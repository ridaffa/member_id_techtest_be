--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2023-03-07 16:38:12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- TOC entry 212 (class 1259 OID 16579)
-- Name: award_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.award_types (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.award_types OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16578)
-- Name: award_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.award_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.award_types_id_seq OWNER TO postgres;

--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 211
-- Name: award_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.award_types_id_seq OWNED BY public.award_types.id;


--
-- TOC entry 218 (class 1259 OID 16612)
-- Name: awards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.awards (
    id integer NOT NULL,
    award_type_id integer NOT NULL,
    product_id integer,
    voucher_id integer,
    points integer NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone,
    image character varying NOT NULL
);


ALTER TABLE public.awards OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16611)
-- Name: awards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.awards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.awards_id_seq OWNER TO postgres;

--
-- TOC entry 3368 (class 0 OID 0)
-- Dependencies: 217
-- Name: awards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.awards_id_seq OWNED BY public.awards.id;


--
-- TOC entry 216 (class 1259 OID 16601)
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.products OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16600)
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- TOC entry 3369 (class 0 OID 0)
-- Dependencies: 215
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- TOC entry 210 (class 1259 OID 16568)
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    created_at timestamp with time zone DEFAULT now() NOT NULL,
    updated_at timestamp with time zone DEFAULT now() NOT NULL,
    deleted_at timestamp with time zone
);


ALTER TABLE public.users OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16567)
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- TOC entry 3370 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- TOC entry 214 (class 1259 OID 16590)
-- Name: vouchers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.vouchers (
    id integer NOT NULL,
    name character varying NOT NULL,
    created_at character varying DEFAULT now() NOT NULL,
    updated_at character varying DEFAULT now() NOT NULL,
    deleted_at character varying
);


ALTER TABLE public.vouchers OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16589)
-- Name: vouchers_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.vouchers_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.vouchers_id_seq OWNER TO postgres;

--
-- TOC entry 3371 (class 0 OID 0)
-- Dependencies: 213
-- Name: vouchers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.vouchers_id_seq OWNED BY public.vouchers.id;


--
-- TOC entry 3187 (class 2604 OID 16582)
-- Name: award_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.award_types ALTER COLUMN id SET DEFAULT nextval('public.award_types_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 16615)
-- Name: awards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards ALTER COLUMN id SET DEFAULT nextval('public.awards_id_seq'::regclass);


--
-- TOC entry 3193 (class 2604 OID 16604)
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 16571)
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- TOC entry 3190 (class 2604 OID 16593)
-- Name: vouchers id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers ALTER COLUMN id SET DEFAULT nextval('public.vouchers_id_seq'::regclass);


--
-- TOC entry 3355 (class 0 OID 16579)
-- Dependencies: 212
-- Data for Name: award_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.award_types (id, name, created_at, updated_at, deleted_at) VALUES (2, 'products', '2023-03-07 12:24:26.914488+07', '2023-03-07 12:24:26.914488+07', NULL);
INSERT INTO public.award_types (id, name, created_at, updated_at, deleted_at) VALUES (3, 'giftcards', '2023-03-07 12:24:32.913523+07', '2023-03-07 12:24:32.913523+07', NULL);
INSERT INTO public.award_types (id, name, created_at, updated_at, deleted_at) VALUES (1, 'vouchers', '2023-03-07 12:24:19.637317+07', '2023-03-07 12:24:19.637317+07', NULL);


