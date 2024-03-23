-- 8) Crie uma função chamada "gerar_protocolo" que gera um novo protocolo para uma solicitação, utilizando um formato específico, por exemplo, AAAA-SEQ, onde AAAA representa o ano e SEQ um número sequencial, sempre levando a tabela de solicitação em consideração.

CREATE
OR REPLACE FUNCTION GERAR_PROTOCOLO (ANO_SOLICITACAO VARCHAR, SEQUEL VARCHAR) RETURNS VARCHAR AS $$ 
DECLARE
	aaaa VARCHAR;
	seq VARCHAR;
	mascara VARCHAR;
BEGIN
	-- MASK = AAAA - SEQ
	-- AAAA = YEAR
	-- SEQ = 000 + ID 

	SELECT s.ano, s.id INTO aaaa, seq
	FROM sequencia as s;

	mascara :=  CONCAT(aaaa, '-', seq);
	return mascara;
END; $$ LANGUAGE PLPGSQL;