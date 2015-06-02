use trab2

# 1) Buscar a lista de doenÃ§as que iniciam com a letra â€œNâ€ e em ordem alfabÃ©tica
SELECT * FROM Doenca WHERE descricao LIKE 'N%';

# 2) Buscar os dados dos pacientes que estÃ£o com sarampo.
SELECT * 
	FROM Paciente 
INNER JOIN Consulta 
	ON Paciente.RG = Consulta.RG 
INNER JOIN Doenca 
	ON Consulta.codDoenca = Doenca.codDoenca 
WHERE descricao LIKE 'SARAMPO'

# 3) Buscar os dados dos mÃ©dicos ortopedistas com mais de 50 anos.
SELECT *
	FROM Medico
INNER JOIN Especialidade 
	ON Medico.codEspec = Especialidade.codEspec
WHERE
	Medico.idade > 50 AND
	Especialidade.nome = 'ortopedista'

# 4) Buscar a especialidade e o nÃºmero total de mÃ©dicos de cada especialidade.
SELECT Especialidade.nome, count(Medico.CRM)
	FROM Especialidade
LEFT JOIN Medico
	ON Especialidade.codEspec = Medico.codEspec
GROUP BY Especialidade.nome

# 5) Buscar os nomes dos mÃ©dicos que nÃ£o tem consultas na tabela de consultas.
SELECT nome 
	FROM Medico 
WHERE
	CRM NOT IN (SELECT CRM FROM Consulta)

# 6) Buscar os dados das consultas, exceto aquelas marcadas para os mÃ©dicos com CRM 46 e 79
SELECT *
	FROM Consulta 
WHERE 
	CRM != '46' AND -- OR <>
	CRM != '79'

# 7) Buscar os ambulatÃ³rios do 4.o andar que tenham capacidade igual a 50 ou nÃºmero superior a 10.
SELECT * FROM Ambulatorio WHERE andar = 4 AND nroAmb >= 10 OR capacidade = 50

# 8) Buscar o nome dos médicos que têm consulta marcada e datas das suas consultas, ordenados por nome
SELECT Medico.nome, Consulta.data 
	FROM Medico
INNER JOIN Consulta
	ON Medico.CRM = Consulta.CRM
ORDER BY
	Medico.nome


# 9) Buscar o CRM dos médicos e as datas das consultas para os pacientes com RG 122 e 725.
SELECT Medico.CRM, Consulta.DATA
	FROM Medico
INNER JOIN Consulta
	ON Medico.CRM = Consulta.CRM
WHERE
	Consulta.RG = 122 OR
    Consulta.RG = 725

# 10) Buscar os números dos ambulatórios, exceto aqueles do 2.o e 4.o andar, que suportam mais de 50 pacientes.
SELECT nroAmb
	FROM Ambulatorio
WHERE 
	(andar = 2 AND capacidade < 50) OR
    (andar = 4 AND capacidade < 50) OR
    (andar <> 2 AND andar <> 4)
    
# 11) Buscar número e capacidade dos ambulatórios do 5.o andar e o nome dos médicos que atendem neles.
SELECT 
	Ambulatorio.nroAmb,
    Ambulatorio.andar,
    Medico.nome
FROM 
	Ambulatorio
LEFT JOIN
	Medico
ON
	Ambulatorio.nroAmb = Medico.nroAmb
WHERE
	Ambulatorio.andar = 5
    
# 12) Buscar nome dos médicos e nome dos seus pacientes com consulta marcada, assim como a data das consultas.

SELECT 
	Medico.nome AS Medico, 
    Paciente.nome AS Paciente, 
    Consulta.data AS "Data da consulta"
FROM 
	Medico
INNER JOIN
	Consulta
ON 
	Medico.CRM = Consulta.CRM
INNER JOIN
	Paciente
ON
	Consulta.RG = Paciente.RG


#13) Buscar nomes de pacientes com pneumonia e com consulta marcada para médicos que iniciam com “João”
SELECT Paciente.nome
	FROM Paciente
INNER JOIN Consulta
	ON Paciente.RG = Consulta.RG
INNER JOIN Medico
	ON Consulta.CRM = Medico.CRM
INNER JOIN Doenca
	ON Consulta.codDoenca = Doenca.codDoenca
WHERE
	Doenca.descricao = "PNEUMONIA" AND
    Medico.nome LIKE "Joao%"


# 14) Buscar os nomes e idade dos médicos, pacientes e funcionários que residem em “Porto Alegre”


# 15) Buscar nome e RG de funcionários que têm salário abaixo de 1500 e que NÃO estão internados como pacientes.
SELECT Nome, RG
	FROM Funcionario
WHERE
	RG NOT IN
		( SELECT RG FROM Paciente ) AND
	SALARIO < 1500
	

# 16) Buscar os números dos ambulatórios onde nenhum médico fornece atendimento.
SELECT nroAmb
	FROM Ambulatorio
WHERE nroAmb 
	NOT IN
		( SELECT nroAmb FROM Medico )

# 17) Buscar os nomes e os RG’s dos funcionários que estão internados como pacientes.
SELECT Funcionario.nome, Funcionario.RG 
	FROM Funcionario
INNER JOIN Paciente
	ON Funcionario.RG = Paciente.RG
	
# 18) Buscar os nomes dos funcionários que nunca consultaram
SELECT Nome
	FROM Funcionario
WHERE
	RG NOT IN
		( SELECT RG FROM Paciente )

# 19) Quais são as cidades cuja soma dos salários dos funcionários ultrapassa R$ 500.000,00?
SELECT Municipio.descricao as nome, SUM(salario) as total
	FROM Funcionario
INNER JOIN Municipio
	ON Funcionario.codMunicipio = Municipio.codMunicipio	
WHERE
	SUM(salario)> 500000
GROUP BY descricao

# 20) Recupere o nome dos médicos e dos pacientes e a cidade onde moram



    





