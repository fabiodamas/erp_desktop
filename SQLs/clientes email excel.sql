select 
    clientes.CodigoCliente,
    clientes.NomeFantasia,
    clientes.Telefone1,
    clientes.Cep,
    clientes.Estado,
    clientes.Bairro,
    clientes.Endereco,
    clientes.EmailNFEXML AS Email,
    clientes.Site,
    cidades.Cidade AS Cidade,
    setor.Setor,
    paises.Pais,
    clientes_emails.Descricao,
    clientes_emails.Email
from
    clientes_emails
        LEFT JOIN
    clientes ON clientes.CodigoCliente = clientes_emails.CodigoCliente
        LEFT JOIN
    cidades ON clientes.CodigoCidade = cidades.CodigoCidade
        LEFT JOIN
    setor ON clientes.SetorNormal = setor.Codigo
        LEFT JOIN
    paises ON clientes.CodigoPais = paises.CodigoPais
where
    clientes.CoDigocliente is not null
order by clientes.Codigocliente;


