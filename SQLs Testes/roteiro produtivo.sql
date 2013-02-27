select 
    rp.OrdemProducao, funcionarios.Nome "Responsável 1", genericos.Descricao "Operação", rp.CodigoProduto, rp.PeriodoInicial, rp.PeriodoFinal, rp.Quantidade
from
    roteiro_produtivo rp,
    funcionarios,
    genericos
where
    (ordemproducao = 7126 or 
    ordemproducao = 6668 ) and
    funcionarios.codigo= rp.codigoresponsavel1 and
    genericos.Codigo = rp.CodigoSetor;
    
select * from genericos    
