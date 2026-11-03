# BlockSolve

Jogo de quebra-cabeça de blocos para navegador (celular e computador).

**Como jogar:** segure um bloco e arraste-o livremente pelo tabuleiro até a parede da mesma cor.
Ele acompanha o dedo, para quando encosta em outro bloco e se encaixa na casa mais próxima ao soltar.
Quando o bloco encosta na abertura certa e cabe nela, ele sai do tabuleiro.
Esvazie o tabuleiro para passar de nível.

## Mecânicas

- **Bloco congelado:** não se move. O número no gelo mostra quantos outros blocos ainda precisam sair para ele derreter.
- **Chave acorrentada:** um bloco leva uma chave pendurada numa corrente (com física, balança quando você arrasta).
  Quando esse bloco sai, a chave voa até o cadeado.
- **Parede com cadeado:** fica trancada até a chave dela ser coletada.

## Conteúdo

- Tela de carregamento, tela inicial (Jogar / Opções) e seleção de níveis.
- 10 níveis de campanha com dificuldade crescente: gelo a partir do nível 3, chave e cadeado a partir do nível 5,
  duas chaves a partir do nível 8. Depois do nível 10 abre o modo infinito.
- Todo nível tem solução garantida pelo gerador (os 10 níveis foram resolvidos em teste automático).
- Opções: som, vibração e apagar progresso. Progresso e moedas ficam salvos no navegador.
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
