--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: energy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.energy (
    energy_id integer NOT NULL,
    name character varying(20) NOT NULL,
    description character(1),
    forumla character(1)
);


ALTER TABLE public.energy OWNER TO freecodecamp;

--
-- Name: energy_energy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.energy_energy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.energy_energy_id_seq OWNER TO freecodecamp;

--
-- Name: energy_energy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.energy_energy_id_seq OWNED BY public.energy.energy_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30),
    description text,
    age_in_billion_of_years numeric NOT NULL,
    star_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30),
    description text,
    has_life boolean,
    age_in_million_of_years numeric NOT NULL,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq OWNER TO freecodecamp;

--
-- Name: id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.id_seq OWNED BY public.moon.moon_id;


--
-- Name: id_seq2; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.id_seq2
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_seq2 OWNER TO freecodecamp;

--
-- Name: id_seq2; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.id_seq2 OWNED BY public.galaxy.galaxy_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean,
    age_in_million_of_years numeric,
    distance_from_earth integer,
    distance_from_sun integer,
    moon_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: my_serial; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.my_serial
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_serial OWNER TO freecodecamp;

--
-- Name: my_serial; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.my_serial OWNED BY public.planet.planet_id;


--
-- Name: my_serial2; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.my_serial2
    AS integer
    START WITH 3
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_serial2 OWNER TO freecodecamp;

--
-- Name: my_serial2; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.my_serial2 OWNED BY public.planet.planet_id;


--
-- Name: my_serial3; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.my_serial3
    AS integer
    START WITH 4
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.my_serial3 OWNER TO freecodecamp;

--
-- Name: my_serial3; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.my_serial3 OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    stellar_classification character varying(15)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.seq OWNER TO freecodecamp;

--
-- Name: seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.seq OWNED BY public.star.star_id;


--
-- Name: energy energy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.energy ALTER COLUMN energy_id SET DEFAULT nextval('public.energy_energy_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.id_seq2'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.my_serial3'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.seq'::regclass);


--
-- Data for Name: energy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.energy VALUES (1, 'Electric', NULL, NULL);
INSERT INTO public.energy VALUES (2, 'Gravitational', NULL, NULL);
INSERT INTO public.energy VALUES (3, 'Magnetic', NULL, NULL);
INSERT INTO public.energy VALUES (4, 'Chemical', NULL, NULL);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'IOK-1', NULL, 12.88, NULL);
INSERT INTO public.galaxy VALUES (2, 'GN-108036', NULL, 12.9, NULL);
INSERT INTO public.galaxy VALUES (3, 'SXDF-NB1006-2', NULL, 12.91, NULL);
INSERT INTO public.galaxy VALUES (4, 'GN-z11', NULL, 13.4, NULL);
INSERT INTO public.galaxy VALUES (5, 'Milky Way', NULL, 13.6, NULL);
INSERT INTO public.galaxy VALUES (6, 'LMC', NULL, 1.1, NULL);
INSERT INTO public.galaxy VALUES (7, 'Andromeda', NULL, 2.5, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 'is the only moon of the planet earth', false, 4.5, 1);
INSERT INTO public.moon VALUES (2, 'Phobos', NULL, false, 4.5, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', NULL, false, 4.5, 2);
INSERT INTO public.moon VALUES (4, 'Io', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (5, 'Europa', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (6, 'Ganymed', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (7, 'Kallisto', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (8, 'Amalthea', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (9, 'Himalia', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (10, 'Elara', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (11, 'Pasipahe', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (12, 'Sinope', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (13, 'Lysithea', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (14, 'Carme', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (15, 'Ananke', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (16, 'Leda', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (17, 'Thebe', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (18, 'Adrastea', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (19, 'Metis', NULL, false, 4.6, 3);
INSERT INTO public.moon VALUES (20, 'Callirrhoe', NULL, false, 4.6, 3);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, ' Earth', 'is planet earth', true, 4.5, 0, 150, NULL);
INSERT INTO public.planet VALUES (2, 'Mars', NULL, false, 4.6, 54, 230, NULL);
INSERT INTO public.planet VALUES (3, 'Jupiter', NULL, false, 4.6, 588, 780, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, false, NULL, NULL, 778, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, false, NULL, NULL, 1427, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, false, NULL, NULL, 2871, NULL);
INSERT INTO public.planet VALUES (8, 'Neptun', NULL, false, NULL, NULL, 4497, NULL);
INSERT INTO public.planet VALUES (9, 'Ceres', NULL, false, NULL, NULL, 414, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-16b', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'CoRoT 7b', NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-186f', NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'UY Scuti', NULL, 5, NULL);
INSERT INTO public.star VALUES (2, 'BY Canis Majoris', NULL, 5, NULL);
INSERT INTO public.star VALUES (3, 'RW Cephei', NULL, 5, NULL);
INSERT INTO public.star VALUES (4, 'V354 Cephei', NULL, 5, NULL);
INSERT INTO public.star VALUES (5, 'HD 7853', NULL, 7, NULL);
INSERT INTO public.star VALUES (6, 'ET And', NULL, 7, NULL);


--
-- Name: energy_energy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.energy_energy_id_seq', 4, true);


--
-- Name: id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.id_seq', 20, true);


--
-- Name: id_seq2; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.id_seq2', 7, true);


--
-- Name: my_serial; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.my_serial', 2, true);


--
-- Name: my_serial2; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.my_serial2', 3, true);


--
-- Name: my_serial3; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.my_serial3', 12, true);


--
-- Name: seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.seq', 6, true);


--
-- Name: energy energy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.energy
    ADD CONSTRAINT energy_name_key UNIQUE (name);


--
-- Name: energy energy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.energy
    ADD CONSTRAINT energy_pkey PRIMARY KEY (energy_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: star name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT name UNIQUE (name);


--
-- Name: planet planet_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_key UNIQUE (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

