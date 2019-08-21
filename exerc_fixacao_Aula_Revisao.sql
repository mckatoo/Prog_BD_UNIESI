create database exerc_fixacao;
use exerc_fixacao;

CREATE TABLE Funcionarios (
    codigo_Func int PRIMARY KEY,
    codigo_Depto int,
    primeiro_Nome varchar(20),
    segundo_Nome varchar(20),
    ultimo_Nome varchar(20),
    data_Nasc date,
    cpf varchar(14) unique,
    rg varchar(13),
    endereco varchar(60),
    cep varchar(10),
    cidade varchar(30) default 'Itapira',
    fone_Res varchar(14),
    fone_Cel varchar(15),
    funcao varchar(30),
    salario decimal(8,2),
    foreign Key(codigo_Depto) references Departamentos(codigo_Depto));

CREATE TABLE Departamentos (
    codigo_Depto int PRIMARY KEY,
    nome varchar(30),
    localizacao varchar(30)
);

-- 2)
SELECT primeiro_Nome, ultimo_Nome FROM Funcionarios
ORDER BY ultimo_Nome;

-- 3)
SELECT * FROM Funcionarios ORDER BY cidade;

-- 4)
SELECT * FROM Funcionarios
WHERE salario > 1000
ORDER BY primeiro_Nome, segundo_Nome, ultimo_Nome;

-- 5)
SELECT data_Nasc, primeiro_Nome FROM Funcionarios
ORDER BY data_Nasc DESC, primeiro_Nome;

-- 6)
SELECT ultimo_Nome, primeiro_Nome, segundo_Nome, fone_Res, fone_Cel, endereco, cidade FROM Funcionarios
ORDER BY ultimo_Nome, primeiro_Nome, segundo_Nome;

-- 7)
SELECT SUM(salario) AS TOTAL
FROM Funcionarios;

-- 8)
SELECT F.primeiro_Nome, D.nome, F.funcao
FROM Funcionarios F JOIN Departamentos D ON F.codigo_Depto= D.codigo_Depto
ORDER BY F.primeiro_Nome;

-- 9)
SELECT D.nome, SUM(F.salario) AS Total
FROM Departamentos D JOIN Funcionarios F ON D.codigo_Depto= F.codigo_Depto
GROUP BY D.nome;

-- 10)
SELECT D.nome, F.primeiro_Nome
FROM Departamentos D JOIN Funcionarios F ON D.codigo_Depto= F.codigo_Depto
WHERE F.funcao= 'Supervisor'
ORDER BY D.nome;

-- 11)
SELECT COUNT(*) AS TotalFuncionarios
FROM Funcionarios;

-- 12)
SELECT AVG(salario) AS Media
FROM Funcionarios;

-- 13)
SELECT D.nome, MIN(F.salario)
FROM Funcionarios F JOIN Departamentos D ON F.codigo_Depto= D.codigo_Depto
GROUP BY D.nome;

-- 14)
SELECT primeiro_Nome FROM Funcionarios
WHERE cidade = 'Itapira' AND funcao= 'Recepcionista';

-- 15)
SELECT D.nome, MAX(F.salario)
FROM Funcionarios F JOIN Departamentos D ON F.codigo_Depto= D.codigo_Depto
GROUP BY D.nome;













