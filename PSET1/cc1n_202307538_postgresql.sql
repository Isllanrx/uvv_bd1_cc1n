/*PROJETO-PSET-ABRANTES*/-----|
/*Nome:Isllan-Toso-Pereira*/--|
/*Turma:CC1N*/----------------|
/*Obrigado-Abrantes*/---------|
------------------------------|

-- COMANDO QUE APAGARÁ O BANCO DE DADOS 'lojas' E CRIARÁ O MESMO COM O USUÁRIO 'ISLLAN';
DROP DATABASE IF EXISTS uvv;

-- COMANDO QUE REALIZARA A CRIAÇÃO DO USUÁRIO ISLLAN COM PERMISSÃO PARA CRIAR O BANCO DE DADOS;
DROP USER isllan;
CREATE USER isllan WITH CREATEDB CREATEROLE ENCRYPTED PASSWORD 'Isllan129';

-- COMANDO QUE VAI DEFINIR O USUÁRIO 'isllan' COMO ADMINISTRADOR PROPRIETÁRIO E PARA DEFINIR TEMPLATE E IDIOMA PADRAO;
CREATE DATABASE uvv 
WITH OWNER = isllan
template   = template0
encoding   = 'UTF8'
lc_collate = 'pt_BR.UTF-8'
lc_ctype   = 'pt_BR.UTF-8'
allow_connections = true;

--COMANDO QUE INICIALIZARA AUTOMATICAMENTE COM USUARIO E SENHA;
\c "dbname= uvv user = isllan password = Isllan129"

-- COMANDO QUE CRIARA O SCHEMA lojas COM BASE NAS CONFIGURAÇOES DEFINIDAS DE USUÁRIO PADRÃO;
CREATE SCHEMA lojas AUTHORIZATION isllan;

-- COMANDO QUE VAI CONFIGURAR O USUARIO "isllan" PARA SER DEFINIDO NO SCHEMA;
ALTER USER isllan;

-- COMANDO PARA CONFIRMAR QUE O PATH ESTA SENDO REALIZADO A ENTRADA DO NOME "LOJAS";
SET SEARCH_PATH TO lojas, "$user", public;

-- COMANDO DE CRIACAO DA TABELA PRODUTOS;
CREATE TABLE    lojas.produtos (
                produto_id                NUMERIC(38)    NOT NULL,
                nome                      VARCHAR(255)   NOT NULL,
                preco_unitario            NUMERIC(10,2),
                detalhe BYTEA,
                imagem BYTEA,
                imagem_mime_type          VARCHAR(512),
                imagem_arquivo            VARCHAR(512),
                imagem_charset            VARCHAR(512),
                imagem_ultima_atualizacao DATE,
                CONSTRAINT produto_id PRIMARY KEY (produto_id)
);
-- COMANDO DE CRIACAO DE COMENTARIO DA TABELA PRODUTO;
COMMENT ON TABLE  lojas.produtos                           IS 'tabela para os produtos da loja';
COMMENT ON COLUMN lojas.produtos.produto_id                IS 'coluna que informa o id dos produtos.';
COMMENT ON COLUMN lojas.produtos.nome                      IS 'coluna que informa o nome dos produtos.';
COMMENT ON COLUMN lojas.produtos.preco_unitario            IS 'coluna que informa o preço unitário dos produtos.';
COMMENT ON COLUMN lojas.produtos.detalhe                   IS 'coluna que informa os detalhes dos produtos.';
COMMENT ON COLUMN lojas.produtos.imagem                    IS 'coluna que informa as imagens dos produtos.';
COMMENT ON COLUMN lojas.produtos.imagem_mime_type          IS 'coluna que apresenta o mime type das imagens dos produtos.';
COMMENT ON COLUMN lojas.produtos.imagem_arquivo            IS 'coluna que apresenta o arquivo das imagens dos produtos.';
COMMENT ON COLUMN lojas.produtos.imagem_charset            IS 'coluna que apresenta o charset das imagens.';
COMMENT ON COLUMN lojas.produtos.imagem_ultima_atualizacao IS 'coluna que informa a última atualização dos produtos mencionados.';

