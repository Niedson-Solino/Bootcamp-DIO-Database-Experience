-- criando db para oficina mecanica
-- drop database oficina_mec;
create database oficina_mec;
use oficina_mec;

CREATE TABLE IF NOT EXISTS Cliente (
  idCliente INT(11) NOT NULL AUTO_INCREMENT,
  nome_razãosocial VARCHAR(100) NOT NULL,
  cpf_cnpj VARCHAR(20) NULL DEFAULT NULL,
  email VARCHAR(200) NULL DEFAULT NULL,
  contato VARCHAR(30) NOT NULL,
  cep VARCHAR(100) NULL DEFAULT NULL,
  endereco VARCHAR(255) NULL DEFAULT NULL,
  numero INT(11) NULL DEFAULT NULL,
  complemento VARCHAR(200) NULL DEFAULT NULL,
  bairro VARCHAR(100) NULL DEFAULT NULL,
  cidade VARCHAR(100) NULL DEFAULT NULL,
  estado VARCHAR(2) NULL DEFAULT NULL,
  constraint unique_cpf_cnpj_cliente unique (cpf_cnpj),
  PRIMARY KEY (idCliente))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Veiculo (
  idVeiculo INT NOT NULL AUTO_INCREMENT,
  placa VARCHAR(10) NOT NULL,
  ano INT NULL,
  marca VARCHAR(45) NULL,
  modelo VARCHAR(45) NULL,
  idClienteVeiculo INT(11) NOT NULL,
  PRIMARY KEY (idVeiculo),
  constraint fk_cliente_veiculo foreign key (idClienteVeiculo) references Cliente(idCliente))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Ordem_de_servico (
  idOrdem_de_servico INT NOT NULL AUTO_INCREMENT,
  data_emissao DATE NULL,
  data_conclusao DATE NULL,
  status_serviço ENUM('Em execução', 'Cancelado', 'Finalizado') NOT NULL DEFAULT 'Em execução',
  valor_total FLOAT NULL,
  PRIMARY KEY (idOrdem_de_servico))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Mecanico (
  idMecanico INT(11) NOT NULL AUTO_INCREMENT,
  nome VARCHAR(100) NOT NULL,
  cpf VARCHAR(20) NULL,
  email VARCHAR(200) NULL DEFAULT NULL,
  celular VARCHAR(30) NULL DEFAULT NULL,
  cep VARCHAR(100) NULL DEFAULT NULL,
  endereco VARCHAR(255) NULL DEFAULT NULL,
  numero INT(11) NULL DEFAULT NULL,
  complemento VARCHAR(200) NULL DEFAULT NULL,
  cidade VARCHAR(100) NULL DEFAULT NULL,
  estado VARCHAR(2) NULL DEFAULT NULL,
  especialidade VARCHAR(45) NULL,
  PRIMARY KEY (idMecanico))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Estoque (
  idEstoque INT NOT NULL AUTO_INCREMENT,
  quantidade_estoque INT NOT NULL DEFAULT 1,
  especificidade VARCHAR(255) NULL,
  status_peça ENUM('Disponivel', 'Em falta') NULL DEFAULT 'Disponivel',
  PRIMARY KEY (idEstoque))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Peça (
  idPeça INT NOT NULL AUTO_INCREMENT,
  idEstoquePeça INT NOT NULL,
  valor_peca FLOAT NOT NULL,
  especificidade VARCHAR(255) NULL,
  PRIMARY KEY (idPeça),
  constraint fk_Estoque_Peça foreign key (idEstoquePeça) references Estoque(idEstoque))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

CREATE TABLE IF NOT EXISTS Autorização (
  idVeiculo_Autorização INT NULL,
  idOrdem_de_servico_Autorização INT NULL,
  Autorização ENUM('Aprovado', 'Cancelado') NOT NULL DEFAULT 'Aprovado',
  PRIMARY KEY (idVeiculo_Autorização, idOrdem_de_servico_Autorização),
  constraint fk_Veiculo_Autorização_OV foreign key (idVeiculo_Autorização) references Veiculo(idVeiculo),
  constraint fk_Ordem_de_serviço_Autorizaçãop_OV foreign key (idOrdem_de_servico_Autorização) references Ordem_de_servico(idOrdem_de_servico))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Ordem_de_servico_Peça (
  idPeça_OP INT NULL,
  idOrdem_de_servico_OP INT NULL,
  quantidade_peça INT NULL,
  PRIMARY KEY (idPeça_OP, idOrdem_de_servico_OP),
  constraint fk_Peça_OP foreign key (idPeça_OP) references Peça(idPeça),
  constraint fk_Ordem_de_servico_OP foreign key (idOrdem_de_servico_OP) references Ordem_de_servico(idOrdem_de_servico))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS Ordem_de_servico_Mecanico (
  idOrdem_de_servico_OM INT NULL,
  idMecanico_OM INT(11) NULL,
  valor_mão_de_obra FLOAT NOT NULL DEFAULT '100',
  especificidade VARCHAR(255) NULL,
  PRIMARY KEY (idOrdem_de_servico_OM, idMecanico_OM),
  constraint fk_Ordem_de_servico_OM foreign key (idOrdem_de_servico_OM) references Ordem_de_servico(idOrdem_de_servico),
  constraint fk_Mecanico_OM foreign key (idMecanico_OM) references Mecanico(idMecanico))
ENGINE = InnoDB;













