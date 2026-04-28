CREATE TABLE produtos (
    id      SERIAL PRIMARY KEY,
    nome    VARCHAR(100) NOT NULL,
    preco   NUMERIC(10, 2) NOT NULL,
    estoque INT NOT NULL
);

CREATE TABLE vendas (
    id          SERIAL PRIMARY KEY,
    produto_id  INT NOT NULL,
    quantidade  INT NOT NULL,
    valor_total NUMERIC(10, 2) NOT NULL,
    data_venda  TIMESTAMP DEFAULT NOW(),

    CONSTRAINT fk_produto FOREIGN KEY (produto_id) REFERENCES produtos(id)
);

INSERT INTO produtos (nome, preco, estoque) VALUES
    ('Café', 10.00, 100),
    ('Açúcar', 20.00, 50),
    ('Arroz',  5.00, 200);

CREATE OR REPLACE PROCEDURE realizar_venda(
    p_produto_id INT,
    p_quantidade INT
)
LANGUAGE plpgsql
AS $$
DECLARE
    v_preco       NUMERIC(10, 2);
    v_estoque     INT;
    v_valor_total NUMERIC(10, 2);
BEGIN
    SELECT preco, estoque
        INTO v_preco, v_estoque
    FROM produtos
    WHERE id = p_produto_id;

    IF NOT FOUND THEN
        RAISE EXCEPTION 'Erro: Produto com ID % não encontrado.', p_produto_id;
    END IF;

    IF v_estoque < p_quantidade THEN
        RAISE EXCEPTION 'Erro: Estoque insuficiente. Disponível: %, Solicitado: %.',
            v_estoque, p_quantidade;
    END IF;

    v_valor_total := v_preco * p_quantidade;

    INSERT INTO vendas (produto_id, quantidade, valor_total)
    VALUES (p_produto_id, p_quantidade, v_valor_total);

    UPDATE produtos
    SET estoque = estoque - p_quantidade
    WHERE id = p_produto_id;

    RAISE NOTICE 'Venda realizada com sucesso! Produto ID: %, Quantidade: %, Total: R$ %',
        p_produto_id, p_quantidade, v_valor_total;
END;
$$;

CALL realizar_venda(1, 2);
