-- AMBULATORIO
INSERT INTO Ambulatorio VALUES ( 1, 1, 200 );
INSERT INTO Ambulatorio VALUES ( 2, 2, 100 );
INSERT INTO Ambulatorio VALUES ( 3, 2, 100 );

-- MUNICIPTIO
INSERT INTO Municipio VALUES ( 1, 'Porto Alegre', 'RS' );

-- ESPECIALIDADE 
INSERT INTO Especialidade VALUES ( 1 , 'Pediatra' );
INSERT INTO Especialidade VALUES ( 2 , 'Clinico Geral' );
INSERT INTO Especialidade VALUES ( 3 , 'Dermatologista' );
INSERT INTO Especialidade VALUES ( 4 , 'Traumatologista' );
INSERT INTO Especialidade VALUES ( 5 , 'Neurologista' );

-- DOENCA
INSERT INTO Doenca VALUES ( 1, 'SARAMPO' );
INSERT INTO Doenca VALUES ( 2, 'GRIPE' );
INSERT INTO Doenca VALUES ( 3, 'HEPATITE' );
INSERT INTO Doenca VALUES ( 4, 'CANCER' );
INSERT INTO Doenca VALUES ( 5, 'NEUPLASIA MALIGNA' );
INSERT INTO Doenca VALUES ( 6, 'SARCOMA DE KAPOSI' );
INSERT INTO Doenca VALUES ( 7, 'PNEUMONIA' );

-- MEDICOS
INSERT INTO Medico VALUES ( 10001, 'Joao Paulo', 21, 1, 5, 3);
INSERT INTO Medico VALUES ( 10002, 'Marilia dos Santos', 30, 1, 2, 2);
INSERT INTO Medico VALUES ( 10003, 'Cleber Pinto', 25, 1, 3, 1);
INSERT INTO Medico VALUES ( 79, 'Flavia Tomassini', 48, 1, 4, 2);
INSERT INTO Medico VALUES ( 46, 'Pedro Flowers', 27, 1, 1, 1);


-- PACIENTES
INSERT INTO Paciente VALUES ( '2345346576', 'Anderson Tinhoso', 32, 1);
INSERT INTO Paciente VALUES ( '7623546590', 'Vanderlei Ramos', 7, 1);
INSERT INTO Paciente VALUES ( '8562314359', 'Tomas Alves', 18, 1);
INSERT INTO Paciente VALUES ( '8562544190', 'Paula Flores', 21, 1);
INSERT INTO Paciente VALUES ( '5672301735', 'Marcelo Azambuja', 35, 1);
INSERT INTO Paciente VALUES ( '9351266889', 'Patricia Montenegro', 25, 1);
INSERT INTO Paciente VALUES ( '5732451738', 'Fabio Winderson', 29, 1);

-- FUNCIONATIO 
INSERT INTO Funcionario VALUES ( '4594837261', 'Vera Souza', 49, 1, 2340.99 );

-- CONSULTA
INSERT INTO Consulta VALUES ( 79, '7623546590', "2015-05-01", "13:07:15", 7 );
INSERT INTO Consulta VALUES ( 46, '8562314359', "2015-05-01", "14:07:15", 6 );
INSERT INTO Consulta VALUES ( 10003, '5672301735', "2015-06-08", "12:12:25", 5 );
INSERT INTO Consulta VALUES ( 10002, '9351266889', "2015-06-09", "22:01:35", 1 );
