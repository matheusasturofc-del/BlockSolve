#!/usr/bin/env bash
# Builds dist/BlockSolve.apk from index.html using only the Android SDK command-line tools.
# Needs: JDK 17+, Android SDK with "platforms;android-34" and "build-tools;34.0.0".
# Usage: ANDROID_HOME=/path/to/sdk android/build.sh
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
SDK="${ANDROID_HOME:-${ANDROID_SDK_ROOT:-$HOME/android-sdk}}"
BT="$SDK/build-tools/34.0.0"
JAR="$SDK/platforms/android-34/android.jar"
APP="$ROOT/android/app"
OUT="$ROOT/android/build"
VERSION_CODE="${VERSION_CODE:-5}"
VERSION_NAME="${VERSION_NAME:-3.0}"

rm -rf "$OUT" && mkdir -p "$OUT/assets" "$OUT/classes" "$OUT/gen" "$ROOT/dist"

# 1. Game files. Fonts come from the APK instead of Google Fonts, so the game works offline.
cp -r "$APP/assets/." "$OUT/assets/"
sed -e '/fonts.googleapis.com\|fonts.gstatic.com/d' \
    -e 's#<meta name="claude:viewport-fit-sides" content="cover">#<meta name="claude:viewport-fit-sides" content="cover">\n<link rel="stylesheet" href="fonts.css">#' \
    "$ROOT/index.html" > "$OUT/assets/index.html"

# 2. Resources and manifest
"$BT/aapt2" compile --dir "$APP/res" -o "$OUT/res.zip"
"$BT/aapt2" link -o "$OUT/unsigned.apk" -I "$JAR" \
  --manifest "$APP/AndroidManifest.xml" -A "$OUT/assets" "$OUT/res.zip" \
  --java "$OUT/gen" --min-sdk-version 24 --target-sdk-version 34 \
  --version-code "$VERSION_CODE" --version-name "$VERSION_NAME"

# 3. Java -> dex
javac -nowarn -Xlint:-options -source 11 -target 11 -encoding UTF-8 -classpath "$JAR" -d "$OUT/classes" \
  $(find "$APP/src" "$OUT/gen" -name '*.java')
"$BT/d8" --release --min-api 24 --lib "$JAR" --output "$OUT" $(find "$OUT/classes" -name '*.class')
(cd "$OUT" && zip -q -j unsigned.apk classes.dex)

# 4. Align and sign
"$BT/zipalign" -f -p 4 "$OUT/unsigned.apk" "$OUT/aligned.apk"
KEYSTORE="${KEYSTORE:-$ROOT/android/debug.keystore}"
if [ ! -f "$KEYSTORE" ]; then
  keytool -genkeypair -keystore "$KEYSTORE" -storepass android -keypass android -alias androiddebugkey \
    -keyalg RSA -keysize 2048 -validity 10000 -dname "CN=BlockSolve Debug,O=BlockSolve,C=BR" >/dev/null 2>&1
fi
"$BT/apksigner" sign --ks "$KEYSTORE" --ks-pass "pass:${KS_PASS:-android}" --key-pass "pass:${KEY_PASS:-android}" \
  --ks-key-alias "${KEY_ALIAS:-androiddebugkey}" --out "$ROOT/dist/BlockSolve.apk" "$OUT/aligned.apk"
"$BT/apksigner" verify "$ROOT/dist/BlockSolve.apk"
echo "APK pronto: dist/BlockSolve.apk ($(du -h "$ROOT/dist/BlockSolve.apk" | cut -f1))"
