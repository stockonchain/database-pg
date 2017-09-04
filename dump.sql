--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.5
-- Dumped by pg_dump version 9.6.5

-- Started on 2017-09-04 18:58:59 CEST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

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
-- TOC entry 2408 (class 0 OID 0)
-- Dependencies: 189
-- Name: account_accountid_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE account_accountid_seq OWNED BY account.accountid;


--
-- TOC entry 2281 (class 2604 OID 16446)
-- Name: account accountid; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account ALTER COLUMN accountid SET DEFAULT nextval('account_accountid_seq'::regclass);


--
-- TOC entry 2403 (class 0 OID 16443)
-- Dependencies: 190
-- Data for Name: account; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- TOC entry 2409 (class 0 OID 0)
-- Dependencies: 189
-- Name: account_accountid_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('account_accountid_seq', 5, true);


--
-- TOC entry 2283 (class 2606 OID 16451)
-- Name: account account_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY account
    ADD CONSTRAINT account_pkey PRIMARY KEY (accountid);


--
-- TOC entry 2284 (class 1259 OID 16507)
-- Name: index_address; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX index_address ON account USING btree (address);


-- Completed on 2017-09-04 18:58:59 CEST

--
-- PostgreSQL database dump complete
--

