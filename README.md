# BlockSolve

Jogo de quebra-cabeça de blocos para navegador (celular e computador).

**Como jogar:** segure um bloco e arraste-o livremente pelo tabuleiro até a parede da mesma cor.
Ele acompanha o dedo, contorna sozinho os blocos no caminho e se encaixa na casa mais próxima ao soltar. Para sair, empurre contra a parede.
Quando o bloco encosta na abertura certa e cabe nela, ele sai do tabuleiro.
Esvazie o tabuleiro para passar de nível.

## Mecânicas

| Mecânica | Aparece no nível | Como funciona |
|---|---|---|
| Bloco congelado | 3 | Não se move até um número de blocos sair do tabuleiro. |
| Chave acorrentada e cadeado | 5 | A chave pendura numa corrente com física. Tirar o bloco dela abre a parede trancada. |
| Pedra | 11 | Obstáculo fixo que nunca sai. |
| Trilho | 14 | O bloco só anda na horizontal ou só na vertical, e só sai por paredes dessa direção. |
| Bomba | 20 | O número cai a cada jogada. Se zerar com o bloco no tabuleiro, você perde (dá para desfazer). |
| Parede congelada e moedas | 40 | A parede só abre depois que alguns blocos saem. Moedas no tabuleiro valem 5 cada ao vencer. |
| Bloco misterioso | 60 | Cinza com "?". A cor aparece depois que alguns blocos saem. |
| Parede com contador | 80 | Só deixa passar um número limitado de blocos e depois fecha. |
| Bloco com casca | 100 | A borda é de uma cor e o miolo de outra: quebre a casca na parede da cor dela e depois tire o miolo. |
| Bloco de vidro | 120 | Só pode ser arrastado algumas vezes. Se acabar antes de sair, racha e trava. |
| Parede camaleão | 140 | Troca de cor a cada jogada; as pontas mostram a próxima cor. |
| Bloco acorrentado | 160 | Preso por correntes até sair o bloco que carrega a chave prateada. |
| Bloco de duas cores | 180 | Sai pela parede de qualquer uma das duas cores. |
| Portão | 200 | Abre e fecha a cada jogada. |
| Gêmeos | 220 | Dois blocos da mesma cor ligados por um laço: quando um sai, o outro sai junto. |
| Ampulheta | 240 | Bloco de areia com contador; quando zera, ele se desfaz sozinho. |
| Fantasma | 260 | Atravessa os outros blocos, mas precisa parar numa casa livre. |
| Parede que anda | 280 | Muda de lugar a cada jogada; o contorno tracejado mostra o próximo lugar. |
| Bloco espelho | 300 | Anda para o lado contrário do dedo. |

A partir da bomba, cada mecânica nova estreia exatamente 20 níveis depois da anterior.

## Conteúdo

- Tela de carregamento, tela inicial (Jogar / Loja / Opções) e seleção de níveis em 12 mundos, tela de novidades a cada atualização e dedicatória para a família.
- **300 níveis** de campanha com dificuldade crescente. Ao vencer o último aparece a mensagem de fim de jogo.
- **Modo infinito** liberado desde o começo: começa fácil e vai trazendo todas as mecânicas.
- Todo nível tem solução garantida pelo gerador, conferida reproduzindo a solução planejada de cada um; os 300 também foram jogados por um robô arrastando com o mouse, tanto seguindo a dica quanto sem estratégia (sempre tirando o bloco mais fácil).
- **Loja:** fundos Padrão, Colorido, Desenho, Noite e Oceano; peças Padrão, Colorido, Desenho, Neon e Pixel.
- Opções: som, vibração e apagar progresso. Progresso, moedas e compras ficam salvos no aparelho.
- Botões no jogo: **Desfazer**, **Reiniciar** e **Dica** (a primeira de cada nível é grátis, depois 10 moedas; cada nível vale 20). A dica segue a solução planejada do nível enquanto ela ainda vale.

Para jogar no navegador, abra `index.html`. Não há dependências nem etapa de build.

## Mais jogos

Na tela inicial, o botão **Mais jogos** abre:

- **Encaixe:** arraste as peças para um tabuleiro 8×8; linhas e colunas completas somem. Cada vez que o tabuleiro fica
  totalmente vazio, o tema de fundo muda (8 temas para colecionar; o botão Tema troca entre os já ganhos). As peças usam o
  estilo escolhido na loja, o recorde e a partida em andamento ficam salvos, e cada 100 pontos vira 1 moeda. As peças
  encaixam como ímã na casa livre mais próxima, e quando falta pouco para completar uma linha ou coluna o sorteio costuma
  trazer uma peça que completa (de preferência a que limpa mais linhas de uma vez).
- **Junta-Junta:** solte bolinhas numa caixa de vidro; duas iguais se juntam na próxima (rosa + rosa = verde...) até o
  Planeta, e dois planetas viram uma Supernova. Física própria (sem bibliotecas). Cada uma das 11 bolinhas tem carinha
  própria e reage: cara feia quando alguém cai em cima, susto caindo, suor perto da borda, soninho parada, festa ao se
  juntar, e os olhinhos seguem a mira. Se uma bolinha ficar acima da linha tracejada, a caixa encheu e a partida acaba.
- **Jogo da velha:** você contra o robô, em fácil, médio ou difícil. No difícil ele joga perfeito e nunca perde
  (verificado em todas as partidas possíveis). Vitórias dão moedas.

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