-- COMANDO DE CRIACAO DA TABELA CLIENTES;
CREATE TABLE    lojas.clientes (
                cliente_id NUMERIC(38)   NOT NULL,
                email      VARCHAR(255)  NOT NULL,
                nome       VARCHAR(255)  NOT NULL,
                telefone1  VARCHAR(20),
                telefone2  VARCHAR(20),
                telefone3  VARCHAR(20),
                CONSTRAINT cliente_id PRIMARY KEY (cliente_id)
);
-- COMANDO DE CRIACAO DE COMENTARIO DA TABELA CLIENTES;
COMMENT ON TABLE  lojas.clientes            IS 'tabela para os clientes da loja';
COMMENT ON COLUMN lojas.clientes.cliente_id IS 'coluna do id cliente.';
COMMENT ON COLUMN lojas.clientes.email      IS 'coluna com email.';
COMMENT ON COLUMN lojas.clientes.nome       IS 'coluna com nome do cliente.';
COMMENT ON COLUMN lojas.clientes.telefone1  IS 'coluna com o telefone principal do cliente, cujo o valor pode ser nulo.';
COMMENT ON COLUMN lojas.clientes.telefone2  IS 'coluna com o telefone secundário do cliente, cujo o valor pode ser nulo.';
COMMENT ON COLUMN lojas.clientes.telefone3  IS 'coluna com o telefone  terciário do cliente, cujo o valor pode ser nulo.';

-- COMANDO DE CRIACAO DA TABELA LOJAS;
CREATE TABLE      lojas.lojas (
                  loja_id                 NUMERIC(38)   NOT NULL,
                  nome                    VARCHAR(255)  NOT NULL,
                  endereco_web            VARCHAR(100),
                  endereco_fisico         VARCHAR(512),
                  latitude                NUMERIC,
                  longitude               NUMERIC,
                  logo BYTEA,
                  logo_mime_type          VARCHAR(512),
                  logo_arquivo            VARCHAR(512),
                  logo_charset            VARCHAR(512),
                  logo_ultima_atualizacao DATE,
                  CONSTRAINT loja_id PRIMARY KEY (loja_id)
);

-- COMANDO DE CRIACAO DE COMENTARIO DA TABELA LOJAS;
COMMENT ON TABLE  lojas.lojas                         IS 'tabela para as lojas';
COMMENT ON COLUMN lojas.lojas.loja_id                 IS 'coluna que informa o id da loja.';
COMMENT ON COLUMN lojas.lojas.nome                    IS 'coluna para informar o nome da loja.';
COMMENT ON COLUMN lojas.lojas.endereco_web            IS 'coluna que informa o endereço web da loja.';
COMMENT ON COLUMN lojas.lojas.endereco_fisico         IS 'coluna que informa o endereço físico da loja.';
COMMENT ON COLUMN lojas.lojas.latitude                IS 'coluna que informa a latitude da loja.';
COMMENT ON COLUMN lojas.lojas.longitude               IS 'coluna que informa a longitude da loja.';
COMMENT ON COLUMN lojas.lojas.logo                    IS 'coluna que informa o logo da loja.';
COMMENT ON COLUMN lojas.lojas.logo_mime_type          IS 'coluna que informa o mime type do logo da loja.';
COMMENT ON COLUMN lojas.lojas.logo_arquivo            IS 'coluna que informa o arquivo do logo da loja.';
COMMENT ON COLUMN lojas.lojas.logo_charset            IS 'coluna que informa o charset.';
COMMENT ON COLUMN lojas.lojas.logo_ultima_atualizacao IS 'coluna que informa a última atualização da loja.';

-- COMANDO DE CRIACAO DA TABELA PEDIDOS;
CREATE TABLE    lojas.pedidos (
                pedido_id  NUMERIC(38) NOT NULL,
                data_hora  TIMESTAMP   NOT NULL,
                cliente_id NUMERIC(38) NOT NULL,
                status     VARCHAR(15) NOT NULL,
                loja_id    NUMERIC(38) NOT NULL,
                CONSTRAINT pedido_id PRIMARY KEY (pedido_id)
);

