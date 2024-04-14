-- Crie um script para criar uma tabela chamada "aluno" com as colunas "id" (chave primária), "nome" e "email".
CREATE TABLE aluno (
    id SERIAL PRIMARY KEY,
    nome VARCHAR (70),
    email VARCHAR (100)
);