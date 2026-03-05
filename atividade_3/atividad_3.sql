use Biblioteca;

/* Criado entidades e atributos  */

create table leitor(
	id INT primary key,
	nome VARCHAR(100) not null,
	email VARCHAR(100) UNIQUE,
	cpf CHAR(11) UNIQUE,
	telefone CHAR(11) UNIQUE,
	cidade VARCHAR(50) not null,
	estado CHAR(2) not null,
	endereco VARCHAR(100) not null,
	data_nascimento DATE
);

create table categoriaLeitor(
	id INT PRIMARY KEY,
	nome VARCHAR(100) not null,
	dias int not null
);
	
create table reserva(
	id INT primary key,
	dataReserva DATE not null,
	dataPrevista DATE,
	situacao VARCHAR(20) not null
);

create table obra(
	id INT primary key,
	isbn CHAR(13) UNIQUE,
	titulo VARCHAR(50) not null,
	autor VARCHAR(50) not null,
	keywords VARCHAR(100),
	dataPublicada DATE not null,
	paginas INT,
	editora VARCHAR(20) not null
);

create table categoriaObra(
	id INT primary key,
	nome VARCHAR(100) not null
);

create table copia (
	id INT primary key,
	situacao VARCHAR(20) not null,
	descritivo VARCHAR(200) not null
);

create table funcionario(
	id INT primary key,
	nome VARCHAR(100) not null,
	email VARCHAR(100) UNIQUE,
	cpf CHAR(11) UNIQUE,
	telefone CHAR(11) UNIQUE,
	cidade VARCHAR(50) not null,
	estado CHAR(2) not null,
	endereco VARCHAR(100) not null,
	data_nascimento DATE
);

create table emprestimo(
	id INT primary key,
	data_emprestimo DATE not null,
	data_prevista DATE,
	data_devolvido DATE,
	situacao VARCHAR(20) not null,
	multa INT

);

/* Criando os relacionamentos com base no DER do professor*/

alter table leitor
add categoriaLeitor_id INT;

alter table leitor
add  constraint fk_categoriaLeitor
foreign KEY(categoriaLeitor_id)
references categoriaLeitor(id);

/* Obra FK*/

alter table obra
add categoriaObra_id INT;

alter table obra 
add constraint fk_categoriaObra
foreign key(categoriaObra_id)
references categoriaObra(id);

/* Copia FK */

alter table copia
add Obra_id INT;

alter table copia 
add constraint fk_Obra
foreign key(Obra_id)
references Obra(id);

/* Reserva FK (leitor)*/

alter table reserva
add leitor_id INT;

alter table reserva 
add constraint fk_leitor
foreign key(leitor_id)
references leitor(id);

/* Reserva FK (obra) */

alter table reserva
add Obra_id INT;

alter table reserva 
add constraint fk_Obra2
foreign key(Obra_id)
references Obra(id);

/* emprestimo FK (leitor)*/

alter table emprestimo
add leitor_id INT;

alter table emprestimo 
add constraint fk_leitor2
foreign key(leitor_id)
references leitor(id);

/* emprestimo FK (funcionario) */

alter table emprestimo
add funcionario_id INT;

alter table emprestimo 
add constraint fk_funcionario
foreign key(funcionario_id)
references funcionario(id);

/* emprestimo FK (copia) */

alter table emprestimo
add copia_id INT;

alter table emprestimo 
add constraint fk_copia
foreign key(copia_id)
references copia(id);