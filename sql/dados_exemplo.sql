-- 1. INSERÇÃO DE DADOS (INSERT)
INSERT INTO DOADOR (CNPJ, Nome_Fantasia, Endereco, Telefone, Latitude, Longitude) 
VALUES ('12.345.678/0001-99', 'Hortifrúti Bom Preço', 'Rua das Flores, 123 - São Paulo', '(11) 98888-7777', -23.550520, -46.633308);

INSERT INTO RECEPTOR (CNPJ, Razao_Social, Endereco, Telefone, Latitude, Longitude) 
VALUES ('98.765.432/0001-11', 'Associação Comunitária Esperança', 'Av. Paulista, 1000 - São Paulo', '(11) 97777-6666', -23.561684, -46.656139);

INSERT INTO LOTE_ALIMENTO (FK_ID_Doador, Descricao_Itens, Peso_Estimado, Data_Vencimento, Status_Coleta) 
VALUES (1, 'Caixas de hortaliças variadas e frutas da estação', 15.50, '2026-06-12', 'Disponível');

-- 2. ATUALIZAÇÃO DE DADOS (UPDATE) - Simulando a reserva do lote pela ONG
UPDATE LOTE_ALIMENTO 
SET Status_Coleta = 'Reservado', FK_ID_Receptor = 1 
WHERE PK_ID_Lote = 1;

-- 3. GERAÇÃO DO TERMO DE RESPONSABILIDADE (INSERT vinculado)
INSERT INTO TERMO_RESPONSAB (FK_ID_Lote, Assinatura_Digital) 
VALUES (1, 'Hash_Assinatura_Digital_Validada_Lei_Do_Bom_Samaritano');

-- 4. CONSULTAS SQL (SELECT) - Visualizar lotes disponíveis por proximidade/status
SELECT l.PK_ID_Lote, d.Nome_Fantasia AS Doador, l.Descricao_Itens, l.Peso_Estimado, l.Status_Coleta
FROM LOTE_ALIMENTO l
JOIN DOADOR d ON l.FK_ID_Doador = d.PK_ID_Doador
WHERE l.Status_Coleta = 'Disponível';

-- 5. REMOÇÃO DE DADOS (DELETE) - Exemplo de exclusão de um registro inválido ou teste
DELETE FROM LOTE_ALIMENTO WHERE PK_ID_Lote = 999;
