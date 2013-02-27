select Concat(

-- hr.category_employee,category_ids/id
"__export__.hr_employee_",
Convert(Codigo+6,char) ,
"," ,

-- True,active
"True", 
",", 

-- 089.191.748-90,x_CPF
COALESCE(CPF,""), 
",",

-- (14) 9746-3155,mobile_phone
COALESCE(Telefone1,""),  
",",

-- 1968-09-02,birthday
DATE_FORMAT(COALESCE(DataNascto,CONVERT("1900-01-01",DATE)), '%Y-%m-%d'),
",",  


-- base.main_company,company_id/id
"base.main_company"
",",

-- Married,marital
"Married", -- marital
",",


-- base.br,country_id/id
"base.br", -- marital
",",


-- Brasileira,place_of_birth
"Brasileira", 
",",


-- EDSON HENRIQUE CALCIOLARI - 87,name
COALESCE(Nome,""),  -- name
",",

-- JAHIR CALCIOLARI,x_NomeMae
COALESCE(NomeMae,""),  -- name
",",

-- ARDILIA RUSSO CALCIOLARI,x_NomePai
COALESCE(NomePai,""),  -- name
",",

-- 16.828.718-3,x_RG
COALESCE(RG,""),  
",",

-- Male, gender;
"Male" 
",",

-- "**********PLANO DE SAUDE UNIMED**********, notes
"\"",
COALESCE(Observacao,"")
, 
"\"",
",",

-- resource_id/id
"hr.employee_resource_",
Convert(Codigo+6,char)
) from funcionarios ;

select COUNT(*) from funcionarios

