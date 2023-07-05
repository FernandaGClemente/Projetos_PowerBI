# ANÁLISE DE DADOS DO DEPARTAMENTO DO RECURSOS HUMANOS
Este é um projeto de análise de dados que se concentra nos dados do departamento dos recursos humanos de uma empresa fictícia. Os dados são armazenados em uma planilha de Excel e importados para o Microsoft Power BI para serem analisados e extrair insights.
## CONJUNTO DE DADOS

O conjunto de dados usado neste projeto consiste em uma tabela chamada “Base de Funcionário” contendo 25 atributos:

- ID RH: Contém o número da identificação exclusiva de cada funcionário 
- Nome Completo: Contém os nomes e sobrenomes de cada funcionário
- Estado Civil: Contém o estado civil de cada funcionário, tendo somente 2 opções: Casado (a) ou solteiro (a)
- Sexo: Contém o gênero de cada funcionário, tendo somente 2 opções: Feminino ou masculino 
- Data Nascimento: Contém a data do dia do nascimento de cada funcionário
- Endereço: Contém o endereço completo, incluindo rua, bairro, cidade, estado e CEP de cada funcionário
- Data de Contratação: Contém a data de admissão de cada funcionário 
- Data de Demissão: Contém a data de desligamento de cada funcionário
- Salário Base: Contém o valor do salário bruto em reais de cada funcionário
- Impostos: Contém o valor total de todos os impostos incidentes em reais sobre salário de cada funcionário
- Benefícios: Contém o valor total de todos os benefícios adquiridos em reais de cada funcionário
- VT: Contém o valor do vale transporte recebido em reais de cada funcionário
- VR: Contém o valor do vale refeição recebido em reais de cada funcionário
- Cargo: Contém o nome do cargo abreviado de cada funcionário
- Nível: Contém nome do nível hierárquico de cada funcionário, tendo 5 opções: Analista, Coordenador, Diretor, Estagiário e Gerente 
- Área: Contém o nome do departamento de cada funcionário, tendo 5 opções: Administrativo, Comercial, Financeiro, Logística e Operações
- Férias acumuladas: Contém o total de dias de férias acumuladas de cada funcionário
- Horas extras: Contém o total de horas extras de cada funcionário
- Imagem: Contém a foto 3x4 de cada funcionário
- Avaliação do Funcionário: Contém o número de avaliação de desempenho de cada funcionário
- Trabalho em Equipe: Contém o número da nota individual atribuída para a competência “Trabalho em equipe” de cada funcionário  
- Liderança: Contém o número da nota individual atribuída para a competência “Liderança” de cada funcionário  
- Comunicação: Contém o número da nota individual atribuída para a competência “Comunicação” de cada funcionário
- Iniciativa: Contém o número da nota individual atribuída para a competência “Iniciativa” de cada funcionário
- Organização: Contém o número da nota individual atribuída para a competência “Organização” de cada funcionário

## FERRAMENTAS USADAS

As seguintes ferramentas foram utilizadas neste projeto:

- Microsoft Excel
- Microsoft Power BI
- Microsoft PowerPoint

## ANÁLISE

A análise neste projeto inclui o seguinte:

- Informações gerais, como Total de Contratações, Total de Demissões, Total de Funcionários ativos, Taxa de rotatividade, Total de salário e entre outros.
- Identificação do perfil dos funcionários que são admitidos pela empresa
- Identificação do perfil dos funcionários que são demitidos pela empresa
- Identificação do perfil dos funcionários ativos na empresa
- Identificação do perfil das equipes, como perfil individual e avaliações gerais e individuais por competências  

## ETAPAS
### ETAPAS REALIZADAS NO POWER QUERY
#### TABELA CALENDÁRIO
A tabela DIMCALENDARIO foi criada realizando as etapas abaixo:

