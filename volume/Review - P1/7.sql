-- CRIE UMA FUNCTION QUE RETORNE A QUANTIDADE DE ALUNOS MATRICULADOS EM UM
-- CURSO
CREATE
OR REPLACE FUNCTION ALUNOS_MATRICULADOS (COURSE_ID INTEGER) RETURNS INTEGER AS $ $ BEGIN RETURN(
    SELECT
        COUNT(M.ID_CURSO) AS MATRICULADOS
    FROM
        MATRICULA AS M
    WHERE
        COURSE_ID = M.ID_CURSO
);

END;

$ $ LANGUAGE PLPGSQL;