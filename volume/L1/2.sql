-- Crie um script para criar uma tabela chamada "disciplina" com as colunas "id" (chave primária), "nome", “descrição” e “carga horária”.
CREATE TABLE disciplina(
    id SERIAL PRIMARY KEY,
    nome VARCHAR (80),
    descricao VARCHAR (200),
    carga_horaria INT
);