--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    description text,
    star_id integer,
    age_in_millions_of_years integer,
    galaxy_types text,
    has_black_hole boolean,
    distance_from_earth numeric,
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(50) NOT NULL,
    description text NOT NULL,
    is_common boolean DEFAULT true NOT NULL
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying NOT NULL,
    planet_id integer,
    description text,
    is_spherical boolean,
    has_atmosphere boolean DEFAULT false NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth numeric(20,4),
    radius_km integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying NOT NULL,
    star_id integer,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    description text,
    age_in_millions_of_years integer,
    num_moons integer DEFAULT 0 NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq1; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq1
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq1 OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq1 OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_id integer,
    distance_from_earth integer,
    description text,
    age_in_millions_of_years integer NOT NULL,
    is_spherical boolean DEFAULT true NOT NULL,
    luminosity integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq1'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our home galaxy, a barred spiral galaxy', NULL, 13600, NULL, true, 0.00, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Nearest spiral galaxy to the Milky Way', NULL, 10000, NULL, true, 2537000.00, 1);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic', 'Satellite galaxy of the Milky Way', NULL, 1100, NULL, false, 163000.00, 3);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic', 'Dwarf irregular galaxy near Milky Way', NULL, 6500, NULL, false, 200000.00, 3);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 'Notable for its active galactic nucleus', NULL, 13270, NULL, true, 13690000.00, 2);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Third-largest member of the Local Group', NULL, 10000, NULL, false, 2730000.00, 1);
