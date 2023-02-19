--
-- PostgreSQL database dump
--

-- Dumped from database version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)
-- Dumped by pg_dump version 15.1 (Ubuntu 15.1-1.pgdg22.04+1)

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
-- Name: admins; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.admins (
    name character varying(250) NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    admin_id integer,
    email character varying(250) NOT NULL
);


ALTER TABLE public.admins OWNER TO postgres;

--
-- Name: schools; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.schools (
    name character varying(250) NOT NULL,
    school_id integer NOT NULL,
    created_on timestamp without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    email character varying(250) NOT NULL
);


ALTER TABLE public.schools OWNER TO postgres;

--
-- Name: schools_school_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.schools_school_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.schools_school_id_seq OWNER TO postgres;

--
-- Name: schools_school_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.schools_school_id_seq OWNED BY public.schools.school_id;


--
-- Name: teacher_options; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teacher_options (
    teaching_exp character varying(250),
    salary_expectations character varying(250),
    current_salary character varying(250),
    availibility character varying(250),
    marital_status character varying(250),
    country_of_qualification character varying(250),
    qualification character varying(250),
    age_groups_taught character varying(250),
    subjects character varying(250),
    desired_location character varying(250),
    nationality character varying(250),
    english character varying(250),
    current_location character varying(250),
    curriclum character varying(250),
    license character varying(250),
    gender character varying(250)
);


ALTER TABLE public.teacher_options OWNER TO postgres;

--
-- Name: teachers_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.teachers_data (
    teacher_id integer NOT NULL,
    phone character varying(250) NOT NULL,
    gender character varying(10) NOT NULL,
    dob date NOT NULL,
    user_id integer NOT NULL,
    curr_location character varying(250) NOT NULL,
    teaching_exp_years character varying(250) NOT NULL,
    salary_expectations character varying(250) NOT NULL,
    current_salary character varying NOT NULL,
    availibility character varying(250) NOT NULL,
    marital_status character varying(250) NOT NULL,
    dependents boolean NOT NULL,
    country_of_qualification character varying(250) NOT NULL,
    qualification character varying(250) NOT NULL,
    curriculem character varying(250) NOT NULL,
    license character varying(250) NOT NULL,
    age_groups character varying(250) NOT NULL,
    subjects character varying(250) NOT NULL,
    desired_location character varying(250) NOT NULL,
    english_level character varying(250) NOT NULL,
    nationality character varying(250) NOT NULL,
    gc_exp boolean NOT NULL,
    linkedin character varying(250),
    favourite boolean DEFAULT false,
    username character varying(250) NOT NULL
);


ALTER TABLE public.teachers_data OWNER TO postgres;

--
-- Name: teachers_data_teacher_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.teachers_data_teacher_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_data_teacher_id_seq OWNER TO postgres;

--
-- Name: teachers_data_teacher_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.teachers_data_teacher_id_seq OWNED BY public.teachers_data.teacher_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    created_on timestamp without time zone NOT NULL,
    roles json NOT NULL,
    refreshtoken character varying(250)
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: schools school_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools ALTER COLUMN school_id SET DEFAULT nextval('public.schools_school_id_seq'::regclass);


