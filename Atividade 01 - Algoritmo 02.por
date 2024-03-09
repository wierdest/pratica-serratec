programa
{
	inclua biblioteca Matematica --> m
	/*
	 * Algoritmos:
	 * 2) Uma contabilidade precisa calcular o Imposto de Renda dos funcionários de uma empresa.
		Dada a tabela do Imposto de Renda abaixo, solicite o salário de um funcionário e calcule o valor do imposto de renda a pagar, tendo efetuado a dedução e informe para o contador o valor da base de cálculo, a alíquota aplicada, o valor deduzido e o imposto a pagar.
		
		Obs.: A parcela a deduzir deve ser multiplicada pelo número de dependentes.
		
		IR na fonte
		--------------------------------------------------------------------------------------
		Base de cálculo¹ (R$)		Alíquotas em %		Parcela a deduzir do IR (R$)
		--------------------------------------------------------------------------------------
		Até 2.112,00			0,00			0,00
		De 2.112,01 até 2.826,65	7,50			158,40
		De 2.826,66 até 3.751,05	15,00			370,40
		De 3.751,06 até 4.664,68	22,50			651,73
		Acima de 4.664,68		27,50			884,96
		
		Exemplo:
		
		Entrada:
		
		Salário: R$ 3.500,00
		Número de dependentes: 1
		
		Processamento:
		
		(3.500 * 0,15) - (370,40 *1) = 154,60
		
		Saída:
		
		Base de Cálculo: R$ 3.500,00
		Alíquota IR: 15,00%
		Parcela a deduzir: R$ 370,40
		Imposto a pagar: R$ 154,60
		
		Obs.: Caso o valor do imposto seja negativo, apresentar valor a pagar igual a zero.
		Obs2.: O exercício acima é apenas para treinamento e não representa o cálculo do imposto oficial.
		
	 */

	 /*
	  * O programa é um sistema, entao precisa rodar até que o usuário decida terminá-lo
	  * O prograama vai mostrar uma mensagem de boas vindas
	  * O programa vai solicitar um real, o salário e um inteiro, o numero de dependentes
	  * O programa vai confirmar o input do usuario, ou seja mostrar o input do usuario de volta para ele, e perguntar se está ok
	  * O programa vai julgar o salario como base de calculo para a aliquota e a parcela
	  * O programa vai calcular o IR de acordo com os limites salariais
	  * O programa vai mostrar os valores para o usuário
	  */
  	
  	// mensagem de boas vindas com escopo global <--- REAPROVEITAMENTO DE CÓDIGO! ACABOU SENDO PROVEITOSO, PQ EU PUDE PEGAR DO ALGORITMO 1!!
  	const cadeia MENSAGEM_DE_BOAS_VINDAS = "Bem-vind@ à Contabilidade!\nVamos calcular o IR (Imposto de Renda) do funcionário?\n"
	
	// mensagem de entrada com escopo global
	const cadeia MENSAGEM_DE_ENTRADA = "Insira o SALÁRIO que deseja consultar.\n!!! Use pontos para separar as casas decimais dos centavos !!! \nAperte Enter.\nInsira o NÚMERO DE DEPENDENTES.\nAperte Enter.\n"

	// São 4 limites para o julgamento, o isento, o baixo valor para pagamento, o medio-alto e o alto.
	const real LIMITE_SALARIO_ISENTO = 2112.0, LIMITE_SALARIO_BAIXO = 2826.65, LIMITE_SALARIO_MED_ALTO = 3751.05, LIMITE_SALARIO_ALTO = 4664.68
	
	// São 4 aliquotas, é 0 para o isento. Vou usar esses valores para MOSTRAR A SAÍDA AO USUÁRIO, eles serao divididos por 100 para chegar à aliquota
	const real ALIQUOTA_BAIXO = 7.5, ALIQUOTA_MED = 15.00, ALIQUOTA_MED_ALTO = 22.50, ALIQUOTA_ALTO = 27.50

	// São 4 valores de parcelas referentes a cada salario
	const real PARCELA_BAIXO = 158.40, PARCELA_MED = 370.40, PARCELA_MED_ALTO = 651.73, PARCELA_ALTO = 884.96
	
  	// Essas variáveis são usadas no processamento. 
  	real salario, aliquota, parcela, imposto
  	inteiro numeroDependentes

	// Manter o sistema ligado até que o usuário decida terminar
	inteiro opcao
	// Usei o tipo logico para deixar a operacao mais didática
	logico programaLigado

	const cadeia MENSAGEM_CONTINUAR_PROGRAMA = "\n\nDeseja consultar outro funcionário?\nDigite 1 para SIM e 2 para NÃO.\n"
	const cadeia MENSAGEM_OPCAO_INVALIDA = "\n Opção inválida!\n\n"
	const cadeia MENSAGEM_FINALIZACAO = "\nObrigado por usar o programa de Consulta de Imposto de Renda da nossa Contabilidade!!!"
	
	funcao inicio()
	{
		// O laco faca permite que o codigo seja executado uma vez
		faca {
			// Aqui é onde as funcoes do programa vao ser chamadas
		
			// Mostra uma mensagem de boas-vindas, uma constante colocada no escopo global do programa
			mostrarBoasVindas()
			// Mostra uma mensagem de entrada, uma const global tb
			mostrarMensagemDeEntrada()
			// lê os dados do usuario
			lerDadosDoUsuario()
			// limpa a tela
			limpa()
			// Confirma os dados do usuario
			confirmarDadosInseridos()
			// limpa a tela
			limpa()
			
			// Processamento de dados
			
			// Julga o salario definindo valores para a aliquota e a parcela
			julgarBaseDeCalculo()
			// Faz o calculo do IR, guardando o valor na variavel global imposto
			calcularIR()

			// Saída
			mostrarResultados()
			
			escreva(MENSAGEM_CONTINUAR_PROGRAMA)
			leia(opcao)
			
			se((opcao != 1) e (opcao != 2)) {
				escreva(MENSAGEM_OPCAO_INVALIDA)
				escreva(MENSAGEM_CONTINUAR_PROGRAMA)
				leia(opcao)
			} 
			
			programaLigado = opcao == 1

			// limpa a tela
			limpa()
			
		} enquanto(programaLigado)
		
		escreva(MENSAGEM_FINALIZACAO)
	}
	
	funcao mostrarBoasVindas() {
		escreva(MENSAGEM_DE_BOAS_VINDAS)
	}
	
	funcao mostrarMensagemDeEntrada() {
		escreva(MENSAGEM_DE_ENTRADA)
	}

	funcao lerDadosDoUsuario() {
		// a função leia pode ter vários argumentos, nesse caso, usamos apenas um
		leia(salario, numeroDependentes)
	}

	funcao confirmarDadosInseridos() {
		escreva("O salário a ser consultado é R$: ", salario, "\nO número de dependentes é: ", numeroDependentes)
		escreva("\nAs informaçoes acima estão corretas?\nDigite 1 para SIM e 2 para NÃO.\n")
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

	funcao julgarBaseDeCalculo() {
		// Julga o saslario como base do calculo
		// define a aliquota e a parcela de acordo com o salario
		// Se o salario for menor que o limite para isencao: 
		se(salario <= LIMITE_SALARIO_ISENTO) {
			aliquota = 0.0
			parcela = 0.0
			
		} senao se (salario <= LIMITE_SALARIO_BAIXO) {
			// Se o salario for menor que o valor limite para o imposto mais baixo
			aliquota = ALIQUOTA_BAIXO / 100
			parcela = PARCELA_BAIXO
		} senao se (salario <= LIMITE_SALARIO_MED_ALTO) {
			// Se o salario ficar entre o baixo e o medio-alto, ou seja medio
			aliquota = ALIQUOTA_MED / 100
			parcela = PARCELA_MED
		} senao se (salario <= LIMITE_SALARIO_ALTO) {
			// Se o salario for maior que o medio alto, mas menor que o alto
			aliquota = ALIQUOTA_MED_ALTO / 100
			parcela = PARCELA_MED_ALTO
		} senao {
			// salario acima do limite para o valor de imposto mais alto
			aliquota = ALIQUOTA_ALTO / 100
			parcela = PARCELA_ALTO
		}
	}

	funcao calcularIR() {
		// Efetua o calculo do IR
		imposto = (salario * aliquota) - (parcela * numeroDependentes)
		se (imposto <= 0.0) {
			imposto = 0.0
		} senao {
			real impostoArredondado = m.arredondar(imposto, 2)
			imposto = impostoArredondado
		}
		
	}

	funcao mostrarResultados() {
		// cria uma cadeia com o resultado do processamento
		cadeia mensagemDeResultado = "\n\t\tBase de Cálculo: R$ " + salario + "\n\t\tAlíquota IR: " + (aliquota * 100) + "%" + "\n\t\tParcela a deduzir: R$ " + parcela + "\n\t\tImposto a pagar: R$ " + imposto
		escreva(mensagemDeResultado)
	}
}
/* $$$ Portugol Studio $$$ 
 * 
 * Esta seção do arquivo guarda informações do Portugol Studio.
 * Você pode apagá-la se estiver utilizando outro editor.
 * 
 * @POSICAO-CURSOR = 4593; 
 * @DOBRAMENTO-CODIGO = [129, 133, 142, 164];
 * @PONTOS-DE-PARADA = ;
 * @SIMBOLOS-INSPECIONADOS = ;
 * @FILTRO-ARVORE-TIPOS-DE-DADO = inteiro, real, logico, cadeia, caracter, vazio;
 * @FILTRO-ARVORE-TIPOS-DE-SIMBOLO = variavel, vetor, matriz, funcao;
 */