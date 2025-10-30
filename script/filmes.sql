--
-- PostgreSQL database dump
--

-- Dumped from database version 12.3
-- Dumped by pg_dump version 12.3

-- Started on 2020-07-22 19:27:43

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 2925 (class 1262 OID 16630)
-- Name: movies; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE movies WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Portuguese_Brazil.1252' LC_CTYPE = 'Portuguese_Brazil.1252';


ALTER DATABASE movies OWNER TO postgres;

\connect movies

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'WIN1252';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 551 (class 1247 OID 16631)
-- Name: box2d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.box2d;


ALTER TYPE public.box2d OWNER TO postgres;

--
-- TOC entry 552 (class 1247 OID 16632)
-- Name: box2df; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.box2df;


ALTER TYPE public.box2df OWNER TO postgres;

--
-- TOC entry 553 (class 1247 OID 16633)
-- Name: box3d; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.box3d;


ALTER TYPE public.box3d OWNER TO postgres;

--
-- TOC entry 554 (class 1247 OID 16634)
-- Name: geography; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.geography;


ALTER TYPE public.geography OWNER TO postgres;

--
-- TOC entry 640 (class 1247 OID 16635)
-- Name: geometry; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.geometry;


ALTER TYPE public.geometry OWNER TO postgres;

--
-- TOC entry 641 (class 1247 OID 16636)
-- Name: gidx; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.gidx;


ALTER TYPE public.gidx OWNER TO postgres;

--
-- TOC entry 642 (class 1247 OID 16639)
-- Name: histogram; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.histogram AS (
	min double precision,
	max double precision,
	count bigint,
	percent double precision
);


ALTER TYPE public.histogram OWNER TO postgres;

--
-- TOC entry 2926 (class 0 OID 0)
-- Dependencies: 642
-- Name: TYPE histogram; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE public.histogram IS 'postgis raster type: A composite type used as record output of the ST_Histogram and ST_ApproxHistogram functions.';


--
-- TOC entry 645 (class 1247 OID 16640)
-- Name: pgis_abs; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.pgis_abs;


ALTER TYPE public.pgis_abs OWNER TO postgres;

--
-- TOC entry 646 (class 1247 OID 16643)
-- Name: quantile; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.quantile AS (
	quantile double precision,
	value double precision
);


ALTER TYPE public.quantile OWNER TO postgres;

--
-- TOC entry 649 (class 1247 OID 16644)
-- Name: raster; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.raster;


ALTER TYPE public.raster OWNER TO postgres;

--
-- TOC entry 2927 (class 0 OID 0)
-- Dependencies: 649
-- Name: TYPE raster; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE public.raster IS 'postgis raster type: raster spatial data type.';


--
-- TOC entry 650 (class 1247 OID 16647)
-- Name: reclassarg; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.reclassarg AS (
	nband integer,
	reclassexpr text,
	pixeltype text,
	nodataval double precision
);


ALTER TYPE public.reclassarg OWNER TO postgres;

--
-- TOC entry 2928 (class 0 OID 0)
-- Dependencies: 650
-- Name: TYPE reclassarg; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE public.reclassarg IS 'postgis raster type: A composite type used as input into the ST_Reclass function defining the behavior of reclassification.';


--
-- TOC entry 653 (class 1247 OID 16648)
-- Name: spheroid; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.spheroid;


ALTER TYPE public.spheroid OWNER TO postgres;

--
-- TOC entry 654 (class 1247 OID 16651)
-- Name: summarystats; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.summarystats AS (
	count bigint,
	sum double precision,
	mean double precision,
	stddev double precision,
	min double precision,
	max double precision
);


ALTER TYPE public.summarystats OWNER TO postgres;

--
-- TOC entry 2929 (class 0 OID 0)
-- Dependencies: 654
-- Name: TYPE summarystats; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TYPE public.summarystats IS 'postgis raster type: A composite type used as output of the ST_SummaryStats function.';


--
-- TOC entry 657 (class 1247 OID 16654)
-- Name: valuecount; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.valuecount AS (
	value double precision,
	count integer,
	percent double precision
);


ALTER TYPE public.valuecount OWNER TO postgres;

