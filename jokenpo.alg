Algoritmo "jokenpo"
// Disciplina  : Algoritmos e Lógica de Programação]
// Professor   : Fabio Ataide de Lima
// Descrição   : Simula um jogo de pedra-papel-tesoura (jokenpo)
// Autor(a)    : Bruno L. Carli
// Data atual  : 27/05/2017
// Agradecimentos à meu amigo Valdeir Melo da faculdade que é quase
// um compilador humano de visualg, me ajudou com varios erros de sintaxe, valeu

//////////////////////////////////
// FUNÇAO QUE FAZ UMA JOGADA   //
////////////////////////////////
Funcao jogar(jogador : caracter) : caracter
Var
   jogada : caracter
   lock : logico
Inicio
   lock <- falso
   enquanto nao lock faca
      escreval("++++++++++++++++++++++++++++++++++")
      escreval(jogador," insira sua jogada")
      escreval("PE - Pedra")
      escreval("PA - Papel")
      escreval("TE - Tesoura")
      escreval("++++++++++++++++++++++++++++++++++")
      leia(jogada)
      se((jogada <> "PE") E (jogada <> "PA") E (jogada <> "TE"))entao
         escreval("++++++++++++++++++++++++++++++++++")
         escreval("Jogada invalida")
         escreval("Jogadas validas somente PE, PA e TE")
         escreval("++++++++++++++++++++++++++++++++++")
      senao
         lock <- verdadeiro
      fimse
   fimenquanto
   retorne jogada
Fimfuncao

/////////////////////////
// FUNÇAO DA IA       //
///////////////////////
funcao iaPlayer(): caracter
var
   choice : inteiro
   jogada : caracter
inicio
   aleatorio 1, 3
   leia(choice)
   aleatorio off
   se (choice = 1) entao
      jogada <- "PE"
   fimse
   se (choice = 2) entao
      jogada <- "PA"
   fimse
   se (choice = 3) entao
      jogada <- "TE"
   fimse

   retorne jogada
Fimfuncao

//////////////////////////////////
//  LOGICA DO JOGO             //
////////////////////////////////
procedimento jogo(jogador1, jogador2 : caracter; ia : logico)
var
   jogada1, jogada2 : caracter
   result_j1, result_j2 : vetor[1..2] de inteiro
   empates, i : inteiro