--
-- Name: teachers_data teacher_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_data ALTER COLUMN teacher_id SET DEFAULT nextval('public.teachers_data_teacher_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.admins (name, created_on, admin_id, email) FROM stdin;
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.schools (name, school_id, created_on, email) FROM stdin;
test	121	2023-02-10 16:46:09.098133	test@school.ae
shahh	141	2023-02-11 00:40:37.778548	arctiguana12@gmail.com
school	145	2023-02-11 04:45:16.404029	school@school.ae
\.


--
-- Data for Name: teacher_options; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teacher_options (teaching_exp, salary_expectations, current_salary, availibility, marital_status, country_of_qualification, qualification, age_groups_taught, subjects, desired_location, nationality, english, current_location, curriclum, license, gender) FROM stdin;
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	male
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	female
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Afghanistan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Albania	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Algeria	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Andorra	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Angola	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Antigua and Barbuda	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Argentina	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Armenia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Australia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Austria	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Azerbaijan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bahamas	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bahrain	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bangladesh	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Barbados	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Belarus	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Belgium	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Belize	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Benin	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bhutan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bolivia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bosnia and Herzegovina	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Botswana	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Brazil	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Brunei	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bulgaria	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Burkina Faso	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Burundi	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Cambodia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Cameroon	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Canada	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Central African Republic	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Fiji	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Finland	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	France	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Gabon	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Gambia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Georgia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Germany	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Ghana	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Greece	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Grenada	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Guatemala	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Guinea	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Guyana	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Hungary	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Iceland	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Indonesia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Iran	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Iraq	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Ireland	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Israel	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Italy	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Jamaica	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Japan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Jordan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kazakhstan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kenya	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kiribati	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kuwait	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kyrgyzs\ntan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Lebanon	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Lesotho	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Liberia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Libya	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Liechtenstein	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Lithuania	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Luxembourg	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Madagascar	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Malawi	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Malaysia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Maldives	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mali	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Malta	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Marshall Islands	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mauritania	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mauritius	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mexico	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Micronesia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Moldova	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Monaco	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mongolia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Montenegro	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Morocco	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mozambique	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Myanmar (form\nerly Burma)	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Namibia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nauru	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nepal	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Netherlands	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	New Zealand	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nicaragua	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Niger	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nigeria	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	North Korea	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	North Macedonia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Norway	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Oman	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Pakistan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Palau	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Palestine State	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Panama	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Paraguay	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Peru	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Philippines	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Poland	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Portugal	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Qatar	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Romania	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Russia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Rwanda	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Samoa	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Saudi Arabia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Senegal	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Serbia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Seychelles	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Sierra Leone	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Singapore	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Slovakia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Slovenia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Somalia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	South Africa	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	South Korea	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	South Sud\nan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Spain	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Sri Lanka	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Sudan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Suriname	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Sweden	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Switzerland	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Syria	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Tajikistan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Tanzania	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Thailand	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Tunisia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Turkey	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Turkmenistan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Tuvalu	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Uganda	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Ukraine	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	United Arab Emirates	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	United Kingdom	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	United States of America	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Uruguay	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Uzbekistan	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Vanuatu	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Venezuela	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Vietnam	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yemen	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Zambia	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Zimbabwe	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Afghanistan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Albania	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Algeria	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Andorra	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Angola	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Antigua and Barbuda	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Argentina	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Armenia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Australia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Austria	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Azerbaijan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bahamas	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bahrain	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bangladesh	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Barbados	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Belarus	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Belgium	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Belize	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Benin	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bhutan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bolivia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bosnia and Herzegovina	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Botswana	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Brazil	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Brunei	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Bulgaria	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Burkina Faso	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Burundi	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Cambodia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Cameroon	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Canada	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Central African Republic	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Fiji	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Finland	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	France	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Gabon	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Gambia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Georgia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Germany	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Ghana	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Greece	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Grenada	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Guatemala	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Guinea	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Guyana	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Hungary	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Iceland	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Indonesia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Iran	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Iraq	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Ireland	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Israel	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Italy	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Jamaica	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Japan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Jordan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kazakhstan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kenya	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kiribati	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kuwait	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Kyrgyzs\ntan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Lebanon	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Lesotho	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Liberia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Libya	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Liechtenstein	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Lithuania	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Luxembourg	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Madagascar	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Malawi	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Malaysia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Maldives	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mali	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Malta	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Marshall Islands	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mauritania	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mauritius	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mexico	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Micronesia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Moldova	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Monaco	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mongolia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Montenegro	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Morocco	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Mozambique	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Myanmar (form\nerly Burma)	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Namibia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nauru	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nepal	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Netherlands	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	New Zealand	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nicaragua	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Niger	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Nigeria	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	North Korea	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	North Macedonia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Norway	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Oman	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Pakistan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Palau	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Palestine State	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Panama	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Paraguay	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Peru	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Philippines	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Poland	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Portugal	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Qatar	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Romania	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Russia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Rwanda	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Samoa	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Saudi Arabia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Senegal	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Serbia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Seychelles	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Sierra Leone	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Singapore	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Slovakia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Slovenia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Somalia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	South Africa	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	South Korea	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	South Sud\nan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Spain	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Sri Lanka	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Sudan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Suriname	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Sweden	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Switzerland	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Syria	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Tajikistan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Tanzania	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Thailand	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Tunisia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Turkey	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Turkmenistan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Tuvalu	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Uganda	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Ukraine	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	United Arab Emirates	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	United Kingdom	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	United States of America	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Uruguay	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Uzbekistan	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Vanuatu	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Venezuela	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Vietnam	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Yemen	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Zambia	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Zimbabwe	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Afghanistan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Albania	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Algeria	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Andorra	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Angola	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Antigua and Barbuda	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Argentina	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Armenia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Australia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Austria	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Azerbaijan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Bahamas	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Bahrain	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Bangladesh	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Barbados	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Belarus	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Belgium	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Belize	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Benin	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Bhutan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Bolivia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Bosnia and Herzegovina	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Botswana	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Brazil	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Brunei	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Bulgaria	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Burkina Faso	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Burundi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Cambodia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Cameroon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Canada	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Central African Republic	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Fiji	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Finland	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	France	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Gabon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Gambia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Georgia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Germany	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Ghana	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Greece	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Grenada	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Guatemala	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Guinea	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Guyana	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Hungary	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Iceland	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	India	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Indonesia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Iran	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Iraq	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Ireland	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Israel	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Italy	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Jamaica	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Japan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Jordan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Kazakhstan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Kenya	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Kiribati	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Kuwait	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Kyrgyzs\ntan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Lebanon	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Lesotho	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Liberia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Libya	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Liechtenstein	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Lithuania	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Luxembourg	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Madagascar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Malawi	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Malaysia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Maldives	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Mali	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Malta	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Marshall Islands	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Mauritania	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Mauritius	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Mexico	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Micronesia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Moldova	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Monaco	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Mongolia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Montenegro	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Morocco	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Mozambique	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Myanmar (form\nerly Burma)	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Namibia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Nauru	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Nepal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Netherlands	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	New Zealand	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Nicaragua	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Niger	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Nigeria	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	North Korea	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	North Macedonia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Norway	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Oman	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Pakistan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Palau	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Palestine State	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Panama	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Paraguay	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Peru	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Philippines	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Poland	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Portugal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Qatar	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Romania	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Russia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Rwanda	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Samoa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Saudi Arabia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Senegal	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Serbia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Seychelles	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Sierra Leone	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Singapore	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Slovakia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Slovenia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Somalia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	South Africa	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	South Korea	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	South Sud\nan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Spain	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Sri Lanka	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Sudan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Suriname	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Sweden	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Switzerland	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Syria	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Tajikistan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Tanzania	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Thailand	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Tunisia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Turkey	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Turkmenistan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Tuvalu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Uganda	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Ukraine	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	United Arab Emirates	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	United Kingdom	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	United States of America	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Uruguay	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Uzbekistan	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Vanuatu	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Venezuela	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Vietnam	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Yemen	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Zambia	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	Zimbabwe	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Biology	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Chemistry	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Physics	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	English	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Arabic	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Islamic Studies	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	History	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Geography	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Social Studies	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Design Technology	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Art	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Music	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Home Economics/Food Technology	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Construction/Engineering	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	French	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	Spanish	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Abu Dhabi – UAE	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Dubai – UAE	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Ras Al Khaimah -UAE	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Sharjah – UAE	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Al Ain – UAE	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Ajman – UAE	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Fujeirah \n– UAE	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Muscat - Oman	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Doha – Qatar	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Riyadh – Saudi Arabia	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Jeddah – Saudi Arabia	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	Bahrain – Kingdom of Bahrain	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Elementry proficiency	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Limited Working Proficiency	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Professional Working Proficiency	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Full/billingual Proficiency	\N	\N	\N	\N
0 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
1 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
2 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
3 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
4 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
5 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
6 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
7 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
8 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
9 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
10 years	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	Early Years/KG	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	Primary/Elementary	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	Secondary/High School	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	PGCE	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	B.Ed	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	M.Ed	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	BSc.Ed	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	BA.Ed	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	An other	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	No Teacher Qualification/licence	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	American Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Australian Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	British Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Canadian Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	IB Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Irish Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	New Zealand Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	Singapore Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	UAE Curriculum	\N	\N
\N	\N	\N	\N	\N	\N	Associate Degree	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	Bachelors Degree	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	Masters Degree	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	\N	\N	Doctoral Degree	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	Single	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	Married	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	\N	Divorced	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	Immediate start	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	January Start	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	August start	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	\N	All of the above	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	6000-8000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	8000-10000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	10000-12000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	12000-14000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	other	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	6000-8000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	8000-10000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	10000-12000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	12000-14000	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\N	\N	other	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N
\.


--
-- Data for Name: teachers_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.teachers_data (teacher_id, phone, gender, dob, user_id, curr_location, teaching_exp_years, salary_expectations, current_salary, availibility, marital_status, dependents, country_of_qualification, qualification, curriculem, license, age_groups, subjects, desired_location, english_level, nationality, gc_exp, linkedin, favourite, username) FROM stdin;
97	0525247545	male	1987-02-08	97	Ireland	2 years	8000-10000	other	Immediate start	Single	f	Ireland	Doctoral Degree	Irish Curriculum,British Curriculum	B.Ed	Primary/Elementary	English	Dubai – UAE	Professional Working Proficiency	Ireland	f		t	Darren Lynch
95	0987654321	male	2002-04-05	95	Algeria	2 years	other	other	January Start	Married	f	Andorra	Masters Degree	American Curriculum,Canadian Curriculum	BSc.Ed	Primary/Elementary	English	Dubai – UAE,Al Ain – UAE	Professional Working Proficiency	Andorra	f	\N	f	Moiz
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, username, password, email, created_on, roles, refreshtoken) FROM stdin;
97	Darren Lynch	$2b$10$X0ZwvrvYT3GW8P8ThBzoaeNpUeYYtHzKl0lPLOyGJLavvgYcXYeoy	darrenlynch9@hotmail.com	2023-02-07 18:04:34.989	{"guest":"3333","teacher":"2222"}	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6IkRhcnJlbiBMeW5jaCIsImlhdCI6MTY3NTc5MzEwMSwiZXhwIjoxNjc4NDcxNTAxfQ.uxHqax5pMqWIZhHN4GvVhAW-Basj0Da7Oy0tc0MFsyM
99	Kingo	$2b$10$AikqXh8lgpioHfp.akq/H.qd7nMeWWIbncW7/cJBk0qFuwmbnhFJ6	shaheer@gmail.com	2023-02-09 12:51:17.703	{"guest":"3333","admin":"0000"}	
145	school	$2b$10$.NT/x3DptGa93Ha1fhz.JeD.BSYSu0mAZltIwTe2zAwTAU6XcU5Be	school@school.ae	2023-02-11 00:45:16.219	{"guest":"3333","school":"1111"}	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InNjaG9vbCIsImlhdCI6MTY3NjA4MzgxOCwiZXhwIjoxNjc4NzYyMjE4fQ.l_CFpo9rWLwC8cluN2f6OD-TX_DWlrSCR1VXHuP6FDY
95	Moiz	$2b$10$5UJGTq0GrQ2rnsjxunxSnOlSaPBPm07vwVG.YFwZV04YNvAoujKm.	arctiguana12@gmail.com	2023-02-09 12:01:44.948	{"guest":"3333","teachers":"2222"}	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6Ik1vaXoiLCJpYXQiOjE2NzU5NDU1MjIsImV4cCI6MTY3ODYyMzkyMn0.i9Z34gicfqmlQvj1hSnFV3B_a0rfRFPFJ1xTz_PGocI
\.


