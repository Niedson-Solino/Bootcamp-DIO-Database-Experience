-- Criando query

-- Consultando total de clientes que realizou pedido
select count(*) as Clientes_ativos from cliente, pedido where idCliente = idClientePedido;

-- Consultando cliente com status do pedido
select concat(Primeiro_nome, ' ', Sobrenome, ' ', Ultimo_nome) as Nome_completo,
CPF,
concat(Endereço,', ',Numero,', ', Cep,', ',Bairro,', ',Cidade,'-',Estado) as Endereço_de_envio,
o.Status,
Descrição
from cliente as c, pedido as o where c.idCliente = o.idClientePedido
order by o.Status;

-- Consultando todos os clientes cadastrado com os status do pedido
select concat(Primeiro_nome, ' ', Sobrenome, ' ', Ultimo_nome) as Nome_completo,
CPF,
concat(Endereço,', ',Numero,', ', Cep,', ',Bairro,', ',Cidade,'-',Estado) as Endereço_de_envio,
o.Status,
Descrição
from cliente left join pedido o on idCliente = idClientePedido;

-- Consultando as informações essenciais das compras realizadas
select concat(Primeiro_nome, ' ', Sobrenome, ' ', Ultimo_nome) as Nome_completo,
c.CPF,
concat(c.Endereço,', ',c.Numero,', ', c.Cep,', ',c.Bairro,', ',c.Cidade,'-',c.Estado) as Endereço_de_envio,
Produto_nome,
Categoria,
o.Status,
Tipo,
Valor,
Desconto,
Frete
from cliente c inner join pedido o on idCliente = idClientePedido
inner join produto_pedido on idPedido_pp = idPedido
inner join pagamento on idPagamento = idPagamentoPedido
inner join produto on idProduto = idProduto_pp
order by o.Status;

-- Consultando relação de produtos vendidos por fornecedores em estoque
select Produto_nome, Descrição, Categoria, Quantidade, Nome_social as Nome_social_fornecedor, Contato, concat(Endereço,', ',Numero,', ', Cep,', ',Cidade,'-',Estado) as Endereço_fornecedor
from produto inner join produto_fornecedor on idProduto_pf = idProduto
inner join FORNECEDOR on idfornecedor_pf = idFornecedor
order by Quantidade;

-- Consultando relação de produtos vendidos por vendedores externos em estoque
select  Produto_nome, Descrição, Categoria, Quantidade, Nome_social as Nome_social_vendedor, Contato, concat(Endereço,', ',Numero,', ', Cep,', ',Cidade,'-',Estado) as Endereço_vendedor
from produto inner join produto_externo on idProduto_ext = idProduto
inner join vendedor_externo on idVendedor_externo_ext = idVendedor_externo
order by Quantidade;

-- Consultando valor total de compra e pedido por cada cliente com pelo menos um pedido efetuado
select concat(Primeiro_nome, ' ', Sobrenome, ' ', Ultimo_nome) as Nome_completo,
CPF,
concat(Endereço,', ',Numero,', ',Cep,', ',Bairro,', ',Cidade,'-',Estado) as Endereço_de_envio,
Tipo as Opção_pagamento,
count(*) as Pedido_efetuado, sum(Valor) as Valor_total from cliente, pagamento where idCliente = idClientePagamento
group by Primeiro_nome
having count(*)>=1;
