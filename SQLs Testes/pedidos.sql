

select * from produtos;


select * from pedidos ;

SELECT 
    pedidos_produtos.*
FROM
    pedidos,
    pedidos_produtos,
    produtos
WHERE
    pedidos.NPedido = pedidos_produtos.NPedido 
    and pedidos_produtos.CodigoProduto = produtos.CodigoProduto 
    -- and produtos.NMolde <> '' 
    and pedidos.DataProducao is null 
    and produtos.NomeTecnico not like '%taco%'
    and pedidos_produtos.NPedido = 15863
ORDER BY
    NPedido desc