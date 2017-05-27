programa
{

	inclua biblioteca Texto //essa biblioteca permite formatarmos o texto, vamos utilizar o caixa_alta
	inclua biblioteca Util //dessa biblioteca vamps utilizar o sorteia para a IA


	/*///////////////////////////////////////////////////
	//  FUNÇÃO JOGAR: recebe uma das possiveis jogadas//
	*//////////////////////////////////////////////////
	
	funcao cadeia jogar(cadeia jogador) { //funcao que retorna uma jogada valida {pedra, papel ou tesoura}
		
		cadeia jogada //var local jogada que retornara uma jogada
		logico lock = falso //tranca do loop

		enquanto(nao lock){ //loop que repete ate que o usuario insira uma entrada valida
			
			escreva(jogador, " Insira sua jogada:\n")
			escreva("PE - Pedra\n")
			escreva("PA - Papel\n")
			escreva("TE - Tesoura\n")
			leia(jogada)
			jogada = Texto.caixa_alta(jogada) //forcamos a entrada a ser em letras maiusculas
			
			se(jogada != "PE" e jogada != "PA" e jogada != "TE"){ //a jogada tem que ser uma das tres
				escreva("++++++++++++++++++++++++++++++++++++++++++\n")
				escreva("                  ATENÇÃO                 \n")
				escreva("Jogada inválida\n")
				escreva("Jogadas validas somente: PE, PA, TE\n")
				escreva("++++++++++++++++++++++++++++++++++++++++++\n")
			}senao{
				lock = verdadeiro //se a jogada for valida saimos do loop
			}//fim_se
		}//fim_enquanto
		
		retorne(jogada) //retornar o tipo de jogada
	}//fim_funcao jogar()


	/*///////////////////////////////////////////////////////////////
	// FUNÇÃO iaPlayer: Para jogar contra a Inteligência Artificial//
	//////////////////////////////////////////////////////////////*/
	
	funcao cadeia iaPlayer(){
		inteiro choice = Util.sorteia(1, 3) // a escolha da IA é aleatória
		cadeia jogada
		se(choice == 1){
			jogada = "PE"
		}senao se(choice == 2){
			jogada = "PA"
		}senao se(choice == 3){
			jogada = "TE"
		}
		retorne(jogada)
	} //fim_funcao iaPlayer()

	/*////////////////////////////////////////////////////////////////
	//FUNÇÃO JOGO: contem a logica principal do jogo              //
	///////////////////////////////////////////////////////////////*/
	
	funcao jogo(cadeia jogador1, cadeia jogador2, logico ia){ //recebe dois jogadores e um valor logico (ia on/off)
		cadeia jogada1, jogada2
		inteiro result_j1[2], result_j2[2], empates, i
		result_j1[0] = 0
		result_j1[1] = 0
		result_j2[0] = 0
		result_j2[1] = 0
		empates = 0
		i = 0
		
		enquanto(i < 10){ //o jogo tem dez rodadas
			escreva("++++++++++++++++++++++++++++++++++++++++++\n")
			escreva("             ROUND ", i+1, "\n")
			escreva("++++++++++++++++++++++++++++++++++++++++++\n\n")
			
			jogada1 = jogar(jogador1) //player1 joga
			
			se(ia == verdadeiro){ //se o player2 for a IA
				jogada2 = iaPlayer()
			}
			senao{ //senao
				jogada2 = jogar(jogador2) //player2 joga
			}//fim_se
			
	
			se(jogada1 == jogada2){ //verificações
				escreva("EMPATE\n")
				empates += 1
			}
			senao{
				se(jogada1 == "PE" e jogada2 == "PA"){
					escreva("Papel vence Pedra\n")
					escreva(jogador2, " venceu\n")
					result_j1[1] += 1
					result_j2[0] += 1
				}
				senao se(jogada1 == "PE" e jogada2 == "TE"){
					escreva("Pedra vence Tesoura\n")
					escreva(jogador1, " venceu\n")
					result_j1[0] += 1
					result_j2[1] += 1
				}
				senao {
					se(jogada1 == "PA" e jogada2 == "PE"){
						escreva("Papel vence Pedra\n")
						escreva(jogador1," venceu\n")
						result_j1[0] += 1
						result_j2[1] += 1
					}
					senao se(jogada1 == "PA" e jogada2 == "TE"){
						escreva("Tesoura vence Papel\n")
						escreva(jogador2, " venceu\n")
					}
					senao {
						se(jogada1 == "TE" e jogada2 == "PE"){
							escreva("Pedra vence Tesoura\n")
							escreva(jogador2, " venceu\n")
							result_j1[1] += 1
							result_j2[0] += 1
						}
						senao se(jogada1 == "TE" e jogada2 == "PA"){
							escreva("Tesourta vence Papel\n")
							escreva(jogador1, " venceu\n")
							result_j1[0] += 1
							result_j2[1] += 1
						}
					} //fim_se
				} //fim_se
			} // fim_se das verificações

			i += 1 // aumenta o contador dos rounds
			
		} //fim_enquanto


		//Resultados
		escreva("++++++++++++++++++++++++++++++++++++++++++\n")
		escreva("                RESULTADO\n")
		escreva(jogador1," venceu ", result_j1[0], " vezes\n")
		escreva(jogador1," perdeu ", result_j1[1]," vezes\n")
		escreva(jogador2," venceu ", result_j2[0], " vezes\n")
		escreva(jogador2," perdeu ", result_j2[1]," vezes\n")
		escreva(empates, " empates.\n")
		escreva("++++++++++++++++++++++++++++++++++++++++++\n")

		
		se(result_j1[0] > result_j2[0]){ //verifica o vencedor
			escreva("Vitoria do jogador ", jogador1, "\n")
		}
		senao se(result_j1[0] < result_j2[0]){
			escreva("vitoria do jogador ", jogador2, "\n")
		}
		senao{
			escreva("++++++++++++++++++++++++++++++++++++++++++\n")
			escreva("Empate\n")
			escreva("++++++++++++++++++++++++++++++++++++++++++\n\n")
		} //fim_se dos resultados
	}

	/*///////////////////////////////////////////////////////////////////////// 
	/*                PROGRAMA PRINCIPAL                                   //
	///////////////////////////////////////////////////////////////////////*/
	funcao inicio()
	{
//programa principal
		cadeia jogador1, jogador2, jogada1, jogada2
		inteiro modo_jogo

		//o jogador começa escolhendo o modo de jogo
		escreva("Escolha o modo de jogo\n")
		escreva("[1] Para jogar com a IA\n")
		escreva("[2] Para jogar com outro jogador\n")
		leia(modo_jogo)

		escolha(modo_jogo){
			caso 1:
				escreva("Insira o nome do primeiro jogador\n") //le  nome do player1
				leia(jogador1)
				jogador2 = "IA"
				jogo(jogador1, jogador2, verdadeiro)
				pare
			caso 2:
				escreva("Insira o nome do primeiro jogador\n") //le  nome do player1
				leia(jogador1)
				escreva("Insira o nome do segundo jogador\n") //le  nome do player1
				leia(jogador2)
				jogo(jogador1, jogador2, falso)
				pare
		}

	}//Fim_inicio
}
