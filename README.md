
1. DDL — Linguagem de Definição de Dados

Responsável por estruturar o "esqueleto" do banco (tabelas, colunas, tipos).

* **`CREATE`**: Cria objetos (DBs, tabelas).
```sql
CREATE TABLE cliente (
  id INT PRIMARY KEY,
  nome VARCHAR(50) NOT NULL
);

```


* **`ALTER`**: Modifica a estrutura existente.
```sql
ALTER TABLE produto ADD COLUMN situacao BOOLEAN;

```


* **`DROP`**: Remove permanentemente o objeto.
```sql
DROP TABLE produto;


**2. DML — Linguagem de Manipulação de Dados\**

Lida com os registros (as linhas) dentro das tabelas.

| Comando | Função | Exemplo |
| --- | --- | --- |
| **INSERT** | Adiciona novos dados | `INSERT INTO cliente (id, nome) VALUES (1, 'Luiz');` |
| **UPDATE** | Edita dados existentes | `UPDATE produto SET nome = 'Café' WHERE id = 1;` |
| **DELETE** | Remove registros | `DELETE FROM produto WHERE id = 2;` |

> **CUIDADO** : Nunca esqueça a cláusula `WHERE` no `UPDATE` e `DELETE` para não afetar toda a tabela!


3. DQL — Linguagem de Consulta de Dados

Focada em recuperar e filtrar informações.

### Comando `SELECT`

O principal comando para busca. A ordem lógica de execução é:

1. **FROM** (Onde buscar)
2. **WHERE** (Filtros)
3. **SELECT** (Quais colunas)
4. **ORDER BY** (Ordenação)

```sql
SELECT nome AS "Nome do Cliente"
FROM cliente
ORDER BY nome ASC;