--
-- TOC entry 1704 (class 2753 OID 16655)
-- Name: btree_geography_ops; Type: OPERATOR FAMILY; Schema: public; Owner: postgres
--

CREATE OPERATOR FAMILY public.btree_geography_ops USING btree;


ALTER OPERATOR FAMILY public.btree_geography_ops USING btree OWNER TO postgres;

--
-- TOC entry 1705 (class 2753 OID 16656)
-- Name: btree_geometry_ops; Type: OPERATOR FAMILY; Schema: public; Owner: postgres
--

CREATE OPERATOR FAMILY public.btree_geometry_ops USING btree;


ALTER OPERATOR FAMILY public.btree_geometry_ops USING btree OWNER TO postgres;

--
-- TOC entry 1706 (class 2753 OID 16657)
-- Name: gist_geography_ops; Type: OPERATOR FAMILY; Schema: public; Owner: postgres
--

CREATE OPERATOR FAMILY public.gist_geography_ops USING gist;


ALTER OPERATOR FAMILY public.gist_geography_ops USING gist OWNER TO postgres;

--
-- TOC entry 1707 (class 2753 OID 16658)
-- Name: gist_geometry_ops_2d; Type: OPERATOR FAMILY; Schema: public; Owner: postgres
--

CREATE OPERATOR FAMILY public.gist_geometry_ops_2d USING gist;


ALTER OPERATOR FAMILY public.gist_geometry_ops_2d USING gist OWNER TO postgres;

--
-- TOC entry 1708 (class 2753 OID 16659)
-- Name: gist_geometry_ops_nd; Type: OPERATOR FAMILY; Schema: public; Owner: postgres
--

CREATE OPERATOR FAMILY public.gist_geometry_ops_nd USING gist;


ALTER OPERATOR FAMILY public.gist_geometry_ops_nd USING gist OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 207 (class 1259 OID 16660)
-- Name: actor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.actor (
    act_id integer NOT NULL,
    act_fname character(20),
    act_lname character(20),
    act_gender character(1)
);


ALTER TABLE public.actor OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 16663)
-- Name: director; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.director (
    dir_id integer NOT NULL,
    dir_fname character(20),
    dir_lname character(20)
);


ALTER TABLE public.director OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16666)
-- Name: genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.genres (
    gen_id integer NOT NULL,
    gen_title character(20)
);


ALTER TABLE public.genres OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 16669)
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    location_id numeric(4,0) DEFAULT (0)::numeric NOT NULL,
    street_address character varying(40) DEFAULT NULL::character varying,
    postal_code character varying(12) DEFAULT NULL::character varying,
    city character varying(30) NOT NULL,
    state_province character varying(25) DEFAULT NULL::character varying,
    country_id character varying(2) DEFAULT NULL::character varying
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16747)
-- Name: movie_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movie_id_seq
    START WITH 929
    INCREMENT BY 1
    MINVALUE 929
    MAXVALUE 2147483647
    CACHE 1;


ALTER TABLE public.movie_id_seq OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16677)
-- Name: movie; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie (
    mov_id integer DEFAULT nextval('public.movie_id_seq'::regclass) NOT NULL,
    mov_title character(50),
    mov_year integer,
    mov_time integer,
    mov_lang character(15),
    mov_dt_rel date,
    mov_rel_country character(5)
);


ALTER TABLE public.movie OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 16680)
-- Name: movie_cast; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_cast (
    act_id integer NOT NULL,
    mov_id integer NOT NULL,
    role character(30)
);


ALTER TABLE public.movie_cast OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16683)
-- Name: movie_direction; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_direction (
    dir_id integer NOT NULL,
    mov_id integer NOT NULL
);


ALTER TABLE public.movie_direction OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16686)
-- Name: movie_genres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movie_genres (
    mov_id integer NOT NULL,
    gen_id integer NOT NULL
);


ALTER TABLE public.movie_genres OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16689)
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    mov_id integer NOT NULL,
    rev_id integer NOT NULL,
    rev_stars numeric(4,2),
    num_o_ratings integer
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16692)
-- Name: reviewer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reviewer (
    rev_id integer NOT NULL,
    rev_name character(30)
);


