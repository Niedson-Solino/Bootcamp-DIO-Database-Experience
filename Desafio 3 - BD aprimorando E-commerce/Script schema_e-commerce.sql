-- Criando bd para e-commerce
-- drop database ecommerce;
create database ecommerce;
use ecommerce;

-- criando tb cliente
CREATE TABLE IF NOT EXISTS Cliente (
  idCliente INT NOT NULL AUTO_INCREMENT,
  Primeiro_nome VARCHAR(12) NOT NULL,
  Sobrenome VARCHAR(10) NULL,
  Ultimo_nome VARCHAR(15) NULL,
  Cpf VARCHAR(11) NOT NULL,
  Data_de_nascimento DATE NOT NULL,
  Cep VARCHAR(9) NOT NULL,
  Endereço VARCHAR(45) NULL,
  Numero VARCHAR(8) NULL,
  Complemento VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  Cidade VARCHAR(20) NULL,
  Estado CHAR(2) NULL,
  constraint unique_cpf_cliente unique (CPF),
  PRIMARY KEY (idCliente))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- criando tb produto
CREATE TABLE IF NOT EXISTS Produto (
  idProduto INT NOT NULL AUTO_INCREMENT,
  Produto_nome VARCHAR(15) NOT NULL,
  Descrição MEDIUMTEXT NULL,
  Classificação_criança BOOL NULL DEFAULT false,
  Categoria ENUM('Eletrônico', 'Vestimenta', 'Brinquedo', 'Alimentos', 'Moveis') NOT NULL,
  Avaliação FLOAT NULL DEFAULT 0,
  Tamanho VARCHAR(10) NULL,
  PRIMARY KEY (idProduto))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- criando tb pagamento
CREATE TABLE IF NOT EXISTS Pagamento (
  idPagamento INT NOT NULL AUTO_INCREMENT,
  idClientePagamento INT NULL,
  Tipo ENUM('Boleto', 'Pix', 'Cartão', '2 cartões') NOT NULL,
  Dados_pagamento VARCHAR(255) NULL,
  Valor FLOAT NOT NULL,
  Desconto FLOAT NULL DEFAULT 0,
  constraint fk_cliente_pagamento foreign key (idClientePagamento) references Cliente(idCliente),
  PRIMARY KEY (idPagamento))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- criando tb pedido
CREATE TABLE IF NOT EXISTS Pedido (
  idPedido INT NOT NULL AUTO_INCREMENT,
  idClientePedido INT NULL,
  idPagamentoPedido INT NULL,
  Status ENUM('Cancelado', 'Confirmado', 'Em processamento') default 'Em processamento' null,
  Descrição VARCHAR(255) NULL,
  Frete FLOAT NULL DEFAULT 10,
  constraint fk_cliente_pedido foreign key (idClientePedido) references Cliente(idCliente),
  constraint fk_pagamento_pedido foreign key (idPagamentoPedido) references Pagamento(idPagamento),
  PRIMARY KEY (idPedido))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- criando tb estoque
CREATE TABLE IF NOT EXISTS Estoque (
  idEstoque INT NOT NULL AUTO_INCREMENT,
  Quantidade INT NOT NULL DEFAULT 1,
  Local VARCHAR(45) NOT NULL DEFAULT 'Galpão central',
  PRIMARY KEY (idEstoque))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- criando tb fornecedor
CREATE TABLE IF NOT EXISTS Fornecedor (
  idFornecedor INT NOT NULL AUTO_INCREMENT,
  Nome_social VARCHAR(255) NOT NULL,
  CNPJ VARCHAR(15) NOT NULL,
  Contato VARCHAR(15) NOT NULL,
  Cep VARCHAR(9) NOT NULL,
  Endereço VARCHAR(45) NULL,
  Numero VARCHAR(8) NULL,
  Complemento VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  Cidade VARCHAR(20) NULL,
  Estado CHAR(2) NULL,
  constraint unique_cnpf_fornecedor unique (CNPJ),
  PRIMARY KEY (idFornecedor))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- criando tb vendendo externo
CREATE TABLE IF NOT EXISTS Vendedor_externo (
  idVendedor_externo INT NOT NULL AUTO_INCREMENT,
  Nome_social VARCHAR(255) NOT NULL,
  Nome_fantasia VARCHAR(255) NULL,
  CNPJ VARCHAR(15) NULL,
  CPF VARCHAR(11) NULL,
  Contato VARCHAR(15) NOT NULL,
  Cep VARCHAR(9) NOT NULL,
  Endereço VARCHAR(45) NULL,
  Numero VARCHAR(8) NULL,
  Complemento VARCHAR(45) NULL,
  Bairro VARCHAR(45) NULL,
  Cidade VARCHAR(20) NULL,
  Estado CHAR(2) NULL,
   constraint unique_cnpj_vendedorext unique (CNPJ),
   constraint unique_cpf_vendedorext unique (CPF),
  PRIMARY KEY (idVendedor_externo))
ENGINE = InnoDB
AUTO_INCREMENT = 1;

-- criando tb produto_externo (tb N-M produto + vendedor_externo)
CREATE TABLE IF NOT EXISTS Produto_externo (
  idProduto_ext INT(11) NULL,
  idVendedor_externo_ext INT NULL,
  Quantidade INT NULL DEFAULT 1,
  constraint fk_produto_externo foreign key (idProduto_ext) references Produto(idProduto),
  constraint fk_vendedor_externo foreign key (idVendedor_externo_ext) references Vendedor_externo(idVendedor_externo),
  PRIMARY KEY (idProduto_ext, idVendedor_externo_ext))
ENGINE = InnoDB;

-- criando tb produto_pedido (tb N-M produto + pedido)
CREATE TABLE IF NOT EXISTS Produto_pedido (
  idProduto_pp INT(11) NULL,
  idPedido_pp INT(11) NULL,
  Quantidade INT NULL DEFAULT 1,
  Status ENUM('Disponível', 'Sem estoque') NULL DEFAULT 'Disponível',
  constraint fk_produto_ordem foreign key (idProduto_pp) references Produto(idProduto),
  constraint fk_pedido_ordem foreign key (idPedido_pp) references Pedido(idPedido),
  PRIMARY KEY (idProduto_pp, idPedido_pp))
ENGINE = InnoDB;

-- criando tb produto_estoque (tb N-M produto + estoque)
CREATE TABLE IF NOT EXISTS Produto_estoque (
  idProduto_pe INT(11) NULL,
  idEstoque_pe INT NULL,
  Localização VARCHAR(255) NOT NULL,
  constraint fk_produto_local foreign key (idProduto_pe) references Produto(idProduto),
  constraint fk_estoque_local foreign key (idEstoque_pe) references Estoque(idEstoque),
  PRIMARY KEY (idProduto_pe, idEstoque_pe))
ENGINE = InnoDB;

-- criando tb produto_fornecedor (tb N-M produto + fornecedor)
CREATE TABLE IF NOT EXISTS Produto_fornecedor (
  idProduto_pf INT(11) NULL,
  idFornecedor_pf INT(11) NULL,
  Quantidade INT NULL DEFAULT 1,
  constraint fk_produto_fornece foreign key (idProduto_pf) references Produto(idProduto),
  constraint fk_fornecedor_fornece foreign key (idFornecedor_pf) references Fornecedor(idFornecedor),
  PRIMARY KEY (idProduto_pf, idFornecedor_pf))
ENGINE = InnoDB;

-- encontrando as constraint
use information_schema;
select * from referential_constraints where constraint_schema = 'ecommerce';
