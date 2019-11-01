Hamburgueria

Projeto desenvolvido para teste.

Utilizado Delphi RAD Studio 10.3, e SQLite Studio.

Arquitetura idealizada:
	Plataforma Web ou um app instalado na máquina do cliente, onde o mesmo pode consultar os seus pedidos realizados em determinado periodo, seus gastos, 
	entre outras informações.
	Após a gravação do Pedido, o mesmo é enviado para um WebService, que por sua vez transmite para a aplicação na hamburgueria.
	A Hamburgueria ao atualizar o pedido, envia o status para o WebService que retorna para o cliente.
	O Pedido pela plataforma deve ser realizado de maneira rapida, simples e intuitiva pelo usuário.
	Com usuário de ADMINISTRADOR deve ser possivel realizar a inclusão de Pedidos, Produtos, novos administradores entre outras informações.
	Desenvolvimento de relatórios gráficos para o administrador.
	
Arquitetura desenvolvida:
	Tela de login para acesso a aplicação, como ADMINISTRADOR ou USUÁRIO COMUM (Venda Rapida)
	A criação da tela de Produto e para inclusão de novos administradores será implementada futuramente.
	Assim como o sistema de WebService (atualmente trabalha com um banco local, sem Plataforma Web, através de um executável) e dos relatórios.
	Tela de Consulta de Pedidos e tela de Inclusão de Pedido.
	Unit's separadas com os componentes de conexão e com as funções relacionadas ao Pedido.
	

Banco de Dados:
	O arquivo do Banco de dados se encontra junto aos arquivos (Hamburgueria.db)
	Tabelas criadas:
			    	CPED (
							NRPEDIDO      INTEGER         PRIMARY KEY AUTOINCREMENT
														  UNIQUE
														  NOT NULL,
							STATUS        VARCHAR (30)    NOT NULL,
							RAZSOCIAL     VARCHAR (60)    NOT NULL,
							VALOR         NUMERIC (15, 6) NOT NULL,
							DTPEDIDO      DATETIME        NOT NULL,
							COMPLEMENTO   VARCHAR (100),
							CONDPAGAMENTO INTEGER (40)    NOT NULL,
							ENDERECO      VARCHAR (60)    NOT NULL,
							TELEFONE      VARCHAR (15)    NOT NULL,
							CEP           VARCHAR (9)     NOT NULL,
							BAIRRO        VARCHAR (40)    NOT NULL
						);
					IPED (
							NRPEDIDO  INTEGER         NOT NULL,
							NRITEM    INTEGER         NOT NULL,
							COD       INTEGER         NOT NULL,
							DESCRICAO VARCHAR (50)    NOT NULL,
							QTDE      INTEGER         NOT NULL,
							VRUNIT    NUMERIC (15, 6) NOT NULL,
							VRTOTAL   NUMERIC (15, 6) NOT NULL,
							COMPLITEM VARCHAR (100)   NOT NULL
						);
					PRODUTO (
							CODPROD    INTEGER         PRIMARY KEY
													   UNIQUE
													   NOT NULL,
							DESCRICAO  VARCHAR (50)    NOT NULL,
							VRUNITARIO NUMERIC (15, 6) NOT NULL,
							INFOPROD   VARCHAR (100)   NOT NULL
						);
					USUARIO (
							LOGIN STRING (40) NOT NULL,
							SENHA STRING (40) NOT NULL,
							ID    INTEGER     NOT NULL
											  PRIMARY KEY AUTOINCREMENT
						);
	

Tela de Login
	- Através do Usuário e Senha é possivel acessar como administrador, assim, tendo mais opções no sistema.
	- Botão Realizar Pedido:
			Para o usuário, permite criar o pedido e altera-lo, quando o mesmo não se encontrar com status ENVIADO ou EM TRANSPORTE,
			sem a necessidade de possuir um usuário e senha no sistema.
	
Tela de Cadastro de Pedidos
	- Apresenta filtros onde o cliente pode visualizar os pedidos realizados, e o valor deles.
	- Através de cores definidas, é possivel diferenciar os pedidos de acordo com os seus respectivos status
	- Totalizar dos pedidos
	- COMO ADMINISTRADOR:
		Opção CONTROLE DO PEDIDO onde:
			Pedido Recebido = Altera o status do pedido para "PEDIDO RECEBIDO"
			Pedido Em Transporte = Altera o status para "PEDIDO EM TRANSPORTE"
			
	- Validações:
		COMO USUÁRIO:
			Não é possivel alterar um pedido após a aprovação do mesmo.
			Não é possivel excluir um pedido após a aprovação do mesmo, sendo necessário contatar a hamburgueria.
			
		COMO ADMINISTRADOR:
			Livre para alterar e excluir pedidos.
			
	- Opção INCLUIR:
		Chama a tela de Pedido, onde é possivel realizar a cadastro de novos pedidos.
		
	- Opção ALTERAR:
		Permite a alteração do pedido, através da tela de inclusão.
		
	- Opção EXCLUIR:
		Exclui o pedido selecionado na Grid da tela de Cadastro de Pedidos.
		
Tela de Pedidos
	- Apresenta o Status ATUAL do Pedido na tela
	- Os campos CLIENTE, ENDERECO, CEP, BAIRRO E TELEFONE são OBRIGATÓRIOS
	- O campo telefone aplica uma formatação sobre a numeração digitada, dependendo do número de digitos.
	- Grid de Produtos, apresentando os produtos lançados.
	- Abaixo na tela existe a opção de lançar produtos ao pedido, na aba Produto.
		Onde:
			Através do LookUp é possivel ver os produtos e seus respectivos ingredientes, obs: os ingredientes são apresentados também após a seleção do produto
			Após digitar a quantidade do produto, será feito o calculo do valor total, caso a quantidade seja zerada, o item é deletado
			É possivel adicionar informações extra sobre o produto.
			Estas informações extrar são exibidas na GRID no campo INFORMAÇÕES EXTRAS
			Para excluir o produto, basta clicar sobre o mesmo e apertar DELETE
			Quando o produto é apagado, é posicionado o ultimo da Grid
			
	- Aba Outras Informações:
		É possivel digitar alguma informações referente ao PEDIDO.
		
	- Aba Condição de Pagamento
		O usuário deve selecionar uma opção pré definida de pagamento.
		
	- botão GRAVAR:
		Valida os dados do cliente.
		Grava o pedido no banco (tabelas CPED e IPED)
		Grava com o Status "AGUARDANDO APROVAÇÃO"
		Caso ocorra algum erro, apresenta mensagem de erro.
		
Unit FuncoesPedido_Unit
	- Possui as funções relacionadas ao Pedido
		COMO:
			UltimoPedido = traz o número do pedido na gravação
			ExcluirPedido = Realiza a exclusão do pedido
			TransfereIPED_TbIPED = passa os dados dos produtos do banco para a memTable de Produtos, para a exibição no alterar e consultar
			CalculaTotais = Calcula o totalizador do pedido
			PedidoRapido = Controla se está logado como Administrador ou não.
			
DMConection
	- Unit que possui os componentes de conexão e transação