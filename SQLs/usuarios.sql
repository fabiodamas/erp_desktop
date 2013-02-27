SELECT 
    CodigoProduto, NomeTecnico, Ncm
FROM
    PRODUTOS
where
    length(NCM) = 8;


select 
    *
from
    faturamento_produtos
where
    tipotela = 1
        and codigoproduto in (SELECT 
            CodigoProduto
        FROM
            PRODUTOS
        where
            length(NCM) = 0);


select distinct
    length(ncm)
from
    faturamento_produtos
order by id desc;

select 
    CodigoProduto
from
    produtos
where
    CodigoProduto in (select distinct
            CodigoProduto
        from
            faturamento_produtos
        where
            length(ncm) = 0);

select 
    *
from
    log_arquivos
where
    Campo = 'NCM' and ValorNovo <> ''
        and length(Replace(ValorNovo, '.', '')) < 8;



select 
    ID as Código,
    Usuario as Usuário,
    case TipoAlteracao
        when 1 then 'Inclusões'
        when 2 then 'Alterações'
        when 3 then 'Exclusões'
    end as 'Tipo de Alteração',
    DataAlteracao as 'Data da alteração',
    Tabela as Janela,
    ValorNovo as 'Valor Novo',
    ValorAntigo as 'Valor Antigo',
    Computador
from
    log_arquivos
where
    Campo = 'NCM' and ValorAntigo <> ''
        and length(Replace(ValorAntigo, '.', '')) < 8;