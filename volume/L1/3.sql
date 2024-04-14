--  Para unir as duas tabelas, crie um script para criação de uma terceira tabela chamada “nota_aluno”.
--  Essa tabela deve possuir as colunas “id_aluno”, “id_disciplina” e “nota”.
CREATE TABLE nota_aluno (
    id_aluno INT REFERENCES aluno(id),
    id_disciplina INT REFERENCES disciplina(id),
    nota_aluno NUMERIC,
    PRIMARY KEY(id_aluno, id_disciplina)
);