inicio
   result_j1[1] <- 0
   result_j1[2] <- 0
   result_j2[1] <- 0
   result_j2[2] <- 0
   empates <- 0
   i <- 0

   enquanto (i<10) faca
      escreval("++++++++++++++++++++++++++++++++++")
      escreval("            Round", i+1)
      escreval("++++++++++++++++++++++++++++++++++")
      jogada1 <- jogar(jogador1)

      se(ia = verdadeiro) entao
         jogada2 <- iaPlayer()
      senao
         jogada2 <- jogar(jogador2)
      fimse

      se(jogada1 = jogada2) entao
         escreval("EMPATE")
         empates <- empates + 1
      senao
         se((jogada1 = "PE") E (jogada2 ="PA")) entao
            escreval("Papel vence Pedra")
            escreval(jogador2, " venceu esta rodada")
            result_j1[2] <- result_j1[2] + 1
            result_j2[1] <- result_j2[1] + 1
         fimse
         se((jogada1 = "PE")E( jogada2 = "TE")) entao
            escreval("Pedra vence Tesoura")
            escreval(jogador1," venceu esta rodada")
            result_j1[1] <-result_j1[1] + 1
            result_j2[2] <- result_j2[2] + 1
         senao
            se((jogada1 = "PA")E(jogada2 = "PE")) entao
               escreval("Papel vence pedra")
               escreval(jogador1, " venceu esta rodada")
               result_j1[1] <- result_j1[1] + 1
               result_j2[2] <- result_j2[2] + 1
            fimse
            se((jogada1 = "PE")E(jogada2 = "TE")) entao
               escreval("Tesoura vence papel")
               escreval(jogador2, " venceu esta rodada")
               result_j1[2] <- result_j1[2] + 1
               result_j2[1] <- result_j2[1] + 1
            senao
               se((jogada1 = "TE")E(jogada2 = "PE")) entao
                  escreval("Pedra vence tesoura")
                  escreval(jogador2, " venceu esta rodada")
                  result_j1[2] <- result_j1[2] + 1
                  result_j2[1] <- result_j2[2] + 1
               fimse
               se((jogada1 = "TE")E(jogada2 = "PA")) entao
                  escreval("Tesoura vence papel")
                  escreval(jogador1," venceu esta rodada")
                  result_j1[1] <- result_j1[1] + 1
                  result_j2[2] <- result_j2[2] + 1
               fimse
            fimse
         fimse
      fimse

      i <- i + 1
   fimenquanto
   escreval("++++++++++++++++++++++++++++++++++")
   escreval("RESULTADO FINAL")
   escreval("++++++++++++++++++++++++++++++++++")
   escreval(jogador1, " venceu ", result_j1[1], " vezes.")
   escreval(jogador1, " perdeu ", result_j1[2], " vezes.")
   escreval(jogador2, " venceu ", result_j2[1], " vezes.")
   escreval(jogador2, " perdeu ", result_j2[2], " vezes.")
   escreval(empates, " empates.")
   escreval("++++++++++++++++++++++++++++++++++")
   escreval(" ")

   se(result_j1[1] > result_j2[1]) entao
      escreval("++++++++++++++++++++++++++++++++++")
      escreval("Vitória do jogador ", jogador1)
      escreval("++++++++++++++++++++++++++++++++++")
   fimse
   se(result_j1[1] < result_j2[1]) entao
      escreval("++++++++++++++++++++++++++++++++++")
      escreval("Vitória do jogador ", jogador2)
      escreval("++++++++++++++++++++++++++++++++++")
   senao
      escreval("++++++++++++++++++++++++++++++++++")
      escreval("EMPATE")
      escreval("++++++++++++++++++++++++++++++++++")
   fimse

fimprocedimento

///////////////////////////////
//   ESCOPO PRINCIPAL       //
/////////////////////////////

Var
   // Seção de Declarações das variáveis
   jogador1, jogador2 : caracter
   escolhaP1, escolhaP2 : caracter
   modo_jogo : inteiro

Inicio
   // Seo de Comandos, procedimento, funções, operadores, etc...
   escreval("++++++++++++++++++++++++++++++++++")
   escreval("Escolha o modo de jogo")
   escreval("[1] para jogar contra a IA")
   escreval("[2] para jogar com outro jogador")
   escreval("++++++++++++++++++++++++++++++++++")
   leia(modo_jogo)

   escolha(modo_jogo) //Escolha do modo de jogo
   caso 1
      escreval("++++++++++++++++++++++++++++++++++")
      escreval("Insira o nome do primeiro jogador")
      escreval("++++++++++++++++++++++++++++++++++")
      leia(jogador1)
      jogador2 <- "IA"
      jogo(jogador1, jogador2, verdadeiro)

   caso 2
      escreval("++++++++++++++++++++++++++++++++++")
      escreval("Insira o nome do primeiro jogador")
      escreval("++++++++++++++++++++++++++++++++++")
      leia(jogador1)
      escreval("++++++++++++++++++++++++++++++++++")
      escreval("Insira o nome do segundo jogador")
      escreval("++++++++++++++++++++++++++++++++++")
      leia(jogador2)
      jogo(jogador1, jogador2, falso)
   outrocaso
      escreval("++++++++++++++++++++++++++++++++++")
      escreval("Voce inseriu uma entrada inválida")
      escreval("++++++++++++++++++++++++++++++++++")
   fimescolha
Fimalgoritmo
