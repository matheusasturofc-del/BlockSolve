# BlockSolve

Jogo de quebra-cabeça de blocos para navegador (celular e computador).

**Como jogar:** segure um bloco e arraste-o pelo tabuleiro até a parede da mesma cor.
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

Para jogar, abra `index.html` em qualquer navegador. Não há dependências nem etapa de build.
