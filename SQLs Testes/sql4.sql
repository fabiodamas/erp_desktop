-- producao
-- 67
SELECT 
    SUM(ordem_producao_produtos.Quantidade) AS Producao
FROM
    ordem_producao,
    ordem_producao_produtos
WHERE
    ordem_producao.OrdemProducao = ordem_producao_produtos.OrdemProducao AND ordem_producao_produtos.CodigoProduto = '313' AND ordem_producao.DataTermino IS NOT NULL ;

-- entradas
-- null
SELECT 
    SUM(Quantidade) AS Entradas
FROM
    produtos_movimentos
WHERE
    CodigoProduto = '313' AND TipoMovimento = 1 ;

-- AcertoEntradas
-- null
SELECT 
    SUM(Quantidade) AS AcertoEntradas
FROM
    acertos_produtos
WHERE
    CodigoProduto = '313' AND TipoAcerto = 1 ;

-- Pedidos
-- 60
SELECT 
    SUM(pedidos_produtos.Quantidade) AS Pedidos
FROM
    pedidos
        LEFT JOIN
    pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido
WHERE
    pedidos_produtos.CodigoProduto = '313' AND pedidos_produtos.DataProducao IS NOT NULL ;


select * from pedidos_produtos where npedido=15860;

-- comparacao
SELECT 
    SUM(pedidos_produtos.Quantidade) AS Pedidos
FROM
    pedidos
        LEFT JOIN
    pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido
WHERE
    pedidos_produtos.CodigoProduto = '313' AND pedidos.DataProducao IS NOT NULL
ORDER BY pedidos.DataProducao DESC ;

select dataproducao from pedidos where npedido=15860;
select * from pedidos_produtos where CodigoProduto = '313' and npedido = 15860 ;
select * from pedidos_produtos where dataproducao is null;
select * from log_arquivos where ChavesCampos='NPedido' and ChavesValores='15860';

-- AND pedidos_produtos.DataProducao

-- Saidas
-- null
SELECT 
    SUM(produtos_movimentos.Quantidade) AS Saidas
FROM
    produtos_movimentos
WHERE
    produtos_movimentos.CodigoProduto = '313' AND TipoMovimento = 0 ;

-- AcertoSaidas
-- null
SELECT 
    SUM(Quantidade) AS AcertoSaidas
FROM
    acertos_produtos
WHERE
    CodigoProduto = '313' AND TipoAcerto = 0 ;
    
-- empenho
-- 7
SELECT 
    SUM(pedidos_produtos.Quantidade) AS Empenho
FROM
    pedidos
        LEFT JOIN
    pedidos_produtos ON pedidos.NPedido = pedidos_produtos.NPedido
WHERE
    pedidos_produtos.CodigoProduto = '313' AND
    (pedidos_produtos.DataProducao IS NULL ) ;


-- interno
-- null
SELECT 
    SUM(ordem_producao_produtos.Quantidade) AS Interno
FROM
    ordem_producao,
    ordem_producao_produtos
WHERE
    ordem_producao.OrdemProducao = ordem_producao_produtos.OrdemProducao AND ordem_producao_produtos.CodigoProduto = '313' AND ordem_producao.DataTermino IS NULL 