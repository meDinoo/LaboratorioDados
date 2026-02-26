create database oficina;

use oficina;
 
 
create table fabricante(
	codigo bigint primary key,
	nome varchar(100) not null,
	telefone varchar(30),
	email varchar(100) not null unique,
	responsavel varchar(100)
);
 
 
create table modelo(
	codigoModelo bigint primary key,
	tipo varchar(100) not null,
	peso decimal(12,4) default(1) ,
	codigofabricante bigint,
	horaTeste int default(100)
);
alter table modelo add foreign key
modelo(codigofabricante) references
fabricante(codigo);
 
create table maquina(
registro varchar(100) primary key,
ano char(4),
horasUso int default(0),
codigoModelo bigint);
 
alter table maquina add foreign key
maquina(codigoModelo) references  
modelo(codigoModelo);

--=============================

create table oficina(
    codgioOficina bigint primary key,
    nome varchar(20) not null,
    cnpj bigint not null unique,
    responsável varchar(40) not null,
    telefone varchar(30),
    email varchar(100) unique
);

create table tecnico(
    codigoTecnico bigint primary key,
    oficina bigint not null
    endereço nvarchar(100),
    telefone varchar(15),
    salario bigint,
    qualificação varchar(30)
);
alter table tecnico add foreign key(oficina) 
references oficina(codigoOficina); 

create table teste(
    pontuação int not null,
    resultado int not null,
    recomendações varchar(255),
    Oficina bigint ,
    Tecnico bigint ,
    codigoTeste bigint primary key
);
alter table teste add foreign key (Oficina) references
oficina(codigoOficina);

alter table teste add foreign key (Tecnico) references
tecnico(codigoTecnico);


create table modelo_tecnico(
    modelo bigint,
    tecnico bigint,
    
);

alter table modelo_tecnico add foreign key (modelo)
references modelo(codigoModelo);
alter table modelo_tecnico add foreign key (tecnico)
references tecnico(codigotecnico);


create table modelo_oficina(
    modelo bigint,
    oficina bigint
);

alter table modelo_oficina add foreign key (modelo)
references modelo(codigoModelo);
alter table modelo_oficina add foreign key (oficina)
references oficina(codigooficina);