ALTER TABLE public.reviewer OWNER TO postgres;

--
-- TOC entry 2909 (class 0 OID 16660)
-- Dependencies: 207
-- Data for Name: actor; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (101, 'James               ', 'Stewart             ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (102, 'Deborah             ', 'Kerr                ', 'F');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (103, 'Peter               ', 'OToole              ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (104, 'Robert              ', 'De Niro             ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (105, 'F. Murray           ', 'Abraham             ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (106, 'Harrison            ', 'Ford                ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (107, 'Nicole              ', 'Kidman              ', 'F');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (108, 'Stephen             ', 'Baldwin             ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (109, 'Jack                ', 'Nicholson           ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (110, 'Mark                ', 'Wahlberg            ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (111, 'Woody               ', 'Allen               ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (112, 'Claire              ', 'Danes               ', 'F');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (113, 'Tim                 ', 'Robbins             ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (114, 'Kevin               ', 'Spacey              ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (115, 'Kate                ', 'Winslet             ', 'F');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (116, 'Robin               ', 'Williams            ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (117, 'Jon                 ', 'Voight              ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (118, 'Ewan                ', 'McGregor            ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (119, 'Christian           ', 'Bale                ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (120, 'Maggie              ', 'Gyllenhaal          ', 'F');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (121, 'Dev                 ', 'Patel               ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (122, 'Sigourney           ', 'Weaver              ', 'F');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (123, 'David               ', 'Aston               ', 'M');
INSERT INTO public.actor (act_id, act_fname, act_lname, act_gender) VALUES (124, 'Ali                 ', 'Astin               ', 'F');


--
-- TOC entry 2910 (class 0 OID 16663)
-- Dependencies: 208
-- Data for Name: director; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (201, 'Alfred              ', 'Hitchcock           ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (202, 'Jack                ', 'Clayton             ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (203, 'David               ', 'Lean                ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (204, 'Michael             ', 'Cimino              ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (205, 'Milos               ', 'Forman              ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (206, 'Ridley              ', 'Scott               ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (207, 'Stanley             ', 'Kubrick             ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (208, 'Bryan               ', 'Singer              ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (209, 'Roman               ', 'Polanski            ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (210, 'Paul                ', 'Thomas Anderson     ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (211, 'Woody               ', 'Allen               ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (212, 'Hayao               ', 'Miyazaki            ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (213, 'Frank               ', 'Darabont            ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (214, 'Sam                 ', 'Mendes              ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (215, 'James               ', 'Cameron             ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (216, 'Gus                 ', 'Van Sant            ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (217, 'John                ', 'Boorman             ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (218, 'Danny               ', 'Boyle               ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (219, 'Christopher         ', 'Nolan               ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (220, 'Richard             ', 'Kelly               ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (221, 'Kevin               ', 'Spacey              ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (222, 'Andrei              ', 'Tarkovsky           ');
INSERT INTO public.director (dir_id, dir_fname, dir_lname) VALUES (223, 'Peter               ', 'Jackson             ');


--
-- TOC entry 2911 (class 0 OID 16666)
-- Dependencies: 209
-- Data for Name: genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.genres (gen_id, gen_title) VALUES (1001, 'Action              ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1002, 'Adventure           ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1003, 'Animation           ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1004, 'Biography           ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1005, 'Comedy              ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1006, 'Crime               ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1007, 'Drama               ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1008, 'Horror              ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1009, 'Music               ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1010, 'Mystery             ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1011, 'Romance             ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1012, 'Thriller            ');
INSERT INTO public.genres (gen_id, gen_title) VALUES (1013, 'War                 ');


--
-- TOC entry 2912 (class 0 OID 16669)
-- Dependencies: 210
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1000, '1297 Via Cola di Rie', '989', 'Roma', '', 'IT');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1100, '93091 Calle della Testa', '10934', 'Venice', '', 'IT');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1200, '2017 Shinjuku-ku', '1689', 'Tokyo', 'Tokyo Prefecture', 'JP');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1300, '9450 Kamiya-cho', '6823', 'Hiroshima', '', 'JP');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1400, '2014 Jabberwocky Rd', '26192', 'Southlake', 'Texas', 'US');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1500, '2011 Interiors Blvd', '99236', 'South San Francisco', 'California', 'US');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1600, '2007 Zagora St', '50090', 'South Brunswick', 'New Jersey', 'US');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1700, '2004 Charade Rd', '98199', 'Seattle', 'Washington', 'US');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1800, '147 Spadina Ave', 'M5V 2L7', 'Toronto', 'Ontario', 'CA');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (1900, '6092 Boxwood St', 'YSW 9T2', 'Whitehorse', 'Yukon', 'CA');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2000, '40-5-12 Laogianggen', '190518', 'Beijing', '', 'CN');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2100, '1298 Vileparle (E)', '490231', 'Bombay', 'Maharashtra', 'IN');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2200, '12-98 Victoria Street', '2901', 'Sydney', 'New South Wales', 'AU');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2300, '198 Clementi North', '540198', 'Singapore', '', 'SG');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2400, '8204 Arthur St', '', 'London', '', 'UK');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2500, '"Magdalen Centre', ' The Oxford ', 'OX9 9ZB', 'Oxford', 'Ox');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2600, '9702 Chester Road', '9629850293', 'Stretford', 'Manchester', 'UK');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2700, 'Schwanthalerstr. 7031', '80925', 'Munich', 'Bavaria', 'DE');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2800, 'Rua Frei Caneca 1360', '01307-002', 'Sao Paulo', 'Sao Paulo', 'BR');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (2900, '20 Rue des Corps-Saints', '1730', 'Geneva', 'Geneve', 'CH');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (3000, 'Murtenstrasse 921', '3095', 'Bern', 'BE', 'CH');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (3100, 'Pieter Breughelstraat 837', '3029SK', 'Utrecht', 'Utrecht', 'NL');
INSERT INTO public.locations (location_id, street_address, postal_code, city, state_province, country_id) VALUES (3200, 'Mariano Escobedo 9991', '11932', 'Mexico City', '"Distrito Federal', '"');


--
-- TOC entry 2913 (class 0 OID 16677)
-- Dependencies: 211
-- Data for Name: movie; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (901, 'Vertigo                                           ', 1958, 128, 'English        ', '1958-08-24', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (902, 'The Innocents                                     ', 1961, 100, 'English        ', '1962-02-19', 'SW   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (903, 'Lawrence of Arabia                                ', 1962, 216, 'English        ', '1962-12-11', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (904, 'The Deer Hunter                                   ', 1978, 183, 'English        ', '1979-03-08', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (905, 'Amadeus                                           ', 1984, 160, 'English        ', '1985-01-07', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (906, 'Blade Runner                                      ', 1982, 117, 'English        ', '1982-09-09', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (907, 'Eyes Wide Shut                                    ', 1999, 159, 'English        ', NULL, 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (908, 'The Usual Suspects                                ', 1995, 106, 'English        ', '1995-08-25', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (909, 'Chinatown                                         ', 1974, 130, 'English        ', '1974-08-09', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (910, 'Boogie Nights                                     ', 1997, 155, 'English        ', '1998-02-16', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (911, 'Annie Hall                                        ', 1977, 93, 'English        ', '1977-04-20', 'USA  ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (912, 'Princess Mononoke                                 ', 1997, 134, 'Japanese       ', '2001-10-19', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (913, 'The Shawshank Redemption                          ', 1994, 142, 'English        ', '1995-02-17', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (914, 'American Beauty                                   ', 1999, 122, 'English        ', NULL, 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (915, 'Titanic                                           ', 1997, 194, 'English        ', '1998-01-23', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (916, 'Good Will Hunting                                 ', 1997, 126, 'English        ', '1998-06-03', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (917, 'Deliverance                                       ', 1972, 109, 'English        ', '1982-10-05', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (918, 'Trainspotting                                     ', 1996, 94, 'English        ', '1996-02-23', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (919, 'The Prestige                                      ', 2006, 130, 'English        ', '2006-11-10', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (920, 'Donnie Darko                                      ', 2001, 113, 'English        ', NULL, 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (921, 'Slumdog Millionaire                               ', 2008, 120, 'English        ', '2009-01-09', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (922, 'Aliens                                            ', 1986, 137, 'English        ', '1986-08-29', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (923, 'Beyond the Sea                                    ', 2004, 118, 'English        ', '2004-11-26', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (924, 'Avatar                                            ', 2009, 162, 'English        ', '2009-12-17', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (926, 'Seven Samurai                                     ', 1954, 207, 'Japanese       ', '1954-04-26', 'JP   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (927, 'Spirited Away                                     ', 2001, 125, 'Japanese       ', '2003-09-12', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (928, 'Back to the Future                                ', 1985, 116, 'English        ', '1985-12-04', 'UK   ');
INSERT INTO public.movie (mov_id, mov_title, mov_year, mov_time, mov_lang, mov_dt_rel, mov_rel_country) VALUES (925, 'Braveheart                                        ', 1995, 178, 'English        ', '1995-09-08', 'UK   ');


--
-- TOC entry 2914 (class 0 OID 16680)
-- Dependencies: 212
-- Data for Name: movie_cast; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (101, 901, 'John Scottie Ferguson         ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (102, 902, 'Miss Giddens                  ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (103, 903, 'T.E. Lawrence                 ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (104, 904, 'Michael                       ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (105, 905, 'Antonio Salieri               ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (106, 906, 'Rick Deckard                  ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (107, 907, 'Alice Harford                 ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (108, 908, 'McManus                       ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (110, 910, 'Eddie Adams                   ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (111, 911, 'Alvy Singer                   ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (112, 912, 'San                           ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (113, 913, 'Andy Dufresne                 ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (114, 914, 'Lester Burnham                ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (115, 915, 'Rose DeWitt Bukater           ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (116, 916, 'Sean Maguire                  ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (117, 917, 'Ed                            ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (118, 918, 'Renton                        ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (120, 920, 'Elizabeth Darko               ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (121, 921, 'Older Jamal                   ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (122, 922, 'Ripley                        ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (114, 923, 'Bobby Darin                   ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (109, 909, 'J.J. Gittes                   ');
INSERT INTO public.movie_cast (act_id, mov_id, role) VALUES (119, 919, 'Alfred Borden                 ');


--
-- TOC entry 2915 (class 0 OID 16683)
-- Dependencies: 213
-- Data for Name: movie_direction; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (201, 901);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (202, 902);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (203, 903);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (204, 904);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (205, 905);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (206, 906);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (207, 907);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (208, 908);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (209, 909);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (210, 910);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (211, 911);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (212, 912);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (213, 913);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (214, 914);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (215, 915);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (216, 916);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (217, 917);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (218, 918);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (219, 919);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (220, 920);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (218, 921);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (215, 922);
INSERT INTO public.movie_direction (dir_id, mov_id) VALUES (221, 923);


--
-- TOC entry 2916 (class 0 OID 16686)
-- Dependencies: 214
-- Data for Name: movie_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (922, 1001);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (917, 1002);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (903, 1002);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (912, 1003);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (911, 1005);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (908, 1006);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (913, 1006);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (926, 1007);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (928, 1007);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (918, 1007);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (921, 1007);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (902, 1008);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (923, 1009);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (907, 1010);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (927, 1010);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (901, 1010);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (914, 1011);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (906, 1012);
INSERT INTO public.movie_genres (mov_id, gen_id) VALUES (904, 1013);


--
-- TOC entry 2917 (class 0 OID 16689)
-- Dependencies: 215
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (901, 9001, 8.40, 263575);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (902, 9002, 7.90, 20207);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (903, 9003, 8.30, 202778);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (906, 9005, 8.20, 484746);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (924, 9006, 7.30, NULL);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (908, 9007, 8.60, 779489);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (909, 9008, NULL, 227235);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (910, 9009, 3.00, 195961);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (911, 9010, 8.10, 203875);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (912, 9011, 8.40, NULL);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (914, 9013, 7.00, 862618);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (915, 9001, 7.70, 830095);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (916, 9014, 4.00, 642132);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (925, 9015, 7.70, 81328);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (918, 9016, NULL, 580301);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (920, 9017, 8.10, 609451);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (921, 9018, 8.00, 667758);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (922, 9019, 8.40, 511613);
INSERT INTO public.rating (mov_id, rev_id, rev_stars, num_o_ratings) VALUES (923, 9020, 6.70, 13091);


--
-- TOC entry 2918 (class 0 OID 16692)
-- Dependencies: 216
-- Data for Name: reviewer; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9001, 'Righty Sock                   ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9002, 'Jack Malvern                  ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9003, 'Flagrant Baronessa            ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9004, 'Alec Shaw                     ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9005, NULL);
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9006, 'Victor Woeltjen               ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9007, 'Simon Wright                  ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9008, 'Neal Wruck                    ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9009, 'Paul Monks                    ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9010, 'Mike Salvati                  ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9011, NULL);
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9012, 'Wesley S. Walker              ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9013, 'Sasha Goldshtein              ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9014, 'Josh Cates                    ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9015, 'Krug Stillo                   ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9016, 'Scott LeBrun                  ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9017, 'Hannah Steele                 ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9018, 'Vincent Cadena                ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9019, 'Brandt Sponseller             ');
INSERT INTO public.reviewer (rev_id, rev_name) VALUES (9020, 'Richard Adams                 ');


--
-- TOC entry 2930 (class 0 OID 0)
-- Dependencies: 217
-- Name: movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movie_id_seq', 929, false);


--
-- TOC entry 2764 (class 2606 OID 16696)
-- Name: actor actor_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.actor
    ADD CONSTRAINT actor_pkey PRIMARY KEY (act_id);


--
-- TOC entry 2766 (class 2606 OID 16698)
-- Name: director director_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.director
    ADD CONSTRAINT director_pkey PRIMARY KEY (dir_id);


--
-- TOC entry 2768 (class 2606 OID 16700)
-- Name: genres genres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.genres
    ADD CONSTRAINT genres_pkey PRIMARY KEY (gen_id);


--
-- TOC entry 2770 (class 2606 OID 16702)
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (location_id);


--
-- TOC entry 2772 (class 2606 OID 16704)
-- Name: movie movie_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie
    ADD CONSTRAINT movie_pkey PRIMARY KEY (mov_id);


--
-- TOC entry 2774 (class 2606 OID 16706)
-- Name: reviewer reviewer_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reviewer
    ADD CONSTRAINT reviewer_pkey PRIMARY KEY (rev_id);


--
-- TOC entry 2775 (class 2606 OID 16707)
-- Name: movie_cast movie_cast_act_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_cast
    ADD CONSTRAINT movie_cast_act_id_fkey FOREIGN KEY (act_id) REFERENCES public.actor(act_id);


--
-- TOC entry 2776 (class 2606 OID 16712)
-- Name: movie_cast movie_cast_mov_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_cast
    ADD CONSTRAINT movie_cast_mov_id_fkey FOREIGN KEY (mov_id) REFERENCES public.movie(mov_id);


--
-- TOC entry 2777 (class 2606 OID 16717)
-- Name: movie_direction movie_direction_dir_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_direction
    ADD CONSTRAINT movie_direction_dir_id_fkey FOREIGN KEY (dir_id) REFERENCES public.director(dir_id);


--
-- TOC entry 2778 (class 2606 OID 16722)
-- Name: movie_direction movie_direction_mov_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_direction
    ADD CONSTRAINT movie_direction_mov_id_fkey FOREIGN KEY (mov_id) REFERENCES public.movie(mov_id);


--
-- TOC entry 2779 (class 2606 OID 16727)
-- Name: movie_genres movie_genres_gen_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_gen_id_fkey FOREIGN KEY (gen_id) REFERENCES public.genres(gen_id);


--
-- TOC entry 2780 (class 2606 OID 16732)
-- Name: movie_genres movie_genres_mov_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movie_genres
    ADD CONSTRAINT movie_genres_mov_id_fkey FOREIGN KEY (mov_id) REFERENCES public.movie(mov_id);


--
-- TOC entry 2781 (class 2606 OID 16737)
-- Name: rating rating_mov_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_mov_id_fkey FOREIGN KEY (mov_id) REFERENCES public.movie(mov_id);


--
-- TOC entry 2782 (class 2606 OID 16742)
-- Name: rating rating_rev_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT rating_rev_id_fkey FOREIGN KEY (rev_id) REFERENCES public.reviewer(rev_id);


-- Completed on 2020-07-22 19:27:44

--
-- PostgreSQL database dump complete
--

