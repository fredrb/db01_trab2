CREATE DATABASE TRAB2
USE TRAB2

-- TURNO_TRABALHO
CREATE TABLE Turno_Trabalho (
    id_turno integer primary key,
    horario_inicio time,
    horario_fim time
);

-- CARGO
CREATE TABLE Cargo (
    id_cargo integer primary key,
    nome_cargo varchar(100),
    nivel_cargo varchar(50)
);

-- FUNCIONARIO
CREATE TABLE Funcionario (
    id_func integer primary key,
	nome_func varchar(100),
    data_nasc_func date,
	endereco_func varchar(200),
    id_cargo integer,
    id_turno integer,
	CONSTRAINT `fk_cargo_funcionario`
		FOREIGN KEY (id_cargo) REFERENCES Cargo (id_cargo),
	CONSTRAINT `fk_turno_funcionario`
		FOREIGN KEY (id_turno) REFERENCES Turno_Trabalho (id_turno)
	ON DELETE CASCADE
    ON UPDATE RESTRICT	
);

-- CLIENTE
CREATE TABLE Cliente (
	id_cliente integer primary key,
	nome_cliente varchar(100),
	data_nasc_cliente datetime,
	cpf_cliente varchar(11),
	endereco_cliente varchar(200),
	fone_cliente varchar(20)
);


-- PRODUTO
CREATE TABLE Produto (
	id_produto integer primary key,
	nome_produto varchar(150),
	desc_produto varchar(200),
	preco_produto decimal
);

-- ORDEM COMPRA CABECALHO
CREATE TABLE Ordem_Compra_Cabecalho (
	id_compra_cabecalho integer primary key,
	data_compra_cabecalho datetime,
	total_compra_cabecalho decimal,
    id_func integer,
    id_cliente integer,
	CONSTRAINT `fk_vendedor_compra`
		FOREIGN KEY (id_func) REFERENCES Funcionario (id_func),
	CONSTRAINT `fk_cliente_compra`
		FOREIGN KEY (id_cliente) REFERENCES Cliente (id_cliente)
	ON DELETE CASCADE
    ON UPDATE RESTRICT		
);


-- ORDEM COMPRA CORPO
CREATE TABLE Ordem_Compra_Corpo (
	id_compra_corpo integer primary key,
	qtde_compra integer,
	item_compra integer,
    id_produto integer,
    id_compra_cabecalho integer,
	CONSTRAINT `fk_produto_compra`
		FOREIGN KEY (id_produto) REFERENCES Produto (id_produto),
	CONSTRAINT `fk_ordem_compra`
		FOREIGN KEY (id_compra_cabecalho) REFERENCES Ordem_Compra_Cabecalho (id_compra_cabecalho)
	ON DELETE CASCADE
    ON UPDATE RESTRICT	
); 

-- INSERT DATA
INSERT INTO Turno_Trabalho VALUES (1, '06:00:00', '15:00:00');
INSERT INTO Turno_Trabalho VALUES (2, '08:00:00', '17:00:00');
INSERT INTO Turno_Trabalho VALUES (3, '09:00:00', '18:00:00');
INSERT INTO Turno_Trabalho VALUES (4, '12:00:00', '21:00:00');
INSERT INTO Turno_Trabalho VALUES (5, '00:00:00', '23:59:00');


INSERT INTO Cargo VALUES (1, 'Vendedor', 1);
INSERT INTO Cargo VALUES (2, 'Manutenção', 1);
INSERT INTO Cargo VALUES (3, 'Consultor', 2);
INSERT INTO Cargo VALUES (4, 'Gerente de Qualidade', 3);
INSERT INTO Cargo VALUES (5, 'Gerente de Loja', 4);

INSERT INTO Funcionario VALUES (12001, 'Wanderlei Souza', '1989-13-12', 'Rua X', 1, 3);
INSERT INTO Funcionario VALUES (12002, 'Washington Silva', '1986-08-01', 'Rua Y', 2, 3);
INSERT INTO Funcionario VALUES (12003, 'Roberto Figueredo', '1990-10-21', 'Rua Z', 1, 2);
INSERT INTO Funcionario VALUES (12004, 'Anderson Mello', '1981-04-14', 'Rua XYZ', 5, 3);
INSERT INTO Funcionario VALUES (12005, 'Rafael', '1983-06-09', 'Rua A', 3, 5);

INSERT INTO Cliente VALUES (90001, 'c11', '1990-01-01', '9584736213', 'Rua B', '(51)9988-7766');
INSERT INTO Cliente VALUES (90002, 'c12', '1990-01-01', '9584736212', 'Rua B', '(51)9988-7765');
INSERT INTO Cliente VALUES (90003, 'c13', '1990-01-01', '9584736211', 'Rua B', '(51)9988-7764');
INSERT INTO Cliente VALUES (90004, 'c14', '1990-01-01', '9584736210', 'Rua B', '(51)9988-7763');
INSERT INTO Cliente VALUES (90005, 'c15', '1990-01-01', '9584736209', 'Rua B', '(51)9988-7762');
INSERT INTO Cliente VALUES (90006, 'c16', '1990-01-01', '9584736208', 'Rua B', '(51)9988-7761');
INSERT INTO Cliente VALUES (90007, 'c17', '1990-01-01', '9584736207', 'Rua B', '(51)9988-7760');
INSERT INTO Cliente VALUES (90008, 'c18', '1990-01-01', '9584736206', 'Rua B', '(51)9988-7759');
INSERT INTO Cliente VALUES (90009, 'c19', '1990-01-01', '9584736205', 'Rua B', '(51)9988-7758');
INSERT INTO Cliente VALUES (90010, 'c20', '1990-01-01', '9584736204', 'Rua B', '(51)9988-7757');

