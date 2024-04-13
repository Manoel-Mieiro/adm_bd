-- CRIE UMA VIEW QUE APRESENTE O NOME E A DATA DE NASCIMENTO DOS ALUNOS QUE
-- ESTÃO MATRICULADOS NO CURSO "BANCO DE DADOS"
CREATE VIEW MATRICULADOS_BD AS
SELECT
    A.NOME,
    A.DATA_NASCIMENTO
FROM
    MATRICULA AS M
    JOIN CURSO AS C ON M.ID_CURSO = C.ID_CURSO
    JOIN ALUNOS AS A ON M.ID_ALUNO = A.ID_ALUNO
WHERE
    C.NOME = 'BANCO DE DADOS'