-- COMANDO DE CRIACAO DE COMENTARIO DA TABELA PEDIDOS;
COMMENT ON TABLE  lojas.pedidos            IS 'tabela para os pedidos da loja';
COMMENT ON COLUMN lojas.pedidos.pedido_id  IS 'coluna que representa o id do pedido.';
COMMENT ON COLUMN lojas.pedidos.data_hora  IS 'coluna que representa data e hora que foi realizado o pedido.';
COMMENT ON COLUMN lojas.pedidos.cliente_id IS 'coluna que solicita o id do cliente que fez o pedido.';
COMMENT ON COLUMN lojas.pedidos.status     IS 'coluna que informa o status do pedido.';
COMMENT ON COLUMN lojas.pedidos.loja_id    IS 'coluna com finalidade de apresentar o id da loja.';

-- COMANDO DE CRIACAO DA TABELA PRODUTOS;
CREATE TABLE    lojas.estoques (
                estoque_id   NUMERIC(38) NOT NULL,
                loja_id      NUMERIC(38) NOT NULL,
                produto_id   NUMERIC(38) NOT NULL,
                quantidade   NUMERIC(38) NOT NULL,
                CONSTRAINT estoque_id PRIMARY KEY (estoque_id)
);

-- COMANDO DE CRIACAO DE COMENTARIO DA TABELA ESTOQUE;
COMMENT ON TABLE  lojas.estoques            IS 'tabela para o estoque da loja';
COMMENT ON COLUMN lojas.estoques.estoque_id IS 'coluna que informa o id do estoque.';
COMMENT ON COLUMN lojas.estoques.loja_id    IS 'coluna que informa o id da loja.';
COMMENT ON COLUMN lojas.estoques.produto_id IS 'coluna que informa o id do produto.';
COMMENT ON COLUMN lojas.estoques.quantidade IS 'coluna que informa a quantidade no estoque.';

-- COMANDO DE CRIACAO DA TABELA DE ENVIOS;
CREATE TABLE    lojas.envios (
                envio_id         NUMERIC(38)  NOT NULL,
                loja_id          NUMERIC(38)  NOT NULL,
                cliente_id       NUMERIC(38)  NOT NULL,
                endereco_entrega VARCHAR(512) NOT NULL,
                status           VARCHAR(15)  NOT NULL,
                CONSTRAINT envio_id PRIMARY KEY (envio_id)
);

-- COMANDO DE CRIACAO DE COMENTARIO DA TABELA DE ENVIOS;
COMMENT ON TABLE  lojas.envios                   IS 'tabela para os envios da loja';
COMMENT ON COLUMN lojas.envios.envio_id          IS 'coluna com id de envio.';
COMMENT ON COLUMN lojas.envios.loja_id           IS 'coluna com id da loja.';
COMMENT ON COLUMN lojas.envios.cliente_id        IS 'coluna com o id do cliente.';
COMMENT ON COLUMN lojas.envios.endereco_entrega  IS 'coluna com o endereço da entrega do cliente.';
COMMENT ON COLUMN lojas.envios.status            IS 'coluna com o status dos envios do cliente.';

-- COMANDO DE CRIACAO DA TABELA DE PEDIDOS DE ITENS;
CREATE TABLE    lojas.pedidos_itens (
                pedido_id       NUMERIC(38)   NOT NULL,
                produto_id      NUMERIC(38)   NOT NULL,
                numero_da_linha NUMERIC(38)   NOT NULL,
                preco_unitario  NUMERIC(10,2) NOT NULL,
                quantidade      NUMERIC(38)   NOT NULL,
                envio_id        NUMERIC       NOT NULL,
                CONSTRAINT pk_pedido_id PRIMARY KEY (pedido_id, produto_id)
);

