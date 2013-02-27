Select distinct
    npedido
from
    pedidos_produtos
where
    DataProducao is null
order by npedido desc;
           
/*
16200
16199
16198
16197
16196
16195
16194
16191
16190
16189
16186
16173
16164
16131
16129
16128
16124
16122
16110
16069
16037
15748
15620
15619
14988
14422
14013
13971
13570
13562
13406
13405
13360
13359
13358
13357
13356
13355
13354
13353
9521
9520
9516
*/
           
select 
    NPedido, DataProducao
from
    pedidos
where
    Npedido = '16196';

SELECT 
    *
FROM
    produtos_status_estoque
WHERE
    CodigoProduto = '2040E';

SELECT 
    *
FROM
    produtos_status_estoque
WHERE
    (estoque < 0) and (CodigoProduto in (select 
            CodigoProduto
        from
            produtos)) and (Left(CodigoProduto,1) <> 'T')

;

