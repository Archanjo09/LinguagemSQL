## 1. DDL — Linguagem de Definição de Dados

O DDL (Data Definition Language) é o "blueprint" do sistema. Ele define a estrutura, as regras e o esqueleto do banco de dados.

### `CREATE` (Construir)

Cria novos bancos de dados ou tabelas, definindo colunas, tipos de dados e restrições.

```sql
-- Criando o banco de dados
CREATE DATABASE supermercado;

-- Criando uma tabela de clientes
CREATE TABLE cliente (
  id INT NOT NULL,
  nome VARCHAR(50) NOT NULL,
  cpf VARCHAR(11) NOT NULL,
  CONSTRAINT pk_id_cliente PRIMARY KEY (id)
);

```

### `ALTER` (Modificar Estrutura)

Atualiza a estrutura de uma tabela existente sem apagar seus dados.

```sql
-- Adicionando uma nova coluna
ALTER TABLE produto ADD COLUMN situacao BOOLEAN NOT NULL;

-- Alterando o tipo de dado de uma coluna
ALTER TABLE produto ALTER COLUMN descricao TYPE VARCHAR(200);

```

### `DROP` (Excluir Objeto)

Remove permanentemente o objeto (tabela ou banco) e tudo o que houver dentro dele.

> [!CAUTION]
> Comando destrutivo e irreversível. Use com cuidado!

```sql
DROP TABLE produto;

```

---

## 2. DML — Linguagem de Manipulação de Dados

O DML (Data Manipulation Language)** gerencia o conteúdo, ou seja, as linhas de dados dentro das tabelas.

###  `INSERT` (Adicionar)

Insere novos registros no banco.

```sql
INSERT INTO cliente (id, nome, cpf)
VALUES (1, 'Luquinhas', '12345678901');

```

###  `UPDATE` (Editar)

Modifica dados existentes.

> [!IMPORTANT]
> Sempre use a cláusula `WHERE`. Sem ela, todos os registros da tabela serão alterados!

```sql
UPDATE produto 
SET descricao = 'Nescau' 
WHERE id = 2;

```

### `DELETE` (Remover)

Apaga registros específicos.

```sql
-- Remove apenas o registro com ID 3
DELETE FROM produto WHERE id = 3;

-- CUIDADO: Remove TODOS os registros da tabela
DELETE FROM produto;

```

---

## 3. DQL — Linguagem de Consulta de Dados

O DQL (Data Query Language) foca na recuperação e visualização das informações.

### `SELECT`

O comando mais utilizado no SQL para buscar e filtrar dados.

* SELECT: Busca todas as colunas.
* Aliases (`AS`): Apelidos temporários para colunas ou tabelas.
* ORDER BY: Define a ordem de exibição (`ASC` para crescente, `DESC` para decrescente).

```sql
-- Selecionando colunas específicas com alias e ordenação
SELECT 
    prod.id AS codigo, 
    prod.descricao AS nome_produto
FROM produto AS prod
ORDER BY id DESC;

```
---

---

## 4. Anatomia e Ordem de uma Consulta SQL
Uma instrução SQL é composta por elementos específicos que orientam o banco de dados sobre como processar a requisição.

* **Palavras-chave:** Termos reservados com significado especial (ex: `SELECT`, `FROM`).
* **Identificadores:** Nomes de objetos como tabelas ou colunas.
* **Literais:** Valores constantes ou strings de texto.
* **Comentários (`--`):** Utilizados para documentar o que o código faz.

### Ordem Lógica de Execução
Embora escrevamos o `SELECT` primeiro, o banco de dados segue uma ordem lógica diferente para processar os dados:

1.  **FROM:** Localiza a tabela de origem.
2.  **WHERE:** Filtra os registros conforme as condições.
3.  **SELECT:** Define quais colunas serão retornadas.
4.  **ORDER BY:** Organiza o resultado final.

---

## 5. Relacionamentos e Integridade (Chave Estrangeira)
A **Chave Estrangeira (FK)** é o campo que "liga" uma tabela a outra, apontando para a **Chave Primária (PK)** de uma tabela distinta.

* **Sem FK:** As tabelas ficam isoladas e podem surgir registros "órfãos".
* **Com FK:** O banco garante a **integridade referencial**, impedindo que um pedido seja criado para um cliente que não existe.

---

## 6. Joins e Operadores SET (Combinação de Dados)
Existem duas formas principais de combinar dados de tabelas diferentes: horizontalmente (colunas) ou verticalmente (linhas).

### JOINS (Combinação Horizontal)
Conectam tabelas lateralmente através de uma coluna comum.

| Join Type | Descrição |
| :--- | :--- |
| **INNER JOIN** | Retorna apenas registros que possuem correspondência em ambas as tabelas. |
| **LEFT JOIN** | Mantém todos os dados da tabela à esquerda e traz os correspondentes da direita. |
| **RIGHT JOIN** | Mantém todos os dados da direita e traz os correspondentes da esquerda. |
| **FULL JOIN** | Traz todos os registros de ambos os lados. |

### Operadores SET (Combinação Vertical)
Empilham os resultados de consultas diferentes (as colunas devem ser compatíveis).

* **UNION:** Combina os resultados e remove duplicados.
* **UNION ALL:** Combina tudo, incluindo duplicatas (mais rápido).
* **INTERSECT:** Mostra apenas o que é comum aos dois conjuntos.
* **EXCEPT:** Mostra o que existe no primeiro conjunto, mas não no segundo.

---

## 7. Normalização de Dados
Normalizar é organizar o banco para que cada dado exista em um único lugar, evitando redundância e inconsistência.

### As Três Formas Normais (FN)
1.  **1FN (Atomicidade):** Cada célula deve conter um único valor. Grupos repetidos e listas em uma única célula são proibidos.
2.  **2FN (Dependência Parcial):** Deve estar na 1FN. Removemos dados que não dependem totalmente da chave primária, criando tabelas separadas para cada entidade.
3.  **3FN (Dependência Transitiva):** Deve estar na 2FN. Campos que não são chave devem depender exclusivamente da chave primária e de mais nada.

> **Resultado:** Um banco normalizado é mais eficiente, confiável e fácil de escalar.