INSERT INTO Produto VALUES (80001, 'ProdA', 'Prod desc 1', 1.00);
INSERT INTO Produto VALUES (80002, 'ProdB', 'Prod desc 2', 2.00);
INSERT INTO Produto VALUES (80003, 'ProdC', 'Prod desc 3', 10.00);
INSERT INTO Produto VALUES (80004, 'ProdD', 'Prod desc 4', 20.00);
INSERT INTO Produto VALUES (80005, 'ProdE', 'Prod desc 5', 100.00);
INSERT INTO Produto VALUES (80006, 'ProdF', 'Prod desc 6', 28.90);
INSERT INTO Produto VALUES (80007, 'ProdG', 'Prod desc 7', 29.00);

INSERT INTO Ordem_Compra_Cabecalho VALUES (70001, '2015-06-01', 11.00, 12003, 90001);
INSERT INTO Ordem_Compra_Cabecalho VALUES (70002, '2015-06-02', 111.00, 12001, 90002);
INSERT INTO Ordem_Compra_Cabecalho VALUES (70003, '2015-06-03', 112.00, 12003, 90003);
INSERT INTO Ordem_Compra_Cabecalho VALUES (70004, '2015-06-04', 22.00, 12001, 90004);
INSERT INTO Ordem_Compra_Cabecalho VALUES (70005, '2015-06-05', 14.00, 12001, 90005);

INSERT INTO Ordem_Compra_Corpo VALUES (60001, 1, 1, 80001, 70001);
INSERT INTO Ordem_Compra_Corpo VALUES (60002, 1, 2, 80003, 70001);

INSERT INTO Ordem_Compra_Corpo VALUES (60003, 11, 1, 80003, 70002);
INSERT INTO Ordem_Compra_Corpo VALUES (60004, 1, 2, 80001, 70002);

INSERT INTO Ordem_Compra_Corpo VALUES (60005, 1, 1, 80005, 70003);
INSERT INTO Ordem_Compra_Corpo VALUES (60006, 1, 2, 80003, 70003);
INSERT INTO Ordem_Compra_Corpo VALUES (60007, 2, 3, 80002, 70003);

INSERT INTO Ordem_Compra_Corpo VALUES (60008, 2, 1, 80003, 70004);
INSERT INTO Ordem_Compra_Corpo VALUES (60009, 2, 2, 80001, 70004);

INSERT INTO Ordem_Compra_Corpo VALUES (60010, 10, 1, 80001, 70005);
INSERT INTO Ordem_Compra_Corpo VALUES (60011, 2, 2, 80002, 70005);


-- 2 QUERIES 1 TABELA
SELECT * FROM Produto WHERE preco > 20; 
SELECT * FROM Cliente WHERE nome_cliente like 'c%';

-- 2 QUERIES 2 TABELAS
SELECT * 
	FROM Funcionario 
INNER JOIN Cargo
	ON Funcionario.id_cargo = Cargo.id_cargo
WHERE
	Cargo.nome_cargo = 'Vendedor';

SELECT Funcionario.nome_func, Turno_Trabalho.horario_inicio, Turno_Trabalho.horario_fim
	FROM Funcionario
INNER JOIN Turno_Trabalho 
	ON Funcionario.id_turno = Turno_Trabalho.id_turno;

-- 2 QUERIES 3 TABELAS
-- NUMERO TOTAL DE VENDAS FEITAS POR CONSULTORES
SELECT COUNT(*)
	FROM Ordem_Compra_Cabecalho
INNER JOIN Funcionario
	ON Ordem_Compra_Cabecalho.id_func = Funcionario.id_func
INNER JOIN Cargo
	ON Funcionario.id_cargo = Cargo.id_cargo
WHERE
	Cargo.id_cargo = 'Consultor';

-- FUNCIONARIOS QUE VENDERAM O PRODUTO 80001
SELECT Funcionario.nome_func
	FROM Funcionario
INNER JOIN Ordem_Compra_Cabecalho
	ON Ordem_Compra_Cabecalho.id_func = Funcionario.id_func
INNER JOIN Ordem_Compra_Corpo
	ON Ordem_Compra_Corpo.id_compra_cabecalho = Ordem_Compra_Cabecalho.id_compra_cabecalho
WHERE 
	Ordem_Compra_Corpo.id_produto = 80001;
	

-- 2 QUERIES 4 TABELAS
-- todos os produtos comprados pelo cliente c11
SELECT nome_cliente, nome_produto
	FROM Cliente
INNER JOIN Ordem_Compra_Cabecalho
	ON Cliente.id_cliente = Ordem_Compra_Cabecalho.id_cliente
INNER JOIN Ordem_Compra_Corpo
	ON Ordem_Compra_Corpo.id_compra_cabecalho = Ordem_Compra_Cabecalho.id_compra_cabecalho
INNER JOIN Produto
	ON Ordem_Compra_Corpo.id_produto = Produto.id_produto
WHERE Cliente.nome_cliente = 'c11';

-- soma de todas as vendas de um cliente onde um produto custa mais de 20 reais	
SELECT Cliente.nome_cliente, SUM(Ordem_Compra_Cabecalho.total_compra_cabecalho)
	FROM Cliente
INNER JOIN Ordem_Compra_Cabecalho
	ON Cliente.id_cliente = Ordem_Compra_Cabecalho.id_cliente
INNER JOIN Ordem_Compra_Corpo
	ON Ordem_Compra_Cabecalho.id_compra_cabecalho = Ordem_Compra_Corpo.id_compra_cabecalho
INNER JOIN Produto 
	ON Ordem_Compra_Corpo.id_produto = Produto.id_produto
WHERE
	Produto.preco_produto > 20
GROUP BY Cliente.nome_cliente;

