-- criando a view
CREATE VIEW vw_LivrosAutores
AS SELECT livros.Nome_Livro as Livro , autores.nome_Autor as Autor
FROM livros
INNER JOIN autores
ON livros.ID_Autor = autores.ID_Autor;

-- executando a view
SELECT Livro, Autor
FROM vw_LivrosAutores
ORDER BY Autor;

-- alterando a view
ALTER  VIEW vw_LivrosAutores AS
SELECT livros.nome_Livro AS Livro, autores.nome_Autor AS Autor, livros.preco_Livro AS Valor
FROM livros
INNER JOIN autores
ON livros.ID_Autor = autores.ID_Autor;

-- testando a alteração
SELECT * FROM vw_LivrosAutores;

-- excluindo a view
DROP VIEW vw_LivrosAutores;

-- ------------------------------------------------------------------------------------------
create database aulaview;
use aulaview;

create table marca(
codMarca int not null auto_increment,
marca varchar(30) not null,
primary key(codMarca));

create table veiculos(
placa varchar(7) not null, 
anofabricacao int not null, 
codMarca_fk int, 
modelo varchar(30), 
cor varchar(30),
primary key(placa),
foreign key(codMarca_fk) references marca(codMarca));

create table consumo(
codConsumo int auto_increment not null, 
placa_fk varchar(7) not null, 
kmRodado int,
valor decimal(9,2),
primary key(codConsumo));

alter table consumo add constraint vei_consumo foreign key (placa_fk)
references veiculos(placa);

insert into marca(marca) values ('Gm');
insert into marca(marca) values ('Fiat');
insert into marca(marca) values ('Ford');
insert into marca(marca) values ('Honda');
insert into marca(marca) values ('Kia');

insert into veiculos(placa, anofabricacao,codMarca_fk, modelo, cor) values
('ABC4531',2000,3,'Fiesta','Branco'),
('ABC6534',2013,3,'Cruze','Preto'),
('CBA8554',1978,2,'Fusca','Azul'),
('CCC5234',2018,4,'Civic','Preto'),
('YUY4344',2018,1,'Camaro','Amarelo');

insert into consumo(placa_fk,kmRodado,valor) values ('YUY4344',100,112.00);
insert into consumo(placa_fk,kmRodado,valor) values ('YUY4344',200,109.00);     
insert into consumo(placa_fk,kmRodado,valor) values ('ABC4531',50,90.00);     
insert into consumo(placa_fk,kmRodado,valor) values ('YUY4344',100,130.00);     
insert into consumo(placa_fk,kmRodado,valor) values ('YUY4344',300,120.00);    
insert into consumo(placa_fk,kmRodado,valor) values ('CBA8554',100,120.00);     
insert into consumo(placa_fk,kmRodado,valor) values ('CBA8554',200,120.00);     
insert into consumo(placa_fk,kmRodado,valor) values ('CBA8554',1400,120.00);     
insert into consumo(placa_fk,kmRodado,valor) values ('YUY4344',300,110.00); 

select * from marca;

select * from veiculos;

select * from consumo;

select veiculos.modelo, veiculos.anofabricacao, marca.marca
from veiculos, marca
where veiculos.codMarca_fk = marca.codMarca
order by veiculos.modelo;

select m.marca, v.placa, v.modelo, v.cor, c.kmrodado, c.valor
from marca m, veiculos v, consumo c
where m.codMarca = v.codMarca_fk and c.placa_fk = v.placa;

select m.marca, v.modelo, v.cor, avg(c.kmRodado) as 'media final'
from marca m, veiculos v, consumo c
where m.codMarca = v.codMarca_fk and v.placa = c.placa_fk
group by m.marca, v.modelo, v.cor
order by v.modelo;

select m.marca, count(*) as "Qt.Marcas"
from marca m, veiculos v
where m.codMarca = v.codMarca_fk
group by m.marca
order by marca desc;

create view qtdveiculospormarca as
select m.marca, count(*) as "Qt.Marcas"
from marca m inner join veiculos v on v.codMarca_fk = m.codMarca
group by m.marca;

select * from qtdveiculospormarca;

select marca from qtdveiculospormarca;

create view viewmarca as
select codMarca, marca from marca;

select * from viewmarca;

alter view viewmarca as
select codMarca as numeromarca, marca as marcaveiculo 
from marca;
-- order by marca  >> view não pode ser ordenada

insert into viewmarca(marcaveiculo) values ('Hyundai');

select * from viewmarca;

select * from marca;

select * from viewmarca order by marcaveiculo;

update viewmarca set marcaveiculo = 'HONDA' where numeromarca = 4;

drop view viewmarca;
-- para elimitar a view.
