    USE master 
    GO

    IF EXISTS (SELECT name FROM sys.databases WHERE name = 'dbtrabandre')
    BEGIN
        DROP DATABASE dbtrabandre
    END
    GO

    CREATE DATABASE dbtrabandre
    GO

    USE dbtrabandre
    GO


    CREATE TABLE Editora (
        cnpj bigint not null,
        editoranome varchar (100) not null unique,
        pais varchar (100) not null,
        estado varchar (100) not null,
        cidade varchar (100) not null,
        cep varchar (100) not null,
        logradouro varchar (100) not null,
        bairro varchar (100) not null,
        numero int not null,
        complemento varchar (100),

        constraint PK_Editora_Cnpj primary Key (cnpj),
        constraint UNQ_EditoraNome unique (editoranome)
    );


    Create TABLE EditoraTelefone(
        editora_cnpj bigint not null,
        telefone varchar (20) not null,
        
        --conferir!
        constraint FK_Editora_Cnpj foreign key (editora_cnpj) references Editora (cnpj),
        constraint PK_EditoraTelefone_CnpjEditora primary Key (telefone)
    );

    Create TABLE Livro(
        editora_cnpj bigint not null,
        isbn bigint not null,
        qtde int not null,
        titulo varchar (100) not null,
        autor varchar (100) not null,
        valor decimal not null,

        constraint FK_Livro_EditoraCnpj foreign key (editora_cnpj) references editora (cnpj),
        constraint PK_Livro primary Key (isbn),
        constraint UNQ_Livro_EditoraCnpj unique (editora_cnpj, isbn)
    );

    Create TABLE Cliente(
        cpf_cnpj bigint not null,
        nome varchar (100) not null,
        email varchar (100) not null,
        pais varchar (100) not null,
        estado varchar (100) not null,
        cidade varchar (100) not null,
        cep varchar (100) not null,
        logradouro varchar (100) not null,
        bairro varchar (100) not null,
        numero int not null,
        complemento varchar (100),
        tipo char not null,
        
        constraint PK_cliente_Id primary key (cpf_cnpj),
        constraint INQ_Cliente_email unique (email),
    );

    CREATE TABLE Cliente_Compra_Livro
    (
        id int IDENTITY(1,1) not null,
        cliente_id bigint not null,
        livro_isbn bigint not null,
        data datetime not null,

        Constraint PK_CompraLivro_Id PRIMARY KEY(id),
        constraint FK_Cliente_Compra_Livro_ClienteId foreign key (cliente_id) references cliente (cpf_cnpj),
        constraint FK_Compra_Livro_Isbn foreign key (livro_isbn) references livro (isbn)
    );

    CREATE TABLE Categoria
    (
        nome varchar (100) not null PRIMARY KEY,
    
        --Constraint PK_Categoria_Nome_Nome PRIMARY KEY(nome),
    );

    CREATE TABLE Categoria_Livro
    (
        id int IDENTITY(1,1) not null,
        livro_isbn bigint not null,
        categoria varchar (100) not null,

        Constraint PK_Categoria_Id PRIMARY KEY(id),
        constraint FK_Categoria_Livro_Isbn foreign key (livro_isbn) references Livro (isbn),
        constraint FK_Categoria_Livro_Categoria_Nome foreign key (categoria) references Categoria (nome),
        constraint INQ_Categoria_Livro unique (livro_isbn, categoria),
    );