1) No Power BI, entre no Power Query, através do Transformar dados.
1) Adicione uma nova fonte > Consulta nula > Renomeie a consulta para DIMCALENDÁRIO.
1) Adicione a fórmula na Barra de fórmula para fazer uma lista de datas:

= List.Dates(#date(2000, 1, 1),Duration.Days(#date(2018, 12, 31) - #date(2000, 1, 1))+1,#duration(1,0,0,0))

1) Na aba transformar, clique em converter para a tabela (Criando uma tabela a partir de uma lista de valores) > Abrirá uma janela > Clique OK
1) Formate a coluna como Data e renomeie o nome da coluna para Data
1) Na aba adicionar coluna > Clique na data e acrescente as colunas: Ano, mês, nome do mês, início do mês e dia > Salvar e fechar (Voltar para o Power BI)
1) Relacionar a tabela DIMCALENDÁRIO com a tabela FATOFUNCIONÁRIO

Colunas criadas a partir da coluna da Data:

- Data = CALENDAR (DATE (2000,01,01), DATE (2018,12,31))
- Ano = YEAR (TabelaCalendário[Data]) ou Ano  = Date.Year([Data])
- Mês = MONTH(TabelaCalendário[Data]) ou Mês = Date.Month([Data])
- Nome do mês = FORMAT(TabelaCalendário[Data], “mmmm”) ou Nome do mês = Date.MonthName([Data])
- Inicio do mês = STARTOFMONTH(TabelaCalendário[Data]) ou Início do mês = Date.StartOfMonth([Data])
- Dia = DAY (TabelaCalendário[Data]) ou Dia = Date.Day([Data])
- Mês/Ano = FORMAT(TabelaCalendário[Data], “mmm/yyyy”)
#### TABELA AVALIAÇÕES 
A tabela DIMAVALIAÇÃO foi criada a partir da duplicação da tabela FATOFUNCIONÁRIO. Foram excluídas várias colunas, permanecendo apenas as colunas ID RH, Trabalho em Equipe, Liderança, Comunicação, Iniciativa e Organização. As colunas Trabalho em Equipe, Liderança, Comunicação, Iniciativa e Organização foram transformadas em linhas ficando na coluna Competência e seus valores agrupados em uma coluna de Notas.  

- ID RH = Contém o número da identificação exclusiva de cada funcionário. ***(Alteração no Tipo de Dado: Número inteiro)***
- Competência = Contém os nomes das competências de cada funcionário, tendo 5 opções: Trabalho em Equipe, Liderança, Comunicação, Iniciativa e Organização ***(Alteração no Tipo de Dado: Texto)***
- Nota = Contém o número da nota individual atribuída para cada competência de cada funcionário ***(Alteração no Tipo de Dado: Número inteiro)***
#### TABELA FUNCIONÁRIOS
A tabela FATOFUNCIONARIO foi modificada, permanecendo com as seguintes colunas:

