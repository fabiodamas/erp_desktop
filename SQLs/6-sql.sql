select * from produtos where produtoacabado=0;

SELECT ft.CodigoPrincipal, ft.CodigoProduto,ft.Descricao,ft.Quantidade,ft.ValorCusto,unidades.Sigla AS Unidade, ft.CodigoUnidade
FROM produtos_ficha_tecnica AS ft 
LEFT JOIN unidades ON unidades.Codigo = ft.CodigoUnidade 
WHERE CodigoPrincipal = '2030T' ;

SELECT * FROM produtos WHERE CodigoProduto = '2030T';
SELECT * FROM produtos_ficha_tecnica WHERE CodigoPrincipal = '2030T';

SELECT CodigoMoeda,QtdMoeda FROM produtos WHERE CodigoProduto = 'ISO126';
-- CodigoMoeda = 95
-- QtdMoeda    = 5.87

SELECT * FROM genericos WHERE Tipo = '20'; -- 95 DOLAR
-- Codigo, Descricao, Tipo
-- 95      Dolar      20
-- 205     Euro       20
-- 277     Real       20

SELECT * FROM indices_financeiros WHERE Codigo=95 ORDER BY Data DESC limit 1;
-- Codigo, Valor,  Data
-- 95    , 1.8953  2012-04-30
-- 95    , 1.8221  2012-03-30 

-- 11.125411
