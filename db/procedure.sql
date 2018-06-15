--pr_inserir_editora
CREATE PROCEDURE PR_INSERIR_EDITORA
	@cnpj bigint,
	@editoranome varchar (100),
	@pais varchar (100),
	@estado varchar (100),
	@cidade varchar (100),
	@cep varchar (100),
	@logradouro varchar (100),
	@bairro varchar (100),
	@numero int,
	@complemento varchar (100)
AS 
BEGIN
	INSERT INTO editora (cnpj, editoranome, pais, estado, cidade, cep, logradouro, bairro, numero, complemento)
         VALUES(@cnpj, @editoranome, @pais, @estado, @cidade, @cep, @logradouro, @bairro, @numero, @complemento)
END
GO
--pr_select_editora
CREATE PROCEDURE PR_SELECT_EDITORA
	@cnpj bigint = 0
AS
BEGIN
	if (@cnpj = 0) 
		select e.cnpj, e.editoranome,e.cidade, e.logradouro
		from editora e
	else
		select *
		from editora where cnpj = @cnpj
END
GO

CREATE PROCEDURE PR_ATUALIZAR_EDITORA
	@cnpj bigint,
	@editoranome varchar (100),
	@pais varchar (100),
	@estado varchar (100),
	@cidade varchar (100),
	@cep varchar (100),
	@logradouro varchar (100),
	@bairro varchar (100),
	@numero int,
	@complemento varchar (100)
AS 
BEGIN
	UPDATE editora
	SET
		editoranome = @editoranome,
		pais = @pais,
		estado = @estado,
		cidade = @cidade,
		cep = @cep,
		logradouro = @logradouro,
		bairro = @bairro,
		numero = @numero,
		complemento = @complemento
	WHERE cnpj = @cnpj
END
GO

CREATE PROCEDURE PR_DELETAR_EDITORA
	@cnpj bigint
AS 
BEGIN
	delete editora
	where cnpj = @cnpj
END
GO

SELECT * FROM editora
GO

---------------------------------------------editoratelefone------------------------------------------------------
/*
NADA
*/
---------------------------------------------Livro----------------------------------------------------------------

--pr_inserir_livro
CREATE PROCEDURE PR_INSERIR_LIVRO
	@editora_cnpj bigint,
	@isbn bigint,
	@qtde int,
	@titulo varchar (100),
	@autor varchar (100),
	@valor decimal
AS 
BEGIN
	INSERT INTO livro (editora_cnpj, isbn, qtde, titulo, autor, valor)
         VALUES(@editora_cnpj, @isbn, @qtde, @titulo, @autor, @valor)
END
GO
--pr_select_livro
CREATE PROCEDURE PR_SELECT_LIVRO
	@isbn bigint = 0
AS 
BEGIN
	if (@isbn = 0)
		select e.editoranome as editora, l.isbn, l.qtde, l.titulo, l.autor, l.valor
		from livro l
		INNER JOIN editora e ON e.cnpj = l.editora_cnpj
	else
		select * from livro where isbn = @isbn
END
GO

CREATE PROCEDURE PR_ATUALIZAR_LIVRO
	@editora_cnpj bigint,
	@isbn bigint,
	@qtde int,
	@titulo varchar (100),
	@autor varchar (100),
	@valor decimal
AS 
BEGIN
	UPDATE livro
	SET
		editora_cnpj = @editora_cnpj,
		qtde = @qtde,
		titulo = @titulo,
		autor = @autor,
		valor = @valor
	WHERE isbn = @isbn
END
GO

CREATE PROCEDURE PR_DELETAR_LIVRO
	@isbn bigint
AS 
BEGIN
	delete categoria_livro
	where livro_isbn = @isbn

	delete livro
	where isbn = @isbn
END
GO

SELECT * FROM livro
GO

---------------------------------------------Cliente----------------------------------------------------------------

--pr_inserir_cliente
CREATE PROCEDURE PR_INSERIR_CLIENTE
	@cpf_cnpj bigint,
	@nome varchar (100),
	@email varchar (100),
	@pais varchar (100),
	@estado varchar (100),
	@cidade varchar (100),
	@cep varchar (100),
	@logradouro varchar (100),
	@bairro varchar (100),
	@numero int,
	@complemento varchar (100),
	@tipo char
