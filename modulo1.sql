-- mostre tudo da tabela city
select * from city;

-- mostre tudo da tabela country 
select * from country;

-- mostre tudo da tabela countrylanguage
select * from countrylanguage;

-- mostre todos os campos da tabela countrylanguage
-- filtrando pelo código do afeganistão 
select * from countrylanguage where CountryCode='AFG';

-- mostre o codigo e nome de cada pais
select code, name from country;

select * from countrylanguage where isOfficial='T';

-- mostre o campos nome e população da tabela city
select name, population from city;

-- alias (apelido)
-- palavra as opcional

-- mostre os campos id, name, CountryCode, district, population da tabela city
select id, name nome, CountryCode codigo, district distrito, population polulacao from city;

-- mostre os campos id, name, CountryCode, district, population da tabela city
select c.id, c.name as nome, c.CountryCode as codigo,
c.district as distrito, c.population as polulacao from city as c;

-- mostre os campos name, population da tabela city e o campo name da tabela country
select c.name, c.population, p.name from city c, country p
where c.CountryCode = p.Code;

-- mostre os campos name, population da tabela city, o campo name da tabela country e o
-- campo language da tabela countrylanguage
select c.name, c.population, p.name, l.language from city c, country p, countrylanguage l
where c.CountryCode = p.Code 
and p.Code = l.CountryCode;

-- mostre os campos name, population da tabela city, o campo name da tabela country e o
-- campo language da tabela countrylanguage, porém só com o idioma oficial(ais)
select c.name, c.population, p.name, l.language from city c, country p, countrylanguage l
where c.CountryCode = p.Code 
and p.Code = l.CountryCode 
and l.IsOfficial = 'T';

select c.name, c.population, p.name, l.language, p.capital, p.LifeExpectancy
from city c, country p, countrylanguage l
where c.CountryCode = p.Code 
and p.Code = l.CountryCode 
and l.IsOfficial = 'T';

-- mostre a quantidade de línguas oficiais por pais agrupados pelo codigo do pais
select countrycode, count(*) from countrylanguage where isOfficial='T'
group by countrycode;

select countrycode, count(*), max(Percentage) from countrylanguage
 where isOfficial='T'
group by countrycode;

select countrycode, count(*), min(Percentage) from countrylanguage
 where isOfficial='T'
group by countrycode;

select countrycode, count(*), avg(Percentage) from countrylanguage
 where isOfficial='T'
group by countrycode;

select countrycode, count(*), sum(Percentage) from countrylanguage
 where isOfficial='T'
group by countrycode
having count(isOfficial)>1;



