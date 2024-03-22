-- Inserindo dados na tabela tipo_servico
INSERT INTO tipo_servico (nome, sigla, descricao) VALUES
('Limpeza de vias públicas', 'LVP', 'Serviços de limpeza e manutenção de ruas e calçadas'),
('Reparo de iluminação pública', 'RIP', 'Serviços de reparo e manutenção de postes e luminárias'),
('Coleta de lixo', 'CL', 'Serviços de coleta e transporte de resíduos sólidos');

-- Inserindo dados na tabela subtipo_servico
INSERT INTO subtipo_servico (nome, tipo_servico_id, duracao_media, prazo, descricao, codigo) VALUES
('Varrição de ruas', 1, 2.5, NULL, 'Varrição manual e mecânica das vias públicas', 'VRR'),
('Reparo de lâmpadas', 2, 1.5, 3, 'Substituição de lâmpadas danificadas', 'RLM'),
('Coleta domiciliar', 3, 4, NULL, 'Coleta de resíduos domiciliares', 'CD');
INSERT INTO subtipo_servico (nome, tipo_servico_id, duracao_media, prazo, descricao, codigo) VALUES
('Capinação de canteiros', 1, 3, NULL, 'Serviços de capinação e remoção de ervas daninhas em canteiros', 'CAP'),
('Limpeza de bueiros', 1, 2, 5, 'Desobstrução e limpeza de bueiros e sistemas de drenagem', 'BUE');
INSERT INTO subtipo_servico (nome, tipo_servico_id, duracao_media, prazo, descricao, codigo) VALUES
('Reparo de fiação elétrica', 2, 2.5, 7, 'Reparo e substituição de fiação elétrica em postes', 'RFE'),
('Troca de reatores', 2, 1.8, 3, 'Substituição de reatores danificados em luminárias', 'TRR');

-- Inserindo dados na tabela situacao_solicitacao
INSERT INTO situacao_solicitacao (nome, codigo) VALUES
('Pendente', 'PEN'),
('Em andamento', 'AND'),
('Concluída', 'CON');

-- Inserindo dados na tabela solicitacao
INSERT INTO solicitacao (protocolo, created_at, data_criacao, data_prazo, ano, subtipo, subtipo_service_id) VALUES
('2024-0001', CURRENT_TIMESTAMP, '2024-03-17 10:00:00', NULL, '2024', 1, NULL),
('2024-0002', CURRENT_TIMESTAMP, '2024-03-17 11:30:00', NULL, '2024', NULL, 2),
('2024-0003', CURRENT_TIMESTAMP, '2024-03-17 13:15:00', NULL, '2024', 3, NULL);

-- Inserindo dados na tabela historico_solicitacao
INSERT INTO historico_solicitacao (situacao_solicitacao_id, observacao, solicitacao_id, data, endereco) VALUES
(1, 'Solicitação aguardando alocação de equipe', 1, CURRENT_TIMESTAMP, 'Rua Principal, 123'),
(2, 'Equipe em deslocamento para o local', 2, CURRENT_TIMESTAMP, 'Avenida Central, 456'),
(3, 'Coleta realizada com sucesso', 3, CURRENT_TIMESTAMP, 'Rua Secundária, 789');