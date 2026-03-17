# Projeto Data Warehouse de E-commerce com SQL Server

## 📌 Visão Geral

Este projeto simula a construção de um **Data Warehouse de vendas de um e-commerce** utilizando **SQL Server**.

O objetivo é demonstrar habilidades em:

* Modelagem de dados
* Processos de ETL
* SQL analítico
* Arquitetura de Data Warehouse
* Preparação de dados para ferramentas de BI

O projeto reproduz um cenário real de empresa, onde dados transacionais brutos são transformados em um **modelo analítico otimizado para análise de negócios**.

---

## 🏗 Arquitetura do Projeto

O projeto segue uma arquitetura em camadas muito utilizada em ambientes de dados modernos:

Dados Brutos (CSV)
↓
Camada Staging (SQL Server)
↓
Data Warehouse (Modelo Estrela)
↓
Camada Analítica (Views para BI)

Essa abordagem permite organizar melhor o fluxo de dados e facilitar análises e integrações com ferramentas de visualização.

---

## 🗂 Estrutura do Projeto

```
sql-ecommerce-analytics

datasets
   customers.csv
   products.csv
   orders.csv
   order_items.csv

sql
   01_create_database.sql
   02_staging_tables.sql
   03_dw_tables.sql
   04_etl_process.sql
   05_analysis_queries.sql
   06_views_bi.sql

docs
   data_model.png
   data_architecture.png

README.md
```

---

## 📊 Modelo de Dados

O Data Warehouse foi construído utilizando **modelo estrela (Star Schema)**.

### Tabela Fato

**fact_sales**

Armazena as métricas principais do negócio:

* quantidade vendida
* preço unitário
* valor total da venda

---

### Tabelas Dimensão

**dim_customer**

Informações sobre os clientes.

**dim_product**

Informações sobre os produtos e categorias.

**dim_date**

Dimensão de tempo para análise de vendas por período.

---

### Diagrama do Modelo de Dados

![Modelo de Dados](docs)

---

## ⚙ Processo ETL

O processo de ETL realiza as seguintes etapas:

1. Importação dos dados brutos (CSV) para tabelas de staging
2. Transformação dos dados para o formato dimensional
3. Carga das tabelas de dimensão
4. Carga da tabela fato com métricas de vendas

Principais transformações realizadas:

* criação da chave de data (`date_key`)
* cálculo do valor total da venda
* relacionamento entre dimensões e fatos

---

## 📈 Consultas Analíticas

O projeto inclui consultas que simulam perguntas comuns de negócio, como:

* Receita total da empresa
* Receita por categoria de produto
* Evolução das vendas ao longo do tempo
* Ticket médio de pedidos
* Ranking de produtos mais vendidos
* Clientes que mais geram receita

Também são utilizadas técnicas de SQL como:

* agregações (`SUM`, `AVG`)
* `JOIN`
* subqueries
* `Window Functions`
* ranking de dados

---

## 📊 Camada Analítica para BI

Foram criadas **views analíticas** para facilitar o consumo dos dados por ferramentas de Business Intelligence.

Views disponíveis:

* `vw_sales_summary`
* `vw_monthly_revenue`
* `vw_top_products`
* `vw_customer_value`

Essas views podem ser utilizadas diretamente em ferramentas como:

* Power BI
* Tableau
* Looker

---

## 🛠 Tecnologias Utilizadas

* SQL Server
* T-SQL
* Modelagem de Data Warehouse
* ETL em SQL
* GitHub

---

## 🚀 Possíveis Melhorias Futuras

Algumas evoluções possíveis para o projeto:

* Criação de dashboard no Power BI
* Automação do ETL utilizando Python
* Carga incremental de dados
* Análise de segmentação de clientes (RFM)
* Orquestração de pipelines de dados

---

## 🎯 Objetivo do Projeto

Este projeto foi desenvolvido com o objetivo de demonstrar habilidades práticas em **engenharia e análise de dados**, simulando um fluxo completo desde dados transacionais até análises para tomada de decisão.