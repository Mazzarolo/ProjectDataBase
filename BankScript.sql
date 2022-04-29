create table usuario (
	idPess int unsigned auto_increment,
    nome varchar(255) not null,
    cpf char(11) not null,
    primary key (idPess)
) default charset = utf8mb4;

insert into usuario values (default, 'João Davi Rigo Mazzarolo', '01664366075');

create table estabelecimento (
	idEst int unsigned auto_increment,
    endereco varchar(255),
    cnpj char(14) not null,
    nomeEst varchar(255),
    primary key (idEst)
) default charset = utf8mb4;

insert into estabelecimento values ('1', 'Avenida Rio Branco, 732, CENTRO, Santa Maria, RS', '45543915038154');

create table produto (
	idProd int unsigned auto_increment,
    descricao varchar(255) not null,
    primary key (idProd)
) default charset = utf8mb4;

insert into produto values ('4', 'CHOC TAB GAROTO BRAN');

create table notaFiscal (
	idNota int unsigned auto_increment,
    dataNota date not null,
    horaNota varchar(255) not null,
    pagForm varchar(255) not null,
    idPess int unsigned not null,
    idEst int unsigned not null,
    primary key (idNota),
    foreign key (idPess) references usuario (idPess),
    foreign key (idEst) references estabelecimento (idEst)
) default charset = utf8mb4;

insert into notaFiscal values ('1', '2021-11-17', 'VALOR PAGO R$', '1', '1');

create table item (
	idNota int unsigned,
    noOrd int unsigned,
    preco decimal(4,2) not null,
    qtde float not null,
    idProd int unsigned not null,
    itemMed varchar(255),
    primary key (idNota, noOrd),
    foreign key (idNota) references notaFiscal (idNota),
    foreign key (idProd) references produto (idProd)
) default charset = utf8mb4;

insert into item values ('1', '1', '2.49', '1', '1');

create table associacao (
	idAssoc varchar(255),
    idEst int unsigned,
    idProd int unsigned not null,
    descricao varchar(255) not null,
    primary key (idAssoc, idEst),
    foreign key (idEst) references estabelecimento (idEst),
    foreign key (idProd) references produto (idProd)
) default charset = utf8mb4;

insert into associacao values ('157104', '1', '1');

alter table item add itemMed varchar(255);

drop table usuario;

delete from usuario where idPess = 3;

describe item;

select idNota from notaFiscal
where dataNota = '2022-01-19' AND idPess = '1' AND idEst = '1';

select * from usuario;
select * from estabelecimento;
select * from produto;
select * from notaFiscal;
select * from item;
select * from associacao;

drop database JavaApp;

create database JavaApp;

use JavaApp;