-- CREATE DATABASE BIBLIOTECA;

CREATE TABLE Autores(
    Autores_ID                      INT PRIMARY KEY IDENTITY,
    Nome                            NVARCHAR(100),
    Sobrenome                       NVARCHAR(100)
);

CREATE TABLE Editoras (
    Editoras_ID                     INT PRIMARY KEY IDENTITY,
    Nome                            NVARCHAR (100),
    Pais                            NVARCHAR (100)
);

CREATE TABLE Generos (
    Generos_ID                      INT PRIMARY KEY IDENTITY,
    Descricao                       NVARCHAR (100)
);

CREATE TABLE Livros (
    Livros_ID                       INT PRIMARY KEY IDENTITY,
    Titulo                          NVARCHAR(100),
    Ano_Publicacao                  NVARCHAR(100),
    Autor_ID                        INT FOREIGN key REFERENCES Autores (Autores_ID),
    Editora_ID                      INT FOREIGN KEY REFERENCES Editoras (Editoras_ID),
    Genero_ID                       INT FOREIGN KEY REFERENCES Generos (Generos_ID),
    ISBN                            NVARCHAR (30)
);

CREATE TABLE Usuarios (
    Usuarios_ID                     INT PRIMARY KEY IDENTITY,
    Nome                            NVARCHAR (100),
    Email                           NVARCHAR (100),
    Data_Nascimento                 DATE,
    Endereco                        NVARCHAR (200)
);

CREATE TABLE Emprestimos (
    Emprestimo_ID                   INT PRIMARY KEY IDENTITY,
    Usuario_ID                      INT FOREIGN KEY REFERENCES Usuarios (Usuarios_ID),
    Livros_ID                       INT FOREIGN KEY REFERENCES Livros (Livros_ID),
    Data_Emprestimos                DATE,
    Data_Devolucao                  DATE,
    STATUS                          NVARCHAR (50)
);