AS
BEGIN
	INSERT INTO cliente (cpf_cnpj, nome, email, pais, estado, cidade, cep, logradouro, bairro, numero, complemento, tipo)
         VALUES(@cpf_cnpj, @nome, @email, @pais, @estado, @cidade, @cep, @logradouro, @bairro, @numero, @complemento, @tipo)
END
GO
--pr_select_cliente
CREATE PROCEDURE PR_SELECT_CLIENTE
	@cpf_cnpj bigint = 0
AS 
BEGIN
	if (@cpf_cnpj = 0) 
		select cpf_cnpj, nome, email, pais, estado, cidade, cep, logradouro, bairro, numero, complemento, tipo
		from cliente
	else
		select cpf_cnpj, nome, email, pais, estado, cidade, cep, logradouro, bairro, numero, complemento, tipo
		from cliente where cpf_cnpj = @cpf_cnpj
END
GO

--pr_select_cliente
CREATE PROCEDURE PR_ATUALIZAR_CLIENTE
	@cpf_cnpj bigint,
	@nome varchar (100),
	@email varchar (100),
	@pais varchar (100),
	@estado varchar (100),
	@cidade varchar (100),
	@cep varchar (100),
	@logradouro varchar (100),
	@bairro varchar (100),
	@numero int,
	@complemento varchar (100),
	@tipo char
AS 
BEGIN
	UPDATE cliente
	SET 
		nome = @nome,
		email = @email,
		pais = @pais,
		estado = @estado,
		cidade = @cidade,
		cep = @cep,
		logradouro = @logradouro,
		bairro = @bairro,
		numero = @numero,
		complemento = @complemento,
		tipo = @tipo
	where
		cpf_cnpj = @cpf_cnpj
END
GO

CREATE PROCEDURE PR_DELETAR_CLIENTE
	@cpf_cnpj bigint
AS 
BEGIN
	delete cliente
	where cpf_cnpj = @cpf_cnpj
END
GO

SELECT * FROM cliente
GO

---------------------------------------------Categoria_Livro------------------------------------------------------------

--pr_inserir_CATEGORIA_LIVRO
CREATE PROCEDURE PR_INSERIR_CATEGORIA_LIVRO
	@livro_isbn bigint,
	@categoria varchar (100)
AS 
BEGIN
	INSERT INTO categoria_livro VALUES (@livro_isbn, @categoria)
END
GO
--pr_select_CATEGORIA_LIVRO
CREATE PROCEDURE PR_SELECT_CATEGORIA_LIVRO
	@id bigint = 0
AS 
BEGIN
	if (@id = 0)
		select * from categoria_livro
	else
		select * from categoria_livro cl where cl.livro_isbn = @id
END
GO

CREATE PROCEDURE PR_ATUALIZAR_CATEGORIA_LIVRO
	@id int,
	@livro_isbn bigint,
	@categoria varchar (100)
AS 
BEGIN
	UPDATE categoria_livro
	SET
		livro_isbn = @livro_isbn,
		categoria = @categoria
		
	WHERE id = @id
END
GO

CREATE PROCEDURE PR_DELETAR_CATEGORIA_LIVRO
	@id int
AS 
BEGIN
	delete Categoria_Livro
	where id = @id
END
GO

SELECT * FROM Categoria_Livro
GO 

---------------------------------------------categoria_nome------------------------------------------------------

--pr_select_CATEGORIA_LIVRO
CREATE PROCEDURE PR_SELECT_CATEGORIA
AS 
BEGIN
	select *
	from categoria
END
GO

SELECT * FROM Categoria_Livro
GO

---------------------------------------------categoria_nome------------------------------------------------------
CREATE PROCEDURE PR_SELECT_COMPRA
AS 
BEGIN
	select 
		c.id as id,
		l.titulo as titulo,
		cl.nome as cliente,
		l.valor as valor
	from Cliente_Compra_Livro c
	inner join livro l ON l.isbn = c.livro_isbn
	inner join cliente cl ON cl.cpf_cnpj = c.cliente_id
END
GO

CREATE PROCEDURE PR_INSERIR_COMPRA
	@cliente_id bigint,
	@livro_isbn bigint,
	@data datetime
AS 
BEGIN
	INSERT INTO Cliente_Compra_Livro (cliente_id, livro_isbn, data)
	VALUES (@cliente_id, @livro_isbn, @data)
END
GO