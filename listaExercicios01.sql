
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

--07
SELECT curso, COUNT(aluno_id) AS total_de_alunos
FROM matriculas
GROUP BY curso;

--08
SELECT produto, AVG(receita) AS media_de_receita
FROM vendas
GROUP BY produto;

--09
SELECT produto, SUM(receita) AS receita_total
FROM vendas
GROUP BY produto
HAVING SUM(receita) > 10000;

--10
SELECT autores.nome
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
HAVING COUNT(livros.id) > 2;

--11
SELECT livros.titulo, autores.nome AS autor
FROM livros
INNER JOIN autores ON livros.autor_id = autores.id;

--12
SELECT alunos.nome, matriculas.curso
FROM alunos
LEFT JOIN matriculas ON alunos.id = matriculas.aluno_id;

--13

SELECT autores.nome, livros.titulo
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id;

--14
SELECT matriculas.curso, alunos.nome
FROM matriculas
RIGHT JOIN alunos ON matriculas.aluno_id = alunos.id;

--15
SELECT alunos.nome, matriculas.curso
FROM alunos
INNER JOIN matriculas ON alunos.id = matriculas.aluno_id;

--16
SELECT autores.nome, COUNT(livros.id) AS total_de_livros
FROM autores
LEFT JOIN livros ON autores.id = livros.autor_id
GROUP BY autores.nome
ORDER BY total_de_livros DESC
LIMIT 1;
