CREATE DATABASE TRAB2
USE TRAB2

-- AMBULATORI
CREATE TABLE Ambulatorio (
    nroAmb integer primary key,
    andar integer,
    capacidade integer
);

-- MUNICIPIO
CREATE TABLE Municipio (
    codMunicipio integer primary key,
    descricao varchar(1000),
    uf varchar(200)
);

-- ESPECIALIDADE
CREATE TABLE Especialidade (
    codEspec integer primary key,
    nome varchar(55)
);

-- MEDICO
CREATE TABLE Medico (
    CRM integer primary key,
    nome VARCHAR(55),
    idade integer,
    codMunicipio integer,
    codEspec integer,
    nroAmb integer,
    CONSTRAINT `fk_municipio_medico`
        FOREIGN KEY (codMunicipio) REFERENCES Municipio (codMunicipio),
	CONSTRAINT `fk_espec_medico`
        FOREIGN KEY (codEspec) REFERENCES Especialidade (codEspec)
	ON DELETE CASCADE
    ON UPDATE RESTRICT
);
    

-- PACIENTE 
CREATE TABLE Paciente (
    RG integer primary key,
    nome varchar(55),
    idade integer,
    codMunicipio integer,
    CONSTRAINT `fk_paciente_municipio`
        FOREIGN KEY (codMunicipio) REFERENCES Municipio (codMunicipio)
	ON DELETE CASCADE
    ON UPDATE RESTRICT
);

-- DOENCE
CREATE TABLE Doenca (
    codDoenca integer primary key,
    descricao varchar(200)
);

-- CONSULTA
CREATE TABLE Consulta (
    CRM integer,
    RG integer,
    data date,
    hora time,
    codDoenca integer,
    primary key ( CRM, data, hora ),
    CONSTRAINT `fk_medico_consulta`
		FOREIGN KEY (CRM) REFERENCES Medico (CRM),
    CONSTRAINT `fk_paciente_consulta`
        FOREIGN KEY (RG) REFERENCES Paciente (RG),
    CONSTRAINT `fk_doenca_consulta`
        FOREIGN KEY (codDoenca) REFERENCES Doenca (codDoenca)
    ON DELETE CASCADE
    ON UPDATE RESTRICT	
);


-- FUNCIONARIO 
CREATE TABLE Funcionario (
    RG integer primary key,
    nome varchar(55),
    idade integer,    
    codMunicipio integer,
    salario decimal,
    CONSTRAINT `fk_municipio_funcionario` 
        FOREIGN KEY (codMunicipio) REFERENCES Municipio (codMunicipio)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);



