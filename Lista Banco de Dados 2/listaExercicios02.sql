-- Ex. 01
CREATE PROCEDURE sp_ListarAutores()
BEGIN
  SELECT * FROM Autor;
END;

-- Ex. 02
CREATE PROCEDURE sp_LivrosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    SELECT Livro.Titulo
    FROM Livro
    JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END;

