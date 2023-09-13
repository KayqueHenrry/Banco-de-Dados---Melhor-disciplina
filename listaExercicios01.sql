
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
