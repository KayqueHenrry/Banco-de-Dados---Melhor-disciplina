select titulos from livros;
select nomes from autores where nascimento < 1900;
SELECT titulo FROM livros
WHERE autor_id = (SELECT id FROM autores WHERE nome = 'J.K. Rowling');
