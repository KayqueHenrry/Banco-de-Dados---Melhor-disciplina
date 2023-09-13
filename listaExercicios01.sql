
--01
select titulos from livros;

 --02
select nomes from autores where nascimento < '1900-01-01';

--03
SELECT titulo FROM livros
INNER JOIN autores ON livros.autor_id = autores.id
WHERE autores.nome = 'J.K. Rowling';

--4
SELECT nome FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id
WHERE matriculas.curso = 'Engenharia de Software';

--5
SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto;

--06
SELECT autores.nome, COUNT(livros.id) AS total_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome;
