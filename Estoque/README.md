# Projeto sobre análise de dados do Departamento de Estoque

#### Este é um projeto de análise de dados que se concentra nos dados de um estoque de uma empresa fictícia de 2018 e 2019. Os dados são armazenados em 2 planilhas: uma em Excel e outra em CSV e importados para o Microsoft Power BI para serem analisados e extrair insights.

## Conjunto de dados:
#### O conjunto de dados usado neste projeto consiste em 4 tabelas chamadas “FatoEstoque”, “DimLoja”, “DimProduto” e “DimEstoqueMinimo” de 2 arquivos (BaseDados.xlsx e EstoqueMin.csv) contendo 18 atributos:

´Tabela FatoEstoque´
* Número Movimentação: Contém o número da movimentação de cada produto
* ID Produto: Contém o número da identificação exclusiva de cada produto
* Data: Contém da data que ocorreu a entrada ou a saída de cada produto do estoque
* ID Shopping: Contém o número da identificação exclusiva de cada Shopping
* Movimentação: Contém a quantidade de produtos que saíram ou entraram no estoque, ou seja, por exemplo, se na coluna estiver o seguinte número -2, significa que saíram 2 produtos e se tiver 5, significa que entraram 5 produtos.
* Tipo: Contém o tipo de movimentação de cada produto, tendo 2 opções: Entrada ou Saída
Tabela DimLoja
* ID Shopping: Contém o número da identificação exclusiva de cada Shopping
* Shopping: Contém o nome do Shopping center
* Bairro: Contém o nome do bairro e do estado onde está localizado o Shopping
Tabela DimProduto
* ID Produto: Contém o número da identificação exclusiva de cada produto
* Produto: Contém o nome de cada produto
* Categoria: Contém o nome da categoria de cada produto, tendo 3 opções: Acessórios, Calçados e Roupas
* Subcategoria: Contém o nome da subcategoria de cada produto, tem 10 opções.
* Imagem: Contém o link URL da imagem de cada produto
* Custo Unit: Contém o valor do custo unitário de cada produto
* Preço Unit: Contém o valor do preço unitário de cada produto
Tabela DimEstoqueMinimo
* ID Produto: Contém o número da identificação exclusiva de cada produto
* Estoque mínimo: Contém a quantidade de estoque mínimo que cada produto precisa ter armazenado

## Ferramentas usadas:
#### As seguintes ferramentas foram utilizadas neste projeto:
* Microsoft Excel
* Microsoft Power BI
* Microsoft PowerPoint

## Uso:
#### Para executar este projeto, precisará ter o Microsoft Excel e o Microsoft Power BI instalados e em execução. 
1. Clone este repositório em sua máquina local.
2. Abra o Microsoft Power BI e depois o arquivo Estoque.pbix.
3. Atualize o parâmetro referente ao caminho do arquivo em Excel (BaseDados.xlsx e EstoqueMin.csv) no Power Query

## As etapas da análise e a conclusão foram demonstradas no arquivo em WORD "Etapas de análise dos dados do Estoque"