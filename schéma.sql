--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

-- Started on 2025-03-04 15:43:55

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 218 (class 1259 OID 16403)
-- Name: banque; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.banque (
    id integer NOT NULL,
    nom character varying(100) NOT NULL
);


ALTER TABLE public.banque OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16402)
-- Name: banque_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.banque_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.banque_id_seq OWNER TO postgres;

--
-- TOC entry 4919 (class 0 OID 0)
-- Dependencies: 217
-- Name: banque_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.banque_id_seq OWNED BY public.banque.id;


--
-- TOC entry 220 (class 1259 OID 16412)
-- Name: compte; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compte (
    id integer NOT NULL,
    solde numeric(10,2) NOT NULL,
    banque_id integer
);


ALTER TABLE public.compte OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16411)
-- Name: compte_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compte_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compte_id_seq OWNER TO postgres;

--
-- TOC entry 4920 (class 0 OID 0)
-- Dependencies: 219
-- Name: compte_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compte_id_seq OWNED BY public.compte.id;


--
-- TOC entry 222 (class 1259 OID 16425)
-- Name: compteepargne; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.compteepargne (
    id integer NOT NULL,
    solde numeric(10,2) NOT NULL,
    benefice numeric(10,2) NOT NULL,
    banque_id integer
);


ALTER TABLE public.compteepargne OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16424)
-- Name: compteepargne_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.compteepargne_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.compteepargne_id_seq OWNER TO postgres;

--
-- TOC entry 4921 (class 0 OID 0)
-- Dependencies: 221
-- Name: compteepargne_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.compteepargne_id_seq OWNED BY public.compteepargne.id;


--
-- TOC entry 4752 (class 2604 OID 16406)
-- Name: banque id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banque ALTER COLUMN id SET DEFAULT nextval('public.banque_id_seq'::regclass);


--
-- TOC entry 4753 (class 2604 OID 16415)
-- Name: compte id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte ALTER COLUMN id SET DEFAULT nextval('public.compte_id_seq'::regclass);


--
-- TOC entry 4754 (class 2604 OID 16428)
-- Name: compteepargne id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteepargne ALTER COLUMN id SET DEFAULT nextval('public.compteepargne_id_seq'::regclass);


--
-- TOC entry 4909 (class 0 OID 16403)
-- Dependencies: 218
-- Data for Name: banque; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.banque (id, nom) FROM stdin;
1	Banque Centrale
2	Banque Centrale
3	Banque Centrale
4	Banque Centrale
5	Banque Centrale
6	Banque Centrale
\.


--
-- TOC entry 4911 (class 0 OID 16412)
-- Dependencies: 220
-- Data for Name: compte; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compte (id, solde, banque_id) FROM stdin;
2	1000.00	1
3	1000.00	1
4	1000.00	1
5	1000.00	1
6	1000.00	1
7	2000.00	1
\.


--
-- TOC entry 4913 (class 0 OID 16425)
-- Dependencies: 222
-- Data for Name: compteepargne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.compteepargne (id, solde, benefice, banque_id) FROM stdin;
\.


--
-- TOC entry 4922 (class 0 OID 0)
-- Dependencies: 217
-- Name: banque_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.banque_id_seq', 6, true);


--
-- TOC entry 4923 (class 0 OID 0)
-- Dependencies: 219
-- Name: compte_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compte_id_seq', 7, true);


--
-- TOC entry 4924 (class 0 OID 0)
-- Dependencies: 221
-- Name: compteepargne_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.compteepargne_id_seq', 1, false);


--
-- TOC entry 4756 (class 2606 OID 16408)
-- Name: banque banque_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.banque
    ADD CONSTRAINT banque_pkey PRIMARY KEY (id);


--
-- TOC entry 4758 (class 2606 OID 16417)
-- Name: compte compte_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_pkey PRIMARY KEY (id);


--
-- TOC entry 4760 (class 2606 OID 16430)
-- Name: compteepargne compteepargne_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteepargne
    ADD CONSTRAINT compteepargne_pkey PRIMARY KEY (id);


--
-- TOC entry 4761 (class 2606 OID 16418)
-- Name: compte compte_banque_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compte
    ADD CONSTRAINT compte_banque_id_fkey FOREIGN KEY (banque_id) REFERENCES public.banque(id);


--
-- TOC entry 4762 (class 2606 OID 16431)
-- Name: compteepargne compteepargne_banque_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.compteepargne
    ADD CONSTRAINT compteepargne_banque_id_fkey FOREIGN KEY (banque_id) REFERENCES public.banque(id);


-- Completed on 2025-03-04 15:43:55

--
-- PostgreSQL database dump complete
--