-- COMANDO DE CRIACAO DE COMENTARIO DA TABELA DE PEDIDOS DE ITENS;
COMMENT ON TABLE  lojas.pedidos_itens                 IS 'tabela para os pedidos em relação aos itens da loja';
COMMENT ON COLUMN lojas.pedidos_itens.pedido_id       IS 'coluna que representa o id dos pedidos.';
COMMENT ON COLUMN lojas.pedidos_itens.produto_id      IS 'coluna que informa o id dos produtos.';
COMMENT ON COLUMN lojas.pedidos_itens.numero_da_linha IS 'coluna com finalidade de informar o numero da linha dos pedidos.';
COMMENT ON COLUMN lojas.pedidos_itens.preco_unitario  IS 'coluna que informa o preço unitário dos pedidos.';
COMMENT ON COLUMN lojas.pedidos_itens.quantidade      IS 'coluna que apresenta as quantidades de pedidos.';
COMMENT ON COLUMN lojas.pedidos_itens.envio_id        IS 'coluna que informa o id dos envios dos pedidos.';

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DO ESTOQUE REFERENCIANDO OS PRODUTOS;
ALTER TABLE lojas.estoques ADD CONSTRAINT produtos_estoques_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DOS ITENS REFERENCIANDO OS PRODUTOS;
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT produtos_pedidos_itens_fk
FOREIGN KEY (produto_id)
REFERENCES lojas.produtos (produto_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DOS PEDIDOS REFERENCIANDO AOS CLIENTES;
ALTER TABLE lojas.pedidos ADD CONSTRAINT clientes_pedidos_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DOS ENVIOS REFERENCIANDO OS CLIENTES;
ALTER TABLE lojas.envios ADD CONSTRAINT clientes_envios_fk
FOREIGN KEY (cliente_id)
REFERENCES lojas.clientes (cliente_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DOS ENVIOS REFERENCIANDO AS LOJAS;
ALTER TABLE lojas.envios ADD CONSTRAINT lojas_envios_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DOS ESTOQUES REFERENCIANDO AS LOJAS;
ALTER TABLE lojas.estoques ADD CONSTRAINT lojas_estoques_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DOS PEDIDOS REFERENCIANDO AS LOJAS;
ALTER TABLE lojas.pedidos ADD CONSTRAINT lojas_pedidos_fk
FOREIGN KEY (loja_id)
REFERENCES lojas.lojas (loja_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DOS ITENS REFERENCIANDO OS PEDIDOS;
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT pedidos_pedidos_itens_fk
FOREIGN KEY (pedido_id)
REFERENCES lojas.pedidos (pedido_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
Warning: Column types mismatch in the following column mapping(s):
        envio_id: VARCHAR(38) -- envio_id: NUMERIC
*/

-- COMANDOS PARA ESTABELECER O MODO DE CONFIGURAR A PRIMARY KEY E FOREING KEY DOS ITENS REFERENCIANDO OS ENVIOS;
ALTER TABLE lojas.pedidos_itens ADD CONSTRAINT envios_pedidos_itens_fk
FOREIGN KEY (envio_id)
REFERENCES lojas.envios (envio_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

-- COMANDOS QUE ADICIONAM AS CONSTRAINTS DE VERIFICACAO DE STATUS DOS PEDIDOS, ENVIOS E LOJAS. |PROPOSTO PELO PROFESSOR PARA VERIFICAR O STATUS DOS PEDIDOS|;

-- COMANDO DE CONSTRAINT DE VERIFICACAO DE STATUS DOS PEDIDOS;
ALTER TABLE pedidos
ADD CONSTRAINT verif_status_pedidos
CHECK (status IN (' CANCELADO ', 'COMPLETO' , 'ABERTO ', 'PAGO' , 'REEMBOLSADO' , 'ENVIADO'));

-- COMANDO DE CONSTRAINT DE VERIFICACAO DE STATUS DOS ENVIOS;
ALTER TABLE envios
ADD CONSTRAINT verif_status_envios
CHECK (status IN ('CRIADO', 'ENVIADO', 'TRANSITO', 'ENTREGUE'));

-- COMANDO DE VERIFICACAO COM CONSTRAINT PARA VERIFICAR SE ESTA PREENCHIDO TODOS OS ENDERECOS;
ALTER TABLE lojas
ADD CONSTRAINT verif_endereco
CHECK ((endereco_fisico IS NOT NULL AND endereco_web IS NULL) OR
       (endereco_fisico IS NULL AND endereco_web IS NOT NULL));

-- COMANDO PARA MOSTRAR O SCHEMA DAS TABELAS COMO PUBLICO;

\dt lojas.*