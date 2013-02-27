select 
    Concat('"',
            '__export__.hr_employee_category_',
            1,
            '"',
            ',',
            '"',
            Descricao,
            '"')
from
    cargos
order by codigo ;

select 
    count(*)
from
    cargos;

desc cargos;

select 
    *
from
    genericos
where
    tipo = 3
order by Codigo; -- departamentos


desc funcionarios;
desc cargos;

-- CodigoCargo
-- CodigoDepto;


select 
    f.Nome,  c.descricao cargo, g.descricao departamento
from
    funcionarios f inner join cargos c on c.Codigo = f.CodigoCargo 
     inner join genericos g on g.Codigo = f.CodigoDepto 
    

