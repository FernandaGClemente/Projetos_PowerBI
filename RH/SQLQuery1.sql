/****** Script do comando SelectTopNRows de SSMS  ******/
SELECT [ID RH]
      ,[Nome Completo]
      ,[Estado Civil]
      ,[Sexo]
      ,[Data de Nascimento]
      ,[Endereço]
      ,[Data de Contratacao]
      ,[Data de Demissao]
      ,[Salario Base]
      ,[Impostos]
      ,[Beneficios]
      ,[VT]
      ,[VR]
      ,[Cargo]
      ,[Nível]
      ,[Área]
      ,[Ferias Acumuladas]
      ,[Horas Extras]
      ,[Imagem]
      ,[Avaliação do Funcionário]
      ,[Trabalho em Equipe]
      ,[Liderança]
      ,[Comunicação]
      ,[Iniciativa]
      ,[Organização]
  FROM [Projeto_RH].[dbo].[BaseFuncionario]

-- Total de contratação, Demiissão, Funcionários ativos e Salario total
SELECT 
	COUNT([Data de Contratacao]) AS 'Total de Contratação', 
	COUNT([Data de Demissao]) AS 'Total de Demissão',
	COUNT([Data de Contratacao])-COUNT([Data de Demissao]) AS 'Total de funcionários ativos',
	ROUND(SUM([Salario Base]+[Beneficios]+[VT]+[VR]+[Impostos]),2) as 'Salário total'
FROM [Projeto_RH].[dbo].[BaseFuncionario]

-- Média das notas das competencias dos funcionarios
SELECT ROUND(AVG(Notas),2) AS 'Média das notas das competências dos funcionário' FROM
(SELECT [ID RH], Competencia, Notas
FROM [Projeto_RH].[dbo].[BaseFuncionario]
UNPIVOT (
  Notas FOR Competencia IN ([Trabalho em Equipe],[Liderança],[Comunicação],[Iniciativa],[Organização])
) AS tabela_pivot) AS Tabela_avaliação;

-- As 10 maiores médias de notas das competencias dos funcionarios
SELECT TOP (10) [ID RH], ROUND(AVG(Notas),2) AS 'Média das notas' FROM
(SELECT [ID RH], 'Trabalho em Equipe' AS Competencia, [Trabalho em Equipe] AS Notas FROM [Projeto_RH].[dbo].[BaseFuncionario]
UNION ALL
SELECT [ID RH], 'Liderança' AS Competencia, [Liderança] AS Notas FROM [Projeto_RH].[dbo].[BaseFuncionario]
UNION ALL
SELECT [ID RH], 'Comunicação' AS Competencia, [Comunicação] AS Notas FROM [Projeto_RH].[dbo].[BaseFuncionario]
UNION ALL
SELECT [ID RH], 'Iniciativa' AS Competencia, [Iniciativa] AS Notas FROM [Projeto_RH].[dbo].[BaseFuncionario]
UNION ALL
SELECT [ID RH], 'Organização' AS Competencia, [Organização] AS Notas FROM [Projeto_RH].[dbo].[BaseFuncionario]) AS Tabela_avaliação
GROUP BY [ID RH]
ORDER BY 'Média das notas' DESC;