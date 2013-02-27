select Observacao from ativos ;
SELECT * FROM titulos_pagar where observacao like '&ativo%48%' order by documento desc;
SELECT * FROM titulos_pagar where valortotal=130 and observacao like '%ativo%' order by documento desc;
