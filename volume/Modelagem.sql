CREATE TABLE tipo_servico (
	id serial NOT NULL,
	nome varchar(45) NOT NULL,
	sigla varchar(10) NULL,
	descricao varchar(255) NULL,
	CONSTRAINT tipo_servico_pkey PRIMARY KEY (id)
);

CREATE TABLE subtipo_servico (
	id serial NOT NULL,
	nome varchar(45) NOT NULL,
	tipo_servico_id int4 NOT NULL,
	duracao_media float8 NULL,
	prazo float8 NULL,
	descricao varchar(255) NULL,
	codigo varchar(10) NOT NULL,
	CONSTRAINT subtipo_servico_pkey PRIMARY KEY (id)
);


CREATE TABLE public.solicitacao (
	id serial4 NOT NULL,
	protocolo varchar(45) NOT NULL,
	created_at timestamp NULL,
	data_criacao timestamp NOT NULL,
	data_prazo timestamp NULL,
	ano varchar NOT NULL,
	deleted_at timestamp NULL,
	subtipo int4 NULL,
	subtipo_service_id int4 NULL,
	situacao_tual varchar(100) NULL,
	CONSTRAINT solicitacao_pkey PRIMARY KEY (id),
	CONSTRAINT solicitacao_protocolo_key UNIQUE (protocolo)
);

CREATE TABLE situacao_solicitacao (
	id serial NOT NULL,
	nome varchar(45) NOT NULL,
	codigo varchar NULL,
	CONSTRAINT situacao_solicitacao_pkey PRIMARY KEY (id)
);

CREATE TABLE historico_solicitacao (
	id serial NOT NULL,
	situacao_solicitacao_id int4 NOT NULL,
	observacao text NULL,
	solicitacao_id int4 NOT NULL,
	"data" timestamp NOT NULL,
	endereco varchar(100) NULL,
	CONSTRAINT historico_solicitacao_pkey PRIMARY KEY (id)
);


ALTER TABLE historico_solicitacao ADD CONSTRAINT fk_historico_pedido1 FOREIGN KEY (solicitacao_id) REFERENCES solicitacao(id);
ALTER TABLE historico_solicitacao ADD CONSTRAINT fk_historico_status_pedido1 FOREIGN KEY (situacao_solicitacao_id) REFERENCES situacao_solicitacao(id);
ALTER TABLE subtipo_servico ADD CONSTRAINT fk_subtipo_servico_tipo_servico1 FOREIGN KEY (tipo_servico_id) REFERENCES tipo_servico(id);
ALTER TABLE solicitacao ADD CONSTRAINT solicitacao_subtipo_fkey FOREIGN KEY (subtipo) REFERENCES subtipo_servico(id);
ALTER TABLE solicitacao ADD CONSTRAINT solicitacao_subtipo_service_id_fkey FOREIGN KEY (subtipo_service_id) REFERENCES subtipo_servico(id);