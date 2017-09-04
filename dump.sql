--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-09-04 19:38:25 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

DROP DATABASE stockonchain;
--
-- TOC entry 2429 (class 1262 OID 16393)
-- Name: stockonchain; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE stockonchain WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C' LC_CTYPE = 'C';


ALTER DATABASE stockonchain OWNER TO postgres;

\connect stockonchain

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
-- TOC entry 2432 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 188 (class 1259 OID 16409)
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE item (
    itemid bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE item OWNER TO postgres;

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
-- TOC entry 2433 (class 0 OID 0)
-- Dependencies: 187
-- Name: Product_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Product_ID_seq" OWNED BY item.itemid;


--
-- TOC entry 186 (class 1259 OID 16401)
-- Name: transactionstock; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transactionstock (
    transactionid bigint NOT NULL,
    type smallint NOT NULL
);


ALTER TABLE transactionstock OWNER TO postgres;

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
-- TOC entry 2434 (class 0 OID 0)
-- Dependencies: 185
-- Name: Transaction_ID_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE "Transaction_ID_seq" OWNED BY transactionstock.transactionid;


--
-- TOC entry 190 (class 1259 OID 16443)
-- Name: account; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE account (
    accountid bigint NOT NULL,
    address text
);


ALTER TABLE account OWNER TO postgres;

--
-- TOC entry 189 (class 1259 OID 16441)
-- Name: account_accountid_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE account_accountid_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE account_accountid_seq OWNER TO postgres;

--
-- TOC entry 2435 (class 0 OID 0)
-- Dependencies: 189
-- Name: account_accountid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_accountid_seq OWNED BY account.accountid;


--
-- TOC entry 191 (class 1259 OID 16482)
-- Name: transaction_item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE transaction_item (
    transactionid bigint NOT NULL,
    itemid bigint NOT NULL,
    amount bigint DEFAULT 0,
    accountid bigint NOT NULL
);


ALTER TABLE transaction_item OWNER TO postgres;

--
-- TOC entry 2287 (class 2604 OID 16446)
-- Name: account accountid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account ALTER COLUMN accountid SET DEFAULT nextval('account_accountid_seq'::regclass);


--
-- TOC entry 2286 (class 2604 OID 16412)
-- Name: item itemid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item ALTER COLUMN itemid SET DEFAULT nextval('"Product_ID_seq"'::regclass);


--
-- TOC entry 2285 (class 2604 OID 16404)
-- Name: transactionstock transactionid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transactionstock ALTER COLUMN transactionid SET DEFAULT nextval('"Transaction_ID_seq"'::regclass);


--
-- TOC entry 2436 (class 0 OID 0)
-- Dependencies: 187
-- Name: Product_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Product_ID_seq"', 1, true);


--
-- TOC entry 2437 (class 0 OID 0)
-- Dependencies: 185
-- Name: Transaction_ID_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('"Transaction_ID_seq"', 11, true);


--
-- TOC entry 2423 (class 0 OID 16443)
-- Dependencies: 190
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2438 (class 0 OID 0)
-- Dependencies: 189
-- Name: account_accountid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_accountid_seq', 5, true);


--
-- TOC entry 2421 (class 0 OID 16409)
-- Dependencies: 188
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO item VALUES (1, 'TestProduct');


--
-- TOC entry 2424 (class 0 OID 16482)
-- Dependencies: 191
-- Data for Name: transaction_item; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2419 (class 0 OID 16401)
-- Dependencies: 186
-- Data for Name: transactionstock; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2292 (class 2606 OID 16414)
-- Name: item Product_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY item
    ADD CONSTRAINT "Product_pkey" PRIMARY KEY (itemid);


--
-- TOC entry 2290 (class 2606 OID 16406)
-- Name: transactionstock Transaction_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transactionstock
    ADD CONSTRAINT "Transaction_pkey" PRIMARY KEY (transactionid);


--
-- TOC entry 2294 (class 2606 OID 16451)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (accountid);


--
-- TOC entry 2297 (class 2606 OID 16486)
-- Name: transaction_item pk_transaction_item; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction_item
    ADD CONSTRAINT pk_transaction_item PRIMARY KEY (transactionid, itemid);


--
-- TOC entry 2295 (class 1259 OID 16507)
-- Name: index_address; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_address ON account USING btree (address);


--
-- TOC entry 2300 (class 2606 OID 16508)
-- Name: transaction_item fk_accountid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction_item
    ADD CONSTRAINT fk_accountid FOREIGN KEY (accountid) REFERENCES account(accountid);


--
-- TOC entry 2298 (class 2606 OID 16487)
-- Name: transaction_item fk_itemid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction_item
    ADD CONSTRAINT fk_itemid FOREIGN KEY (itemid) REFERENCES item(itemid);


--
-- TOC entry 2299 (class 2606 OID 16492)
-- Name: transaction_item fk_transactionid; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY transaction_item
    ADD CONSTRAINT fk_transactionid FOREIGN KEY (transactionid) REFERENCES transactionstock(transactionid);


--
-- TOC entry 2431 (class 0 OID 0)
-- Dependencies: 7
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2017-09-04 19:38:26 CEST

--
-- PostgreSQL database dump complete
--

