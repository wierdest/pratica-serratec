programa
{
	inclua biblioteca Matematica --> m
	/*
	 * Algoritmos:
	 * 1) Uma clínica tem necessidade de informar o IMC (Índice de Massa Corporal) dos seus pacientes.

		Sabendo que o IMC se calcula da seguinte forma: divide-se o peso (em kg) pelo quadrado da altura (em metros), crie um programa que faça o cálculo do IMC de um dado paciente.
		
		Informe o IMC do paciente.
		Caso o IMC seja menor que 18,5, informe que a classificação é Baixo peso.
		Caso o IMC seja maior que 18,5 e menor que 24,9, informe que a classificação é Peso saudável.
		Caso o IMC seja maior ou igual a 25 e menor que 29,9, informe que a classificação é Sobrepeso.
		Caso o IMC seja maior ou igual a 30, informe que a classificação é Obesidade.
		
	 */

	 /*
	  * O programa vai mostrar uma mensagem de boas vindas dizendo do que se trata o programa
	  * O programa vai pedir que o usuario insira o peso do paciente, em kg, seguido da altura em m
	  * O programa vai ler o input do usuario
	  * O programa vai confirmar o input do usuario, ou seja mostrar o input do usuario de volta para ele, e perguntar se está ok
	  * O programa vai calcular o IMC, então vou precisar importar a biblioteca Matematica pra fazer potenciacao e arredondamento
	  * O programa vai classificar o imc em quatro categorias
	  */
	
	// mensagem de boas vindas com escopo global
  	const cadeia MENSAGEM_DE_BOAS_VINDAS = "Bem-vind@ à Clínica!\nVamos calcular o IMC (Índice de Massa Corporal) do paciente?\n"
	// mensagem de entrada com escopo global
	const cadeia MENSAGEM_DE_ENTRADA = "Insira o PESO do paciente em kilogramas.\nAperte Enter.\nInsira a ALTURA do paciente em metros.\nAperte Enter de novo.\nUse apenas pontos para separar casas decimais\n"
	// também usei peso, altura e icm como variáveis globais, 
	// para que eu pudesse organizar o código em funções e trabalhar um pouco com a confirmaçao de dados
	real peso, altura, imc

	// categorias do imc
	const cadeia BAIXO = "Baixo peso", SAUDAVEL = "Peso Saudável", SOBREPESO = "Sobrepeso", OBESIDADE = "Obesidade"
	const real LIMITE_BAIXO = 18.5, LIMITE_SAUDAVEL = 24.9, LIMITE_SOBREPESO = 25.0, LIMITE_OBESIDADE = 29.9

	// Manter o sistema ligado até que o usuário decida terminar
	inteiro opcao

	// Usei o tipo logico para deixar a operacao mais didática
	logico programaLigado
	
	funcao inicio()
	{
		
		faca {
			
			// Mostra uma mensagem de boas-vindas, uma constante colocada no escopo global do programa
			mostrarBoasVindas()
			// Mostra uma mensagem de entrada, uma const global tb
			mostrarMensagemDeEntrada()
			// lê os dados do usuario
			lerDadosDoUsuario()
			// Confirma os dados do usuario
			confirmarDadosInseridos()
			// limpa a tela
			limpa()
			// Processamento de dados
			determinaIMC()
			// Mostra o IMC
			mostraIMC()
			// Julga o IMC de acordo com os indíces especificados
			julgaIMC()

			escreva("\n\nDeseja consultar novo paciente?\nDigite 1 para SIM e 2 para NÃO.\n")
			leia(opcao)
			
			se(opcao != 1 e opcao != 2) {
				escreva("\n Opção inválida!\n\n")
				escreva("\n\nDeseja consultar novo paciente?\nDigite 1 para SIM e 2 para NÃO.\n")
				leia(opcao)
			} 
			
			programaLigado = opcao == 1

			limpa()
			
		} enquanto(programaLigado)
		
		// Mensagem de término
		escreva("\nObrigado por usar o programa de Consulta de ICM da nossa clínica!!!")
	}

	funcao mostrarBoasVindas() {
		escreva(MENSAGEM_DE_BOAS_VINDAS)
	}
	
	funcao mostrarMensagemDeEntrada() {
		escreva(MENSAGEM_DE_ENTRADA)
	}
	
	funcao lerDadosDoUsuario() {
		// a função leia pode ter vários argumentos
		leia(peso, altura)
	}
	
	funcao confirmarDadosInseridos() {
		escreva("O paciente pesa " + peso + " kilos.\nO paciente tem " + altura + " metros de altura.\n")
		escreva("As informações acima estão corretas?\nDigite 1 para SIM e 2 para NÃO.\n")
		inteiro resposta
		leia(resposta)

		se(resposta != 1 e resposta != 2) {
			// se o usuario responder errado à confirmação
			escreva("Por favor, responda com 1 ou 2\n\n")
			// pergunta de novo
			confirmarDadosInseridos()
		} senao {
			se(resposta == 2) {
				// se o usuario responder não, mostra a mensagem de entrada de novo
				mostrarMensagemDeEntrada()
				// e também le os dados mais uma vez
				lerDadosDoUsuario()
			}
			// essa funçao nao tem mais nenhum caso entao, deixa o controle rolar
		}
	}

	funcao determinaIMC() {
		// Lembrando que icm é uma variável global
		// Arredonda para duas casas decimais
		imc = m.arredondar(peso / m.potencia(altura, 2.0), 1)
		
	}

	funcao mostraIMC() {
		escreva("O IMC (Índice de Massa Corporal) do paciente é:  ", imc)
	}
	
	funcao julgaIMC() {
		
		cadeia mensagem = "\n\nA classificação do ICM do paciente é: "
		se (imc <= LIMITE_BAIXO) {
			escreva(mensagem + BAIXO)
		} senao se ((imc > LIMITE_BAIXO) e (imc < LIMITE_SAUDAVEL)) {
			escreva(mensagem + SAUDAVEL)
		} senao se ((imc >= LIMITE_SOBREPESO) e (imc < LIMITE_OBESIDADE)) {
			escreva(mensagem + SOBREPESO)
		} senao {
			escreva(mensagem + OBESIDADE)
		}
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 1710; 
 * @DOBRAMENTO-CODIGO = [85, 89, 93, 98, 120, 127, 131];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */