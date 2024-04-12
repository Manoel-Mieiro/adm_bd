-- Crie uma view que mostre o nome dos cursos com carga horária superior a
-- 60 horas
CREATE VIEW ch_60 AS
SELECT
    c.nome,
    c.carga_horaria
FROM
    cursos as c
WHERE
    c.carga_horaria > 60