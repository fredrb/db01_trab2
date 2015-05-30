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