--
-- TOC entry 3361 (class 0 OID 16612)
-- Dependencies: 218
-- Data for Name: awards; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.awards (id, award_type_id, product_id, voucher_id, points, created_at, updated_at, deleted_at, image) VALUES (2, 1, NULL, 2, 500000, '2023-03-07 12:34:18.729754+07', '2023-03-07 12:34:18.729754+07', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Example_image.svg/600px-Example_image.svg.png');
INSERT INTO public.awards (id, award_type_id, product_id, voucher_id, points, created_at, updated_at, deleted_at, image) VALUES (3, 2, 1, NULL, 100000, '2023-03-07 12:34:31.975911+07', '2023-03-07 12:34:31.975911+07', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Example_image.svg/600px-Example_image.svg.png');
INSERT INTO public.awards (id, award_type_id, product_id, voucher_id, points, created_at, updated_at, deleted_at, image) VALUES (1, 1, NULL, 1, 1000000, '2023-03-07 12:33:46.267629+07', '2023-03-07 12:33:46.267629+07', NULL, 'https://upload.wikimedia.org/wikipedia/commons/thumb/8/8f/Example_image.svg/600px-Example_image.svg.png');


--
-- TOC entry 3359 (class 0 OID 16601)
-- Dependencies: 216
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.products (id, name, created_at, updated_at, deleted_at) VALUES (1, 'Old Fashion Cake', '2023-03-07 12:31:29.288715+07', '2023-03-07 12:31:29.288715+07', NULL);
INSERT INTO public.products (id, name, created_at, updated_at, deleted_at) VALUES (2, 'T-Shirt', '2023-03-07 12:31:36.432995+07', '2023-03-07 12:31:36.432995+07', NULL);
INSERT INTO public.products (id, name, created_at, updated_at, deleted_at) VALUES (3, 'Car', '2023-03-07 12:31:50.887742+07', '2023-03-07 12:31:50.887742+07', NULL);


--
-- TOC entry 3353 (class 0 OID 16568)
-- Dependencies: 210
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.users (id, email, created_at, updated_at, deleted_at) VALUES (1, 'user@member.id', '2023-03-07 12:39:23.257706+07', '2023-03-07 12:39:23.257706+07', NULL);
INSERT INTO public.users (id, email, created_at, updated_at, deleted_at) VALUES (2, 'user2@member.id', '2023-03-07 13:49:15.560257+07', '2023-03-07 13:49:15.560257+07', NULL);


--
-- TOC entry 3357 (class 0 OID 16590)
-- Dependencies: 214
-- Data for Name: vouchers; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.vouchers (id, name, created_at, updated_at, deleted_at) VALUES (1, 'Gift Card IDR 1.000.000', '2023-03-07 12:26:51.358802+07', '2023-03-07 12:26:51.358802+07', NULL);
INSERT INTO public.vouchers (id, name, created_at, updated_at, deleted_at) VALUES (2, 'Gift Card IDR 500.000', '2023-03-07 12:26:55.487418+07', '2023-03-07 12:26:55.487418+07', NULL);
INSERT INTO public.vouchers (id, name, created_at, updated_at, deleted_at) VALUES (3, 'Gift Card IDR 250.000', '2023-03-07 12:27:02.783871+07', '2023-03-07 12:27:02.783871+07', NULL);
INSERT INTO public.vouchers (id, name, created_at, updated_at, deleted_at) VALUES (4, 'Gift Card IDR 100.000', '2023-03-07 12:27:09.434331+07', '2023-03-07 12:27:09.434331+07', NULL);


--
-- TOC entry 3372 (class 0 OID 0)
-- Dependencies: 211
-- Name: award_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.award_types_id_seq', 3, true);


--
-- TOC entry 3373 (class 0 OID 0)
-- Dependencies: 217
-- Name: awards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.awards_id_seq', 3, true);


--
-- TOC entry 3374 (class 0 OID 0)
-- Dependencies: 215
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 3, true);


--
-- TOC entry 3375 (class 0 OID 0)
-- Dependencies: 209
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- TOC entry 3376 (class 0 OID 0)
-- Dependencies: 213
-- Name: vouchers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.vouchers_id_seq', 4, true);


--
-- TOC entry 3203 (class 2606 OID 16588)
-- Name: award_types award_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.award_types
    ADD CONSTRAINT award_types_pkey PRIMARY KEY (id);


--
-- TOC entry 3209 (class 2606 OID 16619)
-- Name: awards awards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT awards_pkey PRIMARY KEY (id);


--
-- TOC entry 3207 (class 2606 OID 16610)
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 16577)
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- TOC entry 3205 (class 2606 OID 16599)
-- Name: vouchers vouchers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.vouchers
    ADD CONSTRAINT vouchers_pkey PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 16630)
-- Name: awards award_type_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT award_type_fk FOREIGN KEY (award_type_id) REFERENCES public.award_types(id) NOT VALID;


--
-- TOC entry 3211 (class 2606 OID 16625)
-- Name: awards product_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT product_fk FOREIGN KEY (product_id) REFERENCES public.products(id) NOT VALID;


--
-- TOC entry 3210 (class 2606 OID 16620)
-- Name: awards voucher_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.awards
    ADD CONSTRAINT voucher_fk FOREIGN KEY (voucher_id) REFERENCES public.vouchers(id);


-- Completed on 2023-03-07 16:38:12

--
-- PostgreSQL database dump complete
--