- ID RH = Sem modificação nos dados ***(Alteração no Tipo de Dado: Inteiro)***
- Nome Completo = Sem modificação nos dados ***(Alteração no Tipo de Dado: Texto)***
- Estado Civil = Substituições de C para Casado(a) e S para Solteiro(a) ***(Alteração no Tipo de Dado: Texto)***
- Sexo = Substituições de M para Masculino e F para Feminino ***(Alteração no Tipo de Dado: Texto)***
- Data de Nascimento = Sem modificação nos dados ***(Alteração no Tipo de Dado: Data)***
- Endereço = Sem modificação nos dados ***(Alteração no Tipo de Dado: Texto)***
- Data de contratação = Sem modificação nos dados ***(Alteração no Tipo de Dado: Data)***
- Data de demissão = Sem modificação nos dados ***(Alteração no Tipo de Dado: Data)***
- Salário Base = Sem modificação nos dados ***(Alteração no Tipo de Dado: Número decimal)***
- Impostos = Sem modificação nos dados ***(Alteração no Tipo de Dado: Número decimal)***
- Benefícios = Sem modificação nos dados ***(Alteração no Tipo de Dado: Número decimal)***
- VT = Sem modificação nos dados ***(Alteração no Tipo de Dado: Número decimal)***
- VR = Sem modificação nos dados ***(Alteração no Tipo de Dado: Número decimal)***
- Cargos = Sem modificação nos dados ***(Alteração no Tipo de Dado: Texto)***
- Níveis = Sem modificação nos dados ***(Alteração no Tipo de Dado: texto)***
- Áreas = Sem modificação nos dados ***(Alteração no Tipo de Dado: Texto)***
- Férias acumuladas = Sem modificação nos dados ***(Alteração no Tipo de Dado: Inteiro)***
- Horas Extras = Sem modificação nos dados ***(Alteração no Tipo de Dado: Inteiro)***
- Imagens = Sem modificação nos dados ***(Alteração no Tipo de Dado: Texto)***
- Avaliação do funcionário = Sem modificação nos dados ***(Alteração no Tipo de Dado: Número decimal)***
- Idade = Criação da coluna através da fórmula Date.From(#date(2018, 12, 31)) - [Data de Nascimento], resultando na diferença da Data de Nascimento de cada funcionário e a data 31/12/2018 em dias. Depois foi feito a transformação da quantidade de dias em anos. ***(Alteração no Tipo de Dado: Inteiro)***
- Cidade = Coluna criada utilizando a coluna de exemplo a partir da coluna Endereço. ***(Alteração no Tipo de Dado: Texto)***
- Estado = Coluna criada utilizando a coluna de exemplo a partir da coluna Endereço. ***(Alteração no Tipo de Dado: Texto)***
- Rua = Coluna criada utilizando a coluna de exemplo a partir da coluna endereço. ***(Alteração no Tipo de Dado: Texto)***

As colunas Trabalho em Equipe, Liderança, Comunicação, Iniciativa e Organização foram excluídas da tabela.
#### PARÂMETRO
Criação do parâmetro CAMINHO com o caminho das pastas onde se encontra o arquivo em Excel (Dataset.xlxs) e a sua substituição no código Fonte. Assim a conexão do arquivo em Excel com o arquivo em Power BI pode ser atualizada com mais facilidade, caso ocorra alguma modificação de pastas.   
### ETAPAS REALIZADAS NO POWER BI
#### MODELAGEM DOS DADOS
Na exibição do modelo, foi realizado as seguintes relações: 

- Tabela DimCalendario com a tabela FatoFuncionario de um para muitos, utilizando a coluna data como chave primaria 
- Tabela DimAvaliação com a tabela FatoFuncionario de um para muitos, utilizando a coluna ID RH como chave primaria 

![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.001.png)
#### DASHBOARD
1. Definição das cores a serem utilizadas no Dashboards 

`  `Preto

49

82

27

![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.002.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.003.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.004.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.005.png)

86

163

166

168

70

160


`  `Branco

69

95

81

135

174

145

153

203

56

![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.006.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.007.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.008.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.009.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.010.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.011.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.012.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.013.png)![](Aspose.Words.2fc41944-837f-44c6-a86b-665d4ee21c7c.014.png)





|0 – 176 - 80|146 – 208 - 80|56 – 86 – 35|83 – 129 - 53|8 – 71 – 18|
| :-: | :-: | :-: | :-: | :- |

1. Criação das 5 guias: Geral, Contratações, Desligamentos, Perfil da empresa e Perfil da equipe
1. Criação das 5 telas de fundo no PowerPoint
1. Criação da tabela Medida
1. Criação das medidas, utilizando a linguagem DAX
   1. % Turnover
   1. Desvio da meta
   1. Média das notas das competências
   1. Média salarial
   1. Nota Geral
   1. Nota Individual
   1. Salário total
   1. Total de contratação
   1. Total de demissões
   1. Total de funcionário ativos
1. Criação de 3 colunas calculadas na tabela FATOFUNCIONÁRIO: 
   1. Anos de empresa
   1. Faixa de Idade 
   1. Faixas de tempo de empresa
1. Criação das segmentações de dados para as 5 guias: Filtro Cidade, Filtro Área, Filtro Nível e Filtro Ano
1. Criação dos gráficos e cartões de linhas múltiplas
1. Inclusão de ícones no Dashboard.
#### COLUNAS CALCULADAS

1) Coluna **Anos de empresa** = Se a data de demissão estiver em branco, utilize a fração do ano que representa o número de dias inteiros entre a data de contratação e a data de hoje, caso contrário, utilize a fração do ano que representa o número de dias inteiros entre a data de contratação e a data de demissão. 

