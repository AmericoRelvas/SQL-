create database escola;
use escola;
create table aluno (
	RA int not null primary key,
    nome varchar(30) not null,
    telefone int(9) not null
    );
create table disciplina (
	Id int not null auto_increment primary key,
    nome varchar(50) not null
    );
create table notas (
	alunoRa int not null references aluno(ra),
    disciplinaID int not null references disciplina(ra),
    notaP1 float not null,
    notaP2 float not null
    );

select * from aluno;
select * from disciplina;
select * from notas;
    
    
INSERT Aluno VALUES(1234, "Aluno_A", 988776655),
(1235, "Aluno_B", 997975566),
(1236, "Aluno_C", 988225544),
(1237, "Aluno_D", 966887744),
(1238, "Aluno_E", 911223344),
(1239, "Aluno_F", 922334455);
INSERT Disciplina VALUES(0, "Banco de dados"),
(0, "Programação estruturada"),
(0, "Redes de computadores"),
(0, "LFA");
INSERT Notas VALUES(1234, 1, 7.0, 5.5),
(1235, 1, 7.0, 5.5),
(1236, 1, 6.0, 8.5),
(1237, 1, 5.0, 3.5),
(1238, 1, 2.5, 3.5),
(1239, 1, 9.0, 5.5),
(1234, 2, 6.0, 7.5),
(1235, 2, 6.5, 8.5),
(1236, 2, 5.0, 4.5),
(1237, 2, 8.0, 7.0),
(1238, 2, 7.5, 6.5),
(1239, 2, 6.0, 5.5),
(1234, 3, 8.5, 5.5),
(1235, 3, 3.5, 7.5),
(1236, 3, 7.0, 3.5),
(1237, 3, 2.0, 7.0),
(1238, 3, 2.5, 7.5),
(1239, 3, 4.0, 9.5),
(1234, 4, 5.0, 6.5),
(1235, 4, 7.5, 7.5),
(1236, 4, 7.0, 6.5),
(1237, 4, 6.0, 7.0),
(1238, 4, 4.5, 3.5),
(1239, 4, 2.0, 2.5);

SET GLOBAL log_bin_trust_function_creators = 1;

CREATE FUNCTION fn_media(x DECIMAL(3,1), y DECIMAL(3,1))
RETURNS DECIMAL(3,1)
RETURN (x * 0.4) + (y * 0.6);

SELECT Aluno.Nome, disciplina.Nome AS 'Disciplina', 
fn_media(NotaP1, NotaP2)AS 'Média Final'
FROM Notas INNER JOIN Aluno 
ON Notas.AlunoRA = Aluno.RA
INNER JOIN Disciplina
ON Notas.DisciplinaId = Disciplina.Id
WHERE fn_media(NotaP1, NotaP2) >= 4.0 AND fn_media(NotaP1, NotaP2) <= 6.9;

SHOW FUNCTION STATUS;

CREATE PROCEDURE proc_MediaExame (var_DisciplinaId int) 
SELECT AVG(fn_media(notaP1, notaP2)) AS 'Média Exame'
FROM notas 
WHERE disciplinaId = var_DisciplinaId 
AND (fn_media(NotaP1, NotaP2) >= 4.0
AND fn_media(NotaP1, NotaP2) <= 6.9);

show procedure status;

call proc_MediaExame(1);
call proc_MediaExame(2);
call proc_MediaExame(3);
call proc_MediaExame(4);


