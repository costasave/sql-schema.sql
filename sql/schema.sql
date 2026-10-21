-- Criação do Banco de Dados
CREATE DATABASE conecta_xepa;
USE conecta_xepa;

-- Tabela de Doadores (Comércio Varejista)
CREATE TABLE DOADOR (
    PK_ID_Doador INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ VARCHAR(18) NOT NULL UNIQUE,
    Nome_Fantasia VARCHAR(150) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Latitude DECIMAL(10,8),
    Longitude DECIMAL(11,8)
);

-- Tabela de Receptores (Instituições/ONGs)
CREATE TABLE RECEPTOR (
    PK_ID_Receptor INT AUTO_INCREMENT PRIMARY KEY,
    CNPJ VARCHAR(18) NOT NULL UNIQUE,
    Razao_Social VARCHAR(150) NOT NULL,
    Endereco VARCHAR(255) NOT NULL,
    Telefone VARCHAR(20) NOT NULL,
    Latitude DECIMAL(10,8),
    Longitude DECIMAL(11,8)
);

-- Tabela de Lotes de Alimentos Excedentes
CREATE TABLE LOTE_ALIMENTO (
    PK_ID_Lote INT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_Doador INT NOT NULL,
    FK_ID_Receptor INT,
    Descricao_Itens TEXT NOT NULL,
    Peso_Estimado DECIMAL(5,2) NOT NULL,
    Data_Vencimento DATE NOT NULL,
    Status_Coleta VARCHAR(50) DEFAULT 'Disponível',
    FOREIGN KEY (FK_ID_Doador) REFERENCES DOADOR(PK_ID_Doador),
    FOREIGN KEY (FK_ID_Receptor) REFERENCES RECEPTOR(PK_ID_Receptor)
);

-- Tabela de Termo de Responsabilidade (Segurança Jurídica)
CREATE TABLE TERMO_RESPONSAB (
    PK_ID_Termo INT AUTO_INCREMENT PRIMARY KEY,
    FK_ID_Lote INT NOT NULL,
    Data_Hora_Aceite DATETIME DEFAULT CURRENT_TIMESTAMP,
    Assinatura_Digital VARCHAR(255) NOT NULL,
    FOREIGN KEY (FK_ID_Lote) REFERENCES LOTE_ALIMENTO(PK_ID_Lote)
);
