-- inserindo dados no esquema

desc cliente;
select * from cliente;
insert into Cliente values 
(default,'Maria M Silva',123456789,'mariadb@yourkut.com',999067447,59088745, 'rua silva de prata',25,null,'Centro','Cidade das flores','RN'),
(default,'Autoeletrica veicular',55585897454121,'Autoeletrica@imail.com',32144111, 57877123, 'rua praia bela',23,null,'Praia','Pititinga beach','CE'),
(default,'Matheus O Pimentel',987654321,'matheuspipi@bol.com',990874450,59088123, 'rua alameda',289,null,'Neopolis','Cidade das rosas','RN'),
(default,'Lucky proteção veicular',4855321456987,'luckyprotecao@hmail.com',32155887, 51005789, 'rua minas novas',132,'Bloco c apto 2','Jape','Baraunas','RN'),
(default,'Autofinance locação veicular',84585897454121,'Autofinance@imail.com',32147885, 57877552, 'rua praia linda',2345,null,'Praia','Zumbi beach','PB'),
(default,'Roberta Y Assis',123456654,'robertayou@imail.com',990212558, 53458745, 'rua centro do forte',124,'Bloco 12 apto 203','Cidade alta','Praia vermelha','PB'),
(default,'Isabela M Cruz',123987456,'isabelacruzis@imail.com',990648547, 51238745, 'rua ayrton senna',325,null,'Centro','Cidade bela','CE');

desc mecanico;
select * from mecanico;
insert into mecanico values
(default,'Mario Jones', 12345654312, 'mariojones@imail.com', 999087458,59088745, 'rua silva de prata',325,null,'Cidade das rosas','RN','Mecanico'),
(default,'Junior Bil', 33345654312, 'juniobil@imail.com', 999088844,59088321, 'rua borges de bronze',1225,null,'Cidade dos ventos','RN','Eletricista'),
(default,'Juka Pinto', 88945654312, 'jukapinto@imail.com', 999785548,59123387, 'rua novo bagda',10,null,'Cidade dos ventos','RN','Funilaria'),
(default,'Max serrão', 78745654312, 'maxserrao@imail.com', 999089999,59088567, 'rua ayrton senna',5,null,'Cidade das rosas','RN','Mecanico');

desc estoque;
select * from estoque;
insert into estoque values
(default,3,'Chicote eletrico interno',default),
(default,5,'Chicote motor',default),
(default,4,'Chicote porta esquerda',default),
(default,default,'Capo',default),
(default,5,'Tinta preta para pintura',default),
(default,3,'Massa para polimento',default),
(default,10,'Bico injetor',default),
(default,2,'Radiador',default),
(default,0,'Tinta rosa para pintura','Em falta');

desc peça;
select * from peça;
insert into peça values
(default,1,1400,null),
(default,2,1900,null),
(default,3,900,null),
(default,4,1500,null),
(default,5,200,null),
(default,6,50,null),
(default,7,250,null),
(default,8,2500,null),
(default,9,50,null);

desc veiculo;
select * from veiculo;
insert into veiculo values
(default, 'mxm1128',2002,'Chevrolet','Corsa max',1),
(default, 'nnx1129',2010,'Chevrolet','Opala',2),
(default, 'qhq2213',2016,'Fiat','Uno',3),
(default, 'hqh1125',2021,'Chevrolet','Onix',4),
(default, 'hhq8578',2022,'Jeep','Compass',4),
(default, 'mxm5878',2019,'Jeep','Renegade',5),
(default, 'wqh8978',2015,'Chevrolet','Cobalt',7);

desc ordem_de_servico;
select * from ordem_de_servico;
insert into ordem_de_servico values
(default,'2022-09-15','2022-10-15', default, 1500),
(default,'2022-08-12','2022-10-12', default, 2600),
(default,'2022-07-10','2022-11-10', default, 1150),
(default,'2022-10-01','2022-12-01', default, 300),
(default,'2021-12-15','2022-03-15','Finalizado', 1650),
(default,'2022-07-05','2022-12-05', default, 250),
(default,'2022-10-18','2022-12-18', default, 550);

desc ordem_de_servico_mecanico;
select * from ordem_de_servico_mecanico;
insert into ordem_de_servico_mecanico values 
(1,1,default,null),
(2,1,default,null),
(3,2,250,null),
(4,3,150,null),
(5,2,default,null),
(6,4,200,null),
(7,4,300,null);

desc ordem_de_servico_peça;
select * from ordem_de_servico_peça;
insert into ordem_de_servico_peça values 
(1,1,1),
(8,2,2),
(3,3,1),
(4,4,1),
(5,5,4),
(6,6,2),
(7,7,3);

desc autorização;
select * from autorização;
insert into autorização values
(1,1,default),
(2,2,default),
(3,3,default),
(4,4,default),
(5,5,default),
(6,6,default),
(7,7,default);

