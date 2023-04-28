create database hospital;
use hospital;

CREATE TABLE Enfermeiro (
	Core INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL
);
CREATE TABLE Paciente (
	Num INT PRIMARY KEY,
	Nome varchar(50) NOT NULL
);
CREATE TABLE Remedio (
	Cod INT PRIMARY KEY,
    Nome VARCHAR (50) NOT NULL
);
CREATE TABLE Medicacao (
	Id INT PRIMARY KEY AUTO_INCREMENT,
	Dia DATE NOT NULL,
    Hora TIME NOT NULL,
    PacienteNum INT NOT NULL,
    RemedioCod INT NOT NULL,
    EnfermeiroCoren INT NOT NULL,
		FOREIGN KEY (PacienteNum) REFERENCES Paciente(Num),
		FOREIGN KEY (RemedioCod) REFERENCES Remedio(Cod), 
		FOREIGN KEY (EnfermeiroCoren) REFERENCES Enfermeiro(Core)
);

INSERT Enfermeiro VALUES (11111, 'Enfermeiro 1'),
(22222,'Enfermeiro 2'),
(33333, 'Enfermeiro 3');

INSERT Paciente VALUES
(1000,'Paciente A'),
(1001,'Paciente B'),
(1002,'Paciente C'),
(1003,'Paciente D'),
(1004,'Paciente E'),
(1005,'Paciente F'),
(1006,'Paciente G'),
(1007,'Paciente H'),
(1008,'Paciente I');

INSERT Remedio VALUES 
(100,'Controle de pressao'),
(101,'Problemas no estomago'),
(102,'Soro'),
(103,'Calmante'),
(104,'Analgesico'),
(105,'Rins');

INSERT Medicacao VALUES
(0, current_date, '05:00:00',1003, 104, 11111),
(0, current_date, '08:00:00',1001, 100, 11111),
(0, current_date, '08:20:00',1007, 102, 11111),
(0, current_date, '08:30:00',1007, 105, 11111),
(0, current_date, '09:00:00',1004, 104, 22222),
(0, current_date, '09:30:00',1005, 105, 33333),
(0, current_date, '10:20:00',1001, 103, 11111),
(0, current_date, '12:00:00',1008, 102, 22222),
(0, current_date, '12:20:00',1002, 105, 22222),
(0, current_date, '13:30:00',1001, 100, 11111),
(0, current_date, '15:00:00',1003, 104, 22222),
(0, current_date, '16:00:00',1001, 103, 11111),
(0, current_date, '20:30:00',1008, 100, 22222),
(0, current_date, '21:00:00',1002, 105, 11111),
(0, current_date, '21:10:00',1006, 102, 11111),
(0, current_date, '23:00:00',1003, 104, 33333);

select * from medicacao;

update Medicacao 
set EnfermeiroCoren = 22222
where id = 1;

commit;

rename table Medicacao to admMedicacao;
rollback;
show tables;

set autocommit=0;
savepoint status1;

select * from Enfermeiro;
update Enfermeiro 
set Nome = 'Enfermeiro10'
where Core = 11111;

rollback to savepoint status1;