SELECT 
    pse.CodigoProduto,
    p.NomeTecnico,
    -- p.CodigoGrupo,
    pse.Estoque,
    pse.Faltas,
    pse.Empenho,
    pse.Interno,
    pse.Disponivel

FROM
    produtos_status_estoque pse,
    Produtos p
where
    pse.CodigoProduto in (select 
            CodigoProduto
        from
            produtos
        where
            CodigoGrupo in (267 , 101)) and p.CodigoProduto = pse.CodigoProduto ;
    
-- verifica entradas e saídas
select 
    (SELECT 
            SUM(ordem_producao_produtos.Quantidade) AS Producao
        FROM
            ordem_producao,
            ordem_producao_produtos
        WHERE
            ordem_producao.OrdemProducao = ordem_producao_produtos.OrdemProducao AND ordem_producao_produtos.CodigoProduto = 'T13PR' AND ordem_producao.DataTermino IS NOT NULL) As Producao,
    (SELECT 
            SUM(Quantidade) AS Entradas
        FROM
            produtos_movimentos
        WHERE
            CodigoProduto = 'T13PR' AND TipoMovimento = 1) as Entradas,
    (SELECT 
            SUM(Quantidade) AS AcertoEntradas
        FROM
            acertos_produtos
        WHERE
            CodigoProduto = 'T13PR' AND TipoAcerto = 1) as AcertoEntradas,
    (SELECT 
            SUM(pedidos_produtos.Quantidade) AS Pedidos
        FROM
            pedidos
                LEFT JOIN
            pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido
        WHERE
            pedidos_produtos.CodigoProduto = 'T13PR' AND pedidos_produtos.DataProducao IS NOT NULL) as Pedidos,
    (SELECT 
            SUM(produtos_movimentos.Quantidade) AS Saidas
        FROM
            produtos_movimentos
        WHERE
            produtos_movimentos.CodigoProduto = 'T13PR' AND TipoMovimento = 0) as Saidas,
    (SELECT 
            SUM(Quantidade) AS AcertoSaidas
        FROM
            acertos_produtos
        WHERE
            CodigoProduto = 'T13PR' AND TipoAcerto = 0) as AcertoSaidas;
            
           


--  insere para zerar
-- se o total de saídas for maior que o que tem no estoque, nao faz nada
INSERT INTO acertos_produtos (Documento, CodigoProduto, Descricao, Quantidade, TipoAcerto)
values
    (2,
    pse.CodigoProduto,
    Left(p.NomeTecnico,60),
    pse.Estoque,
    0);
            
-- exibe apenas as saídas            
select 
    (SELECT 
            SUM(pedidos_produtos.Quantidade) AS Pedidos
        FROM
            pedidos
                LEFT JOIN
            pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido
        WHERE
            pedidos_produtos.CodigoProduto = 'T13PR' AND pedidos_produtos.DataProducao IS NOT NULL) as Pedidos,
    (SELECT 
            SUM(produtos_movimentos.Quantidade) AS Saidas
        FROM
            produtos_movimentos
        WHERE
            produtos_movimentos.CodigoProduto = 'T13PR' AND TipoMovimento = 0) as Saidas,
    (SELECT 
            SUM(Quantidade) AS AcertoSaidas
        FROM
            acertos_produtos
        WHERE
            CodigoProduto = 'T13PR' AND TipoAcerto = 0) as AcertoSaidas,
    1 + 1 + Pedidos        
            ;
            
-- SubQuery Derived Table (SQL Server 7 e demais)
select 
     COALESCE(Producao, 0) as Producao,
     COALESCE(Entradas, 0) as Entradas,
     COALESCE(AcertoEntradas, 0) as AcertoEntradas,
    (COALESCE(Producao, 0) + COALESCE(Entradas, 0) + COALESCE(AcertoEntradas, 0)) as TotalEntradas,
     COALESCE(Pedidos, 0) as Pedidos,
     COALESCE(Saidas, 0) as Saidas,
     COALESCE(AcertoSaidas, 0) as AcertoSaidas,
    (COALESCE(Pedidos, 0) + COALESCE(Saidas, 0) + COALESCE(AcertoSaidas, 0)) as TotalSaidas
FROM
    (Select 
        (SELECT 
                    SUM(ordem_producao_produtos.Quantidade) AS Producao
                FROM
                    ordem_producao, ordem_producao_produtos
                WHERE
                    ordem_producao.OrdemProducao = ordem_producao_produtos.OrdemProducao AND ordem_producao_produtos.CodigoProduto = 'T13PR' AND ordem_producao.DataTermino IS NOT NULL) AS Producao,
            (SELECT 
                    SUM(Quantidade) AS Entradas
                FROM
                    produtos_movimentos
                WHERE
                    CodigoProduto = 'T13PR' AND TipoMovimento = 1) as Entradas,
            (SELECT 
                    SUM(Quantidade) AS AcertoEntradas
                FROM
                    acertos_produtos
                WHERE
                    CodigoProduto = 'T13PR' AND TipoAcerto = 1) as AcertoEntradas,
            (SELECT 
                    SUM(pedidos_produtos.Quantidade) AS Pedidos
                FROM
                    pedidos
                LEFT JOIN pedidos_produtos ON pedidos_produtos.NPedido = pedidos.NPedido
                WHERE
                    pedidos_produtos.CodigoProduto = 'T13PR' AND pedidos_produtos.DataProducao IS NOT NULL) as Pedidos,
            (SELECT 
                    SUM(produtos_movimentos.Quantidade) AS Saidas
                FROM
                    produtos_movimentos
                WHERE
                    produtos_movimentos.CodigoProduto = 'T13PR' AND TipoMovimento = 0) as Saidas,
            (SELECT 
                    SUM(Quantidade) AS AcertoSaidas
                FROM
                    acertos_produtos
                WHERE
                    CodigoProduto = 'T13PR' AND TipoAcerto = 0) as AcertoSaidas
    From dual) As Q;
      
      
SELECT * FROM produtos_status_estoque WHERE  CodigoProduto = 'T13PR';

select nometecnico from produtos;


