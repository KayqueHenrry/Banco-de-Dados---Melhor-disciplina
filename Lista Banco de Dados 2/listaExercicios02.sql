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

-- Ex. 03
CREATE PROCEDURE sp_ContarLivrosPorCategoria(IN categoriaNome VARCHAR(100), OUT totalLivros INT)
BEGIN
    SELECT COUNT(*) INTO totalLivros
    FROM Livro
    JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
    WHERE Categoria.Nome = categoriaNome;
END;

--Ex. 04
CREATE PROCEDURE sp_VerificarLivrosCategoria(IN categoriaNome VARCHAR(100), OUT possuiLivros BOOLEAN)
BEGIN
    DECLARE contador INT;
    CALL sp_ContarLivrosPorCategoria(categoriaNome, contador);
    IF contador > 0 THEN
        SET possuiLivros = TRUE;
    ELSE
        SET possuiLivros = FALSE;
    END IF;
END;

-- Ex.05
CREATE PROCEDURE sp_LivrosAteAno(IN anoPublicacao INT)
BEGIN
    SELECT Titulo
    FROM Livro
    WHERE Ano_Publicacao <= anoPublicacao;
END;

--Ex. 06
CREATE PROCEDURE sp_TitulosPorCategoria(IN categoriaNome VARCHAR(100))
BEGIN
    DECLARE done INT DEFAULT FALSE;
    DECLARE livroTitulo VARCHAR(255);
    DECLARE cursorLivros CURSOR FOR
        SELECT Livro.Titulo
        FROM Livro
        INNER JOIN Categoria ON Livro.Categoria_ID = Categoria.Categoria_ID
        WHERE Categoria.Nome = categoriaNome;
    
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
    
    OPEN cursorLivros;
    
    read_loop: LOOP
        FETCH cursorLivros INTO livroTitulo;
        IF done THEN
            LEAVE read_loop;
        END IF;
        SELECT livroTitulo;
    END LOOP;
    
    CLOSE cursorLivros;
END;

--Ex. 07
CREATE PROCEDURE sp_AdicionarLivro(IN tituloLivro VARCHAR(255), IN editoraID INT, IN anoPublicacao INT, IN numeroPaginas INT, IN categoriaID INT)
BEGIN
    DECLARE EXIT HANDLER FOR SQLEXCEPTION
    BEGIN
        ROLLBACK;
        SELECT 'Erro: Não foi possível adicionar o livro devido a um erro no banco de dados.';
    END;
    
    START TRANSACTION;
    
    -- Verificar se o livro já existe pelo título
    IF (SELECT COUNT(*) FROM Livro WHERE Titulo = tituloLivro) > 0 THEN
        ROLLBACK;
        SELECT 'Erro: Já existe um livro com o mesmo título.';
    ELSE
        INSERT INTO Livro (Titulo, Editora_ID, Ano_Publicacao, Numero_Paginas, Categoria_ID)
        VALUES (tituloLivro, editoraID, anoPublicacao, numeroPaginas, categoriaID);
        COMMIT;
        SELECT 'Livro adicionado com sucesso.';
    END IF;
END;

--Ex. 08
CREATE PROCEDURE sp_AutorMaisAntigo()
BEGIN
  SELECT Nome, Sobrenome
  FROM Autor
  WHERE Data_Nascimento = (SELECT MIN(Data_Nascimento) FROM Autor);
END;

--Ex. 09
CREATE PROCEDURE sp_ListarAutores()
BEGIN
  -- Esta stored procedure lista todos os autores no banco de dados.
  SELECT * FROM Autor;
END;

--10
CREATE PROCEDURE sp_LivrosESeusAutores()
BEGIN
  SELECT Livro.Titulo, Autor.Nome, Autor.Sobrenome
  FROM Livro
  JOIN Autor_Livro ON Livro.Livro_ID = Autor_Livro.Livro_ID
  JOIN Autor ON Autor_Livro.Autor_ID = Autor.Autor_ID;
END;
