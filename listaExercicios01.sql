
--01
select titulos from livros;

 --02
select nomes from autores where nascimento < '1900-01-01';

--03
SELECT titulo FROM livros
INNER JOIN autores ON livros.autor_id = autores.id
WHERE autores.nome = 'J.K. Rowling';
