
delete from pedidos_produtos where Npedido = (
SELECT pedidos.npedido
FROM pedidos 
LEFT JOIN pedidos_produtos ON pedidos.NPedido = pedidos_produtos.NPedido 
WHERE pedidos_produtos.CodigoProduto = 4010
AND pedidos_produtos.DataProducao IS NULL );

SELECT SUM(pedidos_produtos.Quantidade) AS Empenho 
FROM pedidos 
LEFT JOIN pedidos_produtos ON pedidos.NPedido = pedidos_produtos.NPedido 
WHERE pedidos_produtos.CodigoProduto = 4010
AND pedidos_produtos.DataProducao IS NULL ;


delete from pedidos_produtos where Npedido = 14814;
delete from pedidos_produtos where Npedido = 15212;
delete from pedidos_produtos where Npedido = 15558;
delete from pedidos_produtos where Npedido = 15719;
delete from pedidos_produtos where Npedido = 15763;



