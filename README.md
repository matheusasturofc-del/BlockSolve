# BlockSolve

Jogo de quebra-cabeça de blocos para navegador (celular e computador).

**Como jogar:** segure um bloco e arraste-o livremente pelo tabuleiro até a parede da mesma cor.
Ele acompanha o dedo, para quando encosta em outro bloco e se encaixa na casa mais próxima ao soltar.
Quando o bloco encosta na abertura certa e cabe nela, ele sai do tabuleiro.
Esvazie o tabuleiro para passar de nível.

## Mecânicas

| Mecânica | Aparece no nível | Como funciona |
|---|---|---|
| Bloco congelado | 3 | Não se move até um número de blocos sair do tabuleiro. |
| Chave acorrentada e cadeado | 5 | A chave pendura numa corrente com física. Tirar o bloco dela abre a parede trancada. |
| Pedra | 11 | Obstáculo fixo que nunca sai. |
| Trilho | 14 | O bloco só anda na horizontal ou só na vertical, e só sai por paredes dessa direção. |
| Bomba | 18 | O número cai a cada jogada. Se zerar com o bloco no tabuleiro, você perde (dá para desfazer). |
| Parede congelada | 31 | Só abre depois que alguns blocos saem. |
| Moedas no tabuleiro | 31 | Passe um bloco por cima para pegar. Cada uma vale 5 moedas a mais ao vencer. |
| Bloco misterioso | 41 | Cinza com "?". A cor aparece depois que alguns blocos saem. |
| Parede com contador | 51 | Só deixa passar um número limitado de blocos e depois fecha. |

## Conteúdo

- Tela de carregamento, tela inicial (Jogar / Loja / Opções) e seleção de níveis em 4 mundos.
- **100 níveis** de campanha com dificuldade crescente; depois do 100 abre o modo infinito.
- Todo nível tem solução garantida pelo gerador, e os 100 foram resolvidos em teste automático arrastando com o mouse.
- **Loja:** fundos e peças nos estilos Padrão, Colorido e Desenho, comprados com moedas.
- Opções: som, vibração e apagar progresso. Progresso, moedas e compras ficam salvos no aparelho.
- Botões no jogo: **Desfazer**, **Reiniciar** e **Dica** (15 moedas; cada nível vale 20).

Para jogar no navegador, abra `index.html`. Não há dependências nem etapa de build.

## Android (APK)

O APK pronto fica em [`dist/BlockSolve.apk`](dist/BlockSolve.apk). Ele roda o mesmo jogo dentro de um WebView,
com as fontes embutidas (funciona sem internet) e o botão voltar do Android navegando entre as telas.

Para instalar: copie o arquivo para o celular, abra e permita "instalar apps desconhecidos" quando o Android pedir.

Para gerar de novo depois de mudar o jogo:

```bash
ANDROID_HOME=/caminho/do/android-sdk android/build.sh
```

Precisa de JDK 17+ e do Android SDK com `platforms;android-34` e `build-tools;34.0.0`.
O APK é assinado com `android/debug.keystore` (chave de teste, senha `android`), para que versões novas
instalem por cima da antiga. Para publicar na Play Store, gere uma chave própria e passe
`KEYSTORE`, `KS_PASS`, `KEY_PASS` e `KEY_ALIAS` para o script.
