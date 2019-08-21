create database biblioteca;
use biblioteca;

create table categorias(
ID_Categoria smallint(6) auto_increment primary key,
categoria varchar(30) not null default 'Ficção')
auto_increment=10;

create table editoras(
ID_Editora smallint(6) auto_increment primary key,
nome_Editora varchar(50) not null);

create table autores(
ID_Autor smallint(6) auto_increment primary key,
nome_Autor varchar(30),
sobrenome_Autor varchar(60) not null);

create table livros(
ID_Livro int auto_increment primary key,
nome_Livro varchar(70) not null,
ID_Categoria smallint(6) not null,
ID_Autor smallint(6) not null,
ID_Editora smallint(6) not null,
data_Pub date not null,
preco_Livro decimal(6,2) not null,
ISBN char(13),
foreign key(ID_Categoria) references categorias(ID_Categoria),
foreign key(ID_Autor) references autores(ID_Autor),
foreign key(ID_Editora) references editoras(ID_Editora));

INSERT INTO editoras (nome_Editora) VALUES ('Prentice Hall');
INSERT INTO editoras (nome_Editora) VALUES ('O´Reilly');
INSERT INTO editoras (nome_Editora) VALUES ('Microsoft Press');
INSERT INTO editoras (nome_Editora) VALUES ('Wiley');
INSERT INTO editoras (nome_Editora) VALUES ('McGraw-Hill Education');

INSERT INTO autores(nome_Autor,sobrenome_Autor) VALUES
('Daniel', 'Barret'),
('Gerald', 'Carter'),
('Mark', 'Sobell'),
('William', 'Stanek'),
('Richard', 'Blum'),
('Jostein', 'Gaarder'),
('Umberto', 'Eco'),
('Neil', 'De Grasse Tyson'),
('Stephen', 'Hawking'),
('Stephen', 'Jay Gould'),
('Charles', 'Darwin'),
('Alan', 'Turing'),
('Simon', 'Monk'),
('Paul', 'Scherz');

INSERT INTO categorias(categoria) VALUES
('Tecnologia'),
('História'),
('Literatura'),
('Astronomia');

INSERT INTO livros(nome_Livro, ISBN, data_Pub, preco_Livro, ID_Categoria, ID_Autor, ID_Editora)
VALUES
('Linux Command Line and Shell Scripting','9781118983843', '20150109', 68.35, 10, 5, 4),
('SSH, the Secure Shell','9780596008956', '20050517', 58.30, 10, 1, 2),
('Using Samba','9780596002565', '20031221', 61.45, 10, 2, 2),
('Fedora and Red Hat Linux', '9780133477436', '20140110', 62.24, 10, 3, 1),
('Windows Server 2012 Inside Out','9780735666313', '20130125', 66.80, 10, 4, 3),
('Microsoft Exchange Server 2010','9780735640610', '20101201', 45.30, 10, 4, 3),
('Practical Electronics for Inventors', '9781259587542', '20160324', 67.80, 10, 13, 5);

-- comentário
-- Especificando Colunas
SELECT nome_Autor FROM autores;

 -- Consultas Simples
 SELECT * FROM autores;

--  Especificando Colunas
SELECT nome_livro FROM livros;

--  Especificando Colunas
SELECT nome_Livro, ID_Autor FROM livros;

--  Especificando Colunas
SELECT nome_livro, ISBN FROM livros;

-- Consulta com Ordenação
SELECT * FROM livros
ORDER BY nome_Livro ASC;

-- Consulta com Ordenação
SELECT nome_Livro, preco_Livro FROM livros
ORDER BY preco_Livro desc;

-- Cláusula WHERE
SELECT nome_Livro, data_Pub FROM livros
WHERE ID_Autor=1;

-- Cláusula WHERE
SELECT ID_Autor, nome_Autor FROM autores
WHERE sobrenome_Autor="Stanek";

CREATE TABLE vendas (
ID_Venda smallint primary key,
nome_Vendedor varchar(20),
quantidade int,
produto varchar(20),
cidade varchar(20));

INSERT INTO Vendas (ID_Venda, nome_Vendedor, quantidade, produto, cidade) VALUES
(10,'Jorge',1400,'Mouse','São Paulo'),
(12,'Tatiana',1220,'Teclado','São Paulo'),
(14,'Ana',1700,'Teclado','Rio de Janeiro'),
(15,'Rita',2120,'Webcam','Recife'),
(18,'Marcos',980,'Mouse','São Paulo'),
(19,'Carla',1120,'Webcam','Recife'),
(22,'Roberto',3145,'Mouse','São Paulo');

-- Consulta usando agregação para obter o total de vendas de Mouses (sem o GROUP BY)
SELECT SUM(quantidade) As Total_Mouses FROM vendas
WHERE produto = 'Mouse';

-- Consulta totalizando as vendas de todos os produtos por cidade
SELECT cidade, SUM(Quantidade) As Total FROM vendas
 GROUP BY cidade;

-- Consulta contando o número de registros de vendas (quantidade de vendas) por cidade
SELECT cidade, COUNT(*) As Total FROM vendas
 GROUP BY cidade;

-- Consulta retornando total de vendas das cidades com menos de 2500 produtos vendidos
SELECT cidade, SUM(quantidade) As Total fROM Vendas
GROUP BY cidade
HAVING SUM(Quantidade) > 2500;

-- Consulta retornando total de vendas do produto ‘Teclado’ das cidades com menos de 1500 teclados vendidos
SELECT cidade, SUM(quantidade) As Total_Teclados FROM Vendas
WHERE produto = 'Webcam'
GROUP BY cidade
HAVING SUM(quantidade) > 1500;

-- Operador AND
SELECT * FROM livros
WHERE ID_Livro>2 AND ID_Autor<10;

-- Operador OR 
SELECT * FROM livros
WHERE ID_Livro>2 OR ID_Autor<3;

select * from autores;

-- Operador AND NOT
SELECT * FROM livros
WHERE ID_Livro>2 AND NOT ID_Autor<3;

-- Excluir Registros
DELETE FROM autores WHERE ID_Autor=2;

create table autores2(
ID_Autor smallint(6) auto_increment primary key,
nome_Autor varchar(30),
sobrenome_Autor varchar(60) not null);

INSERT INTO autores2(nome_Autor,sobrenome_Autor) VALUES
('Daniel', 'Barret'),
('Gerald', 'Carter'),
('Mark', 'Sobell'),
('William', 'Stanek'),
('Richard', 'Blum'),
('Jostein', 'Gaarder'),
('Umberto', 'Eco'),
('Neil', 'De Grasse Tyson'),
('Stephen', 'Hawking'),
('Stephen', 'Jay Gould'),
('Charles', 'Darwin'),
('Alan', 'Turing'),
('Simon', 'Monk'),
('Paul', 'Scherz');

select * from autores2;

-- Remove todas as linhas  de uma tabela 
truncate table autores2;

-- Atualizar Registros
UPDATE livros 
SET nome_Livro = 'Linux Total'
WHERE ID_Livro = 2;

select * from livros;

-- LIKE  e NOT LIKE
SELECT * FROM livros 
WHERE nome_Livro LIKE 'F%';

-- ‘%’ – qualquer cadeia de 0 ou mais caracteres
SELECT * FROM livros 
WHERE nome_Livro NOT LIKE 'S%';

-- ‘_’ – Sublinhado: qualquer caractere único.
SELECT nome_livro,preco_Livro FROM livros 
WHERE nome_Livro LIKE '_i%';