IF (FatoFuncionarios [Data de Demissao] =BLANK (),

ROUNDDOWN (YEARFRAC (FatoFuncionarios [Data de Contratacao], TODAY ()),0),

ROUNDDOWN (YEARFRAC (FatoFuncionarios [Data de Contratacao], Fato Funcionários [Data de Demissao]),0))

1) Coluna **Faixa de Idade** = Se o número da coluna Idade for menor que 30, informe “18-30 anos”, se for menor que 40, informe “31-40 anos”, se for menor que 60, informe “41-60 anos”, caso contrário, informe “Acima de 60 anos”. 

IF(

`    `FatoFuncionarios[Idade] <= 30, "18-30 anos",

`    `IF(

`        `FatoFuncionarios[Idade] <= 40, "31-40 anos",

`        `IF(

`            `FatoFuncionarios[Idade] <= 60, "41-60 anos",

`            `"Acima de 60 anos"

`        `)

`    `)

)

1) Coluna **Faixa de tempo de empresa** = Se o número da coluna Anos de empresa for menor que 5, informe “0-5 anos”, se for menor que 10, informe “5-10 anos”, se for menor que 15, informe “10-15 anos”, se for menor que 20, informe “15-20 anos”, caso contrário, informe “Acima de 20 anos”.

IF(

`    `FatoFuncionarios[Anos de empresa] <= 5, "0-5 anos",

`    `IF(

`        `FatoFuncionarios[Anos de empresa] <= 10, "5-10 anos",

`        `IF(

`            `FatoFuncionarios[Anos de empresa] <= 15, "10-15 anos",

`            `IF(

`                `FatoFuncionarios[Anos de empresa] <= 20, "15-20 anos",

`                `"Acima de 20 anos"

`            `)

`        `)

`    `)

)
#### TABELA MEDIDA
A tabela MEDIDA foi criada para armazenar as medidas criadas para serem utilizadas nos Dashboards: 

1) Total de contratação = COUNTROWS(FatoFuncionarios) 

Medida que conta a quantidade de linha que tem a tabela funcionários, pois cada linha representa um registro no RH, um funcionário contratado.

1) Total de demissões = CALCULATE ([Total de contratação], FatoFuncionarios [Data de Demissao] <> BLANK (), USERELATIONSHIP (DimCalendario [Data], FatoFuncionarios [Data de Demissao])) 

Medida que conta a quantidade de demissões, usando todas as linhas da tabela (Total de contratação) e filtrando apenas as linhas que não são vazias na coluna Data de Demissão (FatoFuncionarios[Data de Demissao] <> BLANK()). Além disso, foi necessário especificar uma relação entre a coluna de demissão e a data do calendário para que as demissões fiquem no ano correto. 

1) Total de funcionários ativos = [Total de contratação] - [Total de demissões] 

// Medida que calcula a quantidade de funcionários ativos fazendo a diferença do total de contratação com o total de demissões 

1) % Turnover = (([Total de demissões] + [Total de contratação]) /2) / [Total de funcionários ativos] 

// Medida que calcula a taxa de rotatividade de funcionários. Somando os funcionários demitidos e admitidos e dividindo por 2. Seu resultado é divido pela quantidade de funcionários ativos.



