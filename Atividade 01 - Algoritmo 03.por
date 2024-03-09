programa
{
	inclua biblioteca Calendario-->c
	/*
	 * Algoritmos:
	 * 3) Crie um algoritmo que solicite o dia, o mês e o ano e informe se a data é válida ou inválida.
		 Considere o mês de fevereiro com 28 dias.
		
	 */

	 /*
	  * * 
	  * O programa é um sistema, entao precisa rodar até que o usuário decida terminá-lo
	  * O programa vai mostrar uma mensagem de boas vindas dizendo do que se trata o programa
	  * O programa vai pedir que o usuario insira o dia (1 - 31).
	  * O programa vai ler o input do usuario
	  * O programa vai julgar se o dia é válido, 
	  * caso não seja, o programa vai informar que a opçao é invalida e oferecer a oportunidade de 
	  * reinserir ou cancelar a operação
	  * O programa repetirá o mesmo passo para o mes, conferindo se o dia é compatível
	  * caso não seja, o programa fará a mesma coisa
	  * O programa repetirá o mesmo passo para o ano, conferindo se o dia e o mes sao compatíveis
	  * caso nao sejam, o programa informará o usuario da mesma forma
	  * O programa mostrará a data válida, informando o dia da semana correto, usando 
	  * um algoritmo chamado fórmula de zeller. USei um escolha para traduzir o valor numerico para uma cadeia
	  * 
	  * 
	  */

	 // mensagem de boas vindas com escopo global <--- REAPROVEITAMENTO DE CÓDIGO! ACABOU SENDO PROVEITOSO, PQ EU PUDE PEGAR DO ALGORITMO 1!!
  	const cadeia MENSAGEM_BOAS_VINDAS = "Bem-vind@ ao Identificador de Dia de São Nunca!\nVamos conferir se uma data é válida!\n"
	
	// mensagem de entrada com escopo global
	const cadeia MENSAGEM_ENTRADA_DIA = "Insira o DIA (1 - 31) que deseja consultar.\n"
	const cadeia MENSAGEM_ENTRADA_MES = "Insira o MÊS (1 - 12) que deseja consultar.\n"
	const cadeia MENSAGEM_ENTRADA_ANO = "Insira o ANO (1 - 9999) que deseja consultar com 4 dígitos.\n"


	const cadeia MENSAGEM_CONTINUAR_PROGRAMA = "\n\nDeseja continuar consultando?\nDigite 1 para SIM e 2 para NÃO.\n"
	const cadeia MENSAGEM_OPCAO_INVALIDA = "\n Opção inválida - Dia de São Nunca!\n\n "

  	// Manter o sistema ligado até que o usuário decida terminar
	inteiro opcao = 1
	// Usei o tipo logico para deixar a operacao mais didática
	logico programaLigado

	// variáveis para o dia, mes e ano
	inteiro dia, mes, ano

	funcao inicio()
	{
		faca {
			// Mostra uma mensagem de boas-vindas, uma constante colocada no escopo global do programa
			mostrarBoasVindas()
			// Começa requisitando o dia - O método garante um dia válido usando um enquanto 
			requisitarDia()
			// Requisita o mes - O método garante um mes válido de acordo com o dia
			requisitarMes()
			// Requisita o ano - O método garante um ano válido, considerando o ano bisexto e o mes de fevereiro
			requisitarAno()
			// Mostra o resultado da data para o usuario 
			mostrarData()
			mostrarMensagemContinuarPrograma()
			
			programaLigado = opcao == 1

			// limpa a tela
			limpa()
			
		} enquanto (programaLigado)
		
	}

	funcao mostrarBoasVindas() {
		escreva(MENSAGEM_BOAS_VINDAS)
	}

	funcao mostrarMensagemContinuarPrograma() {
		escreva(MENSAGEM_CONTINUAR_PROGRAMA)
		leia(opcao)
		
		se((opcao != 1) e (opcao != 2)) {
			escreva(MENSAGEM_OPCAO_INVALIDA)
			
			escreva(MENSAGEM_CONTINUAR_PROGRAMA)
			leia(opcao)
		} 
	}
	
	funcao requisitarDia() {
		// usando um enquanto
		dia = 0 // inicia o dia como 0
		enquanto((dia < 1) ou (dia > 31)) {
			escreva(MENSAGEM_ENTRADA_DIA)
			leia(dia)
			se((dia < 1) ou (dia > 31)) {
				escreva(MENSAGEM_OPCAO_INVALIDA)
				// mostra mensagem de continuação
				mostrarMensagemContinuarPrograma()
				// limpa a tela
				limpa()
				// reseta o dia
				dia = 0
			}
		}
	}

	funcao requisitarMes() {
		mes = 0 // inicia o mes como 0
		enquanto((mes < 1) ou (mes > 12)) {
			escreva(MENSAGEM_ENTRADA_MES)
			leia(mes)
			se((mes < 1) ou (mes > 12)) {
				escreva(MENSAGEM_OPCAO_INVALIDA)
				// mostra mensagem de continuação
				mostrarMensagemContinuarPrograma()
				// limpa a tela
				limpa()
				// reseta a variavel
				mes = 0
			}
			// precisamos checar se o mes e dia são compatĩveis 
			se((mes == 2) e (dia > 29)) {
				escreva("op problema esta aqui")
				// fevereiro só pode ter um máximo de 29 dias
				escreva(MENSAGEM_OPCAO_INVALIDA)
				// mostra mensagem de continuação
				mostrarMensagemContinuarPrograma()
				// limpa a tela
				limpa()
				// reseta o mes 2
				mes = 0
					
				
			} senao se(((mes == 4) ou (mes == 6) ou (mes == 9) ou (mes == 11)) e dia > 30) {
				// abril, junho, setembro e novembro tem 30 dias
				escreva(MENSAGEM_OPCAO_INVALIDA)
				// mostra mensagem de continuação
				mostrarMensagemContinuarPrograma()
				// limpa a tela
				limpa()
				// reseta o mes contraditorio
				mes = 0
			}  
		}
	}

	funcao requisitarAno() {
		ano = 0
		enquanto((ano < 1) ou (ano > 9999)) {
			escreva(MENSAGEM_ENTRADA_ANO)
			leia(ano)

			se((ano != 0) e (mes == 2) e (dia == 29)) {
				// fevereiro 29 tem que ser bissexto
				se((ano % 4 == 0) e ((ano % 100 != 0) e (ano % 400 == 0)) != verdadeiro) {
					// ano não é bisexto
					escreva(MENSAGEM_OPCAO_INVALIDA)
					// mostra mensagem de continuação
					mostrarMensagemContinuarPrograma()
					// limpa a tela
					limpa()
					// reseta o ano
					ano = 0
				}
			}
		}
	}
	
	funcao mostrarData() {
		
		// Alguns algoritmos tem nome!
		formulaDeZeller()
	}
	
	funcao formulaDeZeller() {
		/**
		 * A Fórmula de Zeller é um algoritmo que calcula o dia da semana de uma data específica. 
		 * Ela é baseada em uma fórmula matemática que leva em consideração o dia, mês e ano da data em questão. 
		 * Para calcular o dia da semana de uma data no calendário gregoriano, a Fórmula de Zeller simplificada é:

			h=(q+⌊13(m+1)5⌋+K+⌊K4⌋+⌊J4⌋−2J)mod  7h=(q+⌊513(m+1)​⌋+K+⌊4K​⌋+⌊4J​⌋−2J)mod7
			
			Onde:
			
			    h é o dia da semana (0 = sábado, 1 = domingo, ..., 6 = sexta-feira).
			    q é o dia do mês.
			    m é o mês (março = 3, abril = 4, ..., dezembro = 12, janeiro = 13, fevereiro = 14).
			    K é o ano do século (últimos dois dígitos do ano).
			    J é o século (parte inteira de ano/100​).
		 */

		 // precisa que janeiro e fevereiro sejam 13 e 14 
		 se(mes <= 2) {
		 	mes = mes + 12
		 	ano = ano - 1
		 }
		 inteiro k = ano % 100 // ano do século
		 inteiro j = ano / 100 // século
		 inteiro q = dia
		 inteiro m = mes

		 inteiro h = (q + ((13*(m+1))/5) + k + (k/4) + (j/4) - (2*j)) % 7

		 cadeia diaDaSemana = ""
		 escolha(h) {
		 	caso 0: {
		 		diaDaSemana = "Sábado"
		 		pare
		 	}
		 	caso 1: {
		 		diaDaSemana = "Domingo"
		 		pare
		 	}
		 	caso 2: {
		 		diaDaSemana = "Segunda-feira"
		 		pare
		 	}
		 	caso 3: {
		 		diaDaSemana = "Terça-feira"
		 		pare
		 	}
		 	caso 4: {
		 		diaDaSemana = "Quarta-feira"
		 		pare
		 	}
		 	caso 5: {
		 		diaDaSemana = "Quinta-feira"
		 		pare
		 	}
		 	caso 6: {
		 		diaDaSemana = "Sexta-feira"
		 		pare
		 	}
		 	caso contrario: {
		 		escreva("\nDesculpe, mas algo deu errado na Formula de Zeller! Saindo...\n")
		 		opcao = 2
		 		pare
		 	}
		 }

		 escreva("\n\n A data ", dia, "/", mes, "/", ano, ", ", diaDaSemana, " é uma data válida!")
		 
	}
		

}

/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 224; 
 * @DOBRAMENTO-CODIGO = [73, 77, 89, 107, 147, 169, 175];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */