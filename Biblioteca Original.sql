--------------------------
---CRIANDO UMA BILIOTECA--
--------------------------

---------------------------------
--/*Criação de banco de dados*/--
---------------------------------
CREATE DATABASE Biblioteca  -- crianco um banco de Dados--
GO
use Biblioteca;  --é quando voce quer usar database sempre seleciona-lo--
GO

---------------------------
----Criação das tabelas----
---------------------------
CREATE TABLE Autores(
    Autor_ID            INT PRIMARY KEY IDENTITY, -- Chave primaria são chaves únicas que não mudam--
    Nome                VARCHAR (100),
    Sobrenome           VARCHAR(100),
    Nacionalidade       VARCHAR(100),
    Data_Nascimento     DATE
);

CREATE TABLE Editoras (
    Editora_ID          int PRIMARY KEY IDENTITY, -- Chave primaria são chaves únicas que não mudam--
    Nome                VARCHAR (100),
    Pais                VARCHAR (100)
);

CREATE TABLE Generos (
    Genero_ID           INT PRIMARY KEY IDENTITY, -- Chave primaria são chaves únicas que não mudam--
    Descricao           VARCHAR(100)
)

CREATE TABLE Livros (
    Livro_ID            INT PRIMARY KEY IDENTITY, -- Chave primaria são chaves únicas que não mudam--
    Titulo              VARCHAR (100),
    Publicacao          INT,
    Autor_ID            INT FOREIGN KEY REFERENCES Autores(Autor_ID), --------- Fazendo uma referencia a tabela Autores  usando o FOREING--
    Editora_ID          INT FOREIGN KEY REFERENCES Editoras(Editora_ID), ------ Fazendo uma referencia a tabela Editores usando o FOREING--
    Genero_ID           INT FOREIGN key REFERENCES Generos(Genero_ID), -------- Fazendo uma referencia a tabela Generos  usando o FOREING--
    ISBN                VARCHAR(20)
);

CREATE TABLE Usuarios (
    Usuario_ID          INT PRIMARY KEY IDENTITY, ----------------------- Chave primaria são chaves únicas que não mudam--
    Regiao_ID           INT FOREIGN KEY REFERENCES Regioes(Regiao_ID), -- Fazendo uma referencia a tabela Regiao usando o FOREING--
    Nome                VARCHAR(100),
    Email               VARCHAR(100),
    Data_Nascimento     DATE,
    Endereco            VARCHAR(200)
);

CREATE TABLE Regioes (   
    Regiao_ID           INT PRIMARY KEY IDENTITY, -- Chave primaria são chaves únicas que não mudam--
    Cidade              VARCHAR (100),
    Regiao              VARCHAR (100)
);

CREATE TABLE Emprestimos (
    Emprestimo_ID       INT PRIMARY KEY IDENTITY, ---------------------------- Chave primaria são chaves únicas que não mudam--
    Usuario_ID          INT FOREIGN key REFERENCES Usuarios(Usuario_ID), ----- Fazendo uma referencia a tabela Usuarios usando o FOREING--
    Livro_ID            INT FOREIGN KEY REFERENCES Livros(Livro_ID), --------- Fazendo uma referencia a tabela Livros usando o  FOREING--
    Data_Emprestimo     DATE,
    Data_Devolucao      DATE,
    STATUS              VARCHAR (50)
);

CREATE TABLE Precos ( 
    Preco_ID            INT PRIMARY KEY IDENTITY, -------------------- Chave primaria são chaves únicas que não mudam--
    Livro_ID            INT FOREIGN key REFERENCES Livros(Livro_ID), --Fazendo uma referencia a tabela Livros usando o FOREING--
    Preco_Venda         DECIMAL (10,2), -------------------------------Preço de venda do livro--
    Preco_Emprestimo    DECIMAL (10,2), -------------------------------Preço do emprestimo do livro--
    Data_Atualizacao    DATE            -------------------------------Data da ultima atualizacao do preço--
);

CREATE TABLE Emprestimos_Oline ( 
    Emprestimo_Online   INT PRIMARY KEY IDENTITY, -------------------------Chave primaria são chaves únicas que não mudam--
    Livro_ID            INT FOREIGN KEY REFERENCES Livros(Livro_ID),  ---- Fazendo uma referencia a tabela Livros usando o FOREING--
    Usuario_ID          INT FOREIGN key REFERENCES Usuarios(Usuario_ID), --Fazendo uma referencia a tabela Usuarios usando o FOREING--
    Data_Emprestimo     DATE,
    Data_Devolucao      DATE,
    Valor_Emprestimmo   DECIMAL (10,2), -----------------------------------Valor do emprestimo online--
    STATUS              VARCHAR (50)    -----------------------------------Status do emprestimos online( Em andamento, Concluido, Atrasado)--
);