--
-- Name: schools_school_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.schools_school_id_seq', 1, false);


--
-- Name: teachers_data_teacher_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.teachers_data_teacher_id_seq', 1, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 145, true);


--
-- Name: admins admins_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admins_email_key UNIQUE (email);


--
-- Name: schools schools_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_email_key UNIQUE (email);


--
-- Name: schools schools_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (school_id);


--
-- Name: teachers_data teachers_data_linkedin_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_data
    ADD CONSTRAINT teachers_data_linkedin_key UNIQUE (linkedin);


--
-- Name: teachers_data teachers_data_phone_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_data
    ADD CONSTRAINT teachers_data_phone_key UNIQUE (phone);


--
-- Name: teachers_data teachers_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_data
    ADD CONSTRAINT teachers_data_pkey PRIMARY KEY (teacher_id);


--
-- Name: teachers_data teachers_data_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_data
    ADD CONSTRAINT teachers_data_username_key UNIQUE (username);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: admins admin_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.admins
    ADD CONSTRAINT admin_id FOREIGN KEY (admin_id) REFERENCES public.users(user_id);


--
-- Name: teachers_data user_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.teachers_data
    ADD CONSTRAINT user_id_fk FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: TABLE teacher_options; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teacher_options TO scoobydoo;


--
-- Name: TABLE teachers_data; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.teachers_data TO scoobydoo;


--
-- Name: TABLE users; Type: ACL; Schema: public; Owner: postgres
--

GRANT ALL ON TABLE public.users TO scoobydoo;


--
-- Name: SEQUENCE users_user_id_seq; Type: ACL; Schema: public; Owner: postgres
--

GRANT SELECT,USAGE ON SEQUENCE public.users_user_id_seq TO scoobydoo;


--
-- PostgreSQL database dump complete
--

