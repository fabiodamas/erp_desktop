select 
    *
from
    xml_nfe_clientes;

select 
    *
from
    faturamento;

select 
    f.fatura, f.serie, f.Codigoempresa, f.TipoTela, f.xml, f.chave_acesso_nfe
from
    faturamento f, xml_nfe_clientes x
where
    f.fatura = x.NotaFiscal
    and
