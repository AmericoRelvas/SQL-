USE world;
SHOW Tables;
SHOW COLUMNS FROM country;
SELECT Name FROM city WHERE Name LIKE 'Sor%';
SELECT Name, population FROM city WHERE Name LIKE 'Sor%';
SELECT city.Name, city.population, country.Name FROM city, country WHERE city.Name LIKE 'Sor%' AND city.CountryCode = country.Code;
use guiatur;
insert into pais (nome, continente, codigo)
values ('Brasil','América','BRA');
select * from pais;
insert into pais (nome, continente, codigo)
values 
('China','Ásia','CHI'),
('Japão','Ásia','JPN');
describe estado;
insert into estado (nome, sigla)
values
('Maranhão','MA'),('São Paulo','SP'),('Santa Catarina','SC'),('Rio de Janeiro','RJ');
insert into cidade (nome, populacao)
values ('Sorocaba','700000'),('Déli','26000000'),('Tóquio','38000000');
select * from  estado;
insert into ponto_tur (nome, tipo)
values ('Quinzinho de Barros','Instituição'),
('Parque Estadual do Jalapão','Atrativo'),
('Torre Eiffel','Atrativo'),
('Fogo de Chão','Atrativo');
select * from ponto_tur;

update ponto_tur set tipo = 'Atrativo' where id = 1;
update pais set codigo = 'IND' where id = 2;

select * from cidade;

delete from cidade where id = 1;

create table linguagemPais (
	id int not null auto_increment primary key,
    codigoPais int,
    linguagem varchar(30) not null default '',
    oficial enum('Sim','Não') not null default 'Não'
    );
    
alter table linguagemPais add constraint FK_linguagemPais
foreign key (codigoPais) references pais(id);

describe linguagemPais;

alter table linguagemPais modify codigoPais int not null;

alter table ponto_tur add coordenada point;
drop table coordenada;
alter table pais add interesse enum('0','1','2','3','4','5','6','7','8','9','10');

alter table cidade add melhoresRest varchar(300) default'';