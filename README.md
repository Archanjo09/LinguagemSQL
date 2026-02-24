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
