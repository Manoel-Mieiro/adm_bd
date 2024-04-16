--  Crie uma função chamada dias_restantes que ao 
-- ser executada informe quantos dias faltam para 
-- terminar o ano
CREATE
OR REPLACE FUNCTION dias_restantes() RETURNS INTEGER AS $ $ DECLARE DAYS_MONTH INTEGER ASW INTEGER;

BEGIN
SELECT
    (
        CASE
            WHEN (
                DATE_PART('MONTH', NOW()) = 'JANUARY'
                OR 'MARCH'
                OR 'MAY'
                OR 'JULY'
                OR 'AUGUST'
                OR 'OCTOBER'
                OR 'DECEMBER' THEN DAYS_MONTH := 31 - DATE_PART('DAY', NOW())
            ),
            WHEN (
                DATE_PART('MONTH', NOW()) = 'APRIL'
                OR 'JUNE'
                OR 'SETEMBER'
                OR 'NOVEMBER' THEN DAYS_MONTH := 30 - DATE_PART('DAY', NOW())
            ),
            WHEN (
                DATE_PART('MONTH', NOW()) = 'FEBRUARY' THEN DAYS_MONTH := 28 - DATE_PART('DAY', NOW())
            )
        );

ASW := DATE_PART (
    ('MONTH', TIMESTAMP 2024 -12 -31) - DATE_PART('MONTH', NOW()) * 31
) - DAYS_MONTH;

RETURN ASW;

END;

$ $ LANGUAGE PLPGSQL;