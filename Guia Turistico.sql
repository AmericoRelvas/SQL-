USE guiatur;

CREATE TABLE pais(  id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,     nome VARCHAR(50) NOT NULL DEFAULT '',     continente ENUM('Asia','America','Africa','Oceania','Europa') NOT NULL,     codigo  CHAR(3) NOT NULL )
CREATE TABLE estado(  
	id INT PRIMARY KEY NOT NULL AUTO_INCREMENT,     
    nome VARCHAR(50) NOT NULL DEFAULT '',          
    sigla  CHAR(2) NOT NULL 
);
SHOW TABLES;
CREATE TABLE cidade(  
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,     
    nome VARCHAR(50) NOT NULL DEFAULT '',          
    populacao  INT NOT NULL 
);
CREATE TABLE ponto_tur(  
	id INT(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,     
    nome VARCHAR(50) NOT NULL DEFAULT '',
    tipo enum('Atrativo','Serviço','Equipamento','Infraestrutura','Instituição'),
    publicado enum('sim','não') not null default 'não'
);
CREATE TABLE coordenada(  
	latitude float(10,6),    
    longitude float(10,6)
);
show Tables;