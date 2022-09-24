-- Criando query

-- Consultando total de veiculos em atendimento ou atendido
select count(*) as Veiculos_atendidos from veiculo, ordem_de_servico where idVeiculo = idOrdem_de_servico;

-- Consultando cliente e carro
select nome_razãosocial as Nome_ou_Razão_social, cpf_cnpj as CPF_ou_CNPJ, Email, Contato,
concat(Endereco,', ',Numero,', ', Cep,', ',Bairro,', ',Cidade,'-',Estado) as Endereço_do_cliente,
Placa,Ano,Marca,Modelo
from cliente, veiculo where idCliente = idVeiculo;

-- Consultando as informações essenciais dos carros
select Placa,Ano,Marca,Modelo,nome_razãosocial as Nome_ou_Razão_social, Email, Contato,
concat(Endereco,', ',Numero,', ', Cep,', ',Bairro,', ',Cidade,'-',Estado) as Endereço_do_cliente,
Autorização as Autorização_do_cliente, Data_emissao as Data_de_emissao, data_conclusao as Data_prevista_conclusao, Status_serviço, Valor_total
from veiculo inner join cliente on idCliente = idClienteVeiculo
inner join autorização on idVeiculo_Autorização = idVeiculo
inner join ordem_de_servico on idOrdem_de_servico_Autorização = idOrdem_de_servico;

-- Consultando relação entre mecanicos, carros, ordens de serviço e mão de obra, ordenado por tipo do serviço
select especialidade as Tipo_do_serviço,Placa,Ano,Marca,Modelo,Autorização as Autorização_do_cliente, Nome as Nome_mecanico, Celular,
Data_emissao as Data_de_emissao, data_conclusao as Data_prevista_conclusao, Status_serviço, valor_mão_de_obra, Valor_total
from veiculo inner join autorização on idVeiculo_Autorização = idVeiculo
inner join ordem_de_servico on idOrdem_de_servico = idOrdem_de_servico_Autorização
inner join ordem_de_servico_mecanico on idOrdem_de_servico_OM = idOrdem_de_servico
inner join mecanico on idMecanico = idMecanico_OM
order by Tipo_do_serviço;

-- Consultando relação entre peças,carros e ordens de serviço
select Placa,Ano,Marca,Modelo,Autorização as Autorização_do_cliente,quantidade_peça as Peças_utilizadas, e.especificidade as Nome_peça,
quantidade_estoque as Quantidade_em_estoque, Status_peça, Data_emissao as Data_de_emissao, data_conclusao as Data_prevista_conclusao, valor_peca as Valor_pecas , Valor_total 
from veiculo inner join autorização on idVeiculo_Autorização = idVeiculo
inner join ordem_de_servico on idOrdem_de_servico = idOrdem_de_servico_Autorização
inner join ordem_de_servico_peça on idOrdem_de_servico_OP = idOrdem_de_servico
inner join peça on idPeça = idPeça_OP
inner join estoque e on idEstoque = idEstoquePeça;

-- Consultando orçamento total com valores discriminado por cliente em cada carro
select nome_razãosocial as Nome_ou_Razão_social,Placa,Ano,Marca,Modelo,especialidade as Tipo_do_serviço, 
Status_serviço,Data_emissao as Data_de_emissao, data_conclusao as Data_prevista_conclusao,nome as Responsavel_mecanico, e.especificidade as Nome_peça,Quantidade_peça,
Valor_peca as Valor_das_Pecas,Valor_mão_de_obra, Valor_total
from veiculo inner join autorização on idVeiculo_Autorização = idVeiculo
inner join ordem_de_servico on idOrdem_de_servico = idOrdem_de_servico_Autorização
inner join ordem_de_servico_peça on idOrdem_de_servico_OP = idOrdem_de_servico
inner join peça on idPeça = idPeça_OP
inner join estoque e on idEstoque=idEstoquePeça
inner join ordem_de_servico_mecanico on idOrdem_de_servico_OM = idOrdem_de_servico
inner join mecanico on idMecanico = idMecanico_OM
inner join cliente on idCliente = idClienteVeiculo
order by Nome_ou_Razão_social;

-- Consultando relação peça e estoque
select quantidade_estoque as Quantidade_em_estoque, e.especificidade as Nome_da_peça,Status_peça
from estoque e, peça p where idEstoque = idEstoquepeça
order by Quantidade_em_estoque;
