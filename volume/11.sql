-- 11) Crie uma trigger chamada "bloquear_exclusao_tipo_servico" que, ao ser acionada antes da exclusão de uma linha na tabela "tipo_servico", verifique se existem subtipos de serviço associados ao tipo de serviço que está sendo excluído e, se existir, cancele a operação de exclusão. Use RAISE EXCEPTION
CREATE
OR REPLACE FUNCTION BLOCK_DELETION () RETURNS TRIGGER AS $$
DECLARE
    join_result INTEGER;
BEGIN
    -- primeiramente, conto a quantidade de correspondências entre tipo_servico e subtipo_servico
    SELECT COUNT(*) INTO join_result
    -- verifico se o id selecionado é o mesmo que quero excluir
    FROM subtipo_servico as ss
	JOIN tipo_servico as t on (t.id = ss.tipo_servico_id)
    WHERE t.id = OLD.id;
    -- se me forem retornadas correspondências, lanço a exception 
     IF join_result > 0 THEN
        RAISE EXCEPTION 'OPERAÇÃO NÃO PODE SER CONCLUÍDA POIS HÁ SUBTIPOS ASSOCIADOS AO REGISTRO!';
    END IF;
    
    RETURN OLD;
END;
$$ LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER BLOQUEAR_EXCLUSAO_TIPO_SERVICO
BEFORE DELETE ON TIPO_SERVICO 
FOR EACH ROW
EXECUTE FUNCTION BLOCK_DELETION ();