1) Média salarial = AVERAGEX (FatoFuncionarios,FatoFuncionarios[Salário Base] + FatoFuncionarios[VR] + FatoFuncionarios[VT] + FatoFuncionarios[Beneficios] + FatoFuncionarios[Impostos]) 

// Medida calcula a média do Salário, VR, VT, Benefício e Impostos de todos os funcionários

1) Desvio da Meta = 0.6- [% Turnover]

// Medida que calcula quanto que desvio da meta de 60% em relação a taxa de turnover. Cidade que tiver a taxa de rotatividade abaixo de 60% atingiu a meta (Fica verde).

1) Salário total = SUMX (FatoFuncionarios,FatoFuncionarios[Salário Base] + FatoFuncionarios[VR] + FatoFuncionarios[VT] + FatoFuncionarios[Beneficios] + FatoFuncionarios[Impostos]) 

// Medida calcula o somatório do Salário, VR, VT, Benefício e Impostos de todos os funcionários

1) Nota individual Nota individual = SUM('DimAvaliação'[Notas])

// Medida que calcula o total de todas as notas individuais

1) Nota Geral = CALCULATE(AVERAGE('DimAvaliação'[Notas]), ALL(FatoFuncionarios))

// Medida que calcula a média das notas de todos os funcionários

1) Média das notas das competências = AVERAGE('DimAvaliação'[Notas]) 

// Medida que calcula a média da avaliação das notas referente as competências dos funcionários 

Funções DAX utilizadas:

- A função **COUNTROWS([<TABLE>])** conta o número de linhas na tabela especificada ou em uma tabela definida por uma expressão.
- A função **CALCULATE(<EXPRESSION>, [<FILTER1>], [<FILTER2>] …)** avalia uma expressão em um contexto de filtro modificado.
- A função **USERELATIONSHIP(<COLUMNNAME1>, <COLUMNNAME2>)** especifica a relação a ser usada em um cálculo específico como aquela que existe entre COLUMNNAME1 e COLUMNNAME2.
- A estrutura condicional **IF (LOGICALTEST, RESULTIFTRUE, [RESULTIFFALSE])** verifica se uma condição é atendida e retornará um valor, se for TRUE, e outro valor, se for FALSE.
- A função **ROUNDDOWN (NÚMERO, NÚMERO DE DÍGITOS)** arredonda um número para baixo, em direção a zero.
- A função **YEARFRAC (STARTDATE, ENDDATE, [BASE])** retorna à fração do ano que representa o número de dias inteiros entre START\_DATE e END\_DATE.
- A função **TODAY ()** retorna a data atual no formato DATETIME.
- A função **AVERAGEX(<TABLE>, <EXPRESSION>)** calcula a média aritmética de um conjunto de expressões avaliadas de uma tabela.
- A função **SUMX(<TABLE>, <EXPRESSION>)** retorna a soma de uma expressão avaliada para cada linha de uma tabela.
- A função **SUM (<COLUMN>)** adiciona todos os números de uma coluna.
- A função **AVERAGE(<COLUMN>)** retorna a média aritmética de todos os números de uma coluna.

## USO
Para executar este projeto, precisará ter o Microsoft Excel e o Microsoft Power BI instalados e em execução. 

1. Clone este repositório em sua máquina local.
1. Abra o Microsoft Power BI e depois o arquivo RH.pbix.
1. Atualize o parâmetro referente ao caminho do arquivo em Excel (Dataset RH.xlsx) no Power Query

# CONCLUSÃO

Em conclusão, este projeto demonstra como podemos utilizar o Power BI para extrair e analisar dados de um arquivo do Microsoft Excel. A análise fornece insights sobre identificação dos perfis dos funcionários ativos, desligados, admitidos, das equipes e informações gerais como taxa de rotatividade, total de salário gasto, total de demissões e contratações e entre outros, que podem ser usados ​​para ajudar nas decisões internas para melhorar os negócios.  
