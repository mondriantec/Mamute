--
-- PostgreSQL database dump
--

SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: campo_documentos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE campo_documentos (
    id integer NOT NULL,
    tipo_documento_id integer,
    tipo_campo character varying(255),
    limite integer,
    descricao text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    nome character varying(255),
    ordem integer
);


ALTER TABLE public.campo_documentos OWNER TO dute;

--
-- Name: campo_documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE campo_documentos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.campo_documentos_id_seq OWNER TO dute;

--
-- Name: campo_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE campo_documentos_id_seq OWNED BY campo_documentos.id;


--
-- Name: campo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('campo_documentos_id_seq', 30, true);


--
-- Name: campo_processos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE campo_processos (
    id integer NOT NULL,
    tipo_campo character varying(255),
    tipo_processo_id integer,
    nome character varying(255),
    tamanho integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.campo_processos OWNER TO dute;

--
-- Name: campo_processos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE campo_processos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.campo_processos_id_seq OWNER TO dute;

--
-- Name: campo_processos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE campo_processos_id_seq OWNED BY campo_processos.id;


--
-- Name: campo_processos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('campo_processos_id_seq', 1, false);


--
-- Name: cartorios; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE cartorios (
    id integer NOT NULL,
    cidade_id integer,
    oficio character varying(255),
    tabeliao character varying(255),
    endereco character varying(255),
    bairro character varying(255),
    fone character varying(255),
    fax character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    tribunal_id integer
);


ALTER TABLE public.cartorios OWNER TO dute;

--
-- Name: cartorios_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE cartorios_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cartorios_id_seq OWNER TO dute;

--
-- Name: cartorios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE cartorios_id_seq OWNED BY cartorios.id;


--
-- Name: cartorios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('cartorios_id_seq', 1, false);


--
-- Name: categorias; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE categorias (
    id integer NOT NULL,
    nome character varying(255),
    descricao text,
    parent_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.categorias OWNER TO dute;

--
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE categorias_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.categorias_id_seq OWNER TO dute;

--
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE categorias_id_seq OWNED BY categorias.id;


--
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('categorias_id_seq', 1, false);


--
-- Name: certidoes; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE certidoes (
    id integer NOT NULL,
    documento_id integer,
    numero integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    valor_emolumentos double precision,
    valor_sistema double precision,
    valor_irtd_br double precision,
    valor_irtd double precision,
    tipo_cartao character varying(255),
    numero_cartao character varying(255),
    mes_validade_cartao character varying(255),
    ano_validade_cartao character varying(255)
);


ALTER TABLE public.certidoes OWNER TO dute;

--
-- Name: certidaos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE certidaos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.certidaos_id_seq OWNER TO dute;

--
-- Name: certidaos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE certidaos_id_seq OWNED BY certidoes.id;


--
-- Name: certidaos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('certidaos_id_seq', 6, true);


--
-- Name: cidades; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE cidades (
    id integer NOT NULL,
    nome character varying(255),
    uf character varying(2),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.cidades OWNER TO dute;

--
-- Name: cidades_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE cidades_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.cidades_id_seq OWNER TO dute;

--
-- Name: cidades_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE cidades_id_seq OWNED BY cidades.id;


--
-- Name: cidades_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('cidades_id_seq', 1, true);


--
-- Name: configuracoes; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE configuracoes (
    id integer NOT NULL,
    chave character varying(255),
    valor character varying(255),
    descricao text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.configuracoes OWNER TO dute;

--
-- Name: configuracoes_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE configuracoes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.configuracoes_id_seq OWNER TO dute;

--
-- Name: configuracoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE configuracoes_id_seq OWNED BY configuracoes.id;


--
-- Name: configuracoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('configuracoes_id_seq', 1, false);


--
-- Name: conveniados; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE conveniados (
    id integer NOT NULL,
    cnpj character varying(255),
    nome character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    uf character varying(255)
);


ALTER TABLE public.conveniados OWNER TO dute;

--
-- Name: conveniados_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE conveniados_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.conveniados_id_seq OWNER TO dute;

--
-- Name: conveniados_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE conveniados_id_seq OWNED BY conveniados.id;


--
-- Name: conveniados_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('conveniados_id_seq', 1, false);


--
-- Name: documentos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE documentos (
    id integer NOT NULL,
    tipo_documento_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    imagem_content_type character varying(255),
    imagem_file_name character varying(255),
    imagem_file_size integer,
    usuario_id integer,
    selo_id integer,
    cartorio_id integer
);


ALTER TABLE public.documentos OWNER TO dute;

--
-- Name: documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE documentos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.documentos_id_seq OWNER TO dute;

--
-- Name: documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE documentos_id_seq OWNED BY documentos.id;


--
-- Name: documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('documentos_id_seq', 12, true);


--
-- Name: irtds; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE irtds (
    id integer NOT NULL,
    uf character varying(255),
    nome character varying(255),
    presidente character varying(255),
    nacional boolean,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.irtds OWNER TO dute;

--
-- Name: irtds_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE irtds_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.irtds_id_seq OWNER TO dute;

--
-- Name: irtds_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE irtds_id_seq OWNED BY irtds.id;


--
-- Name: irtds_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('irtds_id_seq', 1, false);


--
-- Name: lotes; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE lotes (
    id integer NOT NULL,
    tribunal_id integer,
    selo_prefixo character varying(255),
    selo_inicial integer,
    selo_final integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.lotes OWNER TO dute;

--
-- Name: lotes_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE lotes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.lotes_id_seq OWNER TO dute;

--
-- Name: lotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE lotes_id_seq OWNED BY lotes.id;


--
-- Name: lotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('lotes_id_seq', 1, false);


--
-- Name: mensagens; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE mensagens (
    id integer NOT NULL,
    usuario_id integer,
    destinatario_id integer,
    assunto character varying(255),
    texto text,
    status character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.mensagens OWNER TO dute;

--
-- Name: mensagens_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE mensagens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.mensagens_id_seq OWNER TO dute;

--
-- Name: mensagens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE mensagens_id_seq OWNED BY mensagens.id;


--
-- Name: mensagens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('mensagens_id_seq', 1, false);


--
-- Name: motivo_notificacaos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE motivo_notificacaos (
    id integer NOT NULL,
    motivo character varying(255),
    descricao text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.motivo_notificacaos OWNER TO dute;

--
-- Name: motivo_notificacaos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE motivo_notificacaos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.motivo_notificacaos_id_seq OWNER TO dute;

--
-- Name: motivo_notificacaos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE motivo_notificacaos_id_seq OWNED BY motivo_notificacaos.id;


--
-- Name: motivo_notificacaos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('motivo_notificacaos_id_seq', 1, true);


--
-- Name: notificacoes; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE notificacoes (
    id integer NOT NULL,
    cartorio_id integer,
    notificado_id integer,
    motivo_notificacao_id integer,
    texto text,
    data_envio_usuario timestamp without time zone,
    status integer,
    motivo_status text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    endereco character varying(255),
    bairro character varying(255),
    uf character varying(255),
    cpf character varying(255),
    cidade_id integer
);


ALTER TABLE public.notificacoes OWNER TO dute;

--
-- Name: notificacoes_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE notificacoes_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.notificacoes_id_seq OWNER TO dute;

--
-- Name: notificacoes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE notificacoes_id_seq OWNED BY notificacoes.id;


--
-- Name: notificacoes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('notificacoes_id_seq', 2, true);


--
-- Name: perfis; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE perfis (
    id integer NOT NULL,
    nome character varying(255),
    created_by integer,
    updated_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.perfis OWNER TO dute;

--
-- Name: perfis_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE perfis_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.perfis_id_seq OWNER TO dute;

--
-- Name: perfis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE perfis_id_seq OWNED BY perfis.id;


--
-- Name: perfis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('perfis_id_seq', 1, false);


--
-- Name: perfis_usuarios; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE perfis_usuarios (
    usuario_id integer,
    perfil_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.perfis_usuarios OWNER TO dute;

--
-- Name: pessoa_versions; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE pessoa_versions (
    id integer NOT NULL,
    pessoa_id integer,
    version integer,
    nome character varying(255),
    cpf character varying(255),
    rg character varying(255),
    orgao_emissor_rg character varying(255),
    uf_emissor_rg character varying(255),
    cnh character varying(255),
    nome_mae character varying(255),
    endereco character varying(255),
    bairro character varying(255),
    cidade_id character varying(255),
    cep character varying(255),
    estado_civil character varying(255),
    created_by integer,
    updated_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.pessoa_versions OWNER TO dute;

--
-- Name: pessoa_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE pessoa_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pessoa_versions_id_seq OWNER TO dute;

--
-- Name: pessoa_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE pessoa_versions_id_seq OWNED BY pessoa_versions.id;


--
-- Name: pessoa_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('pessoa_versions_id_seq', 1, false);


--
-- Name: pessoas; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE pessoas (
    id integer NOT NULL,
    nome character varying(255),
    cpf character varying(255),
    rg character varying(255),
    orgao_emissor_rg character varying(255),
    uf_emissor_rg character varying(255),
    cnh character varying(255),
    nome_mae character varying(255),
    endereco character varying(255),
    bairro character varying(255),
    cidade_id character varying(255),
    cep character varying(255),
    estado_civil character varying(255),
    created_by integer,
    updated_by integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    version integer
);


ALTER TABLE public.pessoas OWNER TO dute;

--
-- Name: pessoas_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE pessoas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.pessoas_id_seq OWNER TO dute;

--
-- Name: pessoas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE pessoas_id_seq OWNED BY pessoas.id;


--
-- Name: pessoas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('pessoas_id_seq', 1, false);


--
-- Name: precos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE precos (
    id integer NOT NULL,
    tribunal_id integer,
    certidao double precision,
    notificacao double precision,
    registro double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.precos OWNER TO dute;

--
-- Name: precos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE precos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.precos_id_seq OWNER TO dute;

--
-- Name: precos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE precos_id_seq OWNED BY precos.id;


--
-- Name: precos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('precos_id_seq', 1, true);


--
-- Name: processo_versions; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE processo_versions (
    id integer NOT NULL,
    processo_id integer,
    version integer,
    tipo_processo_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.processo_versions OWNER TO dute;

--
-- Name: processo_versions_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE processo_versions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.processo_versions_id_seq OWNER TO dute;

--
-- Name: processo_versions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE processo_versions_id_seq OWNED BY processo_versions.id;


--
-- Name: processo_versions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('processo_versions_id_seq', 1, false);


--
-- Name: processos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE processos (
    id integer NOT NULL,
    tipo_processo_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    version integer
);


ALTER TABLE public.processos OWNER TO dute;

--
-- Name: processos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE processos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.processos_id_seq OWNER TO dute;

--
-- Name: processos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE processos_id_seq OWNED BY processos.id;


--
-- Name: processos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('processos_id_seq', 1, false);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO dute;

--
-- Name: selos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE selos (
    id integer NOT NULL,
    numero character varying(255),
    lote_id integer,
    status integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.selos OWNER TO dute;

--
-- Name: selos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE selos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.selos_id_seq OWNER TO dute;

--
-- Name: selos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE selos_id_seq OWNED BY selos.id;


--
-- Name: selos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('selos_id_seq', 1, false);


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE sessions (
    id integer NOT NULL,
    session_id text NOT NULL,
    data text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.sessions OWNER TO dute;

--
-- Name: sessions_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE sessions_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.sessions_id_seq OWNER TO dute;

--
-- Name: sessions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE sessions_id_seq OWNED BY sessions.id;


--
-- Name: sessions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('sessions_id_seq', 243, true);


--
-- Name: tipo_campos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE tipo_campos (
    id integer NOT NULL,
    tipo character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tipo_campos OWNER TO dute;

--
-- Name: tipo_campos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE tipo_campos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_campos_id_seq OWNER TO dute;

--
-- Name: tipo_campos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE tipo_campos_id_seq OWNED BY tipo_campos.id;


--
-- Name: tipo_campos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('tipo_campos_id_seq', 1, false);


--
-- Name: tipo_documentos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE tipo_documentos (
    id integer NOT NULL,
    tipo character varying(255),
    descricao text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tipo_documentos OWNER TO dute;

--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE tipo_documentos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_documentos_id_seq OWNER TO dute;

--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE tipo_documentos_id_seq OWNED BY tipo_documentos.id;


--
-- Name: tipo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('tipo_documentos_id_seq', 13, true);


--
-- Name: tipo_processos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE tipo_processos (
    id integer NOT NULL,
    tipo character varying(255),
    descricao text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tipo_processos OWNER TO dute;

--
-- Name: tipo_processos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE tipo_processos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tipo_processos_id_seq OWNER TO dute;

--
-- Name: tipo_processos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE tipo_processos_id_seq OWNED BY tipo_processos.id;


--
-- Name: tipo_processos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('tipo_processos_id_seq', 1, false);


--
-- Name: tribunais; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE tribunais (
    id integer NOT NULL,
    uf character varying(255),
    nome character varying(255),
    presidente character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.tribunais OWNER TO dute;

--
-- Name: tribunais_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE tribunais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tribunais_id_seq OWNER TO dute;

--
-- Name: tribunais_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE tribunais_id_seq OWNED BY tribunais.id;


--
-- Name: tribunais_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('tribunais_id_seq', 1, false);


--
-- Name: usuarios; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE usuarios (
    id integer NOT NULL,
    login character varying(40),
    nome character varying(100) DEFAULT ''::character varying,
    email character varying(100),
    crypted_password character varying(40),
    salt character varying(40),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    remember_token character varying(40),
    remember_token_expires_at timestamp without time zone,
    created_by integer,
    updated_by integer,
    organizacao_id integer,
    organizacao_type character varying(255),
    entidade_type character varying(255),
    entidade_id integer,
    admin boolean,
    cpf character varying(255),
    cnpj character varying(255),
    rg character varying(255),
    orgao_rg character varying(255),
    mae character varying(255),
    pai character varying(255),
    data_nascimento date,
    naturalidade character varying(255),
    nacionalidade character varying(255),
    endereco character varying(255),
    bairro character varying(255),
    cep character varying(255),
    endereco_numero character varying(255),
    cidade_id integer
);


ALTER TABLE public.usuarios OWNER TO dute;

--
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE usuarios_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.usuarios_id_seq OWNER TO dute;

--
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE usuarios_id_seq OWNED BY usuarios.id;


--
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('usuarios_id_seq', 2, true);


--
-- Name: valor_campo_documentos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE valor_campo_documentos (
    id integer NOT NULL,
    documento_id integer,
    campo_documento_id integer,
    valor text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.valor_campo_documentos OWNER TO dute;

--
-- Name: valor_campo_documentos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE valor_campo_documentos_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.valor_campo_documentos_id_seq OWNER TO dute;

--
-- Name: valor_campo_documentos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE valor_campo_documentos_id_seq OWNED BY valor_campo_documentos.id;


--
-- Name: valor_campo_documentos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('valor_campo_documentos_id_seq', 30, true);


--
-- Name: valor_campo_processos; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE valor_campo_processos (
    id integer NOT NULL,
    processo_id integer,
    campo_processo_id integer,
    valor text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.valor_campo_processos OWNER TO dute;

--
-- Name: valor_campo_processos_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE valor_campo_processos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.valor_campo_processos_id_seq OWNER TO dute;

--
-- Name: valor_campo_processos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE valor_campo_processos_id_seq OWNED BY valor_campo_processos.id;


--
-- Name: valor_campo_processos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('valor_campo_processos_id_seq', 1, false);


--
-- Name: valores_sistema; Type: TABLE; Schema: public; Owner: dute; Tablespace: 
--

CREATE TABLE valores_sistema (
    id integer NOT NULL,
    certidao double precision,
    notificacao double precision,
    registro double precision,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.valores_sistema OWNER TO dute;

--
-- Name: valores_sistema_id_seq; Type: SEQUENCE; Schema: public; Owner: dute
--

CREATE SEQUENCE valores_sistema_id_seq
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.valores_sistema_id_seq OWNER TO dute;

--
-- Name: valores_sistema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dute
--

ALTER SEQUENCE valores_sistema_id_seq OWNED BY valores_sistema.id;


--
-- Name: valores_sistema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dute
--

SELECT pg_catalog.setval('valores_sistema_id_seq', 1, true);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE campo_documentos ALTER COLUMN id SET DEFAULT nextval('campo_documentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE campo_processos ALTER COLUMN id SET DEFAULT nextval('campo_processos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE cartorios ALTER COLUMN id SET DEFAULT nextval('cartorios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE categorias ALTER COLUMN id SET DEFAULT nextval('categorias_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE certidoes ALTER COLUMN id SET DEFAULT nextval('certidaos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE cidades ALTER COLUMN id SET DEFAULT nextval('cidades_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE configuracoes ALTER COLUMN id SET DEFAULT nextval('configuracoes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE conveniados ALTER COLUMN id SET DEFAULT nextval('conveniados_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE documentos ALTER COLUMN id SET DEFAULT nextval('documentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE irtds ALTER COLUMN id SET DEFAULT nextval('irtds_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE lotes ALTER COLUMN id SET DEFAULT nextval('lotes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE mensagens ALTER COLUMN id SET DEFAULT nextval('mensagens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE motivo_notificacaos ALTER COLUMN id SET DEFAULT nextval('motivo_notificacaos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE notificacoes ALTER COLUMN id SET DEFAULT nextval('notificacoes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE perfis ALTER COLUMN id SET DEFAULT nextval('perfis_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE pessoa_versions ALTER COLUMN id SET DEFAULT nextval('pessoa_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE pessoas ALTER COLUMN id SET DEFAULT nextval('pessoas_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE precos ALTER COLUMN id SET DEFAULT nextval('precos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE processo_versions ALTER COLUMN id SET DEFAULT nextval('processo_versions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE processos ALTER COLUMN id SET DEFAULT nextval('processos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE selos ALTER COLUMN id SET DEFAULT nextval('selos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE sessions ALTER COLUMN id SET DEFAULT nextval('sessions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE tipo_campos ALTER COLUMN id SET DEFAULT nextval('tipo_campos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE tipo_documentos ALTER COLUMN id SET DEFAULT nextval('tipo_documentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE tipo_processos ALTER COLUMN id SET DEFAULT nextval('tipo_processos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE tribunais ALTER COLUMN id SET DEFAULT nextval('tribunais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE usuarios ALTER COLUMN id SET DEFAULT nextval('usuarios_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE valor_campo_documentos ALTER COLUMN id SET DEFAULT nextval('valor_campo_documentos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE valor_campo_processos ALTER COLUMN id SET DEFAULT nextval('valor_campo_processos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dute
--

ALTER TABLE valores_sistema ALTER COLUMN id SET DEFAULT nextval('valores_sistema_id_seq'::regclass);


--
-- Data for Name: campo_documentos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY campo_documentos (id, tipo_documento_id, tipo_campo, limite, descricao, created_at, updated_at, nome, ordem) FROM stdin;
1	1	TEXTO	10		2011-02-23 14:51:04	2011-02-23 14:51:04	campo1	1
2	2	TEXTO	10		2011-02-27 14:19:27	2011-02-27 14:19:27	NUMERO	1
3	2	DATA	\N		2011-02-27 14:19:53	2011-02-27 14:19:53	DATA EMISSAO	2
10	10	NUMERO	\N		2011-03-19 10:04:34.266822	2011-03-19 10:04:34.266822	NUMERO	1
11	10	DATA	\N		2011-03-19 10:04:53.500447	2011-03-19 10:04:53.500447	DATA EMISSAO	2
12	10	TEXTO	\N		2011-03-19 10:05:27.138746	2011-03-19 10:05:27.138746	ORGAO	3
13	10	TEXTO	\N		2011-03-19 10:05:38.256559	2011-03-19 10:05:38.256559	UF	4
14	11	NUMERO	\N		2011-03-19 10:16:25.332446	2011-03-19 10:16:25.332446	NUMERO	1
15	10	TEXTO	\N		2011-03-19 10:17:13.083821	2011-03-19 10:17:13.083821	NOME	5
16	10	TEXTO	\N		2011-03-19 10:17:31.004163	2011-03-19 10:17:31.004163	NATURAL DE	6
17	10	DATA	\N		2011-03-19 10:17:49.959963	2011-03-19 10:17:49.959963	DATA NASCIMENTO	7
18	11	TEXTO	\N		2011-03-19 10:18:16.76948	2011-03-19 10:18:16.76948	NOME	2
19	11	DATA	\N		2011-03-19 10:18:32.69669	2011-03-19 10:18:32.69669	DATA NASCIMENTO	3
20	11	DATA	\N		2011-03-19 10:18:48.011587	2011-03-19 10:18:48.011587	DATA EMISSAO	4
21	11	DATA	\N		2011-03-19 10:19:03.989056	2011-03-19 10:19:03.989056	VALIDADE	5
22	2	TEXTO	\N		2011-03-19 10:19:32.940721	2011-03-19 10:19:32.940721	NOME	3
23	2	TEXTO	2		2011-03-19 10:19:49.725449	2011-03-19 10:19:49.725449	CATEGORIA	4
24	12	NUMERO	\N		2011-03-19 10:20:13.699548	2011-03-19 10:20:13.699548	NUMERO	1
26	12	DATA	\N		2011-03-19 10:20:40.391508	2011-03-19 10:20:40.391508	DATA EMISSAO	2
25	12	TEXTO	\N		2011-03-19 10:20:26.010494	2011-03-19 10:20:48.034758	NOME	3
27	13	TEXTO	\N		2011-03-19 10:21:39.901717	2011-03-19 10:21:39.901717	CNPJ	1
28	13	TEXTO	\N		2011-03-19 10:21:56.944508	2011-03-19 10:21:56.944508	RAZAO SOCIAL	2
29	13	TEXTO	\N		2011-03-19 10:22:09.617326	2011-03-19 10:22:09.617326	NOME FANTASIA	3
30	13	TEXTO	\N		2011-03-19 10:22:24.142519	2011-03-19 10:22:24.142519	ATIVIDADE	4
\.


--
-- Data for Name: campo_processos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY campo_processos (id, tipo_campo, tipo_processo_id, nome, tamanho, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: cartorios; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY cartorios (id, cidade_id, oficio, tabeliao, endereco, bairro, fone, fax, created_at, updated_at, tribunal_id) FROM stdin;
2	1	3º RTD de São Paulo	Jose Maria Siviero					2011-02-22 13:41:54	2011-03-19 09:49:14.910153	2
\.


--
-- Data for Name: categorias; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY categorias (id, nome, descricao, parent_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: certidoes; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY certidoes (id, documento_id, numero, created_at, updated_at, valor_emolumentos, valor_sistema, valor_irtd_br, valor_irtd, tipo_cartao, numero_cartao, mes_validade_cartao, ano_validade_cartao) FROM stdin;
6	29	\N	2011-08-17 13:01:45.728163	2011-08-17 13:01:45.728163	\N	\N	\N	\N	VISA		1	2011
\.


--
-- Data for Name: cidades; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY cidades (id, nome, uf, created_at, updated_at) FROM stdin;
2	Fortaleza	CE	2011-02-22 13:41:54	2011-02-22 13:41:54
3	Acrelândia	AC	\N	\N
1	São Paulo	SP	2011-03-19 09:48:43.673869	2011-03-19 09:48:43.673869
\.


--
-- Data for Name: configuracoes; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY configuracoes (id, chave, valor, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: conveniados; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY conveniados (id, cnpj, nome, created_at, updated_at, uf) FROM stdin;
2		Tribunal de Contas do Estado de São Paulo	2011-02-22 13:41:54	2011-03-19 09:50:36.255368	SP
\.


--
-- Data for Name: documentos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY documentos (id, tipo_documento_id, created_at, updated_at, imagem_content_type, imagem_file_name, imagem_file_size, usuario_id, selo_id, cartorio_id) FROM stdin;
29	2	2011-02-27 18:55:57	2011-02-27 18:57:27	image/jpeg	cnh.jpg	136450	11	100	2
12	10	2011-07-02 08:15:32.987364	2011-07-02 08:15:32.987364	application/pdf	NECTAR20110218114000_920.pdf	56822	11	105	2
\.


--
-- Data for Name: irtds; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY irtds (id, uf, nome, presidente, nacional, created_at, updated_at) FROM stdin;
3	SP	IRTDPJ-SP	Jose Maria Siviero	\N	2011-02-22 13:41:54	2011-03-19 09:44:25.814306
5	AC	IRTDPJ-BR	Jose Maria Siviero	t	2011-02-22 18:15:26	2011-03-19 09:50:09.101616
\.


--
-- Data for Name: lotes; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY lotes (id, tribunal_id, selo_prefixo, selo_inicial, selo_final, created_at, updated_at) FROM stdin;
2	2	AA	100	199	2011-02-27 15:35:04	2011-02-27 15:38:15
\.


--
-- Data for Name: mensagens; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY mensagens (id, usuario_id, destinatario_id, assunto, texto, status, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: motivo_notificacaos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY motivo_notificacaos (id, motivo, descricao, created_at, updated_at) FROM stdin;
1	Teste	\N	2011-06-14 09:57:38.939244	2011-06-14 09:57:38.939244
\.


--
-- Data for Name: notificacoes; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY notificacoes (id, cartorio_id, notificado_id, motivo_notificacao_id, texto, data_envio_usuario, status, motivo_status, created_at, updated_at, endereco, bairro, uf, cpf, cidade_id) FROM stdin;
1	2	\N	1	Testando	\N	\N	\N	2011-06-14 10:01:30.224262	2011-06-14 10:01:30.224262	Rua 1	Centro	SP	\N	1
2	2	2	1	Testando	\N	\N	\N	2011-06-14 10:10:07.26708	2011-06-14 10:10:07.26708	Rua 1	Centro	SP	\N	1
\.


--
-- Data for Name: perfis; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY perfis (id, nome, created_by, updated_by, created_at, updated_at) FROM stdin;
1	ADMIN	1	1	2011-02-22 13:32:34	2011-02-22 13:32:34
\.


--
-- Data for Name: perfis_usuarios; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY perfis_usuarios (usuario_id, perfil_id, created_at, updated_at) FROM stdin;
1	1	2011-02-22 13:32:34	2011-02-22 13:32:34
\.


--
-- Data for Name: pessoa_versions; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY pessoa_versions (id, pessoa_id, version, nome, cpf, rg, orgao_emissor_rg, uf_emissor_rg, cnh, nome_mae, endereco, bairro, cidade_id, cep, estado_civil, created_by, updated_by, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: pessoas; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY pessoas (id, nome, cpf, rg, orgao_emissor_rg, uf_emissor_rg, cnh, nome_mae, endereco, bairro, cidade_id, cep, estado_civil, created_by, updated_by, created_at, updated_at, version) FROM stdin;
\.


--
-- Data for Name: precos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY precos (id, tribunal_id, certidao, notificacao, registro, created_at, updated_at) FROM stdin;
1	2	1	7	7	2011-02-28 02:43:21.700409	2011-02-28 02:43:21.700409
\.


--
-- Data for Name: processo_versions; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY processo_versions (id, processo_id, version, tipo_processo_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: processos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY processos (id, tipo_processo_id, created_at, updated_at, version) FROM stdin;
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY schema_migrations (version) FROM stdin;
20110227184621
20110110032142
20110223134704
20110219031110
20110221174012
20110111132359
20110109170610
20110112175612
20110111132545
20110111124339
20110111132051
20110219021409
20110221172737
20110227152144
20110112173724
20110112173909
20110221204815
20110112173828
20110109170133
20110221174311
20110109151007
20110219021446
20110111133053
20110110024017
20110221180629
20110110023708
20110221174424
20110227143539
20110225143325
20110109170340
20110222180932
20110221183928
20110227152800
20110222133826
20110221174538
20110110025047
20110109150215
20110112174000
20110227150445
20110111131935
20110225203129
20110221181945
20110109151210
20110228010024
20110228010958
20110228012355
20110228012427
20110228014221
20110228014647
20110228022923
20110330110141
20110611144514
20110611145150
20110613191256
20110613192307
\.


--
-- Data for Name: selos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY selos (id, numero, lote_id, status, created_at, updated_at) FROM stdin;
100	AA100	2	1	2011-02-27 15:35:04	2011-02-27 18:57:27
106	AA106	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
107	AA107	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
108	AA108	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
109	AA109	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
110	AA110	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
111	AA111	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
112	AA112	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
113	AA113	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
114	AA114	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
115	AA115	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
116	AA116	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
117	AA117	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
118	AA118	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
119	AA119	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
120	AA120	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
121	AA121	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
122	AA122	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
123	AA123	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
124	AA124	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
125	AA125	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
126	AA126	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
127	AA127	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
128	AA128	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
129	AA129	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
130	AA130	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
131	AA131	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
132	AA132	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
133	AA133	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
134	AA134	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
135	AA135	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
136	AA136	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
137	AA137	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
138	AA138	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
139	AA139	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
140	AA140	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
141	AA141	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
142	AA142	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
143	AA143	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
144	AA144	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
145	AA145	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
146	AA146	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
147	AA147	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
148	AA148	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
149	AA149	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
150	AA150	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
151	AA151	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
152	AA152	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
153	AA153	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
154	AA154	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
155	AA155	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
156	AA156	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
157	AA157	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
158	AA158	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
159	AA159	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
160	AA160	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
161	AA161	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
162	AA162	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
163	AA163	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
164	AA164	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
165	AA165	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
166	AA166	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
167	AA167	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
168	AA168	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
169	AA169	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
170	AA170	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
171	AA171	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
172	AA172	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
173	AA173	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
174	AA174	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
175	AA175	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
176	AA176	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
177	AA177	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
178	AA178	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
179	AA179	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
180	AA180	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
181	AA181	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
182	AA182	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
183	AA183	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
184	AA184	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
185	AA185	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
186	AA186	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
187	AA187	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
188	AA188	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
189	AA189	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
190	AA190	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
191	AA191	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
192	AA192	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
193	AA193	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
194	AA194	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
195	AA195	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
196	AA196	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
197	AA197	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
198	AA198	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
199	AA199	2	0	2011-02-27 15:35:04	2011-02-27 15:35:04
101	AA101	2	1	2011-02-27 15:35:04	2011-02-28 12:47:34.305716
102	AA102	2	1	2011-02-27 15:35:04	2011-02-28 13:19:50.24388
103	AA103	2	1	2011-02-27 15:35:04	2011-02-28 13:20:53.691297
104	AA104	2	1	2011-02-27 15:35:04	2011-02-28 18:10:58.600163
105	AA105	2	1	2011-02-27 15:35:04	2011-07-02 08:15:32.98547
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY sessions (id, session_id, data, created_at, updated_at) FROM stdin;
128	bb6601cef332e829f3b75f3314a0d12d	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 23:45:17.41504	2011-03-31 23:45:17.41504
1	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOg9zZXNzaW9uX2lkIiUzMzcwNjM1NzM4ZTU1OWZmZTU3NDkwZTk1OWMyNGRkYjoQX2NzcmZfdG9rZW4iMVhqVFRhRnBtQWhzc2pGMlRQcjRPaFBwOWNyRmxrUlRjRUlnYWYrRzhRK0k9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=--2c878471517cc1f5a1c5c292e8b361288aedca95	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nYmgyZ1BSTnRVNnlrSmhjNW8yc0dLSVUwNW1FK1h5TU5GZnkzNWFjVTVpMD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 11:07:52.139389	2011-03-30 11:07:52.324725
15	dd17c5fb45d664672466fe2da235a861	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nVVN6bzVjTndyM2hYNlpmMEJKbFNQQ3ZIdnhENGFWaDlnQWRCM1FRUWFHVT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiHkNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJycGOgpAdXNlZHsG\nOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-30 14:29:44.271985	2011-03-30 14:30:00.710057
2	257a3ac7949749a8a59a23e14d9b954a	BAh7CToOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMVgvMmVrZk0xZ2FmT1BJOWJtTjdabndrQ1JJYzd0cnB5RGdKazVuTTBX\nd2M9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-30 11:43:21.93328	2011-03-30 11:44:06.751345
16	d68ec0f088b6c5b1691028e1fdc165fe	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMUE2a2J2UFdHdWMwWHd2\nV3JMK2RoakNvZE1GSEpkYVFiOEVrV0VncmdpN0k9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-30 14:30:06.687615	2011-03-30 14:30:06.687615
17	0e178219085759e869d4237350eff3b8	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nYi8yVkx4NWlVeVI0TTNzMms1K0QwNnR2ZW04VHBmRFQxdUEreHlTNHRjdz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 14:49:27.934214	2011-03-30 14:49:27.970954
18	31e0bf33d0c623f8d806ac6e1034abe7	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMXNiZUVlL3Y4REdrdjFBaXg1eEw0WmdJYU5reUwyazlQcjJKSkdPbWYy\nRUk9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-30 17:19:40.805544	2011-03-30 17:23:37.554926
19	1f6ccd0497355f70ed3c21ce98afa907	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nWXVIU0xZRXM2ZW40N2NmbFJjN2tVTXJCUDdnV2RvenIwWDN4TkFLQlNlTT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 23:28:40.855669	2011-03-30 23:29:19.153658
3	8d05b3e2e296094a370d2fc5dc18b28e	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMWpJSS84S3o0RUJIN05hVUtLYzArUEdacHNqSXp2RFpMd1IrMzlONGIr\ndjQ9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIiNDb3VsZG4ndCBsb2cgeW91IGluIGFzICdjZWNhZicG\nOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-30 12:28:03.025945	2011-03-30 12:29:44.439645
5	f771c940fa261b7d41adfc2641c02953	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nOStsbEFEZm12SlJNMFdwZ1dEMWZKajgybFFWRXUvMi9IKy9BQkl6ZE5GRT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 13:16:20.098773	2011-03-30 13:16:20.12201
6	bbe74e9557613303af351f525e32a165	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nZzI4VkJQQTN1S0MwSktSQmUwU1R4UkFBUUFYdzhUZkdLTHdIN2d5cUZ5VT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 13:16:31.179208	2011-03-30 13:16:31.196456
7	45e863f8979149675a9d2564b296ecc8	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ndmw2WEcyVkkrSHRaRWtldzJSZlpOVVBOcXBaYnNTVVdKcldOWEV1Mk4vdz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 13:16:39.441039	2011-03-30 13:16:39.457582
21	c039fe9cbac45c94d7620b3eee488c66	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\naEs4bGFTQk9MY2lUdER0VTM5RmdlYWdNOFV5VTJ1UUtkSUlEL3BZdWJ0Yz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 23:29:27.163594	2011-03-30 23:29:27.203047
8	60398ccf8fa2a670c240d2e3f526a566	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nUHpSSDZCYUo2ZjI3WCtPMEVRTEJmTlpsbTFQNFdiOEg3ZFFaMEVjN3oyWT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 13:16:57.982584	2011-03-30 13:16:57.999503
9	c562c9c2932506886041f8e430093a8d	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\na3hlcXhqdEZWK0hueVhxbStNeXlGS2x5cS9ySFRJeDVTc3ZJak01Tk41ST06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 13:17:04.840167	2011-03-30 13:17:04.864094
10	dbe2bf17dc366b833b7b6be99b5f0d5d	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nNlJycFhVODFvaU8yZ1NzWU1uN0t1SkhIUTdBZXJrS3pib1lKajkxRWJPND06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 13:17:08.286381	2011-03-30 13:17:08.302915
11	d402422218ea517b2334885add1d995d	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nMnU0Rm9sNDEzVEdFcDl3QVk0MGV4VkxrYnB4MDlFL1RveEZwc21PMDJ6cz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 13:37:10.155368	2011-03-30 13:37:10.274924
20	52c6bb1758eb81fea5b6699f3c247054	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nRHdCSEVhdnBCTUZpMThuK2h6b0N2dE1hdkovR2ZCRyt4S0RDTm05TmtRRT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 23:29:01.000958	2011-03-30 23:31:15.328912
22	d8ea793daac743e339fc42324a32549f	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nQUZkUGppekJZY1VYZHhqaGV0L2JTdnp1bHQ5MnhBRDJVaXVVeEd1MEdzYz0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiJENvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2dvZG9jcycGOgpA\ndXNlZHsGOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-30 21:05:36.265572	2011-03-30 21:07:38.65254
23	b68dd6dae631bf78edcef618eb78a446	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 00:00:37.126991	2011-03-31 00:00:37.126991
4	05809eecff7f425e713d8856dcbd7d29	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nS0JqU2NxL1RMd1MxM3VFMFhNbGRybDRIaSs3SHA3Q0cyNVUyYWZIek5ZUT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiOUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2Rhbml6aWFfYmV6\nZXJyYUBob3RtYWlsLmNvbScGOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-30 12:28:09.345193	2011-03-30 13:53:44.441953
25	6e0a5141a1b88c3df684d36d8b0387a7	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 00:12:42.310507	2011-03-31 00:12:42.310507
26	7b11a40ce0889c286b807245515b8d35	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMWF5U05NQ1NML1l1azB2\nbDNGUjJUS0o3V1ZnckRrSXNoaVZrb240Nkw0MEE9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 00:12:42.768017	2011-03-31 00:12:42.768017
12	2fa11d88228932b29ec5a7c55a37f438	BAh7CjoOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMXQ4a015ZEJhUkkvM040aE16c0g0SjhjMnFPNjdRVStWNWNvQ0lNRVk2\nRTQ9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIixDb3VsZG4ndCBsb2cgeW91IGluIGFzICdjYXJ0b3Jp\nb21hY2VkbycGOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51\nX2hvbWU=\n	2011-03-30 13:55:37.789074	2011-03-30 13:56:26.008702
13	1225a4fe04e44400dde800a73defe968	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nRHNJdWxMcjNka0VaQWJ2QmpIcFNSUG52L0ZXVnFaanVIVlBOUHZoZS9JST06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 13:57:20.23347	2011-03-30 13:57:20.34611
14	ebcc2671a6d6f5f527e403b7545e8359	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nTENmZmpGYjdMWTRNODVkSUpPVXZLZWVHMUNKUFRtZ1hUcjh2R1h3RzlMND06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-30 14:27:20.039128	2011-03-30 14:27:20.21606
27	415db0d642ab34b82b5a2c9dbc9bff42	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXNFWGtrdzVidFJVeW5s\nTHVVS1dPK2pXQUZHRjlDMnN0UHM2NEQ4S3dkNjQ9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 00:13:21.47358	2011-03-31 00:13:21.47358
24	aea44010fedc71106c6b8f53ae2c0aaf	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMUJtWmV4MWtDdkorY0M5UUlOM3JRdVRsNkIrRlR3SE1wbXRtWE9TTlM3\ndnM9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 00:12:20.876927	2011-03-31 00:13:37.979558
28	27672c76279e18b3febde0008de9b397	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nRk9DNzFvdWxWYVpVQVJNR2tmZTM3MVdmL2M5S0ErSGsxcExwWHYwQVZtWT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 00:14:31.765781	2011-03-31 00:16:03.582929
46	9e563da948a753555045a3b71852f6a1	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nSHJ1bzUxcDA2WWlHZFQ2UGozUm01Q2lVOWZNMEJRL3dDMGl5eGFEUkhybz0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiHkNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJycGOgpAdXNlZHsG\nOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 08:00:26.061109	2011-03-31 08:03:27.309622
29	76c8b82cf9df47a25319285ee4933af0	BAh7CjoOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMVYvb24zdWNHMFN3SE5DR2JHTU10MGpWTEY2NW8rMWhlZFRHOUg4cHRQ\nd1k9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIjdDb3VsZG4ndCBsb2cgeW91IGluIGFzICdjYXJ0b3Jp\nby5zaWx2YUB1b2wuY29tLmJyJwY6CkB1c2VkewY7CUY6DHN1Ym1lbnUiF21l\nbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 00:28:45.250247	2011-03-31 00:32:35.102226
30	eebb1b65c8a81e8166ad970182741b78	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nYWoyVWhNZC9ZNmNYUXZyWmY3VTd3NGpoWm4zRGFCeW9kbERKeTZZTzNmdz0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiI0NvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NlY2FmJwY6CkB1\nc2VkewY7CUY6DHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 00:33:14.997323	2011-03-31 00:51:58.907997
31	5bb282bdd346a684e25c0b8b4348e149	BAh7CToOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMWdYTEdWeE1RUkR1aE4zd1pYOU5uankvNG10OEs0ZWJxbGpteFlSUnNq\nUlk9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 01:02:14.683352	2011-03-31 01:02:27.727211
32	ee354636db6664921fc6a6a873f3e184	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nMjUvV0JidnFOYWdqRHRwakMvYm51Z2VsTForZUlwV1FPUVJrVWNtM1VpQT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 01:02:55.815898	2011-03-31 01:02:56.028524
33	8fba128b955f195200d6684d78eb0043	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMU5sTm1nb055cGNEV0VL\ncEdyUW05N2VOSlF1Q3VZdHhSN2RpRk15cG9oVzA9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 01:08:52.473053	2011-03-31 01:08:52.473053
34	08565085cbf1b2014f5eba40ee558338	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 01:54:36.905034	2011-03-31 01:54:36.905034
35	31032e125e7b03e5c344a65e33313ade	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMWVxV1VLTzdxMEtydEw0\nNTJTMG5WYXRXd2ovMDVLQTZZWFJYaFl6QlNyMjQ9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 01:54:37.265687	2011-03-31 01:54:37.265687
36	bf7b65c727fa26f1651b8f0ab6a02454	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nQjNMeW9UdiswTU9nNm1KemZ6czFuRTJwVk9YWGFaNWJOL1E1bHNBQ0VURT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 02:20:40.560496	2011-03-31 02:20:40.858325
47	80b30710c05e1806358674e1434a9ff4	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nNTJwcjZOYnIzaTZHVEQrd3Fmc0QwZThZUWYwSks1Q2E3V3ZkVmhhYmI2QT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiHkNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJycGOgpAdXNlZHsG\nOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 08:05:31.686655	2011-03-31 08:27:08.736354
37	4bbfb1dca952d86ffae9a3e4528a3924	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMUo3eHFKSjJKUHhzYkJFcFVyOWdmT1BSZ3JSUytKV2kyc1Uydm1QZ3Ba\nL1U9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIiNDb3VsZG4ndCBsb2cgeW91IGluIGFzICdhZG1pbicG\nOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-30 23:46:55.012492	2011-03-30 23:47:48.427251
38	aa00dba460464c0312f94f3032c399bc	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMUdyc0NLOHJieGNsL0R1\namw2UEhHRjR2VkpUdXVKVkhsemNZNks3NnBXZEU9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 03:05:57.618988	2011-03-31 03:05:57.618988
48	c44c89c28b72605efc18fc33c0dd474a	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nd0dvSzJ4K1A1UFNjaGYybWFicStJM09VeUFVOXpkd0o4T1NXMW9hNjFqUT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 08:27:42.464337	2011-03-31 08:27:42.605938
40	0e99c9b94ae01ff1ca90d150ff44c3d9	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 01:46:25.206338	2011-03-31 01:46:25.206338
41	bf1c1cd607f1d10d459ad8eb0a293272	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXNnZEtTbHNPQTd4ZXJF\nN2dRcE8vUFdlc05McFczZUJQNzZQbFg3S2lNZUE9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 01:46:27.465346	2011-03-31 01:46:27.465346
49	eba15d7c0a9ff13a53484f4366ddb4b1	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nVXY5MXdNcm5YeWdMb1g4ZDNaa1VYTEkrRFVrazVhSnJkR1ljUjJWZnhFQT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 08:49:28.835094	2011-03-31 08:49:28.958544
50	fd1fe9cbc08db37ed33a5a1fc65e9672	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 08:53:31.056331	2011-03-31 08:53:31.056331
51	09b2d6d8626b8004de52628bf4fd2247	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMVZRd1YzWDNPYzlTKzlR\nSG1uQzZLOU8vNEZIdFg3MW9FaEgxUnlOYzBJWHM9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 08:53:31.417286	2011-03-31 08:53:31.417286
52	56abae61f8f6e392d72992a6b2ed8da5	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nWWNDWFBLTDVFaDU1Y0h5ZEJkc2ErOXYzOWZOODVuVWE1ZW9UUnczTjJjRT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 07:16:54.092922	2011-03-31 07:16:54.229612
39	18bf433820b8af62b059809f5ee36b61	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nV0QwU1hjTGRBUmF5YkFqcHlPWnlJNVRGRzhDdjNHQzFWYWduOTM2cEhGMD0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiHkNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJycGOgpAdXNlZHsG\nOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 04:08:58.548153	2011-03-31 04:48:16.505132
42	82d650252e66d1d34c1b8af7fcf89db4	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nV09ubHhYWjlIck5yZnNDcGE5K0NCM0FKV09pVlY2Nk5FY1Zkdk1BdHNFND06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 05:44:00.332992	2011-03-31 05:44:00.461229
43	3edbf72db13efd47221abd5220f8d5c1	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMTVucDI3YUxmSVhNTnd5\nYmdxT0E2V3poVDZadWJ1NDBzRERlMG1CUW8rV009OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 05:44:00.940324	2011-03-31 05:44:00.940324
53	d45e595cdfa24323192e3d779dd84785	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nQ0c5YitYNEc4emNhNkg3bWY4OUlhZ2RWdGRQN0VKVzMrTGZPOXpyY1FJRT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiOUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2ZhYmlvamdwZXJl\naXJhQHlhaG9vLmNvbS5icicGOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 10:04:19.020515	2011-03-31 10:05:31.235727
44	b4ff249f138c55e424b7195e71403129	BAh7CjoOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMWtaNEtFMnBUNVhYNEczelVBZmN3enh6V1locW5pa2xZK2FScHF3VjNx\nY0k9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIh5Db3VsZG4ndCBsb2cgeW91IGluIGFzICcnBjoKQHVz\nZWR7BjsJRjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21l\n	2011-03-31 07:51:16.638085	2011-03-31 07:52:30.54098
54	34c37e06569d278c010d46b860dd3e77	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\naE1SZjZ3WlliRzBMbjc1RlhsU1FlRHg4b1RjYUw5bVZZTW9Ca2N1VzB0ST0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiOUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2ZhYmlvamdwZXJl\naWVhQHlhaG9vLmNvbS5icicGOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 10:06:05.970816	2011-03-31 10:06:29.886409
61	bcb316dd9ed73048a71ecd10329b96bf	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nd3cvUHUvbWY5cjRmZVNhcnpKWjQ5cHdNbitWUXNnci9SWlBRTE5ta0dCST06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 08:12:42.393047	2011-03-31 08:13:23.278629
64	0130ac2acdf29c765e2b0d54335ddff0	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 08:23:04.698624	2011-03-31 08:23:04.698624
45	5980365bb68fcb75965b92b2687f2050	BAh7CjoOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMVVES0g2OUJlem9zSDlHQjlKcGJlZThTRHJ0N2I4cWhkOUVyWkphU1pM\neEU9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIiZDb3VsZG4ndCBsb2cgeW91IGluIGFzICdzYWx2YWRv\ncicGOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 07:53:01.686471	2011-03-31 07:59:13.027758
55	18495556e6f3f95f414d469f0391f2b4	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nVEkzUUpHckFkclpBQ2wwd1NUcW9MOTdGK3RJMnBsbDhHcmU3eTkvWXlZOD0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiOUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2ZhYmlvamdwZXJl\naXJhQHlhaG9vLmNvbS5icicGOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 10:06:57.012088	2011-03-31 10:07:22.880893
111	2ee0038e1f2174e45f7ea5ea7c393626	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nZkxhK3FLSUI4cXgzNlBVdkEvT1BnVTZDSnpIVldIVzREdk4zTGlGaXA2UT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 15:25:04.271228	2011-03-31 15:25:04.651935
56	497bdff56e1fe798fd1f108804c699e3	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nYXloMU1lMHl6TTBwZnAzbHhCam13aThQb2VTQWJSQy93ZkR4dU9XSnZUWT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 10:16:06.595528	2011-03-31 10:16:06.923843
129	3547b9e1d72c72ebe5acc518db8cac4f	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMWF1STA0MUV6dEIvckNS\nWGtvczZMUUFMWVd4T3FVbEd5T3FMTm1NRm9aMUU9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 23:45:17.775518	2011-03-31 23:45:17.775518
69	bf2a8ae38534139f712ddad6c9e45750	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nVWNEN2M4OFQrVkJMeHpXVGRGZnZXMmJvSndrT1ZPSGN1NzNOMXVBcDBtTT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiQENvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NhcnRvcmlvNG9m\naWNpb2p1YXplaXJvQGJvbC5jb20uYnInBjoKQHVzZWR7BjsJRjoMc3VibWVu\ndSIXbWVudXMvc3VibWVudV9ob21l\n	2011-03-31 11:45:59.612971	2011-03-31 11:46:41.439554
112	06511d686c7d2b2819baebe10f6980be	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nMXpseUpJU1U2NWF6R2ZzMEVkZnpvSloySXoyQUpBKzFrSU12OTZRbm1oVT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 15:26:09.992657	2011-03-31 15:26:13.137631
57	61d8791ab9a2df5c3898b0b39d89196c	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nQ2hVbW5MOHpPcnlEbTBXTzJ3eHg4Ry9FT1FjRks3cE5tNzlsbUdYbmhZQT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 10:25:56.008399	2011-03-31 10:26:33.652918
70	d7a0e17f42e8eb989ffc9ebb02d39709	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nTmdJSENBK2lxbmNNaE5LY0EyRW9VR1Z2bUZEN2pGbXNwMGUzWndzdzBhUT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 12:44:19.072835	2011-03-31 12:44:22.220142
72	039488f87830da1fdf7cab7e8e5d6488	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 12:59:41.229304	2011-03-31 12:59:41.229304
73	0fb3f56fb91941bf13bd6203b1f76c29	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMWo3N3pSc01IRkxUTGdt\nT0tJWld3MDZMbmhSb2poTkduOTBLMUdROHJwRmM9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 12:59:41.698641	2011-03-31 12:59:41.698641
58	2bd09500909bddc94c409f71164b8abd	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nMjBNcHJDNVRIaG9MZk5PQWhsS2pQc1NJRU1aUlBYVFp5dEEzdHdvcnAvcz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 10:43:06.057436	2011-03-31 10:43:57.894336
130	808cd59428a0661dc9f4225273393dde	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 02:57:51.917604	2011-04-01 02:57:51.917604
113	c704f8648ee87072d6503b8b850228c9	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nNWlqRndkR3hPaTdTK09kRk5PV3hTanFIZkxwbHFrbjg3TjY3UmZNK1N6az06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 15:27:48.017318	2011-03-31 15:27:59.483063
114	2a89b3f152079c3cb5650c589ce4051e	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMUdGQ1VNUzJ0TG1HelQxQXg1QStyd0hRcVloMDZXQllScmFBNFY0V3hp\nS2s9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 15:55:58.784665	2011-03-31 15:56:37.40752
75	2b040abe154b6657813012cb7268a6bc	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\ndE93cUcxcS9wU2dxdEJray9vb3BiZDI5TGVYZjNVd3hoY2wzMzZNNXRDVT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiPUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NhcnRvcmlvbW96\nYXJ0c2FsZXNAaG90bWFpbC5jb20nBjoKQHVzZWR7BjsJRjoMc3VibWVudSIX\nbWVudXMvc3VibWVudV9ob21l\n	2011-03-31 13:27:47.596335	2011-03-31 13:28:42.844203
117	b8f62783b465cb8e6f7361a5ea376bc4	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 16:39:11.04131	2011-03-31 16:39:11.04131
118	26c49ad35b597aac6342896097508f6f	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 16:39:11.057431	2011-03-31 16:39:11.057431
60	d2a63b5fad74a405ab4fa5d92fb8548b	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMXlRS3JZTW5vckkzSWk0YnVHc0VRdXdyOElwRTFweXJ4WTg0dENFS2RN\nQlk9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 10:44:53.908541	2011-03-31 10:45:37.51976
78	2bb80568da5fce98b726b53fbfe8acd2	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nK29TSHdKOXUwenVMU3BGdmdaRk1SNktSWHRFUEptVzJTUEF5aDFMclhtaz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 13:32:34.534443	2011-03-31 13:32:34.712595
126	c24e326ca9361e897dc2801fc629d526	BAh7CToOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMWp5UkozUmFBOXRnSjlIdFdBVUMyOXR5ZFdCeTF2VWRYSmo5b0JlS1dY\nSVU9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 17:46:49.791444	2011-03-31 17:50:38.877728
76	bf165b4027b802a8005835191c6123d0	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nTm1CVy9ORURBK3JkNkYydzJTVWJhT1NzSkRhc1AxMFpxZEtxcTJZNHJwRT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiPUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NhcnRvcmlvbW96\nYXJ0c2FsZXNAaG90bWFpbC5jb20nBjoKQHVzZWR7BjsJRjoMc3VibWVudSIX\nbWVudXMvc3VibWVudV9ob21l\n	2011-03-31 13:30:15.179211	2011-03-31 13:40:00.312528
81	0020368109eec62630a1bcab575aafb1	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nLzdxMm9xQnQ0R0gvcVBGZ3ozWENMcU5jYnNIaVY3aVlPN2ZJcjZMcWJFRT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 13:54:54.477756	2011-03-31 13:54:54.594987
82	ac96b99d123ac6230c22d81f11f74d6c	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMVdyTmx3Vm00Y0RQWkp2T0JyUE5mYXhORE1QN0tySm1OVng3Um51K3hZ\nOXM9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIh5Db3VsZG4ndCBsb2cgeW91IGluIGFzICcnBjoKQHVz\nZWR7BjsJRjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21l\n	2011-03-31 14:03:41.24993	2011-03-31 14:07:04.837465
59	a3f7af6ed63c9a167a0771a7f6b91709	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nWUo3aTk3cjBISUpSamg1S2ZKZnpvYUdWSjF0Q1FlWGF0UkhldjRWaXdqYz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 10:44:37.638022	2011-03-31 15:20:46.381513
88	fc47489973d3ae27d541f020aafbfdce	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nYzB1WDhWQ25jZmJCQzNJbXlCbU45VG94OWFMcTV2ZDVZOXY1anJSOHRoOD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 13:13:40.721861	2011-03-31 13:13:40.939883
89	ac4bf34559a20ab8d60ed8fd18063952	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nNTJFYlI1Rkw4SFdwVWtsd0RNYmk5R2tuY2V1NXBkWW4rWEQ0bGVjQ29qbz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 13:15:13.698422	2011-03-31 13:15:13.854654
90	9d564f677d44928e2b8a265957e3c9be	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nNXNvWjdrYnE1RWZGdkxiTExVeTlhTEVhYk1ybExYUmZYSTdSMzFrWUJzUT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 13:21:47.722244	2011-03-31 13:21:50.902708
91	fae163939ccd40f1a28eb647bdce64c3	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ndUhyZmduTm0zRmtXY2FaeTBzTmZnRDZnN0prNldCV0tUc2JsaytRcm9NMD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 13:22:32.219174	2011-03-31 13:22:32.403011
92	1698647ff4528dbf0b906b300b1ac8dc	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nWFp1bGhlMGMyU3hJYkRoZ21JSHR2eUxub3ZvNzJ2VStEZTd0R29UTXpOMD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 13:24:18.798832	2011-03-31 13:24:18.999372
93	3b85767d7356d09b71a2be72e07f4b61	BAh7CjoOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMVc2TG50MVhIMWNFUzY3ZVZvRW51cXpycE55dlRVdUYrQzJFYTZMemcx\nOTQ9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIjVDb3VsZG4ndCBsb2cgeW91IGluIGFzICdjYXJ0b3Jp\nb3BpbmhvQHlhaG9vLmNvbScGOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 14:03:10.31962	2011-03-31 14:04:38.505962
131	a3ec55f9e395fdd4171783f8c50fa862	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMUpqMUMvbFNCY2pFZ0t6\ncmNtR1R3eEE1QXpGVzN1WXNDZjc2MnpzZXFEeVE9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 02:57:52.213909	2011-04-01 02:57:52.213909
134	2ec15b8ba90782867b56bde3b142f888	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 06:22:57.123084	2011-04-01 06:22:57.123084
63	d6171c77ffc02b3ef45286831d699512	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nWCtyc1RRdmRWN1RFK2pyOHpSUitFaFZzbzNrc3kzcG4yLzZKNzZKSkd5TT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 11:03:24.346392	2011-03-31 11:03:52.133259
66	da34ba9c31454125de226b09a7115442	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\neFVZa21qUEYxak13S1Jmd2FBVk4yK1dPNjBRbE51NkpWQzhvNGQvUU5QMD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 11:12:34.349051	2011-03-31 11:12:34.384545
95	30ab5c4ca32d4bce177c78a9c6f48891	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nc0Z4dmhwN3NXek4rczlTUWFRTDRRb3dCb3ZkcmduNkJjdm9KUlFtYUtqYz0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiPUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NhcnRvcmlvMm9m\naWNpb19jZUB5YWhvby5jb20uYnInBjoKQHVzZWR7BjsJRjoMc3VibWVudSIX\nbWVudXMvc3VibWVudV9ob21l\n	2011-03-31 17:07:49.430409	2011-03-31 17:09:02.670711
67	b78a87de622a3ec1497506532a025731	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nRjc1NGJLMFYxekJxdWxoc0d0MmMwSXN5VUUyRlpaSlM3T1dkRHIwNDVIMD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 11:34:41.013426	2011-03-31 11:35:10.787936
71	104c7033458272a762eb5153832d30e5	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nTHFCc045UDQyeXRUTENxVXZ1THFXeEpYK09HcFBnbmUxbW55ZFZsdVVHQT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 10:08:49.340672	2011-03-31 10:20:48.259682
74	48d1e16c320555a2ccd3590516c447d3	BAh7CToOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMUd0YWNZUzBkUXdJUEszS2RZd1hPb0FXUUhmWUt3SmxHQ21vdkJFYzBr\nZm89OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 10:30:26.521353	2011-03-31 10:30:41.409349
99	9c755a99096c678ab2ba548e0bc54e60	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nVUtJak91eEhRdy8zanpraE1iZWFqeUM4U056YjA2Rk9iYlFpVHA0STN5bz0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiLkNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NhcnRvcmlvMW1h\ndXJpdGknBjoKQHVzZWR7BjsJRjoMc3VibWVudSIXbWVudXMvc3VibWVudV9o\nb21l\n	2011-03-31 17:20:41.99712	2011-03-31 17:23:01.167395
62	2384dd9a2d4e18a5c39909fc3da4b3c3	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nb2J1S1IrZC92ZU5iN3hIVU9VNE9tVytPRkpzakYzaHVnOTFHU2R4dHgzaz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 11:00:07.629844	2011-03-31 13:20:20.294487
77	7f6cbfec6aa94296ceb2040a86dcbb2d	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ncGdOTEVZZURsaTJhS0J3RjJ0Yk1jR21mVEpoaGh5Z2wzTERacGNHYWtYYz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 10:50:46.764915	2011-03-31 10:50:49.918614
79	77bf105563059e5bcf7fefc720a15d79	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 11:03:41.180381	2011-03-31 11:03:41.180381
80	eae7c6d669c49c046ce421dcdf1383b4	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMWR1aTdlLzVQQlQ3M1U4\ncnc5dlZuWmRlL2xSd2NCSWU1TGxDV2ZGbFRlRm89OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 11:03:41.591547	2011-03-31 11:03:41.591547
101	bde2a7330b11a2da1ad3def141153784	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nYzJuSURKMFQySURzTXc0RVhpU0VmQkJRQ2g4R0VSWTZJU1ZHTEorckFJZz0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiLkNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NhcnRvcmlvMW1h\ndXJpdGknBjoKQHVzZWR7BjsJRjoMc3VibWVudSIXbWVudXMvc3VibWVudV9o\nb21l\n	2011-03-31 17:23:19.532929	2011-03-31 17:24:12.10634
102	40e77a938dfb36412e4791f912dc2917	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nUWErYTU2dkZkUlcyMmNPbzFJajczUk8yaXdoVkhtWTZvK29vbk80SXNwND0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiKENvdWxkbid0IGxvZyB5b3UgaW4gYXMgJzA3MDg5ODMzMDYn\nBjoKQHVzZWR7BjsJRjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21l\n	2011-03-31 17:24:26.055141	2011-03-31 17:25:26.485275
104	5aa0a5de8752dff1402e0dfe9a16e793	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nUXpIaUVvQTRrMkM4VUFSZkVjTDNabU50ME9hUWhjQks4MkhYMWVmdm44QT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 17:26:47.352865	2011-03-31 17:26:47.44288
103	f08cda36637f2a54994f9e98a8090745	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMXhyVVpPZmN6NXJ4dll4QWg4WXVJNEJqTERURUlna1dnSzI1TUY0dWFM\nYmc9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 17:26:02.933757	2011-03-31 17:26:55.399463
105	b6289600ad1a08d6ca837247fc58b969	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nVzZrL3VtYjFvbmZPdkJ3OCtGQ2xYZmZrYzhCU2F3dUV6R0FoekxId295bz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 17:27:05.703771	2011-03-31 17:27:18.250861
106	7c0d7a0cb3c1d0093b8c65f740457444	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ndWlLUy9hWVFKbllqY2kzNEU4eUtPMm5EVURNeXlFYStONGZiTWdVTXF6cz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 17:29:37.826152	2011-03-31 17:29:38.286277
107	c3683815012ac66bd83453145820c8ed	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nU2dYQTNYdXBjMWRsczkvLy9JcndEVkNzVXEvU0o5VmNmcTMydUFTMC9HOD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 17:30:49.965861	2011-03-31 17:30:52.632316
108	926576f8d24e1f824ef6f6c2b6579f32	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nQjM0SmNVd3o3MzBQRUltTUVLRGFwUWJSRkZTQU9CN0NFQ2orREVYTWN3dz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 17:33:01.63072	2011-03-31 17:33:04.959022
109	76df3c056f9bac3fb20c688910fc59db	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nTitXWVFRUmVSWFNTNnVtd1RCWnhycjVXbWpaeDRaY3BSb0NJeHRkMUFVOD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 17:35:15.970425	2011-03-31 17:41:31.6412
110	2877cd9b61fb4014894b2ccbbd06a3aa	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nTHlXSndTZ2JrbDFuNHhHa2h6WCs5VkRKMFpOUHJ0Nlp6YTVUNW9Ya1Bycz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 17:43:11.121444	2011-03-31 17:43:11.269511
98	b3cc5f994216e412d051ed1d840fda4e	BAh7CToOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMWNLa2xWNkQ3NzRvL1BMNEdSY2dQOUN4c0Y0dXEyblIxQmo3N1lHWGgv\nZEU9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 17:13:12.210912	2011-03-31 17:48:35.735761
97	6d40cdf02e0faf55397f211961b7c68d	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nZEg4QUplZFR0OG5DNm8zY1k5dERsckJJZ05Na1hDNEl5WGxPSFBFQ0UrQT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 17:13:09.265337	2011-03-31 18:51:19.050658
115	8924a8bce34e7e16457196cfd4c92cc3	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 19:20:44.290149	2011-03-31 19:20:44.290149
116	496e2c2e9ebcc97b928ccd6b3a80e3b9	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 19:20:44.300386	2011-03-31 19:20:44.300386
119	b9af16deefc038505f71b7cefb2f2bc5	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 19:26:12.137985	2011-03-31 19:26:12.137985
120	b4ae8a1f3e418befbdc2334261c5d163	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 19:27:01.555114	2011-03-31 19:27:01.555114
121	4c628b9ebb629c08f26e07a38b3075ed	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nMElSY2JVeTA4WkErbVQxZjRnWkdJajNoQkhSdFlGYnlTVm81TzEwTFo5az06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 19:30:31.509842	2011-03-31 19:32:04.28922
122	bad3675d91bf78631feaa0819a972580	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 19:45:39.781946	2011-03-31 19:45:39.781946
123	ba85651d28835e1be40974e3f1d768f4	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMWpUL0dBUXNYZ010ZXQz\na3RLSUlHdVNJekkvcWNaYlUyMm9lNnFFQmx6RUE9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 19:45:40.283859	2011-03-31 19:45:40.283859
124	364f4ec04372b5cf677cd045abd3cc9f	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 20:05:18.762243	2011-03-31 20:05:18.762243
125	ce11e97201d05c0ac652e64572ad4b38	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMWc3c3h6b0RKRi9jTWd5\nUjE0SFpFR2lFNlM4ZmIrK2dydVZQbTJTNTBlOEk9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 20:05:19.115899	2011-03-31 20:05:19.115899
65	71d1af0f1b6f7f7e48e3748f76e4dc7e	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXBFeDFSOUtlRjNUaEps\nLytYSytPNW43YThTWVFaZ2RLaElzdytuZEQ4UmM9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 08:23:04.749042	2011-03-31 08:23:04.749042
83	de8233cb0a2ee19ee5cc0c1c3b1124e8	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-03-31 14:08:54.477	2011-03-31 14:08:54.477
68	11981419620fa3c0d5612fee81336c7c	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\neUJKUGFJQkVJdkhYaVNyM3VOajZlNHcxNnpJK1E1TldiSU95ME5WZmpLRT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 08:53:33.773526	2011-03-31 08:53:34.127028
84	9c6964e2e222b149977d0518bc52a1ce	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXR5WnY0TmV3a0pJcXQy\nQXJOR2hvK0VSaVFrTThnaEs4Sy9SN3dUTVpRWGc9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-03-31 14:08:56.193184	2011-03-31 14:08:56.193184
94	b58f2e4c8e523ffa2afd25d91ed30673	BAh7CjoOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMUpiazZrdTNTVWxLZXZmS3F0TFF2aHVDV1NxazY5S1BFd2NlUGdtQVh2\nRHc9IgpmbGFzaElDOidBY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hI\nYXNoewY6CmVycm9yIitDb3VsZG4ndCBsb2cgeW91IGluIGFzICdpcmV2ZXZl\naWN1bG9zJwY6CkB1c2VkewY7CUY6DHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVf\naG9tZQ==\n	2011-03-31 16:58:12.733384	2011-03-31 16:59:14.240976
85	a71085880b7af28a43d2f139d8a64a3f	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nbWlRNVU4amQ3WktEbUUwOVp1WmprNk9UQTdxVUp3NkhCanRVZS9La21Wbz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 14:24:30.509227	2011-03-31 14:24:30.542366
132	7a31d064586a0a1930922a6664a28838	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 02:19:31.332828	2011-04-01 02:19:31.332828
86	1c63b9ac377bc24980d0e98c06cb6abd	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ncFpKV2tVWjZPdzBCU1JrRzVhdTByalJwenFvdEpRUGpHaXg0c0I5S3o5OD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 15:22:07.625506	2011-03-31 15:22:07.803296
96	d89ccbf197c96061111b9ebfcda5aaf5	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nSkllM25yR2JxQVpJZTU0cmp3YnQyZ3JDbkl4dnYvNDZZdk9rSndyVG5maz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 14:27:30.554473	2011-03-31 14:27:30.970893
87	cf82cc23fe7665fd327c0edd634c8bca	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nOHpmaXdONW1oRlFLVlBzRWZ1YXNNVGZ4YnU5aXZkKzk4UGNjaTM3NU1Vcz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 15:40:17.607391	2011-03-31 15:40:17.772694
133	1f92702edca563d22dca849f540cc3eb	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMU9MYjNtWXhzR1A4RWpK\nc0pWeW1vUGd3UThVWjNmTlRlZ3BCYXBnajROR1U9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 02:19:36.294428	2011-04-01 02:19:36.294428
135	f40362e6fb88cd6aa5e83e061fd02c7c	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXA4dlFxMWJvaTYwNkd4\nZHJSUkljenNySFRvWlRQZmt0NzBwcUJwbGF4cHM9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 06:22:57.460729	2011-04-01 06:22:57.460729
100	ad75f642b83ede82a1afa374cc437beb	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nY1hITmdXMGFWejFDaUI1UzhNNEVubGp5ZVdkVGZPRk9GNXY4WDVmbmdHMD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-03-31 14:41:05.343176	2011-03-31 14:41:27.454488
173	fb80c6f7ca5090455b0737bee51bf55c	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nbG1rYW5jc0xsTzVHdGFJMTZ1WHgzWDY4OUMreVlaei9TUnAycXR0RlNVOD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 11:30:02.872059	2011-04-01 11:30:03.205076
136	0fbdce2d1e6cc1ad7604c1ae255e98c4	BAh7CToOcmV0dXJuX3RvIhEvZG9jdW1lbnRvcy86CW1lbnUiCWhvbWU6EF9j\nc3JmX3Rva2VuIjFvYldIOEVxMGJKeENyUlVHRGpDZG1IUE55QzRuNXZPb2Fv\nMTNZTCtYSm1zPToMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21l\n	2011-04-01 06:42:11.093294	2011-04-01 06:44:26.098837
137	eb0eed426f5abc10fae16c3eadee61b4	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 10:09:46.818875	2011-04-01 10:09:46.818875
138	4968bd4a8c6299065517c183c04c6318	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXpCT1dPeE8zWG9KcDV1\nbXlnTStmN2o2VUZjSWRNV01IeUw4WGkzY0NiYWs9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 10:09:47.189073	2011-04-01 10:09:47.189073
127	5c8221c42bfc66293114778e1f9149a0	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMWc5TklyK3A0b0NjUlNoTnBCTytQWVozK01INTVoL3BTam9qbVhoeWxH\nTkE9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-03-31 18:56:24.85924	2011-03-31 18:56:36.721807
139	4120d5baf8c6aed6dd0d7ce8b4c51ad3	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nUlhFUExBMGZYSGZUOHR5c0puQ0h3RlVub3IvNU1TRDR6ZDIxVmlHUjdMaz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:13:56.414808	2011-04-01 10:13:56.484195
140	a80ece3884b355a26f943884a2ccb61f	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ncnZKandDdnlGeVpCVUdKY01rZzBGSDBzZDZGK1NnTUNQNGRHemhDbk1Kcz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 07:38:47.911268	2011-04-01 07:38:48.07744
141	41e87bfd7c2ca39c0808ded5790d5ea6	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\na0h3NGpCNlRlTHFWQ1htK240REZ5cHdQVngyT1I5ZUlpbDNya2dEWjlQST06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:29:50.315434	2011-04-01 10:31:04.492673
142	2d89f7f49df10480d29c912fcecc0dbd	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nLzBYR29RWDMrV090ZTFSWDgwLy9JMmlDK0JsREFFa29XZWVITjI3RUh1TT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:34:46.688236	2011-04-01 10:34:47.041055
143	df39df9dd1fce1e8ec3b74fff1ad1e3e	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 07:57:01.310068	2011-04-01 07:57:01.310068
144	ba11cd42ce815ac03671155547b6c64e	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMUNKSW43M293WDUySm5l\nd2xTR1J3aEVSRnZ4ZmZUVUc1UG5DTUFVY0xvcGs9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 07:57:01.692322	2011-04-01 07:57:01.692322
145	7e56acdcc9e45a716656a9243b5c1902	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nT0FpSFhvVlIzdHdPQ0pkaTk4WnBUbm9mOTlIT0VpRUpOT0orcWVoK0JnQT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiHkNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJycGOgpAdXNlZHsG\nOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-04-01 10:40:43.245279	2011-04-01 10:40:50.002443
146	3c3f38f3ae0758e2f83fc06748804c54	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nN2x1QXNDTkxaRFJxODZad2I1Sm9BSng4dC9aOW9MRTFlU2FXdzVDRUJkTT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 07:59:29.041332	2011-04-01 07:59:29.433763
147	dab3b9b073e522de4ccf804c444bf513	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nWjZ1OW1lNS9ibzNBV1daZTVJOEJkcUZ3a3Z2VElvalovRm5kTzhKc253WT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:41:00.821804	2011-04-01 10:41:13.90955
148	7c06f8d7ad4caa2cc21f24f53c56f9c4	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ncStrSkdxRUNUcEUxN0ZxN09vUktUK2YzcC90TmJzMnpFSTdPVEM3NzRhTT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 08:00:23.335309	2011-04-01 08:00:23.510319
149	9ad13253cc375e44ea3c06a64ae48bd8	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nem0rMGwxejcxMENJenFOUjZ2V3BIMHUwcDhuaEtDMHlXdGl6TnFVdFZVOD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:45:37.203071	2011-04-01 10:45:37.266791
150	12879b17256078340cd0ce8001df586a	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nNCtyeDNWZm1vc1l2bWZQb05leXJ0QWVyWnpyOHBnWjR0Z0g5MXJEQUZXVT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:45:37.296155	2011-04-01 10:45:37.435659
151	0eca8902c076f5047cc4a88de6396f51	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nK0VBbTN3bXRwdmdoYThrN1hTVWNkMEFXUjFIT29VZ1RtWXFPdjlVVG50Yz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 08:04:27.497326	2011-04-01 08:08:11.594328
152	6ae623c6525f40e17370506d96894999	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nM0hGSlNpdzFaQ3RkejZEZUpjaTgvVTV4cHNWaXNqNEE2QkVueThKNlZQcz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:49:44.389507	2011-04-01 10:49:44.429431
153	db825e2fe1144d5f9bd56e84b01773a5	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nY00ycVZ6NFovV2gxeXBDVmJqRDQwZWJNMGVidmVOYklVZENEeXgvakFMaz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:49:58.631737	2011-04-01 10:49:58.69445
155	1a790a292df2d92d18203ecfd7796355	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nV0ZuM2g0MkRZYVBJc2wzY0o5UmoydDI1SHRaRXBkZ09PSWhJMlZ5OEJobz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 08:08:33.5791	2011-04-01 08:08:42.389194
174	cefc4b30e23f435ccd521f01bcca4d11	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nUXFzL0lHVWtNTzhWWEpKTkxSVVErRHpMakdPTkVVWjZaV2l1MWNzb09VZz0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiJ0NvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2lsZGVmb25zbycG\nOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-04-01 11:30:19.502879	2011-04-01 11:30:41.073065
175	4859e7b05fb2edad5daf08063f0e8ccd	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nTUE1MURFYklqcWowTnMyeGorS082Vi9RV2xtQUFLNGZ6c1M0Sm85MUFHbz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 11:45:17.749709	2011-04-01 11:45:18.515228
180	f0677de126b67655d9091672e514502b	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMVFnR2tVV0NCQ3dwYkhJSkJReEh5SFZ3ZkVXRVRlK1RFYktJNVYxaS9r\namc9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-04-01 13:58:26.101816	2011-04-01 13:58:36.685835
181	df77d258b5081910b36b5fc05024b14c	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 14:04:40.995366	2011-04-01 14:04:40.995366
182	8497deb54a8fa172f24d29753bb830c0	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMVAzbm1MMFp5YUlwQTFN\nVmRMWnV6M0lTQTRqZFFkYTE1eWVCaGFzL1QzVUk9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 14:04:41.06879	2011-04-01 14:04:41.06879
188	481221d7aca890be3a32aef9019e2a0a	BAh7CToOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMWs3KytTSVFnUi9MM2tGdUQrZ1F2azdyMyt2dTV0V2kxTFRPNWRFdjlP\nR0E9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-04-01 16:46:09.260412	2011-04-01 16:46:32.065835
154	f1dc596024713b01c7c3ff349d208cab	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nb2pKSWQ3ZjVyd3ZDV2xDTHNOYUYvYVNwTXh3NVZ0bXRESnhURUE1cW5ITT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:49:58.710036	2011-04-01 10:50:53.466431
197	71ac9b6c8ac02cb4f2a2505f5f35d046	BAh7CjoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMWFnVFZPTGdyQ1dITm9r\nN0JtejdySUtyOFgzd3g2Zm56MEpEUHFuQ2pPMVE9Og91c3VhcmlvX2lkaRAi\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7BjsJ\nRjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21l\n	2011-04-09 00:08:49.945123	2011-04-09 00:09:22.100058
157	05596a60c880a8831273a6372fee6a9a	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nM2N1TmlxUkw3czVQRzNMQzBXaHJwWXZPRDhhMkRqc1hYaVhEN3lZOFUvaz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:56:49.714417	2011-04-01 10:56:49.75116
156	3ef6c645f6415243a551678df6e82bac	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nTGRBY04wRVN1a0ZMNHM2Rkt4Uzh5WTJDMkd0ZllUYVhXSS9RbHZBRVpLYz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 10:56:49.652174	2011-04-01 10:57:26.459784
158	f9aac164d4be1c976d73e7c432889387	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nZ3ZGT3JWTXVvTHpkc0o0Qkxhc2NBSEF4RnBMMDdPalJWTTZsemFxL0c3ND06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 11:01:57.741116	2011-04-01 11:01:57.868659
171	3348ea1432c66f0cda42b0e5f12c1072	BAh7CToOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMWRGem1oUjNTM0RrOEJtcVBTeWZOcUJlaHdHUzdWbkY0ZDl6Rm0yZlBo\nYUU9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-04-01 11:02:08.42323	2011-04-01 11:04:37.15588
198	b0ec07e9f77a6671ffdd6381f1b5d694	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nbnV4U3BLalZxUTZSS2ZUMGxBTEs1RkhkUHM4R2dJSC9FOWZTVVdidVFzZz0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoLbm90aWNlIh5Zb3UgaGF2ZSBiZWVuIGxvZ2dlZCBvdXQuBjoKQHVzZWR7\nBjsJRjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21l\n	2011-04-09 00:09:34.732555	2011-04-09 00:09:34.789395
199	a6491358bd05c4540ab313a8a9d977b3	BAh7CjoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMUdlbEh6bmxsTDBzTkJJ\nOGxUQi9vckdSZUphZ01xMEV0VjE0NUx3YytyQTg9Og91c3VhcmlvX2lkaRAi\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7BjsJ\nRjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21l\n	2011-04-09 10:57:19.063359	2011-04-09 11:01:24.351634
160	5dac79a9df54c9adceaf7e9d60afe788	BAh7CToJbWVudSIJaG9tZToOcmV0dXJuX3RvIgovaG9tZToQX2NzcmZfdG9r\nZW4iMW1QR3RtOTUyT1I0N05wMk8rZ25abkY2b1oyRUluOEJpNDFpaktGNnNx\nbEU9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-04-01 08:21:45.571626	2011-04-01 08:28:03.827275
161	f3fb91e31e7f7a0200dcfcdaffde924a	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nRVpWUU5NRkRyTGtOOXlCMW1LZFk0S1BhSFVSeVdtOFBCMVkxQ1VxYnN2QT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 08:28:12.028868	2011-04-01 08:28:12.065272
163	6d2fbec00b3f1cc2e0660df1f27b3419	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nRWdyM1lmNUhhV3VaSGNjbGZtV3BvSDlieVc1cUdmN0NqVy9jTGFYRXpEST06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 08:45:49.821227	2011-04-01 08:45:49.872656
164	5a3a214b6a067f89947d35999f3c83e7	BAh7CToOcmV0dXJuX3RvIgovaG9tZToJbWVudSIJaG9tZToQX2NzcmZfdG9r\nZW4iMU83NW9MSVBUbm1mc01yV2M2Q2NDbzk3djZIWlhZb3U3Q2xTVjBuTC9j\naWs9OgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-04-01 09:04:13.882911	2011-04-01 09:06:00.648881
168	4cf9430e5daeac3c90970328362daffb	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 10:18:27.856265	2011-04-01 10:18:27.856265
169	8bc6c6ef9a6176fb59908d865ae709bd	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXNCdHJiN2tiMHhPZ1dj\nbGF6UURpTmoxM0tpNytBMTI4dXM0U1NvL0M0NVE9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 10:18:27.922344	2011-04-01 10:18:27.922344
167	b2625f8bb6ccb3f2208db43c262c643d	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nNHBSM3VGQm9kby9ublFxcTR0aS95bjRMdEdBc1BXV1FjOGVjSDBQNVd6UT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiOUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NhcnRvcmlvdmll\naXJhQHlhaG9vLmNvbS5icicGOgpAdXNlZHsGOwlGOgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 10:14:49.904344	2011-04-01 10:23:39.774694
159	dfc0586e18feb8ede3b6cc5dd6a43825	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\na2VBQUNyQkhaK01OUzgwcFlRaVZYdFQzWlZETGhiRHNOR1d4K1RtUW1Bdz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 11:01:58.033912	2011-04-01 11:09:27.816034
172	38b7df958fedbacb2d98a42df30bd9bb	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ndDVSdnBSQnFleXRka08zTFNtRndHYk5DMEFOQzBYNmU5TVhJeU9td1p4MD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 13:49:18.597718	2011-04-01 13:49:18.709459
162	44d3b112dfd1b1ff5974c6364c312b6b	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nS3pZY2E2KzJCaDB1b2g1ampuNTdGdWxrTnBYSmwya09GbG1PYnRqMXUrMD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 11:24:24.587758	2011-04-01 11:24:24.907788
165	ece73a8080c19b0966eb4ef560c81cdf	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\ncnhKaG9YeVlPV2I0ZnhKNlpKTXpCUnpkMDhsWXd1a25GcVBSQTgyeHZlND06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 11:49:38.52052	2011-04-01 11:49:38.737027
176	3336611e4a80305f73d87a21920af685	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nSG9WdFFrWWdkT2Q4UFlwSDFLWnd4UFRqRm5CRDhDL3VkNEp5TmRraHY5az06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 14:39:18.662059	2011-04-01 14:39:19.195201
177	345f76ddcb6b99eea5653c64a841664d	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 14:58:14.501115	2011-04-01 14:58:14.501115
178	2fd9ef0d5020e9ef06f0a72a6d1ef877	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXg0K1lraENEMjJrN2s1\nQUxiTXFwSTV4Q0NFVU95cXJzTXZ2cFBobytBK1U9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 14:58:15.845214	2011-04-01 14:58:15.845214
179	ac10373e50ad1a805ccefd8724c65992	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nTXJoQmpIcStRMTN1RkdqTnpFT2k5a0Z6Sldka1RXdnZybUpjNnVJWXRHaz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 16:17:27.119315	2011-04-01 16:17:27.259723
166	287e08061be73d65f60219a75995ceb3	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nNWpoVGdOYk43aUpmVG8ya05MSTJ5UDFrZXJTcVdYNWZHbHk4elJwVnRCOD06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 12:10:34.688564	2011-04-01 12:10:49.349911
183	4ef4e1aafe8151df0c5744d8357a8eab	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 17:15:43.570575	2011-04-01 17:15:43.570575
184	617855cc7325869b4f0721d752da0082	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMXl6dG15RmRQSm9iUXpJ\nQnB3ZlBNNTdKQ3o3WWZPeGMrd3YwdkR5d01UdWM9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 17:15:44.013698	2011-04-01 17:15:44.013698
170	e11b13d8c9e11dd21ffe340362edef39	BAh7CjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIgYvOhBfY3NyZl90b2tlbiIx\nOXN3b1BvQVZkTGpEYkdYWU1JZ2t2VXF5My9nN1RJWWFtR1pCMW5tdDhuRT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiHkNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJycGOgpAdXNlZHsG\nOwlGOgxzdWJtZW51IhdtZW51cy9zdWJtZW51X2hvbWU=\n	2011-04-01 13:24:57.020671	2011-04-01 13:25:49.636294
185	5dff18705ddb20ba52e8326362facd46	BAh7CjoOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nY0VCVVp6TDBaU3NnTXgrclpkQTcrVVpYY3ZtS01tR09xN3VUc004S2hyWT0i\nCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7\nBjoKZXJyb3IiPUNvdWxkbid0IGxvZyB5b3UgaW4gYXMgJ2NhcnRvcmlvMm9m\naWNpb19jZUB5YWhvby5jb20uYnInBjoKQHVzZWR7BjsJRjoMc3VibWVudSIX\nbWVudXMvc3VibWVudV9ob21l\n	2011-04-01 18:01:02.244438	2011-04-01 18:20:06.345178
186	79a7df536e4e920fabee8bd488e9116b	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nbzZocjl5d0l1Mm81VVRDV2IzUkZ0OHpHdzFjNHRGWWEwbGNmWmZVWThyZz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 18:38:08.58978	2011-04-01 18:38:08.810592
187	429f5f569c3400db3b3d561c25047f53	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nenVlQTRMVXA1WlU2ZVdRSFNvVkU5WVZXd0phTWUzdnlhdWp4c2lENEFqaz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 18:42:24.59867	2011-04-01 18:42:24.706427
189	b028be81f58bd514a9c77ed142a62be3	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nVDF3Sy84dnE2YWFKaXRCMmg4MGdMNEgxcTF4ZmN5ZkkyYlhCeGFhR0NQTT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-01 20:01:20.440288	2011-04-01 20:02:19.482412
190	1c7d56602bce25a266e5ae97ad6fea78	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-01 21:01:20.434306	2011-04-01 21:01:20.434306
191	baaf4ef05b6ed6da282c6ae61a303c6a	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMU5hZ093ZWkxYzVnUzJ5\nMkQwMUFZU3hNbUtFSWpFM3RkUEJvL0JtQWVCZE09OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-01 21:01:20.798808	2011-04-01 21:01:20.798808
192	b09a762c075c742fa77de61e9c776b0b	BAh7BjoOcmV0dXJuX3RvIgYv\n	2011-04-02 00:03:25.859959	2011-04-02 00:03:25.859959
193	6a58d8becd8e7a55f669f7104d4e395f	BAh7CDoJbWVudSIJaG9tZToQX2NzcmZfdG9rZW4iMVA4WUdzYzhsalVZNzFP\nM0Zzam1QRXJSSWlKWDRGWjBTa0NNcGRYMjkybnM9OgxzdWJtZW51IhdtZW51\ncy9zdWJtZW51X2hvbWU=\n	2011-04-02 00:03:30.174893	2011-04-02 00:03:30.174893
194	f7583d4ce76feaf66e6fc923ca1b0d50	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nQ1VxRG9ybFViNnZyd0o2NEZMa3h0SkZHTTdtTGlsQi9WWFIzRXNPVUJzWT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-02 02:18:37.129953	2011-04-02 02:18:37.707934
195	78fa4c0916adfdd10bc17fa1cd8c3306	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nOVVyZmc4VzJSMlRrNklua1VoQVViNGl2SlJUcXJEaXhTQUNkMldNbVFtWT06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-02 02:18:58.06411	2011-04-02 02:18:58.265811
196	9525a965af460936c891381c07938f6f	BAh7CToOcmV0dXJuX3RvIgYvOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIx\nZXRYSU1nOFBBbUxlMnVzb09QbHBxc3NGNzZpbWZzMkRqYzY2UkV2SVh0cz06\nDHN1Ym1lbnUiF21lbnVzL3N1Ym1lbnVfaG9tZQ==\n	2011-04-02 02:19:05.514901	2011-04-02 02:19:06.019939
200	c05922e23dd7e3a7d8b6168ac3151242	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6EF9jc3JmX3Rva2VuIjFTbmdLb2V3Wmt4M0NTRzJJaE4wbEVWMG5VQndY\nMUFNLzZaOGZIVFF6cnVvPToJbWVudSIJaG9tZSIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiG0xvZ2dl\nZCBpbiBzdWNjZXNzZnVsbHkGOgpAdXNlZHsGOwpG\n	2011-06-10 15:08:34.116107	2011-06-10 15:09:25.234021
201	16bc0ce05cbfa34491665484b79eec59	BAh7CToMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lIgpmbGFzaElDOidB\nY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIe\nWW91IGhhdmUgYmVlbiBsb2dnZWQgb3V0LgY6CkB1c2VkewY7B0Y6EF9jc3Jm\nX3Rva2VuIjE2NjN4VGx5a2dsZVc0OU9xS2xjcmY2bk9nZnVmQmV0R2k0dFI3\nTGp2aWJvPToJbWVudSIJaG9tZQ==\n	2011-06-10 15:09:31.894722	2011-06-10 15:50:14.655371
202	4f32a91d74f23529f9eb485d2454653e	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6EF9jc3JmX3Rva2VuIjFjTUhmWUdEYmdiZ0xHRmM3ZFBDQkE5MDh4SGxa\ndTV1MFdXa3UwQnppcGNrPSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiG0xvZ2dlZCBpbiBzdWNjZXNz\nZnVsbHkGOgpAdXNlZHsGOwlGOgltZW51Iglob21l\n	2011-06-10 16:53:35.65228	2011-06-10 16:56:20.886284
204	f998e7e881fbdf0e4b8bdd40986b6530	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxRitvZXVvdW9nSVJKbG1aVlJtU3oydkhiNXA0OVNqWDBWVzU1WVYwZHJU\nRT0iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIh5Zb3UgaGF2ZSBiZWVuIGxvZ2dlZCBvdXQuBjoKQHVz\nZWR7BjsIRjoJbWVudSIJaG9tZToOcmV0dXJuX3RvIg0vbG9nb3V0Lw==\n	2011-06-10 16:56:27.896879	2011-06-10 16:57:57.229923
203	edf330b458b052837855b18c3d83b051	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7\nBjsIRjoQX2NzcmZfdG9rZW4iMWRQcUVJa2l2UldOWFdUUGx5b1QxUVNtcTNV\namFQMndweWNleVMwY3YxRHc9OgltZW51Iglob21l\n	2011-06-10 16:54:08.209317	2011-06-10 16:58:43.873742
205	4601c35fa9a67b5d78b2d605f77061b2	BAh7CToMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxMFloVkRUQ3ZOOUxkRGE5dkUvNUQrb2xKQlgyb1BJVW5Ja3FDVWFCczZB\nMD06DnJldHVybl90byINL2xvZ291dC86CW1lbnUiCWhvbWU=\n	2011-06-13 08:21:44.847149	2011-06-13 08:22:18.986758
206	1b2800b06c3e1dc44d9a95f8f35da398	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxaGVRRjkvS0NNNWNhU2JqRU9TbWlreStiR1p2QjZpTE1adloxSy9ZK09X\nST06CW1lbnUiCWhvbWU=\n	2011-06-13 10:22:05.08673	2011-06-13 10:22:05.08673
207	29c55a507399647bfedcce0633a266a3	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxRXFsNkZHTC9sek55MVY0WVZwdlg5bzZGUFJpc2pnaGRvSCt2ODhLS2Fm\nYz06CW1lbnUiCWhvbWU=\n	2011-06-14 09:01:46.130624	2011-06-14 09:01:46.130624
208	869a7127a72a02f5adaf882c983c7773	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7\nBjsIRjoQX2NzcmZfdG9rZW4iMTFZdU0zRGZBQlJGK1IzbzVpQXJHbHlYOGR1\nN1Y2UkRXMW53WUhDQmloVHc9OgltZW51Iglob21l\n	2011-06-14 09:04:39.98139	2011-06-14 09:09:12.078262
209	a368bce952829fd8fb23c3a9e3b32791	BAh7CToMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxLzFOYmtURU41bTFPdCtaTzg5R0Ywdmk1LzNsS3NqK3JkdVh4UUlJZ3Ns\nTT0iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIh5Zb3UgaGF2ZSBiZWVuIGxvZ2dlZCBvdXQuBjoKQHVz\nZWR7BjsIRjoJbWVudSIJaG9tZQ==\n	2011-06-14 09:09:15.660032	2011-06-14 09:09:33.234236
210	629dd9441c6f7758f8a10953762cc7c3	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7\nBjsIRjoQX2NzcmZfdG9rZW4iMW82Q0dEalZuOXRzK3M1dU9VbzNPS1o3YWVU\nU09uVWN5UXc4dEdnSUZSYVU9OgltZW51Iglob21l\n	2011-06-14 09:44:18.373229	2011-06-14 09:49:47.965128
211	29e050818dae5f313c72d58a9ea4e118	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6EF9jc3JmX3Rva2VuIjEwWU9wRWdydTBJQnBMZHc5aGxES1YwMHArVW1M\nYjQvVGNCenptSW9DOFRNPSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiKk5vdGlmaWNhY2FvIHdhcyBz\ndWNjZXNzZnVsbHkgY3JlYXRlZC4GOgpAdXNlZHsGOwlGOgltZW51Iglob21l\n	2011-06-14 09:49:56.295868	2011-06-14 10:12:39.115676
213	57bf2004cd401905d4dc1e8fbf975a97	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7\nBjsIRjoQX2NzcmZfdG9rZW4iMTNRYmhtSzNXZVlOWURaNHcrT0JERHFRUllP\nZTdLMmpoNjFBNlRkMFZRTjg9OgltZW51Iglob21l\n	2011-06-14 10:20:01.373076	2011-06-14 10:20:18.968032
214	f573e340ab563206f1a73c57883550bd	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6EF9jc3JmX3Rva2VuIjErcEM2NWEyOXZVMVdweXd2YThHSzRMbHphSDZW\ncEVrclhFakc4SU9sNnpVPSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiG0xvZ2dlZCBpbiBzdWNjZXNz\nZnVsbHkGOgpAdXNlZHsGOwlGOgltZW51Iglob21l\n	2011-06-14 10:20:43.741033	2011-06-14 10:21:28.140688
215	9e1d90498826351330b87d51f31ee8fe	BAh7CToMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lIgpmbGFzaElDOidB\nY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIe\nWW91IGhhdmUgYmVlbiBsb2dnZWQgb3V0LgY6CkB1c2VkewY7B0Y6EF9jc3Jm\nX3Rva2VuIjFjU0N1bDdLaFg4RDUzdHZubms3ZkRadFBCYjZGb2RVaEM0Z3pC\ndlFRa2FNPToJbWVudSIJaG9tZQ==\n	2011-06-14 10:21:49.592284	2011-06-14 10:21:49.736097
216	aa6d2e12cc2c0a7def9f4bcc18572172	BAh7CToMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lIgpmbGFzaElDOidB\nY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewY6C25vdGljZSIe\nWW91IGhhdmUgYmVlbiBsb2dnZWQgb3V0LgY6CkB1c2VkewY7B0Y6EF9jc3Jm\nX3Rva2VuIjF1REJZZlNManVsdGk5aThXNHlMNHZieUNYZitvVnhnRDkwWVhP\nTktQamdZPToJbWVudSIJaG9tZQ==\n	2011-06-14 10:24:29.252787	2011-06-14 10:24:29.416656
217	d9d546c760998a39ba759f9d13f08b8b	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOgltZW51Iglob21l\nOhBfY3NyZl90b2tlbiIxWlIxVFlsL0R3UnBnNWdUejY1SkQzR1c4dTZBZk5D\nK1VOdkZaaHQyQTN0UT0=\n	2011-06-14 10:45:21.357147	2011-06-14 10:45:21.357147
212	eca270f2a81ce67574b6e16d5398c364	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6CW1lbnUiCWhvbWU6EF9jc3JmX3Rva2VuIjE0d2tDd043eWF6QWZscnZH\nVDBpemc5QUhCWEV0b0RVbDV5WTNZUWE3UUY0PSIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiJ0NlcnRp\nZGFvIHdhcyBzdWNjZXNzZnVsbHkgY3JlYXRlZC4GOgpAdXNlZHsGOwpG\n	2011-06-14 10:12:42.595884	2011-06-14 11:17:05.760839
218	58f81a2a3ca2593f69ab90a44b2e0f5c	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOgltZW51Iglob21l\nOhBfY3NyZl90b2tlbiIxeElGdCtqMzIvU0toUGFiNE1zeE9yS3ZLUk95QTF5\nK1VxVHZFWEVjc3BLWT0=\n	2011-06-28 11:18:48.448766	2011-06-28 11:18:48.448766
219	3a7473f2c5689e17c84857e059f1ec63	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOgltZW51Iglob21l\nOhBfY3NyZl90b2tlbiIxaTdIc05CamIrYkEzWDdta0VoanNYSTdmbEprMzFq\nZGhTV2d3WWcxcFFEVT0=\n	2011-07-01 21:35:15.105666	2011-07-01 21:35:15.105666
220	b6cf596e83d033889a81728de761a29b	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6CW1lbnUiCWhvbWUiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZs\nYXNoOjpGbGFzaEhhc2h7BzoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1\nbGx5OgplcnJvciIiQ291bGRuJ3QgbG9nIHlvdSBpbiBhcyAnbmFqZScGOgpA\ndXNlZHsHOwlGOwpUOhBfY3NyZl90b2tlbiIxYUMwOXZYSzY5YnpNcm1KQ09V\nc3VOOU5BME1BUnppS2xSL3E2aE1SV3Zkbz0=\n	2011-07-02 08:08:37.095426	2011-07-02 08:14:02.732087
221	427f89adcacdae1d08ddf9416a986e54	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naQ46CW1lbnUiCWhvbWU6EF9jc3JmX3Rva2VuIjFZSlF4TE5SaVF3UUtnMmFY\nbFZEWnhQRkpOdGRnNFZGYldqVTNjeGk0NGpJPSIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiKERvY3Vt\nZW50byB3YXMgc3VjY2Vzc2Z1bGx5IGNyZWF0ZWQuBjoKQHVzZWR7BjsKRg==\n	2011-07-02 08:14:50.249294	2011-07-02 08:15:41.510899
222	056163c6b470fc77ea753c6a776d28bc	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6CW1lbnUiCWhvbWU6EF9jc3JmX3Rva2VuIjFHRUR2bzRuRklOeDlaL0lO\nTUZHNXNzOGlVdzZ6MTVVOTM5YWRYeDNYWEpZPSIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiG0xvZ2dl\nZCBpbiBzdWNjZXNzZnVsbHkGOgpAdXNlZHsGOwpG\n	2011-07-02 08:15:43.522724	2011-07-02 08:18:59.097239
224	3d69494681d1dd2a868a50dc6968e3be	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6CW1lbnUiCWhvbWUiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZs\nYXNoOjpGbGFzaEhhc2h7BzoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1\nbGx5OgplcnJvciIiQ291bGRuJ3QgbG9nIHlvdSBpbiBhcyAnbmFqZScGOgpA\ndXNlZHsHOwlGOwpUOhBfY3NyZl90b2tlbiIxUXk0bmpwaTdVQ3BNUElCTGtj\nUTA2ZXRad29VTHM5cDlXd04yN1RuOVRtaz0=\n	2011-07-02 08:23:20.249271	2011-07-02 08:27:55.683938
225	4e1d590e46f8b4628aa2dbde307443d2	BAh7CjoMc3VibWVudSIdbWVudXMvc3VibWVudV9maW5hbmNlaXJvOg91c3Vh\ncmlvX2lkaRA6CW1lbnUiD2ZpbmFuY2Vpcm86EF9jc3JmX3Rva2VuIjFjdG9T\nQjFpZVo0NHhLREYrTG1TeGN0R2pJUGVkREUvYVlieGdhZHhaR2V3PSIKZmxh\nc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgtu\nb3RpY2UiG0xvZ2dlZCBpbiBzdWNjZXNzZnVsbHkGOgpAdXNlZHsGOwpG\n	2011-07-02 08:26:43.252325	2011-07-02 08:27:58.590212
227	69b65f49b073c464a33188ba16e92fca	BAh7CToMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOgltZW51Iglob21l\nOhBfY3NyZl90b2tlbiIxRU9OTzRZTExUYUFaN2FDWGFFNWdoZ2FRd01WRXJY\nYXFmM2tzRDZ2L2MrYz0iCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZs\nYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIh5Zb3UgaGF2ZSBiZWVuIGxvZ2dl\nZCBvdXQuBjoKQHVzZWR7BjsJRg==\n	2011-07-02 08:34:15.473015	2011-07-02 08:34:44.112812
223	bfcbc0b56d9601ad6d384c6c56d681d9	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg5yZXR1cm5fdG8i\nCi9ob21lOgltZW51Iglob21lOhBfY3NyZl90b2tlbiIxY2NkTmFLN3FMQ0cy\nR2JkcnFwY3Y3TDBieTRwTGNmc1YwSWg3NExIM0x0WT0iCmZsYXNoSUM6J0Fj\ndGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhhc2h7BjoLbm90aWNlIh5Z\nb3UgaGF2ZSBiZWVuIGxvZ2dlZCBvdXQuBjoKQHVzZWR7BjsKRg==\n	2011-07-02 08:18:59.254083	2011-07-02 08:40:17.6544
226	e01c3cd408ae01c8b3bdc46bfc2315ef	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6CW1lbnUiCWhvbWU6EF9jc3JmX3Rva2VuIjFRc1FkOGxhYVkyUlVQbko4\nNWdMZXNrZ2ZMeDQzVlRIL2g0NFBmdGJpaWxjPSIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiG0xvZ2dl\nZCBpbiBzdWNjZXNzZnVsbHkGOgpAdXNlZHsGOwpG\n	2011-07-02 08:28:11.289238	2011-07-02 09:37:41.245621
228	6910cb9711946d91c20809354b7122ec	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6CW1lbnUiCWhvbWU6EF9jc3JmX3Rva2VuIjFnbGdKTE5ZNFVxdHhpTFdG\nWWFUVWxlSloxdDh3ZFNrSFlkTDZtaGltUVpJPSIKZmxhc2hJQzonQWN0aW9u\nQ29udHJvbGxlcjo6Rmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiG0xvZ2dl\nZCBpbiBzdWNjZXNzZnVsbHkGOgpAdXNlZHsGOwpG\n	2011-07-02 09:37:41.589018	2011-07-02 09:42:55.328181
229	c2ee4b6b315d37184e0297123e3e9982	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOgltZW51Iglob21l\nOhBfY3NyZl90b2tlbiIxOGhkNisxYThWQ2M0K0RKYjRlV1p2RXJTNmh0U2dH\nMTFWNkRObEVSWXhnND0=\n	2011-07-06 10:03:11.996082	2011-07-06 10:03:11.996082
230	50ff0e292a43daabf6750bf0f8c5f6be	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOgltZW51Iglob21l\nOhBfY3NyZl90b2tlbiIxK0VQUWl4UXRjWmlWZmFQQVJSMVhOaSt4aG9KT25q\nNEhpWEJYYWdvVDJLaz0=\n	2011-07-06 10:10:11.884251	2011-07-06 10:10:11.884251
231	e3b84b4ad43133aa431e4e55c384b9c6	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxeFhRYWZXejJIazZKU0tYOFhPZFdJZWdLSHF2a1lMODlJejlwOUx5Lzhw\nND06CW1lbnUiCWhvbWU=\n	2011-07-19 13:38:56.521931	2011-07-19 13:38:56.521931
232	7b82bac2f43b9ffab4467858beaf603d	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6EF9jc3JmX3Rva2VuIjF4dW1ZSk5uUlJoZkNmclIwQ1pHZzQrNTV4SUJE\nVlIzWlZMa0pjTDNXelRNPSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsHOgtub3RpY2UiG0xvZ2dlZCBpbiBzdWNjZXNz\nZnVsbHk6CmVycm9yIilDb3VsZG4ndCBsb2cgeW91IGluIGFzICc5OTk5OTk5\nOTk5OScGOgpAdXNlZHsHOwlGOwpUOgltZW51Iglob21l\n	2011-07-19 13:41:18.689149	2011-07-19 13:59:02.186309
233	8b8886187b38a785fda7940f53cbeb94	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7\nBjsIRjoQX2NzcmZfdG9rZW4iMXVtbXlRSHo5d1IvUHFVaVFqNjlzNGFzQk50\nRklVQUFQNkpYYWNoY0U0Z2c9OgltZW51Iglob21l\n	2011-07-19 13:59:06.034292	2011-07-19 14:47:51.007389
234	7e7c5c7b05e1b528bdf734d7f771622a	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRAiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7\nBjsIRjoQX2NzcmZfdG9rZW4iMXl0Z3JXQlozN09HOG8yelZvN29CdlhHdHVq\nTVdtS2cxQmJYNUo5cVIxS0k9OgltZW51Iglob21l\n	2011-07-19 14:36:49.301698	2011-07-19 17:29:17.937594
235	372e899ab8bae3b73c36fef1ed3104e9	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxejByTVBRN1NqSzRTZlkrZDJyQzFJUlNSanBOc055Q0QwaDh1bjZTbHhp\nTT06CW1lbnUiCWhvbWU=\n	2011-07-20 07:47:24.048284	2011-07-20 07:47:24.048284
236	063d0ae7091d749fc6b5baef69ee25dd	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naQYiCmZsYXNoSUM6J0FjdGlvbkNvbnRyb2xsZXI6OkZsYXNoOjpGbGFzaEhh\nc2h7BjoLbm90aWNlIhtMb2dnZWQgaW4gc3VjY2Vzc2Z1bGx5BjoKQHVzZWR7\nBjsIRjoQX2NzcmZfdG9rZW4iMXpWZy90SUd2MEFsTjJBcGpRK0hWTHRmaENG\nL0d5bmFyWFJzU21lanp4WDQ9OgltZW51Iglob21l\n	2011-08-11 15:50:35.587635	2011-08-11 15:51:46.238937
237	63218c3ec9bdb95bda432fe4cfc04c5f	BAh7CToMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lIgpmbGFzaElDOidB\nY3Rpb25Db250cm9sbGVyOjpGbGFzaDo6Rmxhc2hIYXNoewc6CmVycm9yIiND\nb3VsZG4ndCBsb2cgeW91IGluIGFzICdhZG1pbic6C25vdGljZSIeWW91IGhh\ndmUgYmVlbiBsb2dnZWQgb3V0LgY6CkB1c2Vkewc7B0Y7CFQ6EF9jc3JmX3Rv\na2VuIjFyTk04enJVSk5raHRsb2o0bVd3bDBMODBLbkJoL1FySVhBdHpsdzUr\nUCs4PToJbWVudSIJaG9tZQ==\n	2011-08-11 15:51:52.510324	2011-08-11 15:58:06.057908
238	01a8fa80263c213b9e58133af0fd4698	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxODd4UGRBZStET2w1VEpPUUJvMzZiTGVJVWNlNDBkWnhZMUphU2lGMjdP\nST06CW1lbnUiCWhvbWU=\n	2011-08-17 09:00:22.294467	2011-08-17 09:00:22.294467
239	c773c1eb7b19ab9fd75b5bf12e13905a	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxRFdrSU9JcmJDeUJhaGk1aHZONDBtTzdEOEcrZ3ZhcldTUTIxek5aRXh0\ndz06CW1lbnUiCWhvbWU=\n	2011-08-17 09:32:53.797871	2011-08-17 09:32:53.797871
240	02d400e5e3496fdc154e2703416b8766	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxRVd6KzVlLytJS1ViN1ZKNC91V3BXRlhiRmZOaW1BNzVNR25jK3FvY2gw\nUT06CW1lbnUiCWhvbWU=\n	2011-08-17 10:18:29.939075	2011-08-17 10:18:29.939075
241	f86bd4887926f2c3ef4010db56f12368	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6EF9jc3JmX3Rva2VuIjE2WW1VQkgwVnlhV0g1c2NYQ1NtNkNBVTh5dURk\ndjRUdzNGdTFVOUZkVWJzPSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsGOgtub3RpY2UiG0xvZ2dlZCBpbiBzdWNjZXNz\nZnVsbHkGOgpAdXNlZHsGOwlGOgltZW51Iglob21l\n	2011-08-17 12:53:31.164772	2011-08-17 13:04:51.124873
242	f2a5ff1d8680667e5b86e0b3eb129b9b	BAh7CjoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOg91c3VhcmlvX2lk\naRA6EF9jc3JmX3Rva2VuIjFZVjFhQ0tTU2NIcTZZZzYvYlVJVWxLeGN1RGtE\nTGlPOWNiY3kxSE1Dc3pzPSIKZmxhc2hJQzonQWN0aW9uQ29udHJvbGxlcjo6\nRmxhc2g6OkZsYXNoSGFzaHsHOgplcnJvciIjQ291bGRuJ3QgbG9nIHlvdSBp\nbiBhcyAnYWRtaW4nOgtub3RpY2UiG0xvZ2dlZCBpbiBzdWNjZXNzZnVsbHkG\nOgpAdXNlZHsHOwlUOwpGOgltZW51Iglob21l\n	2011-08-17 13:06:06.223553	2011-08-17 14:41:50.780169
243	2072085391e0152a39454db21369c65a	BAh7CDoMc3VibWVudSIXbWVudXMvc3VibWVudV9ob21lOhBfY3NyZl90b2tl\nbiIxdWprMVJvMTdXWlBOT2l3akJ4VlJ3dXdSTHY2OElLZC9kUnJqMWRtTFhZ\nRT06CW1lbnUiCWhvbWU=\n	2011-08-17 17:24:34.844023	2011-08-17 17:24:34.844023
\.


--
-- Data for Name: tipo_campos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY tipo_campos (id, tipo, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tipo_documentos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY tipo_documentos (id, tipo, descricao, created_at, updated_at) FROM stdin;
1	Teste	\N	2011-02-22 17:04:42	2011-02-22 17:04:42
2	CNH	Carteira Nacional de Habilitação	2011-02-27 14:18:55	2011-02-27 14:18:55
10	RG		2011-03-19 10:03:39.19923	2011-03-19 10:03:39.19923
11	Passaporte		2011-03-19 10:13:31.943789	2011-03-19 10:13:31.943789
12	Carteira de Trabalho		2011-03-19 10:16:46.26688	2011-03-19 10:16:46.26688
13	Contrato Social		2011-03-19 10:21:25.680497	2011-03-19 10:21:25.680497
\.


--
-- Data for Name: tipo_processos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY tipo_processos (id, tipo, descricao, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: tribunais; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY tribunais (id, uf, nome, presidente, created_at, updated_at) FROM stdin;
2	SP	Tribunal de Justica de São Paulo		2011-02-22 13:41:54	2011-03-19 09:50:55.785344
\.


--
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY usuarios (id, login, nome, email, crypted_password, salt, created_at, updated_at, remember_token, remember_token_expires_at, created_by, updated_by, organizacao_id, organizacao_type, entidade_type, entidade_id, admin, cpf, cnpj, rg, orgao_rg, mae, pai, data_nascimento, naturalidade, nacionalidade, endereco, bairro, cep, endereco_numero, cidade_id) FROM stdin;
6	usuario_irtd	usuario_irtd	usuario_irtd@uol.com.br	c97cf9f324a1ad63d2891ae086d7c99b6df52543	e5cde0e98ca7c3fc8f3cef6438768ea2d256dc31	2011-02-22 13:41:54	2011-02-22 13:41:54	\N	\N	\N	\N	\N	\N	Irtd	3	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7	usuario_tribunal	usuario_tribunal	usuario_tribunal@uol.com.br	94a089f8b5af8a55fd321809c1a8650600c6421f	e3788891c0975d62efa3deacf65aed1fcc7d545f	2011-02-22 13:41:54	2011-02-22 13:41:54	\N	\N	\N	\N	\N	\N	Tribunal	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8	usuario_conveniado	usuario_conveniado	usuario_conveniado@uol.com.br	9b828230cbd7eff0f6e6e84f32c578c7f2c08cfb	21fb8bd8f502f809fe4881b49eb950e9873bf9c8	2011-02-22 13:41:54	2011-02-22 13:41:54	\N	\N	\N	\N	\N	\N	Conveniado	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10	usuario_irtdbr	usuario_irtdbr	irtdpjbr@uol.com.br	56376ea43e551efa33ba5c29a09292f4f1964b9a	b4f2445b467a147587ad739948740a0f5a48ce3a	2011-02-22 18:15:26	2011-02-22 18:15:26	\N	\N	\N	\N	\N	\N	Irtd	5	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
11	99999999999	naje	naje@fabricainfo.com	eaa7510b9e65a72fc63662f4f481b4598fa4a8bd	a747629eac8350b6db8a5685d157eeafbe4e9419	2011-02-25 14:24:05	2011-06-14 09:47:25.396065	\N	\N	\N	\N	\N	\N	\N	\N	\N	99999999999	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2	25825825825	joao	1308046207@teste.com	a841d24b138b192cc2ca457271ea6100abacbdc4	676b3318facc5f594c90f9b5fd10cbb9f66b1e24	2011-06-14 10:10:07.249871	2011-06-14 10:10:07.249871	\N	\N	\N	\N	\N	\N	\N	\N	\N	25825825825	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9	\N	usuario_cartorio	usuario_cartorio@uol.com.br	96e67f12ea3dbf0e00ea5bd1aed083c8cd7f3e37	c1b04425e1fc82d87e4cc016aaf62c5962a12f8a	2011-02-22 13:41:54	2011-07-02 08:14:59.558397	\N	\N	\N	\N	\N	\N	Cartorio	2	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1	\N	admin	coutinho@mondriantecnologia.com	2a5250497b1f275db03ae015622b85482b72b61a	177fae414ae65c3e34964a1f98d72d3e0c34edb4	2011-02-22 13:32:34	2011-08-11 15:51:45.927469	\N	\N	\N	\N	\N	\N	\N	\N	t	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: valor_campo_documentos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY valor_campo_documentos (id, documento_id, campo_documento_id, valor, created_at, updated_at) FROM stdin;
1	23	1	testando...	2011-02-27 14:00:56	2011-02-27 14:00:56
2	\N	2	123456	2011-02-27 14:22:00	2011-02-27 14:22:00
3	\N	3	22/02/2011	2011-02-27 14:22:00	2011-02-27 14:22:00
4	25	2	111111	2011-02-27 14:25:10	2011-02-27 14:25:10
5	25	3	111	2011-02-27 14:25:10	2011-02-27 14:25:10
6	26	2	0101010	2011-02-27 14:25:50	2011-02-27 14:25:50
7	26	3	12/02/2011	2011-02-27 14:25:50	2011-02-27 14:25:50
8	27	2	123456	2011-02-27 15:06:23	2011-02-27 15:06:23
9	27	3	12/02/2011	2011-02-27 15:06:23	2011-02-27 15:06:23
10	28	2	1111888	2011-02-27 18:10:30	2011-02-27 18:10:30
11	28	3	12/02/2011	2011-02-27 18:10:30	2011-02-27 18:10:30
12	29	2	111111	2011-02-27 18:55:57	2011-02-27 18:55:57
13	29	3	12/02/2011	2011-02-27 18:55:57	2011-02-27 18:55:57
16	8	2	8888	2011-02-28 12:47:34.316993	2011-02-28 12:47:34.316993
17	8	3	10/02/2011	2011-02-28 12:47:34.320146	2011-02-28 12:47:34.320146
18	9	2	09876543	2011-02-28 13:19:50.267721	2011-02-28 13:19:50.267721
19	9	3	10/02/2011	2011-02-28 13:19:50.274485	2011-02-28 13:19:50.274485
20	10	2	11111	2011-02-28 13:20:53.701722	2011-02-28 13:20:53.701722
21	10	3	10/02/2011	2011-02-28 13:20:53.704858	2011-02-28 13:20:53.704858
22	11	2		2011-02-28 18:10:58.647648	2011-02-28 18:10:58.647648
23	11	3		2011-02-28 18:10:58.650722	2011-02-28 18:10:58.650722
24	12	11	10/10/2010	2011-07-02 08:15:33.128388	2011-07-02 08:15:33.128388
25	12	12	SSP	2011-07-02 08:15:33.135875	2011-07-02 08:15:33.135875
26	12	13	CE	2011-07-02 08:15:33.138548	2011-07-02 08:15:33.138548
27	12	15	Naje	2011-07-02 08:15:33.141182	2011-07-02 08:15:33.141182
28	12	16	Fortaleza	2011-07-02 08:15:33.143836	2011-07-02 08:15:33.143836
29	12	17	19/02/1970	2011-07-02 08:15:33.146458	2011-07-02 08:15:33.146458
30	12	10	18765434	2011-07-02 08:15:33.149084	2011-07-02 08:15:33.149084
\.


--
-- Data for Name: valor_campo_processos; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY valor_campo_processos (id, processo_id, campo_processo_id, valor, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: valores_sistema; Type: TABLE DATA; Schema: public; Owner: dute
--

COPY valores_sistema (id, certidao, notificacao, registro, created_at, updated_at) FROM stdin;
1	1	7	7	2011-02-28 02:33:19.581357	2011-02-28 02:33:19.581357
\.


--
-- Name: campo_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY campo_documentos
    ADD CONSTRAINT campo_documentos_pkey PRIMARY KEY (id);


--
-- Name: campo_processos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY campo_processos
    ADD CONSTRAINT campo_processos_pkey PRIMARY KEY (id);


--
-- Name: cartorios_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY cartorios
    ADD CONSTRAINT cartorios_pkey PRIMARY KEY (id);


--
-- Name: categorias_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- Name: certidaos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY certidoes
    ADD CONSTRAINT certidaos_pkey PRIMARY KEY (id);


--
-- Name: cidades_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY cidades
    ADD CONSTRAINT cidades_pkey PRIMARY KEY (id);


--
-- Name: configuracoes_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY configuracoes
    ADD CONSTRAINT configuracoes_pkey PRIMARY KEY (id);


--
-- Name: conveniados_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY conveniados
    ADD CONSTRAINT conveniados_pkey PRIMARY KEY (id);


--
-- Name: documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY documentos
    ADD CONSTRAINT documentos_pkey PRIMARY KEY (id);


--
-- Name: irtds_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY irtds
    ADD CONSTRAINT irtds_pkey PRIMARY KEY (id);


--
-- Name: lotes_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY lotes
    ADD CONSTRAINT lotes_pkey PRIMARY KEY (id);


--
-- Name: mensagens_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY mensagens
    ADD CONSTRAINT mensagens_pkey PRIMARY KEY (id);


--
-- Name: motivo_notificacaos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY motivo_notificacaos
    ADD CONSTRAINT motivo_notificacaos_pkey PRIMARY KEY (id);


--
-- Name: notificacoes_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY notificacoes
    ADD CONSTRAINT notificacoes_pkey PRIMARY KEY (id);


--
-- Name: perfis_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY perfis
    ADD CONSTRAINT perfis_pkey PRIMARY KEY (id);


--
-- Name: pessoa_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY pessoa_versions
    ADD CONSTRAINT pessoa_versions_pkey PRIMARY KEY (id);


--
-- Name: pessoas_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (id);


--
-- Name: precos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY precos
    ADD CONSTRAINT precos_pkey PRIMARY KEY (id);


--
-- Name: processo_versions_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY processo_versions
    ADD CONSTRAINT processo_versions_pkey PRIMARY KEY (id);


--
-- Name: processos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY processos
    ADD CONSTRAINT processos_pkey PRIMARY KEY (id);


--
-- Name: selos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY selos
    ADD CONSTRAINT selos_pkey PRIMARY KEY (id);


--
-- Name: sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: tipo_campos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY tipo_campos
    ADD CONSTRAINT tipo_campos_pkey PRIMARY KEY (id);


--
-- Name: tipo_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY tipo_documentos
    ADD CONSTRAINT tipo_documentos_pkey PRIMARY KEY (id);


--
-- Name: tipo_processos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY tipo_processos
    ADD CONSTRAINT tipo_processos_pkey PRIMARY KEY (id);


--
-- Name: tribunais_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY tribunais
    ADD CONSTRAINT tribunais_pkey PRIMARY KEY (id);


--
-- Name: usuarios_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- Name: valor_campo_documentos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY valor_campo_documentos
    ADD CONSTRAINT valor_campo_documentos_pkey PRIMARY KEY (id);


--
-- Name: valor_campo_processos_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY valor_campo_processos
    ADD CONSTRAINT valor_campo_processos_pkey PRIMARY KEY (id);


--
-- Name: valores_sistema_pkey; Type: CONSTRAINT; Schema: public; Owner: dute; Tablespace: 
--

ALTER TABLE ONLY valores_sistema
    ADD CONSTRAINT valores_sistema_pkey PRIMARY KEY (id);


--
-- Name: index_cartorios_on_tribunal_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_cartorios_on_tribunal_id ON cartorios USING btree (tribunal_id);


--
-- Name: index_certidaos_on_documento_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_certidaos_on_documento_id ON certidoes USING btree (documento_id);


--
-- Name: index_documentos_on_cartorio_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_documentos_on_cartorio_id ON documentos USING btree (cartorio_id);


--
-- Name: index_documentos_on_selo_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_documentos_on_selo_id ON documentos USING btree (selo_id);


--
-- Name: index_documentos_on_usuario_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_documentos_on_usuario_id ON documentos USING btree (usuario_id);


--
-- Name: index_mensagens_on_assunto; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_mensagens_on_assunto ON mensagens USING btree (assunto);


--
-- Name: index_mensagens_on_destinatario_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_mensagens_on_destinatario_id ON mensagens USING btree (destinatario_id);


--
-- Name: index_mensagens_on_status; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_mensagens_on_status ON mensagens USING btree (status);


--
-- Name: index_mensagens_on_usuario_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_mensagens_on_usuario_id ON mensagens USING btree (usuario_id);


--
-- Name: index_pessoa_versions_on_pessoa_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_pessoa_versions_on_pessoa_id ON pessoa_versions USING btree (pessoa_id);


--
-- Name: index_pessoas_on_cidade_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_pessoas_on_cidade_id ON pessoas USING btree (cidade_id);


--
-- Name: index_pessoas_on_cnh; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_pessoas_on_cnh ON pessoas USING btree (cnh);


--
-- Name: index_pessoas_on_cpf; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_pessoas_on_cpf ON pessoas USING btree (cpf);


--
-- Name: index_pessoas_on_nome; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_pessoas_on_nome ON pessoas USING btree (nome);


--
-- Name: index_pessoas_on_nome_mae; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_pessoas_on_nome_mae ON pessoas USING btree (nome_mae);


--
-- Name: index_pessoas_on_rg; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_pessoas_on_rg ON pessoas USING btree (rg);


--
-- Name: index_processo_versions_on_processo_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_processo_versions_on_processo_id ON processo_versions USING btree (processo_id);


--
-- Name: index_sessions_on_session_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_sessions_on_session_id ON sessions USING btree (session_id);


--
-- Name: index_sessions_on_updated_at; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_sessions_on_updated_at ON sessions USING btree (updated_at);


--
-- Name: index_usuarios_on_entidade_type_and_entidade_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_usuarios_on_entidade_type_and_entidade_id ON usuarios USING btree (entidade_type, entidade_id);


--
-- Name: index_usuarios_on_login; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE UNIQUE INDEX index_usuarios_on_login ON usuarios USING btree (login);


--
-- Name: index_usuarios_on_organizacao_type_and_organizacao_id; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE INDEX index_usuarios_on_organizacao_type_and_organizacao_id ON usuarios USING btree (organizacao_type, organizacao_id);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: dute; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

