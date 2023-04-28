CREATE DATABASE Car;
USE Car;
 
CREATE TABLE Fabricante (
	Codigo INT(3) PRIMARY KEY AUTO_INCREMENT,
    Marca CHAR(20) NOT NULL
);
 
CREATE TABLE Veiculo (
	RENAVAN INT(8) PRIMARY KEY,
    Nome VARCHAR(30) NOT NULL,
    Cor VARCHAR (20) NOT NULL,
    Preco DECIMAL(10,2) NOT NULL,
    fabricante_Codigo INT(3) NOT NULL,
    FOREIGN KEY (fabricante_Codigo) REFERENCES Fabricante (Codigo) 
);

insert into Fabricante(Codigo, Marca) values ('0', 'Fiat'),
	('0', 'Chevrolet'),
    ('0', 'Volkswagen'),
    ('0', 'Ford'),
    ('0', 'Honda');

insert into Veiculo(RENAVAN, Nome, Cor, Preco, fabricante_Codigo)
values ('11111111', 'Civic', 'Preto', '150000', '5'),
	('22222222', 'Focus', 'Prata', '130000', '4'),
    ('33333333', 'Golf', 'Vermelho', '140000', '3'),
    ('44444444', 'Onix', 'Branco', '85000', '2'),
    ('55555555', 'Toro', 'Vermelho', '220000', '1'),
    ('66666666', 'Cronos', 'Preto', '106000', '1'),
    ('77777777', 'Cruze', 'Prata', '155000', '2'),
    ('88888888', 'Amarok', 'Prata', '340000', '3'),
    ('99999999', 'CRV', 'Branco', '250000', '1');
    
select * from Veiculo;
select * from Fabricante;

create view selecao as 
select Veiculo.nome as "Veiculo", Fabricante.marca as "Marca", Veiculo.cor as "Cor", Veiculo.preco as "Valor"
from Veiculo inner join Fabricante
where Veiculo.fabricante_codigo = Fabricante.codigo and Veiculo.preco <= 100000;

select * from selecao;
describe selecao;
show tables;

create index index_renavam on veiculo(RENAVAN);

show index from Veiculo;

select nome as "Veiculo", cor as "Cor", preco as "Valor"
from Veiculo
use index (index_renavam) 
where preco<= 100000;