INSERT INTO public.galaxy VALUES (7, 'Whirlpool', 'Classic grand design spiral galaxy', NULL, 400, NULL, true, 23160000.00, 1);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral', 'Flat, rotating discs with a central bulge and spiral arms', true);
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical', 'Smooth, featureless light distribution and ellipsoidal shape', true);
INSERT INTO public.galaxy_type VALUES (3, 'Irregular', 'No definite form; neither spiral nor elliptical', false);
INSERT INTO public.galaxy_type VALUES (4, 'Lenticular', 'Disc-shaped with no spiral arms, intermediate type', false);
INSERT INTO public.galaxy_type VALUES (5, 'Dwarf', 'Small galaxies with only a few billion stars', true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (41, 'Moon', 3, 'Earth''s only natural satellite', true, true, 4500, 384400.0000, 1737);
INSERT INTO public.moon VALUES (42, 'Phobos', 4, 'Larger moon of Mars, heavily cratered', false, false, 4500, 225940000.0000, 11);
INSERT INTO public.moon VALUES (43, 'Deimos', 4, 'Smaller moon of Mars, irregular shape', false, false, 4500, 225980000.0000, 6);
INSERT INTO public.moon VALUES (44, 'Io', 5, 'Most volcanically active body in Solar System', true, true, 4500, 629000000.0000, 1821);
INSERT INTO public.moon VALUES (45, 'Europa', 5, 'Likely harbors a subsurface ocean', true, false, 4500, 629000000.0000, 1560);
INSERT INTO public.moon VALUES (46, 'Ganymede', 5, 'Largest moon in the Solar System', true, true, 4500, 629000000.0000, 2634);
INSERT INTO public.moon VALUES (47, 'Callisto', 5, 'Most heavily cratered object in Solar System', true, false, 4500, 629000000.0000, 2410);
INSERT INTO public.moon VALUES (48, 'Amalthea', 5, 'Small inner moon of Jupiter', false, false, 4500, 629010000.0000, 83);
INSERT INTO public.moon VALUES (49, 'Titan', 6, 'Largest moon of Saturn, has thick atmosphere', true, true, 4500, 1277000000.0000, 2576);
INSERT INTO public.moon VALUES (50, 'Enceladus', 6, 'Geysers of water ice erupting from surface', true, true, 4500, 1277000000.0000, 252);
INSERT INTO public.moon VALUES (51, 'Mimas', 6, 'Has a large impact crater resembling Death Star', true, false, 4500, 1277000000.0000, 198);
INSERT INTO public.moon VALUES (52, 'Rhea', 6, 'Second largest moon of Saturn', true, false, 4500, 1277000000.0000, 764);
INSERT INTO public.moon VALUES (53, 'Dione', 6, 'Has wispy terrain on its trailing side', true, false, 4500, 1277000000.0000, 561);
INSERT INTO public.moon VALUES (54, 'Tethys', 6, 'Has a large canyon system', true, false, 4500, 1277000000.0000, 531);
INSERT INTO public.moon VALUES (55, 'Miranda', 7, 'Smallest and innermost of Uranus major moons', true, false, 4500, 2724000000.0000, 235);
INSERT INTO public.moon VALUES (56, 'Ariel', 7, 'Brightest of Uranus''s moons', true, false, 4500, 2724000000.0000, 578);
INSERT INTO public.moon VALUES (57, 'Umbriel', 7, 'Darkest of Uranus''s major moons', true, false, 4500, 2724000000.0000, 584);
INSERT INTO public.moon VALUES (58, 'Titania', 7, 'Largest moon of Uranus', true, false, 4500, 2724000000.0000, 788);
INSERT INTO public.moon VALUES (59, 'Triton', 8, 'Largest moon of Neptune, retrograde orbit', true, true, 4500, 4351400000.0000, 1353);
INSERT INTO public.moon VALUES (60, 'Proteus', 8, 'Second largest moon of Neptune', false, false, 4500, 4351400000.0000, 209);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('Jupiter', 1, false, true, 628700000.0000, 'Largest planet in the Solar System', 4503, 95, 29);
INSERT INTO public.planet VALUES ('Uranus', 1, false, true, 2724000000.0000, 'Rotates on its side', 4503, 27, 31);
INSERT INTO public.planet VALUES ('Neptune', 1, false, true, 4351400000.0000, 'Farthest known planet from the Sun', 4503, 16, 32);
INSERT INTO public.planet VALUES ('Proxima b', 2, false, true, 24900000000.0000, 'Potentially habitable exoplanet in habitable zone', 4850, 0, 33);
INSERT INTO public.planet VALUES ('Kepler-22b', 3, false, true, 620000000000.0000, 'Super-Earth in the habitable zone of Kepler-22', 200, 0, 35);
INSERT INTO public.planet VALUES ('Sirius Db', 3, false, true, 814000000000.0000, 'Hypothetical planet orbiting Sirius', 200, 0, 36);
INSERT INTO public.planet VALUES ('Mercury', 1, false, true, 91700000.0000, 'Smallest planet, closest to the Sun', 4500, 0, 5);
INSERT INTO public.planet VALUES ('Venus', 1, false, true, 261000000.0000, 'Hottest planet, dense atmosphere', 4503, 0, 6);
INSERT INTO public.planet VALUES ('Earth', 1, true, true, 0.0000, 'Only known planet with life', 4543, 1, 7);
INSERT INTO public.planet VALUES ('Saturn', 1, false, true, 1275000000.0000, 'Known for its prominent ring system', 4503, 83, 3);
INSERT INTO public.planet VALUES ('Proxima c', 2, false, true, 24900000000.0000, 'Second planet candidate of Proxima Centauri', 4850, 0, 4);
INSERT INTO public.planet VALUES ('Mars', 1, false, true, 225000000.0000, 'The Red Planet, has the largest volcano', 4503, 2, 8);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 0, 'The star at the center of our Solar System', 4600, true, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 4, 'Nearest known star to the Sun', 4850, true, 0);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 9, 'Brightest star in the night sky', 200, true, 25);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 700, 'Red supergiant in Orion constellation', 8, true, 100000);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 860, 'Blue supergiant, brightest star in Orion', 8, true, 120000);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 1, 4, 'Triple star system, closest to Solar System', 5000, true, 1);
INSERT INTO public.star VALUES (7, 'Vega', 1, 25, 'Brightest star in Lyra constellation', 455, true, 40);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 5, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 60, true);


--
-- Name: planet_planet_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq1', 36, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_id_distinct; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_id_distinct UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_id_distinct; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_id_distinct UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_id_distinct; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_id_distinct UNIQUE (star_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: galaxy galaxy_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

