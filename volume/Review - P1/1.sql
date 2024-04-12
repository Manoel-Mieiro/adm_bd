-- Crie uma view que retorne o nome dos alunos que nasceram antes de 1990
CREATE VIEW ALUNOS_90 AS
SELECT
    a.nome as Nome,
    a.data_nascimento
FROM
    alunos as a
WHERE
    date_part('YEAR', a.data_nascimento) < 1990