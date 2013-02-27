SELECT 
    *
FROM
    roteiro_produtivo
where
    CodigoProduto = '4010' and ordemproducao = 7230 and codigosetor=175;

select * from genericos where codigo=175;

select 
    *
from
    pedidos_produtos
where
    quantidade = 100 and codigoproduto = '4010';



SELECT 
    *
FROM
    ordem_producao_produtos
WHERE
    OrdemProducao = '7230' AND CodigoProduto = '4010';
    
SELECT Especie, Marca FROM configuracoes_proprietario    ;
SELECT * FROM packing_list_produtos where pedido=15323