--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: celestial_bodies; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_bodies (
    celestial_bodies_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.celestial_bodies OWNER TO freecodecamp;

--
-- Name: celestial_bodies_celestial_bodies_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_bodies_celestial_bodies_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_bodies_celestial_bodies_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_bodies_celestial_bodies_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_bodies_celestial_bodies_id_seq OWNED BY public.celestial_bodies.celestial_bodies_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    description text,
    discovered_by character varying(30),
    discovery_date date
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_km integer,
    discovered_by character varying(30),
    discovery_date date,
    planet_id integer NOT NULL
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
-- Name: moon_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_planet_id_seq OWNER TO freecodecamp;

--
-- Name: moon_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_planet_id_seq OWNED BY public.moon.planet_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(30),
    diameter_in_km integer,
    has_rings boolean,
    has_human_stuff boolean,
    star_id integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_star_id_seq OWNER TO freecodecamp;

--
-- Name: planet_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_star_id_seq OWNED BY public.planet.star_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    diameter_in_millions_km numeric,
    discovered_by character varying(30),
    discovery_date date,
    galaxy_id integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: star_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_galaxy_id_seq OWNED BY public.star.galaxy_id;


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
-- Name: celestial_bodies celestial_bodies_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies ALTER COLUMN celestial_bodies_id SET DEFAULT nextval('public.celestial_bodies_celestial_bodies_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: moon planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN planet_id SET DEFAULT nextval('public.moon_planet_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN star_id SET DEFAULT nextval('public.planet_star_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: star galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN galaxy_id SET DEFAULT nextval('public.star_galaxy_id_seq'::regclass);


--
-- Data for Name: celestial_bodies; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_bodies VALUES (1, 'Galaxy', 'A galaxy is a huge collection of gas, dust, and billions of stars and their solar systems, all held together by gravity.');
INSERT INTO public.celestial_bodies VALUES (2, 'Star', 'Stars are giant balls of hot gas – mostly hydrogen, with some helium and small amounts of other elements. Every star has its own life cycle, ranging from a few million to trillions of years, and its properties change as it ages.');
INSERT INTO public.celestial_bodies VALUES (3, 'Planet', 'A planet is a large object that orbits a star. To be a planet, an object must be massive enough for gravity to have squeezed it into a spherical, or round, shape,. It must also be large enough for gravity to have swept up any rocky or icy objects from its path, or orbit, around the star.');
INSERT INTO public.celestial_bodies VALUES (4, 'Moon (satellite)', 'A satellite is an object that moves around a larger object. Earth is a satellite because it moves around the sun. The moon is a satellite because it moves around Earth. Earth and the moon are called “natural” satellites. But usually when someone says “satellite,” they are talking about a “man-made” satellite.');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky way', 'Spiral', 'The Milky way is a huge collection of stars, dust and gas. It is called a spiral gallaxy because if you could
 view it from the top or bottom, it would look like a spinning pinwheel. The Sun is located on one of the spir
al arms, about 25000 light-yearsaway from the center of the galaxy.', 'Galileo Galilei', '1610-01-01');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 'Andromeda, also known as Messier 31 (M31), is a spiral galaxy located about 2.5 million light years away. It is thought that the Mily way and Andromeda will collide several billion years from now. The black holes located in both galaxies will then reside in the large, elliptcial galaxy that results from this merger', 'Simon Marius', '1612-01-01');
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Spiral', 'The Whirlpool galaxy (also known as Messier 51, M51, or NGC 5194) is a classic spiral galaxy located in the Canes Venatici constellation.', 'Charles Messier', '1773-10-13');
INSERT INTO public.galaxy VALUES (4, 'Cigar', 'Starbust', 'Messier 82 (also known as NGC 3034, Cigar Galaxy or M82) is a starburst galaxy approximately 12 million light-years away in the constellation Ursa Major.', 'Johann Elert Blode', '1774-01-01');
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 'Also known as the Pinwheel Galaxy, it is a spiral galaxy located 6.6 megaparsecs (21.5 million light-years) from Earth and is located in the constellation Ursa Major. Spiral galaxies have multiple arms that extend from the central bulge and appear as spirals because of their rotation.', 'Pierre Mechain', '1781-01-01');
INSERT INTO public.galaxy VALUES (6, 'Sombrero', 'Spiral', 'Looking like a broad-brimmed Mexican hat, the Sombrero galaxy, M104, is a spiral galaxy seen nearly edge-on. This stunning Hubble image of
 M104, also known as the Sombrero galaxy, is one of the largest mosaics ever assembled from Hubble observations.', 'Pierre Mechain', '1781-05-11');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 3474, NULL, NULL, 1);
INSERT INTO public.moon VALUES (3, 'Phobos', 22533, 'Asaph Hall', '1877-08-17', 2);
INSERT INTO public.moon VALUES (4, 'Deimos', 12, 'Asaph Hall', '1877-08-11', 2);
INSERT INTO public.moon VALUES (5, 'Charon', 1212, 'James Christy, R. Harrington', '1978-06-22', 3);
INSERT INTO public.moon VALUES (6, 'Nix', 50, 'Alan Stern and a lot of people', '2005-05-15', 3);
INSERT INTO public.moon VALUES (7, 'Styx', 25, 'Mark Showalter', '2012-06-26', 3);
INSERT INTO public.moon VALUES (8, 'Kerberos', 19, 'Mark Showalter', '2011-06-28', 3);
INSERT INTO public.moon VALUES (9, 'Hydra', 51, 'Marc Buie', '2005-05-15', 3);
INSERT INTO public.moon VALUES (10, 'Titan', 5150, 'Christiaan Huygens', '1655-03-25', 4);
INSERT INTO public.moon VALUES (11, 'Enceladus', 504, 'William Herschel', '1789-08-28', 4);
INSERT INTO public.moon VALUES (12, 'Iapetus', 1470, 'Giovanni Cassini', '1671-10-25', 4);
INSERT INTO public.moon VALUES (13, 'Mimas', 396, 'William Herschel', '1789-09-17', 4);
INSERT INTO public.moon VALUES (14, 'Tethys', 1062, 'Giovanni Cassini', '1684-03-11', 4);
INSERT INTO public.moon VALUES (15, 'Telesto', 24, 'Bradford A. Smith', '1980-04-08', 4);
INSERT INTO public.moon VALUES (16, 'Titania', 1576, 'William Herschel', '1787-01-11', 5);
INSERT INTO public.moon VALUES (17, 'Umbriel', 1169, 'William Lassell', '1851-10-24', 5);
INSERT INTO public.moon VALUES (18, 'Obreron', 1522, 'William Herschel', '1787-01-11', 5);
INSERT INTO public.moon VALUES (19, 'Ariel', 1157, 'William Lassell', '1851-10-24', 5);
INSERT INTO public.moon VALUES (21, 'Miranda', 471, 'Gerard P. Kuiper', '1948-02-16', 5);
INSERT INTO public.moon VALUES (22, 'Puck', 162, 'Voyager 2 spacecraft', '1985-12-30', 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Terrestrial/Rocky', 12742, false, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial/Rocky', 6779, false, true, 1);
INSERT INTO public.planet VALUES (3, 'Pluto', 'Dwarf', 2376, false, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 'Gas giant', 120536, true, false, 1);
INSERT INTO public.planet VALUES (5, 'Uranus', 'Ice giant', 50724, true, false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice giant', 49244, true, false, 1);
INSERT INTO public.planet VALUES (7, 'Venus', 'Terrestrial/Rocky', 12104, false, true, 1);
INSERT INTO public.planet VALUES (8, 'Mercury', 'Terrestrial/Rocky', 4879, false, true, 1);
INSERT INTO public.planet VALUES (9, 'Kepler-186f', 'Super Earth exoplanet', 14908, NULL, false, 1);
INSERT INTO public.planet VALUES (10, '14 Herculis b', 'Gas giant exoplanet', NULL, NULL, NULL, 2);
INSERT INTO public.planet VALUES (11, '51 Pegasi b', 'Gas giant exoplanet', NULL, NULL, NULL, 3);
INSERT INTO public.planet VALUES (12, 'Gliese 581c', 'Neptune-like exoplanet', NULL, NULL, NULL, 4);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1.4, NULL, NULL, 1);
INSERT INTO public.star VALUES (2, 'Alpheratz', 4.2, 'William Herschel', '1781-07-21', 2);
INSERT INTO public.star VALUES (3, 'Mirach', NULL, 'William Herschel', '1784-01-01', 2);
INSERT INTO public.star VALUES (4, 'Upsilon Andromedae', NULL, 'Geoffrey Marcy, R. Paul Butler', '1999-04-15', 2);
INSERT INTO public.star VALUES (5, 'Delta Andromedae', NULL, NULL, NULL, 2);
INSERT INTO public.star VALUES (6, '51 Andromedae', NULL, NULL, NULL, 2);


--
-- Name: celestial_bodies_celestial_bodies_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_bodies_celestial_bodies_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: moon_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_planet_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_star_id_seq', 4, true);


--
-- Name: star_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_galaxy_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_bodies celestial_bodies_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_name_key UNIQUE (name);


--
-- Name: celestial_bodies celestial_bodies_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_bodies
    ADD CONSTRAINT celestial_bodies_pkey PRIMARY KEY (celestial_bodies_id);


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
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


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
-- Name: star galaxy_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT galaxy_id FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon planet_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT planet_id FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet star_id; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT star_id FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

