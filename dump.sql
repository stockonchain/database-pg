--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.3

-- Started on 2017-09-02 19:58:35 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12655)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2413 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 16409)
-- Name: Product; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Product" (
    "ProductID" bigint NOT NULL,
    "Name" text NOT NULL
);


ALTER TABLE "Product" OWNER TO postgres;

--
-- TOC entry 187 (class 1259 OID 16407)
-- Name: Product_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Product_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Product_ID_seq" OWNER TO postgres;

--
-- TOC entry 2414 (class 0 OID 0)
-- Dependencies: 187
-- Name: Product_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Product_ID_seq" OWNED BY "Product"."ProductID";


--
-- TOC entry 186 (class 1259 OID 16401)
-- Name: Transaction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE "Transaction" (
    "TransactionID" bigint NOT NULL,
    "Type" smallint NOT NULL,
    "ProductID" bigint NOT NULL,
    "Amount" integer NOT NULL
);


ALTER TABLE "Transaction" OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 16399)
-- Name: Transaction_ID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Transaction_ID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Transaction_ID_seq" OWNER TO postgres;

--
-- TOC entry 2415 (class 0 OID 0)
-- Dependencies: 185
-- Name: Transaction_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Transaction_ID_seq" OWNED BY "Transaction"."TransactionID";


--
-- TOC entry 189 (class 1259 OID 16422)
-- Name: Transaction_ProductID_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE "Transaction_ProductID_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE "Transaction_ProductID_seq" OWNER TO postgres;

--
-- TOC entry 2416 (class 0 OID 0)
-- Dependencies: 189
-- Name: Transaction_ProductID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Transaction_ProductID_seq" OWNED BY "Transaction"."ProductID";


--
-- TOC entry 2278 (class 2604 OID 16412)
-- Name: Product ProductID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Product" ALTER COLUMN "ProductID" SET DEFAULT nextval('"Product_ID_seq"'::regclass);


--
-- TOC entry 2276 (class 2604 OID 16404)
-- Name: Transaction TransactionID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Transaction" ALTER COLUMN "TransactionID" SET DEFAULT nextval('"Transaction_ID_seq"'::regclass);


--
-- TOC entry 2277 (class 2604 OID 16424)
-- Name: Transaction ProductID; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Transaction" ALTER COLUMN "ProductID" SET DEFAULT nextval('"Transaction_ProductID_seq"'::regclass);


--
-- TOC entry 2405 (class 0 OID 16409)
-- Dependencies: 188
-- Data for Name: Product; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Product" ("ProductID", "Name") FROM stdin;
\.


--
-- TOC entry 2417 (class 0 OID 0)
-- Dependencies: 187
-- Name: Product_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Product_ID_seq"', 1, false);


--
-- TOC entry 2403 (class 0 OID 16401)
-- Dependencies: 186
-- Data for Name: Transaction; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY "Transaction" ("TransactionID", "Type", "ProductID", "Amount") FROM stdin;
\.


--
-- TOC entry 2418 (class 0 OID 0)
-- Dependencies: 185
-- Name: Transaction_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Transaction_ID_seq"', 1, false);


--
-- TOC entry 2419 (class 0 OID 0)
-- Dependencies: 189
-- Name: Transaction_ProductID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Transaction_ProductID_seq"', 1, false);


--
-- TOC entry 2283 (class 2606 OID 16414)
-- Name: Product Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Product"
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY ("ProductID");


--
-- TOC entry 2280 (class 2606 OID 16406)
-- Name: Transaction Transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Transaction"
    ADD CONSTRAINT "Transaction_pkey" PRIMARY KEY ("TransactionID");


--
-- TOC entry 2281 (class 1259 OID 16434)
-- Name: fki_Transaction_ProductID_FK; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "fki_Transaction_ProductID_FK" ON "Transaction" USING btree ("ProductID");


--
-- TOC entry 2284 (class 2606 OID 16429)
-- Name: Transaction Transaction_ProductID_FK; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY "Transaction"
    ADD CONSTRAINT "Transaction_ProductID_FK" FOREIGN KEY ("ProductID") REFERENCES "Product"("ProductID") ON DELETE CASCADE;


-- Completed on 2017-09-02 19:58:35 CEST

--
-- PostgreSQL database dump complete
--

