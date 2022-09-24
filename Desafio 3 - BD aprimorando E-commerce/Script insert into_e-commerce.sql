-- inserindo dados
use ecommerce;

desc cliente;
select * from cliente;
insert into Cliente values 
(default,'Maria','M','Silva',123456789,'1997-02-05',59088745, 'rua silva de prata',25,default,'Centro','Cidade das flores','RN'),
(default,'Matheus','O','Pimentel',987654321,'1985-12-15',59088123, 'rua alameda',289,default,'Neopolis','Cidade das rosas','RN'),
(default,'Ricador','F','Silva',321456987,'1992-11-25',51005789, 'rua minas novas',132,'Bloco c apto 2','Jape','Baraunas','RN'),
(default,'Julia','S','França',897454121,'1987-03-12',57877552, 'rua praia linda',2345,default,'Praia','Zumbi beach','PB'),
(default,'Roberta','G','Assis',123456654,'1992-11-23',53458745, 'rua centro do forte',124,'Bloco 12 apto 203','Cidade alta','Praia vermelha','PB'),
(default,'Isabela','M','Cruz',123987456,'1991-03-29',51238745, 'rua ayrton senna',325,default,'Centro','Cidade bela','CE');

desc produto;
select * from produto;
insert into Produto values
(default,'Fone de ouvido','Disponivel na cor vermelho e azul',false,'Eletrônico','4',null),
(default,'Barbie Elsa','Disponivel na cor rosa e roxo',true,'Brinquedo','3',null),
(default,'Body Carters','Disponivel na cor preto e azul',true,'Vestimenta','5',null),
(default,'Microfone Vedo','Disponivel na cor preta',false,'Eletrônico','4',null),
(default,'Sofá retrátil',default,false,'Moveis','3','3x57x80'),
(default,'Fire Stick Amazon',default,false,'Eletrônico','3',null);

desc pagamento;
select * from pagamento;
insert into pagamento values
(default,1,'Boleto',null,'89',default),
(default,2,'Pix',null,'150','10'),
(default,3,'Cartão','Codigo de segurança: 785','200',default),
(default,4,'Pix',null,'100',default);


desc pedido;
select * from pedido;
insert into pedido values
(default,1,1,default,'Compra via app',default),
(default,2,2,default,'Compra via app',50),
(default,3,3,'Confirmado',null,default),
(default,4,4,default,'Compra via web',0);

desc produto_pedido;
select * from produto_pedido;
insert into produto_pedido values
(1,5,5,default),
(2,5,3,default),
(3,6,1,default),
(4,7,4,default);

desc estoque;
select * from estoque;
insert into estoque values
(default,1000,'Rio Grande do Norte'),
(default,500,'Rio Grande do Norte'),
(default,100,'Ceara'),
(default,10,'Ceara'),
(default,60,'Paraiba'),
(default,10,'São paulo');

desc produto_estoque;
select * from produto_estoque;
insert into produto_estoque values
(1,2,'RN'),
(2,6,'SP');

desc fornecedor;
select * from fornecedor;
insert into fornecedor values
(default, 'Almeida e filhos',1234556677878, 990878889, 59887536,'Rua da silva',25,null,null,'Natal','RN'),
(default, 'Eletrônicos Silva',1578811875675, 990154125, 59777536,'Rua Dom Ruan',136,null,null,'Natal','RN'),
(default, 'Eletrônicos Valma',3621889215878, 990412358, 51256957,'Rua Brodovisck',254,null,null,'São Paulo','SP');

desc produto_fornecedor;
select * from produto_fornecedor;
insert into produto_fornecedor values
(1,1,500),
(1,2,400),
(2,2,563),
(3,3,default),
(2,3,10);

desc vendedor_externo;
select * from vendedor_externo;
insert into vendedor_externo values
(default, 'Tech eletronics',null, 1234556677878,null,  990878889, 59887536,'Rua bosque do poetas',25,null,null,'Fortaleza','CE'),
(default, 'Botique Nied',null,null,12458796314, 990154125, 59777536,'Rua Dom Matias',16,null,null,'Rio de Janeiro','RJ'),
(default, 'Kids World',null,3621889215878,null, 990412358, 51256957,'Rua Jon Pinto',24,null,null,'São Paulo','SP');

desc produto_externo;
select * from produto_externo;
insert into produto_externo values
(1,2,80),
(2,1,10),
(3,3,50);

insert into produto_pedido values
(4,7,4,default);