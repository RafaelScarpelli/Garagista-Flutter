# Catalago de Entidades

Cadastro simples – 1 ponto cada (máximo de 5 pts)\
	- Cadastro de cliente\
	- Cadastro de veiculo\
	- Cadastro da revisão para o veiculo\

Cadastro com associação (1:N) – 3 pontos cada\
	- Cliente x Venda. Um cliente pode realizar várias vendas e uma venda pertence a apenas um cliente

	- Cadastro da venda de um carro

	- Cadastro de Observação

	- AgendamentoRevisão

Cadastro associativa (N:N) – 6 pontos cada\
	- Cliente × Veículo via Aluguel. A Aluguel é a tabela intermediaria entre Cliente e veículo

	- Agendamento_Revisão x Tipo_Revisão:
		class AgendamentoRevisaoTipo {
  			int id;
  			int agendamentoId;
  			int tipoRevisaoId;
		}  

