--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: map_browser_archive; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_archive (
    id bigint NOT NULL,
    archive_name character varying(200) NOT NULL,
    archive_number character varying(200) NOT NULL,
    archive_team character varying(200) NOT NULL,
    archive_unit character varying(200) NOT NULL
);


ALTER TABLE public.map_browser_archive OWNER TO postgres;

--
-- Name: map_browser_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_archive_id_seq OWNER TO postgres;

--
-- Name: map_browser_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_archive_id_seq OWNED BY public.map_browser_archive.id;


--
-- Name: map_browser_languages; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_languages (
    id bigint NOT NULL,
    language_code character varying(4) NOT NULL,
    language_name character varying(50) NOT NULL
);


ALTER TABLE public.map_browser_languages OWNER TO postgres;

--
-- Name: map_browser_languages_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_languages_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_languages_id_seq OWNER TO postgres;

--
-- Name: map_browser_languages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_languages_id_seq OWNED BY public.map_browser_languages.id;


--
-- Name: map_browser_map; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_map (
    id bigint NOT NULL,
    additional_notes text NOT NULL,
    archive_id_id bigint,
    corrector_id_id bigint,
    created_at character varying(150) NOT NULL,
    description text NOT NULL,
    full_title character varying(500) NOT NULL,
    keyword_geo character varying(500) NOT NULL,
    keyword_name character varying(500) NOT NULL,
    keyword_subject character varying(500) NOT NULL,
    publication_place_id bigint,
    publishing_address character varying(300) NOT NULL,
    scale character varying(500) NOT NULL,
    short_title character varying(500) NOT NULL,
    subject character varying(500) NOT NULL,
    filename character varying(100) NOT NULL,
    added_at timestamp with time zone NOT NULL,
    source_text character varying(500) NOT NULL,
    creation_type character varying(500) NOT NULL,
    thumbnail character varying(100) NOT NULL
);


ALTER TABLE public.map_browser_map OWNER TO postgres;

--
-- Name: map_browser_map_authors; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_map_authors (
    id bigint NOT NULL,
    map_id bigint NOT NULL,
    people_id bigint NOT NULL
);


ALTER TABLE public.map_browser_map_authors OWNER TO postgres;

--
-- Name: map_browser_map_authors_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_map_authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_map_authors_id_seq OWNER TO postgres;

--
-- Name: map_browser_map_authors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_map_authors_id_seq OWNED BY public.map_browser_map_authors.id;


--
-- Name: map_browser_map_creator; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_map_creator (
    id bigint NOT NULL,
    map_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.map_browser_map_creator OWNER TO postgres;

--
-- Name: map_browser_map_creator_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_map_creator_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_map_creator_id_seq OWNER TO postgres;

--
-- Name: map_browser_map_creator_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_map_creator_id_seq OWNED BY public.map_browser_map_creator.id;


--
-- Name: map_browser_map_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_map_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_map_id_seq OWNER TO postgres;

--
-- Name: map_browser_map_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_map_id_seq OWNED BY public.map_browser_map.id;


--
-- Name: map_browser_map_language_id; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_map_language_id (
    id bigint NOT NULL,
    map_id bigint NOT NULL,
    languages_id bigint NOT NULL
);


ALTER TABLE public.map_browser_map_language_id OWNER TO postgres;

--
-- Name: map_browser_map_language_id_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_map_language_id_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_map_language_id_id_seq OWNER TO postgres;

--
-- Name: map_browser_map_language_id_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_map_language_id_id_seq OWNED BY public.map_browser_map_language_id.id;


--
-- Name: map_browser_map_subject_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_map_subject_type (
    id bigint NOT NULL,
    map_id bigint NOT NULL,
    subjecttypes_id bigint NOT NULL
);


ALTER TABLE public.map_browser_map_subject_type OWNER TO postgres;

--
-- Name: map_browser_map_subject_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_map_subject_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_map_subject_type_id_seq OWNER TO postgres;

--
-- Name: map_browser_map_subject_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_map_subject_type_id_seq OWNED BY public.map_browser_map_subject_type.id;


--
-- Name: map_browser_people; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_people (
    id bigint NOT NULL,
    first_name character varying(80) NOT NULL,
    last_name character varying(80) NOT NULL
);


ALTER TABLE public.map_browser_people OWNER TO postgres;

--
-- Name: map_browser_people_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_people_id_seq OWNER TO postgres;

--
-- Name: map_browser_people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_people_id_seq OWNED BY public.map_browser_people.id;


--
-- Name: map_browser_publicationplaces; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_publicationplaces (
    id bigint NOT NULL,
    city_name character varying(100) NOT NULL,
    country_name character varying(100) NOT NULL
);


ALTER TABLE public.map_browser_publicationplaces OWNER TO postgres;

--
-- Name: map_browser_publicationplaces_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_publicationplaces_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_publicationplaces_id_seq OWNER TO postgres;

--
-- Name: map_browser_publicationplaces_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_publicationplaces_id_seq OWNED BY public.map_browser_publicationplaces.id;


--
-- Name: map_browser_subjecttypes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.map_browser_subjecttypes (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.map_browser_subjecttypes OWNER TO postgres;

--
-- Name: map_browser_subjecttypes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.map_browser_subjecttypes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.map_browser_subjecttypes_id_seq OWNER TO postgres;

--
-- Name: map_browser_subjecttypes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.map_browser_subjecttypes_id_seq OWNED BY public.map_browser_subjecttypes.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: map_browser_archive id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_archive ALTER COLUMN id SET DEFAULT nextval('public.map_browser_archive_id_seq'::regclass);


--
-- Name: map_browser_languages id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_languages ALTER COLUMN id SET DEFAULT nextval('public.map_browser_languages_id_seq'::regclass);


--
-- Name: map_browser_map id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map ALTER COLUMN id SET DEFAULT nextval('public.map_browser_map_id_seq'::regclass);


--
-- Name: map_browser_map_authors id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_authors ALTER COLUMN id SET DEFAULT nextval('public.map_browser_map_authors_id_seq'::regclass);


--
-- Name: map_browser_map_creator id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_creator ALTER COLUMN id SET DEFAULT nextval('public.map_browser_map_creator_id_seq'::regclass);


--
-- Name: map_browser_map_language_id id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_language_id ALTER COLUMN id SET DEFAULT nextval('public.map_browser_map_language_id_id_seq'::regclass);


--
-- Name: map_browser_map_subject_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_subject_type ALTER COLUMN id SET DEFAULT nextval('public.map_browser_map_subject_type_id_seq'::regclass);


--
-- Name: map_browser_people id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_people ALTER COLUMN id SET DEFAULT nextval('public.map_browser_people_id_seq'::regclass);


--
-- Name: map_browser_publicationplaces id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_publicationplaces ALTER COLUMN id SET DEFAULT nextval('public.map_browser_publicationplaces_id_seq'::regclass);


--
-- Name: map_browser_subjecttypes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_subjecttypes ALTER COLUMN id SET DEFAULT nextval('public.map_browser_subjecttypes_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add map	7	add_map
26	Can change map	7	change_map
27	Can delete map	7	delete_map
28	Can view map	7	view_map
29	Can add archive	8	add_archive
30	Can change archive	8	change_archive
31	Can delete archive	8	delete_archive
32	Can view archive	8	view_archive
33	Can add languages	9	add_languages
34	Can change languages	9	change_languages
35	Can delete languages	9	delete_languages
36	Can view languages	9	view_languages
37	Can add people	10	add_people
38	Can change people	10	change_people
39	Can delete people	10	delete_people
40	Can view people	10	view_people
41	Can add publication p laces	11	add_publicationplaces
42	Can change publication p laces	11	change_publicationplaces
43	Can delete publication p laces	11	delete_publicationplaces
44	Can view publication p laces	11	view_publicationplaces
45	Can add subject types	12	add_subjecttypes
46	Can change subject types	12	change_subjecttypes
47	Can delete subject types	12	delete_subjecttypes
48	Can view subject types	12	view_subjecttypes
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	Testing4321	\N	f	MateuszZawadzki	Mateusz	Zawadzki		f	t	2022-04-03 13:18:18.883403+02
2	Testing4321	\N	f	MarekBarwi┼äski	Marek	Barwi┼äski		f	t	2022-04-03 13:21:42.814959+02
3	Testing4321	\N	f	El┼╝bietaKo┼Ťcik	El┼╝bieta	Ko┼Ťcik		f	t	2022-04-03 13:21:42.817617+02
4	Testing4321	\N	f	KawalecSuleja	Kawalec	Suleja		f	t	2022-04-03 13:21:43.40949+02
5	Testing4321	\N	f	Ku┼║maMarek	Ku┼║ma	Marek		f	t	2022-04-03 13:21:43.612896+02
6	Testing4321	\N	f	Barwi┼äski	Barwi┼äski			f	t	2022-04-03 13:21:43.615918+02
7	Testing4321	\N	f	MateuszZawadzki,	Mateusz	Zawadzki,		f	t	2022-04-03 13:21:43.706065+02
9	pbkdf2_sha256$320000$CY5ELF8h8s7R30OSGD2bVi$NYHdEuykvd4wc5Hht+OSVaxfiia/8f9rtlTZDsTLN30=	\N	f	KubaBee	Jakub	Pszczo┼éa	1kubaape1@gmail.com	f	t	2022-04-04 20:56:48.208158+02
10	pbkdf2_sha256$320000$HENFAikjbQLWQm9c2ePRNz$u80bAMW3QqYbCJ5zdXtDIKP6Jkpeulb3JrO+HCRC4lY=	\N	f	test_001	Test	Test	test_001@gmail.com	f	t	2022-04-05 00:00:55.727463+02
8	pbkdf2_sha256$320000$BUdMDVxw50xDIgYMGORw8e$ooaFfCzVykDAK//Kj+EKtZ4mbKrX4NFI11i+eH8YFQg=	2022-04-05 21:53:42.629354+02	t	1kuba			1kubaape1@gmail.com	t	t	2022-04-03 13:54:28.357155+02
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-04-06 19:56:08.732905+02	19	aaaTest 	1	[{"added": {}}]	10	8
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	map_browser	map
8	map_browser	archive
9	map_browser	languages
10	map_browser	people
11	map_browser	publicationplaces
12	map_browser	subjecttypes
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-04-03 13:16:38.005667+02
2	auth	0001_initial	2022-04-03 13:16:38.148105+02
3	admin	0001_initial	2022-04-03 13:16:38.185286+02
4	admin	0002_logentry_remove_auto_add	2022-04-03 13:16:38.198262+02
5	admin	0003_logentry_add_action_flag_choices	2022-04-03 13:16:38.209861+02
6	contenttypes	0002_remove_content_type_name	2022-04-03 13:16:38.241455+02
7	auth	0002_alter_permission_name_max_length	2022-04-03 13:16:38.259478+02
8	auth	0003_alter_user_email_max_length	2022-04-03 13:16:38.283696+02
9	auth	0004_alter_user_username_opts	2022-04-03 13:16:38.294184+02
10	auth	0005_alter_user_last_login_null	2022-04-03 13:16:38.308666+02
11	auth	0006_require_contenttypes_0002	2022-04-03 13:16:38.313099+02
12	auth	0007_alter_validators_add_error_messages	2022-04-03 13:16:38.321421+02
13	auth	0008_alter_user_username_max_length	2022-04-03 13:16:38.345181+02
14	auth	0009_alter_user_last_name_max_length	2022-04-03 13:16:38.356695+02
15	auth	0010_alter_group_name_max_length	2022-04-03 13:16:38.373245+02
16	auth	0011_update_proxy_permissions	2022-04-03 13:16:38.398594+02
17	auth	0012_alter_user_first_name_max_length	2022-04-03 13:16:38.411111+02
18	map_browser	0001_initial	2022-04-03 13:16:38.430421+02
19	map_browser	0002_archive_languages_people_publicationplaces_and_more	2022-04-03 13:16:38.496448+02
20	map_browser	0003_archive_archive_name_archive_archive_number_and_more	2022-04-03 13:16:38.790076+02
21	map_browser	0004_alter_map_scale	2022-04-03 13:16:38.805106+02
22	map_browser	0005_remove_map_filename	2022-04-03 13:16:38.82074+02
23	map_browser	0006_map_filename	2022-04-03 13:16:38.835366+02
24	map_browser	0007_remove_map_author1_id_remove_map_author2_id_and_more	2022-04-03 13:16:38.936144+02
25	map_browser	0008_alter_map_authors_remove_map_creator_map_creator	2022-04-03 13:16:38.999091+02
26	map_browser	0009_alter_archive_archive_name_and_more	2022-04-03 13:16:39.023598+02
27	map_browser	0010_alter_map_filename	2022-04-03 13:16:39.037316+02
28	map_browser	0011_map_added_at_map_source_text_alter_map_created_at_and_more	2022-04-03 13:16:39.166787+02
29	map_browser	0012_alter_map_filename	2022-04-03 13:16:39.183991+02
30	map_browser	0013_remove_map_language_id_map_language_id	2022-04-03 13:16:39.244239+02
31	map_browser	0014_alter_map_scale	2022-04-03 13:16:39.277944+02
32	map_browser	0015_subjecttypes_remove_map_creation_type_and_more	2022-04-03 13:16:39.34651+02
33	map_browser	0016_remove_map_creation_type_map_creation_type_and_more	2022-04-03 13:16:39.437844+02
34	map_browser	0017_alter_archive_archive_name_and_more	2022-04-03 13:16:39.527169+02
35	map_browser	0018_alter_publicationplaces_city_name_and_more	2022-04-03 13:16:39.542969+02
36	map_browser	0019_alter_map_created_at_alter_map_publishing_address	2022-04-03 13:16:39.573489+02
37	map_browser	0020_alter_map_full_title_alter_map_short_title	2022-04-03 13:16:39.609635+02
38	map_browser	0021_alter_map_creation_type_alter_map_keyword_geo_and_more	2022-04-03 13:16:39.725906+02
39	map_browser	0022_map_thumbnail	2022-04-03 13:16:39.742847+02
40	sessions	0001_initial	2022-04-03 13:16:39.763722+02
41	map_browser	0023_alter_map_filename_alter_map_thumbnail	2022-04-03 13:37:00.082785+02
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
sy6hq8hhtq1e87168s6txh880yryn2x2	.eJxVjDsOwyAQRO9CHSHDYj4p0_sMaGEhOImwZOwqyt1jJBdJM8WbN_NmHvet-L2l1c_Ersyyyy8LGJ-p9oIeWO8Lj0vd1jnwrvCzbXxaKL1up_t3ULCVvnZgrLMgwFI-IgWXtB4xGx0lasiDOJiKA2RQ2cgICqWQ2kZyYSRkny_Ujze4:1nbpFG:yAailwTY04aySd8mPOjIxHVmBz8mEPXt8y7k8Eqhvq0	2022-04-19 21:53:42.632094+02
\.


--
-- Data for Name: map_browser_archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_archive (id, archive_name, archive_number, archive_team, archive_unit) FROM stdin;
1	Archiwum Akt Nowych w Warszawie	429	AAN/260 Kolekcja kartograficzna/429	Kolekcja kartograficzna
2	Archiwum Akt Nowych w Warszawie	427	AAN/260 Kolekcja kartograficzna/427	kolekcja kartograficzna
3	Archiwum Akt Nowych w Warszawie	405	AAN/260 Kolekcja kartograficzna/405	Kolekcja kartograficzna
4	Archiwum Akt Nowych w Warszawie	107/56	AAN/463 Ambasada RP w Pary┼╝u/107/56	Ambasada RP w Pary┼╝u
5	Archiwum Akt Nowych w Warszawie	84	Kolekcja kartograficzna	AAN/260 Kolekcja kartograficzna/84
6	Archiwum Akt Nowych w Warszawie	83	AAN/260 Kolekcja kartograficzna/83	Kolekcja kartograficzna
7	Archiwum Akt Nowych w Warszawie	79/30	Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u	AAN/40 Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u/79/30
8	Archiwum Akt Nowych w Warszawie	927/28	AAN/100 Archiwum Padarewskiego/927/28	Archiwum Paderewskiego
9	Archiwum Akt Nowych w Warszawie	928/105	AAN/100 Archiwum Padarewskiego/928/105	Archiwum Paderewskiego
10	Archiwum Akt Nowym w Warszawie	928/106	AAN/100 Archiwum Padarewskiego/928/106	Archiwum Paderewskiego
11	Archiwum Akt Nowych w Warszawie	920/4	AAN/100 Archiwum Padarewskiego/920/4	Archiwum Paderewskiego
12	Archiwum Akt Nowych w Warszawie	928/107	AAN/100 Archiwum Padarewskiego/928/107	Archiwum Paderewskiego
13	Archiwum Akt Nowych w Warszawie	928/108	AAN/100 Archiwum Padarewskiego/928/108	Archiwum Paderewskiego
14	Archiwum Akt Nowych w Warszawie	315/41	AAN/39 Komitet Narodowy Polski w Pary┼╝u/315/41	Komitet Narodowy Polski w Pary┼╝u
15	Archiwum Akt Nowych w Warszawie	79/29	AAN/40 Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u/79/29	Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u
16	Archiwum Akt Nowych w Warszawie	17/96	AAN/40 Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u/17/96	Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u
17	Archiwum Akt Nowych w Warszawie	896/3	AAN/100 Archiwum Padarewskiego/896/3	Archiwum Paderewskiego
18	Archiwum Akt Nowych w Warszawie	867/7	AAN/100 Archiwum Padarewskiego/896/7	Archiwum Paderewskiego
19	Archiwum Akt Nowych w Warszawie	896/2	AAN/100 Archiwum Padarewskiego/896/2	Archiwum Paderewskiego
20	Archiwum Akt Nowych w Warszawie	896/6	AAN/100 Archiwum Padarewskiego/896/6	Archiwum Paderewskiego
21	Archiwum Akt Nowych w Warszawie	920/113	AAN/100 Archiwum Padarewskiego/920/113	Archiwum Paderewskiego
22	Archiwum Akt Nowych w Warszawie	920/114	AAN/100 Archiwum Padarewskiego/920/114	Archiwum Paderewskiego
23	Archiwum Akt Nowych w Warszawie	1860/179	AAN/39 Komitet Narodowy Polski w Pary┼╝u/1860/179	Komitet Narodowy Polski
24	Archiwum Akt Nowych w Warszawie	884/67	AAN/100 Archiwum Padarewskiego/884/67	Archiwum Paderewskiego
25	Archiwum Akt Nowych w Warszawie	884/65	AAN/100 Archiwum Padarewskiego/884/65	Archiwum Paderewskiego
26	Archiwum Akt Nowych w Warszawie	884/66	AAN/100 Archiwum Padarewskiego/884/66	Archiwum Paderewskiego
27	Archiwum Akt Nowych w Warszawie	920/93	AAN/100 Archiwum Padarewskiego/920/93	Archiwum Paderewskiego
28	Archiwum Akt Nowych	931/7	AAN/100 Archiwum Padarewskiego/931/7	Archiwum Paderewskiego
29	Archiwum Akt Nowych	933/20	AAN/100 Archiwum Padarewskiego/933/20	Archiwum Padarewskiego
30	Archiwum Akt Nowych	122/72	AAN/39 Komitet Narodowy Polski w Pary┼╝u/122/72	Komitet Narodowy Polski w Pary┼╝u
31	Archiwum Akt Nowych	73/7	AAN/40 Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u/73/7	Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u
32	Archiwum Akt Nowych	153/69	AAN/40 Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u/153/69	Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u
33	Archiwum Akt Nowych	153/70	AAN/40 Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u/153/70	Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u
34	Archiwum Akt Nowych	153/76	AAN/40 Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u/153/76	Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u
35	Archiwum Akt Nowych	845/5	AAN/100 Archiwum Paderewskiego/845/5	Archiwum Paderewskiego
36	Archiwum Akt Nowych	662/29	AAN/100 Archiwum Paderewskiego/662/29	Archiwum Paderewskiego
37	Archiwum Akt Nowych	845/5	AAN/100 Archiwum Padarewskiego/845/5	Archiwum Paderewskiego
38	Archiwum Akt Nowych	896/4	AAN/100 Archiwum Padarewskiego/896/4	Archiwum Padarewskiego
39	Archiwum Akt Nowych	896/5	AAN/100 Archiwum Padarewskiego/896/5	Archiwum Padarewskiego
40	Archiwum Akt Nowych	896/1	AAN/100 Archiwum Padarewskiego/896/1	Archiwum Padarewskiego
41	Archiwum Akt Nowych	933/18	AAN/100 Archiwum Paderewskiego/933/18	Archiwum Paderewskiego
42	Archiwum Akt Nowych	962/91	AAN/100 Archiwum Paderewskiego/962/91	Archiwum Paderewskiego
43	Archiwum Akt Nowych	899/28	AAN/100 Archiwum Paderewskiego/899/28	Archiwum Paderewskiego
44	Archiwum Akt Nowych	920/223	AAN/100 Archiwum Padarewskiego/920/223	Archiwum Padarewskiego
45	Archiwum Akt Nowych	920/197	AAN/100 Archiwum Padarewskiego/920/197	Archiwum Padarewskiego
46	Archiwum Akt Nowych	962/38	AAN/100 Archiwum Padarewskiego/962/38	Archiwum Padarewskiego
47	Archiwum Akt Nowych	962/14	AAN/100 Archiwum Paderewskiego/962/14	Archiwum Paderewskiego
48	Archiwum Akt Nowych	962/90	AAN/100 Archiwum Padarewskiego/962/90	Archiwum Padarewskiego
49	Archiwum Akt Nowych	962/37	AAN/100 Archiwum Padarewskiego/962/37	Archiwum Padarewskiego
50	Archiwum Akt Nowych	965/76	AAN/100 Archiwum Paderewskiego/965/76	Archiwum Paderewskiego
51	Archiwum Akt Nowych	967/90	AAN/100 Archiwum Paderewskiego/967/90	Archiwum Paderewskiego
52	brak	brak	brak	brak
\.


--
-- Data for Name: map_browser_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_languages (id, language_code, language_name) FROM stdin;
1		Niemiecki
2		Francuski
3		Polski
4		Angielski
5		Hiszpa┼äski
\.


--
-- Data for Name: map_browser_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_map (id, additional_notes, archive_id_id, corrector_id_id, created_at, description, full_title, keyword_geo, keyword_name, keyword_subject, publication_place_id, publishing_address, scale, short_title, subject, filename, added_at, source_text, creation_type, thumbnail) FROM stdin;
56		\N	\N			TestowaMapaAWS				\N		1	TestowaMapaAWS		maps/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_xXihjc3.jpg	2022-04-03 23:14:04.647588+02			thumbnails/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_copy.jpg
57		2	\N			TestowaMapaAWS				\N		1	TestowaMapaAWS		maps/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_CSrSzwm.jpg	2022-04-04 20:09:30.262924+02			thumbnails/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_copy_DMMq0xx.jpg
2		\N	\N	1913	Zmiana opisu	├ťbersichtskarte des Oberschlesischen Industriebezirks. Aus Anlass des XII. Allgemeinen Deutschen Bergmannstages zu Breslau 1913				2	Herausgegeben vom Oberschlesischer Berg- und H├╝ttenm├Ąnnischer Verein in Kattowitz, bearbeitet im KËžniglichen Oberbergamte zu Breslau durch Oberbergamts-Markscheider Jahr.  Pneumadruck F. Pietsch	100000	├ťbersichtskarte des Oberschlesischen Industriebezirks.	g├│rnictwo, hutnictwo, w─Ögiel kamienny, spis przedsi─Öbiorstw przemys┼éowych G├│rno┼Ťl─ůskiego Zwi─ůzku Przemys┼éowc├│w G├│rniczo-Hutniczych:  g├│rnictwo, hutnictwo, w─Ögiel kamienny	maps/1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg.jpg	2022-04-03 13:21:42.77254+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg_copy.jpg
4		2	\N	 daty, po 1905 roku	Mapa przedstawia struktur─Ö narodowo┼Ťciow─ů ludno┼Ťci Kr├│lestwa Polskiego, w podziale na powiaty. Za pomoc─ů zr├│┼╝nicowania szrafu oraz kolor├│w, przedstawiono zar├│wno udzia┼é procentowy mniejszo┼Ťci narodowych w poszczeg├│lnych powiatach (w sze┼Ťciu przedzia┼éach od 1 do 50%) oraz g┼é├│wne narodowo┼Ťci (Polacy, Niemcy, ┼╗ydzi, Rosjanie i Rusini oraz Litwini). Poza powiatami przedstawiono tak┼╝e struktur─Ö narodowo┼Ťciow─ů dw├│ch najwi─Ökszych miast ÔÇô Warszawy i ┼üodzi.\nNa zdecydowanej wi─Ökszo┼Ťci obszaru Kr├│lestwa Polskiego dominuje ludno┼Ť─ç polska, a najliczniejsz─ů i obecn─ů we wszystkich powiatach mniejszo┼Ťci─ů s─ů ┼╗ydzi oraz w okolicach ┼üodzi i w powiatach zachodnich Niemcy. Jedynie w p├│┼énocno-wschodniej cz─Ö┼Ťci guberni suwalskiej dominuje ludno┼Ť─ç litewska, przy niewielkim udziale Polak├│w, Niemc├│w i ┼╗yd├│w, a w trzech powiatach po┼éudniowo-wschodnich (W┼éodawa, Che┼ém, Hrubiesz├│w) nieznacznie przewa┼╝aj─ů Rosjanie i Rusini (faktycznie chodzi o ludno┼Ť─ç ukrai┼äsk─ů), a Polacy, Niemcy i ┼╗ydzi s─ů grupami mniejszo┼Ťciowymi, przy czym udzia┼é ludno┼Ťci polskiej wynosi 35-50%.\nNie podano ┼║r├│de┼é danych oraz daty wykonania mapy. Mo┼╝na jednak przypuszcza─ç, ┼╝e zosta┼éa ona opracowana na podstawie wynik├│w rosyjskiego powszechnego spisu ludno┼Ťci z roku 1897. By┼é to pierwszy i ostatni powszechny spisu ludno┼Ťci przeprowadzony w carskiej Rosji. Obj─ů┼é tak┼╝e gubernie wchodz─ůce w sk┼éad Kr├│lestwa Polskiego. Nie zawiera┼é pytania o narodowo┼Ť─ç, kt├│r─ů ustalano na podstawie odpowiedzi na pytanie o j─Özyk ojczysty. W trakcie tego spisu w celu zwi─Ökszenia liczby Rosjan, osoby deklaruj─ůce j─Özyk ukrai┼äski i bia┼éoruski (lub dialekty tych j─Özyk├│w), by┼éy cz─Östo zaliczane do ludno┼Ťci rosyjskoj─Özycznej, ewentualnie traktowani wsp├│lnie jako Rusini. Nast─Öpnie ┼é─ůcznie podawana by┼éa liczebno┼Ť─ç ÔÇ×Rosjan i Rusin├│wÔÇŁ, podobnie jak na tej mapie. W rzeczywisto┼Ťci po┼éudniowo-wschodnie powiaty Kr├│lestwa Kongresowego na pocz─ůtku XX wieku by┼éy zamieszkane przez Ukrai┼äc├│w (ewentualnie Rusin├│w), a nie ÔÇ×Rosjan i Rusin├│wÔÇŁ. \nWyniki tego spisu zosta┼éy ostatecznie opublikowane w roku 1905, wi─Öc mapa nie mog┼éa powsta─ç wcze┼Ťniej, z kolei w roku 1912 z Kr├│lestw Polskiego zosta┼éa wy┼é─ůczona Gubernia Che┼émska, czego ta mapa nie uwzgl─Ödnia. Nie oznacza to jednak, ┼╝e nie mog┼éa powsta─ç po roku 1912.Wykorzystywanie przez polskie instytucje, na potrzeby przedstawianie argument├│w za polsko┼Ťci─ů ┼Ül─ůska, Wielkopolski, Pomorza oraz Warmii i Mazur, danych pochodz─ůcych z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, by┼éo uzasadnione m.in. tym, ┼╝e w spisach powszechnych narodowo┼Ť─ç by┼éa ustalana na podstawie odpowiedzi na pytanie o j─Özyk ojczysty, a statystyka pruska wyszczeg├│lnia┼éa obok j─Özyka polskiego, tak┼╝e j─Özyk kaszubski i mazurski, co skutecznie zmniejsza┼éo liczb─Ö os├│b deklaruj─ůcych j─Özyk polski (a tym samym liczb─Ö os├│b zaliczonych do polskiej narodowo┼Ťci). Ponadto w pruskim spisie powszechnym istnia┼éa mo┼╝liwo┼Ť─ç zadeklarowania dw├│ch j─Özyk├│w i cz─Ö┼Ť─ç Polak├│w, znaj─ůcych tak┼╝e j─Özyk niemiecki, deklarowa┼éo j─Özyk polski wraz z niemieckim, co skutkowa┼éo zaliczeniem ich do tzw. ÔÇ×os├│b dwuj─ÖzycznychÔÇŁ.\n	Kr├│lestwo Polskie (pod wzgl─Ödem etnograficznym)	Kr├│lestwo Polskie, Kongres├│wka		struktura narodowo┼Ťciowa, spis rosyjski z 1897 roku	\N			Kr├│lestwo Polskie	struktura narodowo┼Ťciowa ludno┼Ťci Kr├│lestwa Polskiego w podziale na powiaty wed┼éug danych spisu powszechnego z 1897 roku	maps/1voYIurZMGyYMAlFj2SJG-d_ufN8dZyQQ.jpg	2022-04-03 13:21:42.838545+02		Mapa r─Ökopi┼Ťmienna	thumbnails/1voYIurZMGyYMAlFj2SJG-d_ufN8dZyQQ_copy.jpg
58		3	\N			TestowaMapaAWS				\N		1	TestowaMapaAWS		maps/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_BwSQAEk.jpg	2022-04-04 20:11:15.286857+02			thumbnails/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_copy_3sq7nG6.jpg
6		4	\N	 daty, wersja drukowana wykonana ok. 1923 roku, natomiast elementy naniesione odr─Öcznie wykonano w lutym 1924 roku	Mapa obejmuje pogranicze polsko-czechos┼éowackie na p├│┼énocnym Spiszu i w Tatrach Wysokich. Sk┼éada si─Ö z cz─Ö┼Ťci drukowanej oraz naniesionych odr─Öcznie, zaznaczonych szrafem i kolorami, r├│┼╝nych wersji linii granicznych. Posiada tak┼╝e dwie legendy, druga (na doklejonej kartce) dotyczy element├│w naniesionych odr─Öcznie.  \nNa drukowanej mapie topograficznej obejmuj─ůcej p├│┼énocny Spisz, Tatry Wysokie i niewielki fragment Podhala, zosta┼éy przedstawione r├│┼╝ne wersje przebiegu granicy polsko-czechos┼éowackiej proponowane i ustalane w latach 1920-1922. S─ů to: linia graniczna na podstawie traktatu z Sevres (10 sierpnia 1920), tzw. ÔÇ×linia Ambasador├│wÔÇŁ (po decyzji z 28 lipca 1920), linia graniczna proponowana przez Polsk─Ö, linia graniczna nie wyznaczona decyzj─ů z 28 lipca 1920, linia graniczna przeg┼éosowana przez Komisj─Ö Delimitacyjn─ů (25 wrze┼Ťnia 1922) oraz polski projekt linii kolejowej do Nowego Targu-Jaworzyny-Roztoki. \nNatomiast odr─Öczne naniesione, kolorowe linie graniczne, s─ů wersj─ů p├│┼║niejsz─ů i zosta┼éy ÔÇô wed┼éug informacji umieszczonej na dodatkowej legendzie mapy ÔÇô dodane w konsekwencji posiedzenia Komisji Delimitacyjnej w Brnie (Czechos┼éowacja) 11 lutego 1924 roku. \nKolorami zaznaczony jest przebieg dw├│ch granic istniej─ůcych przed 1924 rokiem, czyli dawnej granicy mi─Ödzy Galicj─ů i W─Ögrami (kolor zielony) oraz granicy wytyczonej na podstawie decyzji Rady Ambasador├│w z 28 lipca 1920, czyli tzw. ÔÇ×linii Ambasador├│wÔÇŁ (kolor czerwony). Co jednak istotniejsze, dodano trzy kolejne, nie zaznaczone na wcze┼Ťniejszej wersji drukowanej, warianty przebiegu granicy polsko-czechos┼éowackiej ÔÇô propozycj─Ö polsk─ů, cz─Ö┼Ťciowo odmienn─ů od zamieszczonej na wersji drukowanej (kolor ┼╝├│┼éty), propozycj─Ö czechos┼éowack─ů sprzed posiedzenia Komisji Delimitacyjnej (kolor niebieski) oraz modyfikacj─Ö propozycji czechos┼éowackiej w rozumieniu Komisji Delimitacyjnej (kolor czarny).\nPodstawowymi punktami spornymi, przedstawionymi na mapie, jest podzia┼é p├│┼énocnego Spiszu pomi─Ödzy Polsk─Ö a Czechos┼éowacj─ů oraz okre┼Ťlenie przynale┼╝no┼Ťci pa┼ästwowej Doliny Jaworzyny.\nSpisz do I wojny ┼Ťwiatowej znajdowa┼é si─Ö w granicach W─Ögier. Po rozpadzie monarchii Austro-W─Ögierskiej oraz zako┼äczeniu wojny, nowopowsta┼éa Czechos┼éowacja ro┼Ťci┼éa pretensje terytorialne do ca┼éego obszaru p├│┼énocnych W─Ögier, z kolei liczna na p├│┼énocnym Spiszu ludno┼Ť─ç polska, domaga┼éa si─Ö przy┼é─ůczenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Pary┼╝u, podj─Öto decyzj─Ö o przeprowadzeniu na p├│┼énocnym Spiszu w po┼éowie 1920 roku plebiscytu, kt├│ry mia┼é zadecydowa─ç o przynale┼╝no┼Ťci politycznej tego obszaru. Ostatecznie plebiscytu nie przeprowadzono (z powodu wojny polsko-bolszewickiej), a podzia┼éu p├│┼énocnego Spiszu dokona┼éa Rada Ambasador├│w 28 lipca 1920 roku, przyznaj─ůc Polsce jego niewielki fragment, co nie zako┼äczy┼éo spor├│w terytorialnych polsko-czechos┼éowackich. Nie rozstrzygni─Öto w├│wczas tak┼╝e przynale┼╝no┼Ťci pa┼ästwowej Doliny Jaworzyny.\nNa mapie wida─ç bardzo du┼╝─ů zbie┼╝no┼Ť─ç, zaznaczonych kolorami w lutym 1924 roku, linii granicznych dziel─ůcych p├│┼énocny Spisz pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö. Propozycj─ů polska (kolor ┼╝├│┼éty) oraz czechos┼éowacka (kolor niebieski) z lutego 1924 roku, s─ů na tym odcinku ca┼ékowicie zbie┼╝ne, a pomi─Ödzy nimi a przebiegiem wcze┼Ťniejszej ÔÇ×linii Ambasador├│wÔÇŁ z lipca 1920 roku (kolor czerwony), jest tylko kilka nieznacznych r├│┼╝nic. Jedyna istotna modyfikacja propozycji czechos┼éowackiej (kolor czarny) dotyczy┼éa obszaru na po┼éudnie od wsi Jurg├│w i Brzegi, by┼éa korzystna dla Polski. \nCo wa┼╝ne, granica polsko-czechos┼éowacka na p├│┼énocnym Spiszu, wytyczona odr─Öcznie na tej mapie w lutym 1924 roku, przetrwa┼éa do czas├│w wsp├│┼éczesnych, obecnie jako granica polsko-s┼éowacka. \nNatomiast istotne r├│┼╝nice widoczne na mapie dotycz─ů przebiegu granicy w Tatrach Wysokich. Propozycja polska w┼é─ůcza┼éa do Polski po┼éo┼╝on─ů na wsch├│d od Morskiego Oka i Roztoki, Dolin─Ö Jaworzyny (kolor ┼╝├│┼éty), co nie by┼éo akceptowane przez stron─Ö czechos┼éowack─ů, pomimo tego, ┼╝e propozycja z lutego 1924 roku, postulowa┼éa przy┼é─ůczenie tego fragmentu Tatr w mniejszym zakresie terytorialnym (w cz─Ö┼Ťci wschodniej) ni┼╝ wcze┼Ťniejsza propozycja polska z roku 1920 (widoczna na mapie w wersji drukowanej).\nCiekawie przedstawia si─Ö por├│wnanie wcze┼Ťniejszej propozycji polskiej (wersja drukowana), kolejnej propozycji polskiej z lutego 1924 roku (kolor ┼╝├│┼éty) oraz linii granicznej przeg┼éosowanej przez Komisj─Ö Delimitacyjn─ů 25 wrze┼Ťnia 1922 roku (wersja drukowana). Ta ostatnia propozycja postulowa┼éa w┼é─ůczenie do Polski cz─Ö┼Ťci Tatr Wysokich na wsch├│d od Rys├│w i Morskiego Oka oraz dzieli┼éa Dolin─Ö Jaworzyny pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö (granica mia┼éa biec dnem doliny). By┼éy to propozycje korzystniejsze dla Polski ni┼╝ wcze┼Ťniejsze rozstrzygni─Öcia Rady Ambasador├│w. Natomiast ta sama propozycja Komisji Delimitacyjnej z roku 1922 dzieli┼éa p├│┼énocny Spisz w spos├│b jeszcze bardziej niekorzystny dla Polski, pozostawiaj─ůc gminy Kacwin i Niedzica po stronie czechos┼éowackiej. Co ciekawe taki sam, bardzo niekorzystny dla Polski, podzia┼é p├│┼énocnego Spiszu uwzgl─Ödnia┼éa pierwsza propozycja Polski (wersja drukowana), kt├│ra jednocze┼Ťnie postulowa┼éa w┼é─ůczenie do Polski du┼╝o wi─Ökszego obszaru Tatr Wysokich wraz z ca┼é─ů Dolin─ů Jaworzyny (obszar ten pod wzgl─Ödem historycznym tak┼╝e jest zaliczany do Spiszu). Natomiast druga propozycja polska, z lutego 1924 (kolor ┼╝├│┼éty), rozk┼éada akcenty zdecydowanie inaczej. Postulowa┼éa przy┼é─ůczenie do Polski gmin Kacwin i Niedzica na p├│┼énocnym Spiszu (zgodnie z propozycj─ů czechos┼éowack─ů i wcze┼Ťniejsz─ů decyzj─ů Rady Ambasador├│w), natomiast ogranicza┼éa ┼╝─ůdania Polski dotycz─ůce fragmentu Tatr na wsch├│d od Morskiego Oka i rezygnowa┼éa ze wschodniej cz─Ö┼Ťci Doliny Jaworzyny. Mimo to, nowe, ograniczone terytorialnie, postulaty strony polskiej dotycz─ůce wschodniej cz─Ö┼Ťci Tatr Wysokich, nie zyska┼éy akceptacji strony czechos┼éowackiej oraz Ligi Narod├│w, kt├│ra miesi─ůc p├│┼║niej, 12 marca 1924 roku przyzna┼éa ca┼éy obszar Doliny Jaworzyny Czechos┼éowacji.	Carte de la fronti├Ęre Polono-Tchecoslovaque sur le territoire de Spisz (Jaworzyna)	granica polsko-czechos┼éowacka, granica polsko-s┼éowacka, Spisz, Dolina Jaworzyny, Tatry		Rada Ambasador├│w, linia Ambasador├│w, Komisja Delimitacyjna	4	Bureau technique de la Delegation Polonaise	75000		liczne propozycje przebiegu granicy pomi─Ödzy Polsk─ů a Czechos┼éowacj─ů na p├│┼énocnym Spiszu  oraz w Dolinie Jaworzyny, proponowane i ustalane w latach 1920-1924	maps/1H745Iz4vzRJVAyLu9JZG678qjg2u7hyK.jpg	2022-04-03 13:21:42.884624+02	https://drive.google.com/drive/folders/18qN9TcqtM6bjoeYefK_E3cpoPm4vZNRg?usp=sharing	Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1H745Iz4vzRJVAyLu9JZG678qjg2u7hyK_copy.jpg
10		8	\N	, prawdopodobnie 1919	Powstanie mapy jest konsekwencj─ů polsko-czeskich spor├│w o przynale┼╝no┼Ť─ç pa┼ästwow─ů ┼Ül─ůska Cieszy┼äskiego, a bezpo┼Ťrednio jest zwi─ůzane z podpisaniem 5 listopada 1918 roku wst─Öpnego porozumienia w┼éadz lokalnych (polskich i czeskich) tymczasowo dziel─ůcego ten region wed┼éug kryterium etnicznego (a precyzyjniej j─Özykowego). Umowa ta przydziela┼éa polskiej administracji powiaty, kt├│re zamieszka┼ée by┼éy w wi─Ökszo┼Ťci przez ludno┼Ť─ç polskoj─Özyczn─ů: bielski, cieszy┼äski oraz wi─Öksz─ů cz─Ö┼Ť─ç powiatu frysztackiego (na mapie kolor bia┼éy), a czechos┼éowackiej powiat frydecki i pozosta┼é─ů cz─Ö┼Ťci─ů powiatu frysztackiego (na mapie kolor niebieski). Podzia┼é ten nie ko┼äczy┼é i nie rozwi─ůzywa┼é konfliktu, a ostateczne rozgraniczenie terytorialne pozostawia┼é si─Ö do rozstrzygni─Öcia przez rz─ůdy Polski i Czechos┼éowacji. By┼é on korzystny dla strony polskiej i stanowi┼é podstaw─Ö dla dalszego podtrzymania roszcze┼ä terytorialnych. Przydziela┼é Polsce zdecydowan─ů wi─Ökszo┼Ť─ç ┼Ül─ůska Cieszy┼äskiego wraz z cz─Ö┼Ťci─ů kopal┼ä w─Ögla kamiennego i zak┼éad├│w przemys┼éowych w okolicach Karwiny, Rychwa┼édu i Bogumina. Strona czechos┼éowacka nie zaakceptowa┼éa podzia┼éu wed┼éug kryterium etnicznego, domagaj─ůc si─Ö na podstawie argument├│w historycznych, ca┼éego obszaru Ksi─Östwa Cieszy┼äskiego.\nNa mapie przedstawiono Ksi─Östwo Cieszy┼äskie z podzia┼éem na powiaty, z zaznaczonymi g┼é├│wnymi miastami, liniami kolejowymi, rzekami, zag┼é─Öbiami w─Öglowymi w okolicach Ostrawy i Karwiny oraz Czechowic (kolor ┼╝├│┼éty). Najistotniejszym elementem zamieszczonym na mapie jest zaznaczenie obszar├│w (powiat├│w i gmin) obj─Ötych tymczasow─ů administracj─ů polsk─ů (kolor bia┼éy) oraz czesk─ů (kolor niebieski), na podstawie porozumienia z 5 listopada 1918 roku. \nPonadto obok mapy dodano informacje o strukturze narodowo┼Ťciowej tego obszaru, wed┼éug wynik├│w spis├│w ludno┼Ťci z lat 1880, 1890, 1900, 1910 z podzia┼éem na Polak├│w, Niemc├│w i Czech├│w, zar├│wno w odniesieniu do ca┼éego obszaru Ksi─Östwa Cieszy┼äskiego, jak i z wy┼é─ůczeniem, najliczniej zamieszkanego przez Czech├│w, powiatu frydeckiego. Jednocze┼Ťnie autorzy mapy podkre┼Ťlili, ┼╝e wyniki ostatniego spisu powszechnego z 1910 roku przeprowadzonego w Monarchii Austro-W─Ögierskiej, s─ů ÔÇ×niekorzystne dla narodowo┼Ťci polskiej w wyniku fa┼észerstw i r├│┼╝nych nacisk├│wÔÇŁ. W trakcie tego spisu (jak i w trakcie wcze┼Ťniejszych) nie by┼éo pytania o narodowo┼Ť─ç, a struktur─Ö etniczn─ů ustalano wed┼éug odpowiedzi na pytanie o ÔÇ×j─Özyk domowyÔÇŁ. Wszystkie zamieszczone na mapie dane statystyczne dowodzi┼éy wyra┼║nej dominacji ludno┼Ťci polskiej na obszarze ┼Ül─ůska Cieszy┼äskiego.\nPoza danymi pochodz─ůcymi ze spis├│w powszechnych, autorzy mapy zamie┼Ťcili tak┼╝e informacje dotycz─ůce ÔÇ×linii j─ÖzykowychÔÇŁ, przytaczaj─ůc opinie trzech badaczy (Polaka i dw├│ch Czech├│w), dowodz─ůce, ┼╝e obszar ┼Ül─ůska Cieszy┼äskiego jest obj─Öty zasi─Ögiem j─Özyka polskiego, a j─Özyk czeski pojawia si─Ö dopiero na zach├│d od tego regionu. Naniesiono tak┼╝e granic─Ö (linia czerwona) oddzielaj─ůc─ů j─Özyk polski (cz─Ö┼Ť─ç wschodnia) od dialekt├│w przej┼Ťciowych (cz─Ö┼Ť─ç zachodnia), kt├│ra cz─Ö┼Ťciowo biegnie wzd┼éu┼╝ granicy powiatu frydeckiego, a nast─Öpnie przecina go, zostawiaj─ůc ca┼éy powiat frysztacki po stronie j─Özyka polskiego, co nie znalaz┼éo potwierdzenia w wynikach spisu powszechnego z 1910 roku. \nPod map─ů znajduje si─Ö nieczytelna, okr─ůg┼éa, czerwona piecz─Ö─ç, prawdopodobnie jest to piecz─Ö─ç Archiwum Akt Nowych.\nZ tre┼Ťci mapy oraz zamieszczonych obok niej danych statystycznych, mo┼╝na wnioskowa─ç, ┼╝e do Polski powinna nale┼╝e─ç nie tylko cz─Ö┼Ť─ç ┼Ül─ůska Cieszy┼äskiego wst─Öpnie przyznana jej w administrowanie na podstawie porozumienia z 5 listopada 1918 roku, ale tak┼╝e niekt├│ry gminy przyznane stronie czeskiej, zw┼éaszcza w najbardziej uprzemys┼éowionym powiecie frysztackim. \nPomimo u nazwiska autora mapy oraz wydawcy czy miejsca wydania, tre┼Ť─ç mapy jednoznacznie wskazuje, i┼╝ zosta┼éa ona przygotowana przez stron─Ö polsk─ů, a u┼╝yty w niej j─Özyk francuski, wskazuje, i┼╝ adresatem s─ů politycy i eksperci francuscy.\nNajbardziej interesuj─ůcym elementem mapy, s─ů odr─Öcznie naniesione dwie linie ÔÇô czerwona i zielona. Z raportu do┼é─ůczonego do mapy, wynika, ┼╝e narysowa┼é je Roman Dmowski, w Pary┼╝u, 11 wrze┼Ťnia 1919 roku, podczas spotkania z polskim dyplomat─ů Janem Ciechanowskim (kt├│ry jest autorem raportu). Raport by┼é przeznaczony dla J├│zefa Pi┼ésudskiego, omawia┼é przebieg rozm├│w pomi─Ödzy R. Dmowskim a J. Cambonem oraz Komisj─ů ds. polskich, dotycz─ůcych przeprowadzenia plebiscytu na ┼Ül─ůsku Cieszy┼äskim. Linie narysowane przez R. Dmowskiego by┼éy propozycjami Komisji dotycz─ůcymi przebiegu linii demarkacyjnej (czerwona) oraz granicy (zielona). Wariant czerwony by┼é dla Polski korzystniejszy, poniewa┼╝ przyznawa┼é jej p├│┼énocno-zachodni─ů cz─Ö┼Ť─ç Zag┼é─Öbia Ostrawsko-Karwi┼äskiego. Wed┼éug raportu, obie te propozycje Dmowski kategorycznie odrzuci┼é, b─Öd─ůc przekonanym, ┼╝e sytuacja w tym regionie rozwinie si─Ö dla Polski pomy┼Ťlnie.\nOstatecznie ┼Ül─ůsk Cieszy┼äski zosta┼é w roku 1920 podzielony w spos├│b du┼╝o bardziej niekorzystny dla Polski.	Le Duche de Cieszyn (Teschen) Silesie	┼Ül─ůsk Cieszy┼äski, Ksi─Östwo Cieszy┼äskie, pogranicze polsko-czeskie, granica polsko-czeska	Roman Dmowski, Jan Ciechanowski	struktura narodowo┼Ťciowa, struktura j─Özykowa, polsko-czeskie porozumienie z 5 listopada 1918 roku, w─Ögiel kamienny;zag┼é─Öbkie	\N		 (na mapie odr─Öcznie wrysowana podzia┼éka liniowa)		Podzia┼é ┼Ül─ůska Cieszy┼äskiego wed┼éug kryterium etnicznego (j─Özykowego), na powiaty i gminy obj─Öte administracj─ů polsk─ů oraz czesk─ů, na podstawie porozumienia z 5 listopada 1918 roku, z odr─Öcznie naniesionymi dwiema propozycjami podzia┼éu tego regionu	maps/1C9qAALloCYU2k9sVxHtibZtRo0OmuA4w.jpg	2022-04-03 13:21:42.965158+02	https://drive.google.com/drive/folders/1ar2Q3ruyx-0jB9w7NffXVDUITFEDbsl-?usp=sharing	Mapa r─Ökopi┼Ťmienna z dodatkowymi adnotacjami	thumbnails/1C9qAALloCYU2k9sVxHtibZtRo0OmuA4w_copy.jpg
32		30	\N	1919	Mapa za┼é─ůcznikowa do memoria┼éu "Caract├Ęre physique du territoire de la Pologne"	Caract├Ęre physique du territoire de la Pologne	granica polsko-niemiecka, granica polsko-bolszewicka, granica polsko-ukrai┼äska		Komitet Narodowy Polski	\N				granice polski	maps/1XnpiaoXgJxuzgmSR3lR0fi7BS29plIeV.jpg	2022-04-03 13:21:43.3914+02	https://drive.google.com/drive/folders/1AhHPKWNS9-hr_NdQjoOWrNjUie3uF2lr	Mapa r─Ökopi┼Ťmienna	thumbnails/1XnpiaoXgJxuzgmSR3lR0fi7BS29plIeV_copy.jpg
16		14	\N	, ok. 1917-1919	Na mapie, na obszarze szeroko poj─Ötego pogranicza polsko-czesko-s┼éowackiego, rozci─ůgaj─ůcego si─Ö od Sanoka i Koszyc po Opolszczyzn─Ö i ┼Ül─ůsk Opawski, przedstawiono granice j─Özykowe polsko-czeskie i polsko-s┼éowackie wraz ze stref─ů dialekt├│w przej┼Ťciowych.\nAutorem mapy jest Kazimierz Nitsch, polski j─Özykoznawca i slawista, profesor Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiello┼äskiego, jeden z ekspert├│w delegacji polskiej na konferencj─Ö pokojow─ů w Pary┼╝u w 1919 roku.\nNa mapie zaznaczono sie─ç rzeczn─ů, granice przedwojenne oraz granice Polski z ko┼äca XVIII wieku (z regu┼éy fragmentarycznie, natomiast szczeg├│┼éowo wszelkie przedrozbiorowe polskie enklawy na Spiszu). G┼é├│wnymi elementami mapy s─ů granice zasi─Ögu j─Özyka czeskiego i s┼éowackiego (linia niebieska), po┼éudniowa granica zasi─Ögu j─Özyka polskiego (linia czerwona) oraz zaznaczona szrafem szeroka strefa dialekt├│w przej┼Ťciowych (w domy┼Ťle polsko-czesko-s┼éowackich).Strefa dialekt├│w przej┼Ťciowych pomi─Ödzy j─Özykiem polskim a czeskim i s┼éowackim, rozci─ůga od ┼Ül─ůska Opawskiego na zachodzie, przez region Frydecki i Czadecki, po Oraw─Ö w┼é─ůcznie. Natomiast w Galicji (Beskid Niski) obszary zamieszkane przez ludno┼Ť─ç pos┼éuguj─ůc─ů si─Ö j─Özykiem polskim (na p├│┼énocy) oraz s┼éowackim (na po┼éudniu), s─ů rozdzielone szerok─ů stref─ů osadnictwa ludno┼Ťci rusi┼äskiej (┼üemkowie, Rusnacy), pos┼éuguj─ůcej si─Ö dialektem j─Özyka ukrai┼äskiego, przez co nie dochodzi tam do bezpo┼Ťredniego kontaktu Polak├│w i S┼éowak├│w.  W pobli┼╝u po┼éudniowej granicy zasi─Ögu j─Özyka polskiego oraz w strefie dialekt├│w przej┼Ťciowych naniesiono liczne, nawet niewielkie miejscowo┼Ťci i wsie, co umo┼╝liwia precyzyjn─ů identyfikacj─Ö polsko-czeskiej i polsko-s┼éowackiej granicy j─Özykowej.\nZ mapy jednoznacznie wynika, ┼╝e trzy g┼é├│wne regiony sporne na pograniczu polsko-czechos┼éowacki po zako┼äczeniu I wojny ┼Ťwiatowej, czyli ┼Ül─ůsk Cieszy┼äski, Orawa oraz p├│┼énocny Spisz, w zdecydowanej wi─Ökszo┼Ťci nale┼╝─ů do polskiego obszaru j─Özykowego, ewentualnie znajduj─ů si─Ö w strefie dialekt├│w przej┼Ťciowych (po┼éudniowa Orawa). Najbardziej jaskrawo jest to widoczne na przyk┼éadzie ┼Ül─ůska Cieszy┼äskiego, kt├│ry prawie w ca┼éo┼Ťci znajduje si─Ö w polskim obszarze j─Özykowym, a granica zasi─Ögu j─Özyka polskiego si─Öga po Ostraw─Ö, obejmuj─ůc m.in. Bogumin, prawie ca┼ée Zag┼é─Öbie Ostrawsko-Karwi┼äskie, wi─Ökszo┼Ť─ç Zaolzia, a nawet du┼╝─ů cz─Ö┼Ť─ç powiatu frydeckiego, si─Öga te┼╝ na po┼éudnie od historycznego obszaru ┼Ül─ůska Cieszy┼äskiego. Z kolei najbardziej skomplikowany jest przebieg granicy j─Özyka polskiego na Spiszu, z licznymi ÔÇ×wyspami j─ÖzykowymiÔÇŁ i stref─ů dialekt├│w przej┼Ťciowych na po┼éudnie od Tatr.\nNa podstawie tej mapy mo┼╝na stwierdzi─ç, ┼╝e formu┼éowane m.in. podczas konferencji pokojowej w Pary┼╝u, polskie roszczenia terytorialne dotycz─ůce ┼Ül─ůska Cieszy┼äskiego, Orawy i Spiszu, by┼éy ca┼ékowicie uzasadnione kryteriami j─Özykowymi i etnicznymi, a arbitralne rozstrzygni─Öcia Rady Ambasador├│w z 28 lipca 1920 roku, dziel─ůce te obszary pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, bez zachowania nadrz─Ödno┼Ťci kryteri├│w j─Özykowo-etnicznych, by┼éy dla Polski oraz ludno┼Ťci mieszkaj─ůcej na polsko-czechos┼éowackim pograniczu, niesprawiedliwe i krzywdz─ůce.	Limites de Linguistiques Polonaise-Tcheque et Polonaise-Slovaque	pogranicze polsko-czeskie, pogranicze polsko-s┼éowackie, ┼Ül─ůsk Cieszy┼äski, Orawa, Spisz	Kazimierz Nitsch	struktura j─Özykowa, pogranicze j─Özykowe, zasi─Ög j─Özyka polskiego, Komitet Narodowy Polski	8	Lit. W. Krzeptowski	600000		granice j─Özykowe polsko-czeskie i polsko-s┼éowackie oraz strefa dialekt├│w przej┼Ťciowych	maps/1yhgoi1jtLzhq2FmGYKvYfRnYX-WCz5H_.jpg	2022-04-03 13:21:43.085188+02	https://drive.google.com/drive/folders/1sYjkaI4qKMWn_7OA1KPpV9kWO_SOVp_V?usp=sharing	Mapa r─Ökopi┼Ťmienna	thumbnails/1yhgoi1jtLzhq2FmGYKvYfRnYX-WCz5H__copy.jpg
46		44	\N		Na mapie przedstawiono zasi─Ög wyst─Öpowania z┼é├│┼╝ w─Ögla kamiennego i brunatnego na obszarze Czechos┼éowacji oraz ┼Ül─ůska	Carte d'ensemble des existences de charbon dans l'Etat Tch├ęco-slovaque	Czechos┼éowacja, ┼Ül─ůsk, granica polsko-s┼éowacka, granica polsko-czeska		z┼éo┼╝a w─Ögla, surowce naturalne, mapa gospodarcza	\N				Mapa wyst─Öpowania z┼é├│┼╝ w─Ögla w pa┼ästwie Czechos┼éowackim	maps/1xVWY4dURE2fixm1Zg4VbQ7ChD8aArVDk.jpg	2022-04-03 13:21:43.648027+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b	Mapa r─Ökopi┼Ťmienna	thumbnails/1xVWY4dURE2fixm1Zg4VbQ7ChD8aArVDk_copy.jpg
19		17	\N	, ok. 1917-1919	Mapa w j─Özyku angielskim wydana przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawiaj─ůca procentowy udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych w powiatach wschodniej cz─Ö┼Ťci Prus, wed┼éug oficjalnych danych statystycznych rz─ůdu pruskiego, pochodz─ůcych ze spisu szkolnego z roku 1911. Na mapie  daty, ale mo┼╝na przypuszcza─ç, ┼╝e zosta┼éa wykonana w latach 1917-1919.\nSzrafem przedstawiono udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych w pi─Öciu nier├│wnych przedzia┼éach procentowych ÔÇô 0,5-10%; 10-25%; 25-40%; 40-50%; 50-100%, na tle podzia┼éu administracyjnego na powiaty, rejencje i prowincje.\nZ danych przedstawionych na mapie wynika dominuj─ůcy (ponad 50%) udzia┼é uczni├│w narodowo┼Ťci polskiej we wszystkich powiatach G├│rnego ┼Ül─ůska, wschodniej cz─Ö┼Ťci Opolszczyzny, zdecydowanej wi─Ökszo┼Ťci Wielkopolski, wi─Ökszo┼Ťci Kaszub oraz szerokiego pasa w po┼éudniowej cz─Ö┼Ťci Mazur.\nWykorzystywanie przez polskie instytucje, na potrzeby przedstawiania argument├│w za polsko┼Ťci─ů ┼Ül─ůska, Wielkopolski, Pomorza, Warmii i Mazur, oraz w celu wykazania s┼éuszno┼Ťci polskich ┼╝─ůda┼ä odno┼Ťnie przysz┼éych zachodnich granic Polski, danych pochodz─ůcych z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, by┼éo uzasadnione m.in. tym, ┼╝e w spisach powszechnych narodowo┼Ť─ç by┼éa ustalana na podstawie odpowiedzi na pytanie o j─Özyk ojczysty, a statystyka pruska wyszczeg├│lnia┼éa obok j─Özyka polskiego, tak┼╝e j─Özyk kaszubski i mazurski, co skutecznie zmniejsza┼éo liczb─Ö os├│b deklaruj─ůcych j─Özyk polski (a tym samym liczb─Ö os├│b zaliczonych do polskiej narodowo┼Ťci). Ponadto w pruskim spisie powszechnym istnia┼éa mo┼╝liwo┼Ť─ç zadeklarowania dw├│ch j─Özyk├│w i cz─Ö┼Ť─ç Polak├│w, znaj─ůcych tak┼╝e j─Özyk niemiecki, deklarowa┼éo j─Özyk polski wraz z niemieckim, co skutkowa┼éo zaliczeniem ich do tzw. ÔÇ×os├│b dwuj─ÖzycznychÔÇŁ.\nW lewym g├│rnym rogu mapy dopisano odr─Öcznie w j─Özyku francuskim Epreuve, czyli Test.	Ethnographic map of Prussian Poland drafted from official statistic of elementary schools in the Kingdom of Prussia year 1911	Prusy		statystyka narodowo┼Ťciowa, dzieci narodowo┼Ťci polskiej w szko┼éach, pruski spis szkolny 1911, Centralna Agencja Polska w Lozannie	3	Cartographical Bureau of the "Polish Central Agency" in Lausanne	1 000 000 (podzia┼éka)		procentowy udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych w powiatach wschodniej cz─Ö┼Ťci Prus, wed┼éug oficjalnych danych statystycznych rz─ůdu pruskiego, pochodz─ůcych ze spisu szkolnego z roku 1911	maps/1S0-Bw_k93Pea0m0UhXFV9oyc3i30kQ2n.jpg	2022-04-03 13:21:43.147725+02		Mapa drukowana	thumbnails/1S0-Bw_k93Pea0m0UhXFV9oyc3i30kQ2n_copy.jpg
47		45	\N		Mapa b─Öd─ůca cz─Ö┼Ťci─ů artyku┼éy pt. "W─Ögiel jako postulat ┼╝ywotno┼Ťci pa┼ästwa polskiego" autorstwa in┼╝. Franciszka Drobiniaka wydanego w Czasopi┼Ťmie G├│rniczo-Hutniczym w marcu 1919. Na mapie zaznaczono wyst─Öpowanie z┼é├│┼╝ w─Ögla na obszarze Czechos┼éowacji i ┼Ül─ůska Cieszy┼äskiego.	Carte d'ensemble des existences de charbon dans l'Etat Tch├ęco-slovaque	granica polsko-s┼éowacka, ┼Ül─ůsk Cieszy┼äski		surowce naturalne, w─Ögiel kamienny, w─Ögiel brunatny	\N				surowce naturalne, w─Ögiel kamienny	maps/1QvHT0kjn3OhuY_SH_7EgaU8y7lF5G7N8.jpg	2022-04-03 13:21:43.661275+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b	Mapa drukowana	thumbnails/1QvHT0kjn3OhuY_SH_7EgaU8y7lF5G7N8_copy.jpg
22		20	\N	, ok. 1917-1919	Tytu┼é mapy mo┼╝na t┼éumaczy─ç jako ÔÇ×mapa etnograficzna ziem polskich pod zaborem pruskimÔÇŁ.\nMapa zosta┼éa wydana przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawia procentowy udzia┼é ludno┼Ťci polskiej w poszczeg├│lnych powiatach wschodniej cz─Ö┼Ťci Prus, na podstawie danych spisu powszechnego z 1910 roku i cz─Ö┼Ťciowo z roku 1900 oraz odr─Öcznie wrysowan─ů propozycj─Ö przebiegu granicy polsko-niemieckiej. \nPod legend─ů mapy umieszczono informacj─Ö w j─Özyku francuskim (t┼éumaczenie) Uwaga. Mapa oparta jest na oficjalnych danych pruskich ze spisu powszechnego z 1910 r., kt├│ry zosta┼é opublikowany szczeg├│┼éowo tylko dla rejencji w Poznaniu, Bydgoszczy, Gda┼äsku, Kwidzynie, Olsztynie i Opolu. Dla innych okr─Ög├│w musieli┼Ťmy przyj─ů─ç dane z 1900 roku.\nNa mapie  daty, ale mo┼╝na przypuszcza─ç, ┼╝e zosta┼éa wykonana w latach 1917-1919.\nSzrafem, w podziale na powiaty, przedstawiono udzia┼é os├│b narodowo┼Ťci polskiej w pi─Öciu nier├│wnych przedzia┼éach procentowych: 0,5-10%; 10-25%; 25-40%; 40-50%; 50-100%.\nZ danych przedstawionych na mapie wynika dominuj─ůcy (ponad 50%) udzia┼é ludno┼Ťci polskiej w wi─Ökszo┼Ťci powiat├│w G├│rnego ┼Ül─ůska (poza raciborskim), we wschodniej cz─Ö┼Ťci Opolszczyzny, zdecydowanej wi─Ökszo┼Ťci Wielkopolski, wschodniej cz─Ö┼Ťci Kaszub oraz w po┼éudniowej cz─Ö┼Ťci Mazur.\nW pruskich spisach powszechnych narodowo┼Ť─ç by┼éa ustalana na podstawie odpowiedzi na pytanie o j─Özyk ojczysty, a statystyka pruska wyszczeg├│lnia┼éa obok j─Özyka polskiego, tak┼╝e j─Özyk kaszubski i mazurski, co skutecznie zmniejsza┼éo liczb─Ö os├│b deklaruj─ůcych j─Özyk polski (a tym samym liczb─Ö os├│b zaliczonych do polskiej narodowo┼Ťci). Ponadto w pruskim spisie powszechnym istnia┼éa mo┼╝liwo┼Ť─ç zadeklarowania dw├│ch j─Özyk├│w i cz─Ö┼Ť─ç Polak├│w, znaj─ůcych tak┼╝e j─Özyk niemiecki, deklarowa┼éo j─Özyk polski wraz z niemieckim, co skutkowa┼éo zaliczeniem ich do tzw. ÔÇ×os├│b dwuj─ÖzycznychÔÇŁ.\nNa mapie zosta┼éa odr─Öcznie o┼é├│wkiem narysowana linia, przypuszczalnie propozycja przebiegu granicy polsko-niemieckiej. Przecina ona ┼Ül─ůsk Cieszy┼äski, powiat Racib├│rz, G┼éubczyce i Pr─ůdnik, w┼é─ůczaj─ůc w granice Polski ca┼éy G├│rny ┼Ül─ůsk, a tak┼╝e centraln─ů i wschodni─ů Opolszczyzn─Ö. Nast─Öpnie linia graniczna pozostawia po polskiej stronie powiaty Namys┼é├│w i Syc├│w, w┼é─ůcza do Polski zdecydowan─ů wi─Ökszo┼Ť─ç Wielkopolski (m.in. z powiatami Babimost, Mi─Ödzych├│d, Wiele┼ä i Chodzie┼╝) oraz wi─Ökszo┼Ť─ç Pomorza Gda┼äskiego, gdzie przecina powiat Cz┼éuch├│w i S┼éupsk. \nZaproponowano przebieg granicy w ten spos├│b, aby w┼é─ůczy─ç do Polski nie tylko wszystkie powiaty z ponad 50% oraz z ponad 40%, udzia┼éem ludno┼Ťci polskiej, ale tak┼╝e te, gdzie wed┼éug danych spisu powszechnego Polacy stanowili 25-40% og├│┼éu ludno┼Ťci, a w przypadku zachodniej cz─Ö┼Ťci Pomorza Gda┼äskiego, nawet powiaty z zaledwie kilkunasto, czy wr─Öcz kilkuprocentowym udzia┼éem ludno┼Ťci polskiej (Cz┼éuch├│w, Byt├│w, S┼éupsk i L─Öbork).\nPrzedstawiona na mapie propozycja wytyczenia granicy polsko-niemieckiej, bazowa┼éa na kryteriach narodowo┼Ťciowych i strategicznych. Kryterium narodowo┼Ťciowe (ponad 50% dominacja Polak├│w) by┼éo wystarczaj─ůcy, ┼╝eby w┼é─ůczy─ç w granice Polski G├│rny ┼Ül─ůsk oraz wschodni─ů Opolszczyzn─Ö. Jednak w przypadku po┼éudniowej Opolszczyzny oraz cz─Ö┼Ťciowo Wielkopolski (zw┼éaszcza po┼éudniowej i p├│┼énocnej) ten "narodowo┼Ťciowy pr├│g w┼é─ůczenia w granice Polski" obni┼╝ono do 25%, co przy konsekwentnym stosowaniu ÔÇ×kryterium narodowo┼ŤciowegoÔÇŁ powinno oznacza─ç przyznanie tych powiat├│w Niemcom. Natomiast na Pomorzu, z powodu du┼╝o wi─Ökszego udzia┼éu ludno┼Ťci niemieckiej, zdecydowano o ca┼ékowitym odej┼Ťciu od kryterium narodowo┼Ťciowego na rzecz kryterium strategicznego i gospodarczego (szeroki dost─Öp do morza). Propozycja granicy polsko-niemieckiej na Warmii i Mazurach nie zosta┼éa naszkicowana.\nNie podano autora (autor├│w) proponowanej linii granicznej.\nNa marginesach mapy umieszczono odr─Öczne, cz─Ö┼Ťciowo nieczytelne, adnotacje, dotycz─ůce m.in. poszczeg├│lnych odcink├│w linii kolejowych. 	Carte Ethnographique de la Pologne Prussienne	Prusy, granica polsko-niemiecka		struktura narodowo┼Ťciowa, Polacy w Prusach, pruski spis powszechny z 1910 roku	3	Bureau Cartographique de l' "Agence Polonaise Central"	1 000 000 (podzia┼éka)		udzia┼é ludno┼Ťci polskiej w poszczeg├│lnych powiatach wschodniej cz─Ö┼Ťci Prus, na podstawie danych spisu powszechnego z 1910 roku i cz─Ö┼Ťciowo z roku 1900 oraz odr─Öcznie wrysowana propozycja przebiegu granicy polsko-niemieckiej	maps/1Yntg0yApgMSzJD6prn4TnOYiGrhk-U0Z.jpg	2022-04-03 13:21:43.204729+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1Yntg0yApgMSzJD6prn4TnOYiGrhk-U0Z_copy.jpg
24		22	\N	, ok. 1919	Na mapie przedstawiono za pomoc─ů szrafu, w trzech przedzia┼éach liczbowych (powy┼╝ej 75%; powy┼╝ej 50%; oko┼éo 25%), rozmieszczenie i udzia┼é procentowy ludno┼Ťci polskiej na obszarze Orawy i Spiszu. Ponadto zaznaczono granic─Ö sprzed 1914 roku pomi─Ödzy W─Ögrami a Austri─ů (Galicj─ů), linie kolejowe, g┼é├│wne miasta oraz miasteczka i wsie na Spiszu i Orawie.\nNa mapie  podania ┼║r├│de┼é u┼╝ytych danych liczbowych, mo┼╝na jednak przypuszcza─ç (na podstawie por├│wna┼ä z innymi mapami z tego okresu), ┼╝e zosta┼éa ona opracowana na podstawie wynik├│w bada┼ä Kazimierza Nitscha, polskiego j─Özykoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiello┼äskiego, jednego z ekspert├│w delegacji polskiej na konferencj─Ö pokojow─ů w Pary┼╝u w 1919 roku. Oznacza to, ┼╝e rozmieszczenie i liczba Polak├│w zosta┼éo opracowane na podstawie kryteri├│w j─Özykowych.\nZ mapy wynika, ┼╝e Orawa i Spisz, kt├│re po zako┼äczeniu I wojny ┼Ťwiatowej by┼éy regionami spornymi na pograniczu polsko-s┼éowacki, by┼éy w├│wczas zdominowane przez ludno┼Ť─ç polsk─ů (polskoj─Özyczn─ů). Najbardziej wyra┼║na, ponad 75% dominacja ludno┼Ťci polskiej (polskoj─Özycznej) jest widoczna zw┼éaszcza w p├│┼énocnej cz─Ö┼Ťci Orawy i Spiszu. Im dalej na po┼éudnie, tym sytuacja narodowo┼Ťciowo-j─Özykowa tych region├│w by┼éa bardziej skomplikowana i niejednoznaczna. Dotyczy┼éo to zw┼éaszcza Spiszu, na kt├│rym wyst─Öpowa┼éy liczne ÔÇ×wyspy j─ÖzykoweÔÇŁ, w tym niemieckie. \nNa podstawie omawianej mapy, mo┼╝na stwierdzi─ç, ┼╝e formu┼éowane m.in. podczas konferencji pokojowej w Pary┼╝u, polskie roszczenia terytorialne dotycz─ůce p├│┼énocnej Orawy i p├│┼énocnego Spiszu, by┼éy uzasadnione kryteriami j─Özykowymi i etnicznymi, a arbitralne rozstrzygni─Öcia Rady Ambasador├│w z 28 lipca 1920 roku, dziel─ůce te obszary pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, bez zachowania nadrz─Ödno┼Ťci kryteri├│w j─Özykowo-etnicznych, by┼éy dla Polski oraz ludno┼Ťci mieszkaj─ůcej na polsko-s┼éowackim pograniczu, niesprawiedliwe i krzywdz─ůce.\nW lewym g├│rnym roku mapy znajduje si─Ö okr─ůg┼éa piecz─ůtka z napisem Komitet Narodowy Obrony Orawy, Spisza i Podhala w Warszawie.	Rozsiedlenie ludno┼Ťci polskiej na Orawie i Spiszu	Orawa, Spisz, pogranicze polsko-s┼éowackie, granica polsko-s┼éowacka	Kazimierz Nitsch	struktura narodowo┼Ťciowa, struktura j─Özykowa, Polacy na Spiszu i Orawie	10	Sekcja Mi┼éo┼Ťnik├│w G├│r P.T.K. w Warszawie	300000		rozmieszczenie i udzia┼é procentowy ludno┼Ťci polskiej na Orawie i Spiszu	maps/18qhsMLJXMmqgEnnrBhFjx1El1BPoeV4C.jpg	2022-04-03 13:21:43.249153+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/18qhsMLJXMmqgEnnrBhFjx1El1BPoeV4C_copy.jpg
49		47	\N		Na mapie przedstawiono projekt granicy polsko-rumu┼äskiej na tle granic z 1914 r. Ponadto umieszczono na niej schemat linii kolejowych, g┼é├│wne miasta, sie─ç rzeczn─ů, przebieg ┼éa┼äcuch├│w g├│rskich oraz ÔÇ×nowe graniceÔÇŁ. Ich przebieg (np. wschodnia granica Polski) jest cz─Ö┼Ťciowo niezgodny z ostatecznie ustalonym powojennym przebiegiem granic. Natomiast niewielki fragment granicy polsko-rumu┼äskiej, po ostatecznym wytyczeniu, nie odbiega┼é od projektu zamieszczonego na omawianej mapie, poza tym, ┼╝e by┼é kr├│tszy, z powodu nieco odmiennego przebiegu granic Czechos┼éowacji, W─Ögier i Rosji.	Projet de la future fronti├Ęre polono-roumaine	granica polsko-rumu┼äska		projekt granic	\N		5000000		projekt przebiegu granicy polsko-rumu┼äskiej	maps/1HNUM8FcdaLjl1XlaF8aZSq88DkHYFjOy.jpg	2022-04-03 13:21:43.687344+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV?usp=sharing	Mapa drukowana	thumbnails/1HNUM8FcdaLjl1XlaF8aZSq88DkHYFjOy_copy.jpg
7	Pierworys wykonany na podk┼éadzie tre┼Ťci mapy wydanej  przez Ksi─Ögarnia p.f. "Stella" M. Czajkowskiego w Cieszynie.	5	\N	4 listopad 1918	Na mapie Ksi─Östwa Cieszy┼äskiego z listopada 1918 roku przedstawiono rozmieszczenie ludno┼Ťci polskiej (kolor czerwony ÔÇô wschodnia, centralna i p├│┼énocna cz─Ö┼Ť─ç Ksi─Östwa) oraz czeskiej i morawskiej (zachodnia cz─Ö┼Ť─ç Ksi─Östwa), a tak┼╝e zaznaczono zielonym szrafem zag┼é─Öbia w─Öglowe, z podzia┼éem na ÔÇ×produkuj─ůceÔÇŁ i ÔÇ×odkryteÔÇŁ. Zlokalizowane s─ů one w p├│┼énocnej cz─Ö┼Ťci Ksi─Östwa Cieszy┼äskiego, zw┼éaszcza w okolicy Ostrawy i Karwina, gdzie jest najwi─Öksza koncentracja ÔÇ×zag┼é─Öbi produkuj─ůcychÔÇŁ, co jest zgodne ze stanem faktycznym (Zag┼é─Öbie Ostrawsko-Karwi┼äskie). Ponadto zaznaczono miasta, w kt├│rych znajduj─ů si─Ö huty ┼╝elaza (Bogumin, Frysztat), miasta w kt├│rych zlokalizowano ÔÇ×fabryki r├│┼╝neÔÇŁ oraz naniesiono poszczeg├│lne miejscowo┼Ťci, linie kolejowe, drogi, rzeki, granice Ksi─Östwa i granice powiat├│w.\nNa mapie znajduj─ů si─Ö liczne odr─Öczne dopiski, np. dotycz─ůce liczby ludno┼Ťci Ksi─Östwa Cieszy┼äskiego, z podzia┼éem na trzy g┼é├│wne grupy wyznaniowe (katolicy, ewangelicy, ┼╗ydzi) oraz trzy g┼é├│wne narodowo┼Ťci (Polacy, Niemcy, Czesi). Mo┼╝na przypuszcza─ç, ┼╝e te informacje s─ů naniesione przez autora mapy. Ponadto zielonym pisakiem w j─Özyku francuskim dopisano przy kilku miastach rodzaje zak┼éad├│w przemys┼éowych, kt├│re si─Ö w nich znajduj─ů. Pod map─ů jest tak┼╝e odr─Öczny dopisek ÔÇ×Pary┼╝ dnia 8/XII 18ÔÇŁ oraz nieczytelny podpis. Nie podano ┼║r├│de┼é danych zamieszczonych na mapie, jednak mo┼╝na przypuszcza─ç, ┼╝e dane dotycz─ůce struktury narodowo┼Ťciowej pochodz─ů ze spisu powszechnego przeprowadzonego w Monarchii Austro-W─Ögierskiej w 1910 roku.\nZ mapy wynika, ┼╝e w listopadzie 1918 roku na obszarze Ksi─Östwa Cieszy┼äskiego wyra┼║nie dominowa┼éa ludno┼Ť─ç polska, katolicka (zar├│wno pod wzgl─Ödem przestrzennym, jak i liczbowym), a najbardziej uprzemys┼éowiona by┼éa cz─Ö┼Ť─ç p├│┼énocna Ksi─Östwa, a zw┼éaszcza p├│┼énocno-zachodnia, kt├│ra by┼éa jednocze┼Ťnie najbardziej zr├│┼╝nicowana pod wzgl─Ödem narodowo┼Ťciowym.	Mapa og├│lna Ksi─Östwa Cieszy┼äskiego	Ksi─Östwo Cieszy┼äskie, ┼Ül─ůsk Cieszy┼äski, pogranicze polsko-czeskie, granica polsko-czeska		struktura narodowo┼Ťciowa, Polacy, Czesi, g├│rnictwo, w─Ögiel kamienny	5	Ksi─Ögarnia p.f. "Stella" M. Czajkowskiego w Cieszynie	200000		Rozmieszczenie ludno┼Ťci polskiej i czeskiej na obszarze Ksi─Östwa Cieszy┼äskiego oraz lokalizacja zag┼é─Öbi w─Öglowych i g┼é├│wnych zak┼éad├│w przemys┼éowych;zaznaczono cz─Ö┼Ťci zag┼é─Öbia w─Öglowego produkuj─ůce i odkryte	maps/1b4Dne8muw16rEE9qU3e1-dN9et5H2H-s.jpg	2022-04-03 13:21:42.909116+02		Mapa r─Ökopi┼Ťmienna z dodatkowymi adnotacjami	thumbnails/1b4Dne8muw16rEE9qU3e1-dN9et5H2H-s_copy.jpg
8		6	\N	, po 1910 a przed 1919	Na mapie Ksi─Östwa Cieszy┼äskiego przedstawiono struktur─Ö narodowo┼Ťciow─ů wed┼éug danych ze spisu powszechnego przeprowadzonego w Monarchii Austro-W─Ögierskiej w 1910 roku. W spisie tym, nie zadawano pytania o narodowo┼Ť─ç, natomiast okre┼Ťlano j─ů na podstawie odpowiedzi na pytanie o ÔÇ×j─Özyk domowyÔÇŁ. \nNa mapie precyzyjnie wyszczeg├│lniono miasta i wsie znajduj─ůce si─Ö w Ksi─Östwie Cieszy┼äskim, r├│┼╝nicuj─ůc sygnatury w zale┼╝no┼Ťci od liczby mieszka┼äc├│w oraz przedstawiaj─ůc szrafem struktur─Ö narodowo┼Ťciow─ů mieszka┼äc├│w poszczeg├│lnych osad, w podziale na Polak├│w, Czech├│w i Niemc├│w. Zaznaczono tak┼╝e, zar├│wno szrafem jak i kolorem, granice powiat├│w (kolor niebieski), granice czeskiego terytorium etnograficznego wed┼éug wynik├│w spisu z 1910 roku (kolor czerwony), obszary wydobycia w─Ögla (kolor ┼╝├│┼éty). Ponadto naniesiono drogi i linie kolejowe. \nNa mapie  jest daty wydania, mo┼╝na jednak przypuszcza─ç, ┼╝e powsta┼éa po roku 1910, a przed 1919, dlatego ┼╝e zosta┼éy w niej u┼╝yte dane ze spisu z 1910 roku, natomiast jako pa┼ästwa s─ůsiaduj─ůce z Ksi─Östwem Cieszy┼äskim, podano W─Ögry, Galicj─Ö i Prusy, czyli stan sprzed zako┼äczenia I wojny ┼Ťwiatowej. \nZ mapy wynika, ┼╝e w wed┼éug danych spisu z 1910 roku, na obszarze Ksi─Östwa Cieszy┼äskiego wyra┼║nie dominowa┼éa ludno┼Ť─ç polska, (zar├│wno pod wzgl─Ödem przestrzennym, jak i liczbowym), zw┼éaszcza w jego cz─Ö┼Ťci wschodniej, centralnej i p├│┼énocnej. Czesi przewa┼╝ali w w─ůskim pasie cz─Ö┼Ťci zachodniej (bez fragmentu p├│┼énocno-zachodniego). Niemcy, og├│┼éem stanowili 18%, a ich obecno┼Ť─ç najbardziej zaznacza┼éa si─Ö w miastach, zw┼éaszcza w Bielsku, Cieszynie, Boguminie, Frydku, Skoczowie, gdzie byli ludno┼Ťci─ů dominuj─ůc─ů. Jako obszary wydobycia w─Ögla kamiennego zaznaczono okolice Ostrawy i Karwiny oraz Czechowic.\nRegionem najbardziej zr├│┼╝nicowanym narodowo┼Ťciowo, a jednocze┼Ťnie najbardziej uprzemys┼éowionym i najcenniejszym pod wzgl─Ödem gospodarczym, by┼éo wed┼éug danych spisu z 1910 roku Zag┼é─Öbie Ostrawsko-Karwi┼äskie, kt├│rego cz─Ö┼Ť─ç zachodnia (okolice Ostrawy) by┼éa zdominowana przez ludno┼Ť─ç czesk─ů, a cz─Ö┼Ť─ç wschodnia (okolice Karwiny) i p├│┼énocna przez Polak├│w. Ponadto w miastach sw─ů obecno┼Ť─ç zaznacza┼éa tak┼╝e ludno┼Ť─ç niemiecka. Tak du┼╝e zr├│┼╝nicowanie narodowo┼Ťciowe tego fragmentu Ksi─Östwa Cieszy┼äskiego, by┼éo konsekwencj─ů zar├│wno jego po┼éo┼╝enia na etnicznym pograniczu polsko-czeskim, jak i silnego uprzemys┼éowienia oraz wynikaj─ůcych z tego migracji ekonomicznych.	Le Duch├ę de Cieszyn (Teschen). Les nationalit├ęs dÔÇÖapr─Ťs le recensement de 1910	Ksi─Östwo Cieszy┼äskie, ┼Ül─ůsk Cieszy┼äski, pogranicze polsko-czeskie;zag┼é─Öbie ostrawsko-karwi┼äskie		struktura narodowo┼Ťciowa, austriacki spis powszechny 1910, Polacy, Czesi, Niemcy, g├│rnictwo, w─Ögiel kamienny	\N		300000	Le Duch├ę de Cieszyn (Teschen)	struktura narodowo┼Ťciowa Ksi─Östwa Cieszy┼äskiego na podstawie wynik├│w spisu z 1910 roku, obszary wydobycia w─Ögla kamiennego obejmuj─ůce zag┼é─Öbie ostrawsko-kaewi┼äskie	maps/12konZdBtMZ1nMpQIAwXGj9Ho-1dZSzXw.jpg	2022-04-03 13:21:42.92833+02		Mapa r─Ökopi┼Ťmienna	thumbnails/12konZdBtMZ1nMpQIAwXGj9Ho-1dZSzXw_copy.jpg
3		1	\N	ok. 1917-1919 roku	Na mapie zosta┼éa przedstawiona za pomoc─ů czerwonej linii propozycja przebiegu granicy polsko-niemieckiej, wed┼éug stanowiska Komitetu Narodowego Polskiego. Jako podk┼éadu u┼╝yto mapy wydanej przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawiaj─ůcej procentowy udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych w powiatach wschodniej cz─Ö┼Ťci Prus, wed┼éug oficjalnych danych statystycznych rz─ůdu pruskiego pochodz─ůcych ze spisu szkolnego z roku 1911. Na mapie jest odr─Öczny dopisek "Granica Zachodnia Polski (stanowisko K.N.P.)". Oczywist─ů intencj─ů przekazu by┼éa sugestia, ze proponowana linia przysz┼éej granicy polsko-niemieckiej uwzgl─Ödnia realia narodowo┼Ťciowe. G┼é├│wnym, ale nie jedynym, kryterium zaproponowania przebiegu granicy polsko-niemieckiej, by┼éa struktura narodowo┼Ťciowa, a konkretnie udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych we wschodnich powiatach Prus. Na obszarze ┼Ül─ůska oraz Warmii i Mazur, zaproponowano przebieg granicy w ten spos├│b, aby w┼é─ůczy─ç do Polski wszystkie powiaty z ponad 50% (tylko w pojedynczych przypadkach z ponad 40%), udzia┼éem dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych, ponadto granic─Ö poprowadzono zgodnie z granicami pruskich powiat├│w (za wyj─ůtkiem powiatu Reszel). Natomiast w Wielkopolsce, na Pomorzu oraz Powi┼Ťlu odst─ůpiono od tej zasady - proponowano w┼é─ůczy─ç powiaty ju┼╝ od ponad 25% udzia┼éu dzieci polskich, a na Pomorzu i Powi┼Ťlu w granicach Polski mia┼éy znale┼║─ç si─Ö w ca┼éo┼Ťci lub cz─Ö┼Ťciowo powiaty z zaledwie kilku procentowym udzia┼éem dzieci narodowo┼Ťci polskiej lub wr─Öcz bez polskiej ludno┼Ťci (powiat Elbl─ůg). Ponadto przebieg proponowanej granicy na wielu odcinkach by┼é niezgodny z pruskim podzia┼éem administracyjnym.\nPrzedstawione na mapie stanowisko KNP w sprawie wytyczenia granicy polsko-niemieckiej, bazowa┼éo na kryteriach narodowo┼Ťciowych i strategicznych. Kryteria narodowo┼Ťciowe (wyra┼║ny, ponad 50% udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych) by┼éy wystarczaj─ůce, ┼╝eby w┼é─ůczy─ç w granice Polski ca┼éy obszar G├│rnego ┼Ül─ůska, wi─Ökszo┼Ť─ç ┼Ül─ůska Opolskiego oraz szeroki pas po┼éudniowych Mazur i po┼éudniowej Warmii. Tam, gdzie przebieg linii granicznej by┼éby zbyt zawi┼éy (Wielkopolska) lub wchodzi┼éy w gr─Ö wzgl─Ödy strategiczne (szeroki dost─Öp do morza w rejonie uj─ůcia Wis┼éy) kryteria narodowo┼Ťciowe schodzi┼éy na plan dalszy. Na mapie  daty, ale mozna przypuszcza─ç, ze zosta┼éa wykonana na przelomie 1918 i 1919 r., lub w pocz─ůtkach 1919 r., w zwi─ůzku z obradami konferencji pokojowej.  W przypadku Wielkopolski ten "narodowo┼Ťciowy pr├│g w┼é─ůczenia w granice Polski" w przypadku kilku powiat├│w obni┼╝ono do 25%, natomiast na Pomorzu i Powi┼Ťlu, z powodu du┼╝o wi─Ökszego udzia┼éu ludno┼Ťci niemieckiej, zdecydowano o odej┼Ťciu od kryterium narodowo┼Ťciowego na rzecz kryteri├│w strategicznych (szeroki dost─Öp do morza, uj┼Ťcie Wis┼éy). Na mapie  daty, ale mo┼╝na przypuszcza─ç, ┼╝e zosta┼éa wykonana w latach 1917-1918. Wykorzystywanie przez polskie instytucje, na potrzeby przedstawiania argument├│w za polsko┼Ťci─ů ┼Ül─ůska, Wielkopolski, Pomorza oraz Warmii i Mazur, danych pochodz─ůcych z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, by┼éo uzasadnione m.in. tym, ┼╝e w spisach powszechnych narodowo┼Ť─ç by┼éa ustalana na podstawie odpowiedzi na pytanie o j─Özyk ojczysty, a statystyka pruska wyszczeg├│lnia┼éa obok j─Özyka polskiego, tak┼╝e j─Özyk kaszubski i mazurski, co skutecznie zmniejsza┼éo liczb─Ö os├│b deklaruj─ůcych j─Özyk polski (a tym samym liczb─Ö os├│b zaliczonych do polskiej narodowo┼Ťci). Ponadto w pruskim spisie powszechnym istnia┼éa mo┼╝liwo┼Ť─ç zadeklarowania dw├│ch j─Özyk├│w i cz─Ö┼Ť─ç Polak├│w, znaj─ůcych tak┼╝e j─Özyk niemiecki, deklarowa┼éo j─Özyk polski wraz z niemieckim, co skutkowa┼éo zaliczeniem ich do tzw. ÔÇ×os├│b dwuj─ÖzycznychÔÇŁ.	Pologne Prussienne. La nationalit├ę des enfants dans les ├ęcole primaires d'apr├Ęs la statistique du gouvernement Prussien de 1911	granica polsko-niemiecka, Prusy, granice zaboru pruskiego		zachodnia granica Polski, Komitet Narodowy Polski, Prusy, dzieci narodowo┼Ťci polskiej w szko┼éach, statystyka narodowo┼Ťciowa, pruski spis szkolny 1911 r.	3	Bureau Cartographique "l'Agence Polonaise Centrale" a Lausanne	1000000 (podzia┼éka)	Pologne Prussienne	przedstawienie propozycji przebiegu zachodniej granicy Polski wed┼éug stanowiska Komitetu Narodowego Polskiego, na podk┼éadzie przedstawiaj─ůcym procentowy udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych w powiatach wschodniej cz─Ö┼Ťci Prus, wed┼éug danych statystycznych rz─ůdu pruskiego z roku 1911  (spis szkolny)	maps/1LqOGQWqHrxRTzz5besNgkv3gWLqIS0vO.jpg	2022-04-03 13:21:42.806679+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1LqOGQWqHrxRTzz5besNgkv3gWLqIS0vO_copy.jpg
5		3	\N	1919 (29 VII 1919)	Mapa nie posiada tytu┼éu. Zosta┼éy na niej przedstawione trzy r├│┼╝ne warianty rozgraniczenia terytorium Polski i Litwy, powsta┼ée w po┼éowie 1919 roku. Rozbie┼╝no┼Ťci dotycz─ů g┼é├│wnie Wile┼äszczyzny i Suwalszczyzny. Na tle rozmieszczenia miast, rzek, linii kolejowych oraz zaznaczonego obszaru tzw. ÔÇ×Litwy etnograficznejÔÇŁ (wed┼éug dzisiejszej nomenklatury by┼éby to obszar z dominacj─ů ludno┼Ťci litewskiej) zaznaczono przebieg linii demarkacyjnej polsko-litewskiej z 18 czerwca 1919 roku, linii granicznej proponowanej przez Polak├│w z 20 czerwca 1919 roku (czyli zaledwie dwa dni p├│┼║niej) oraz ÔÇô jak to uj─Öto w legendzie mapy ÔÇô "linii proponowanej przez Naczelnego Wodza Armii Sprzymierzonych z 18 VII 1919 roku". Z pewno┼Ťci─ů chodzi tu o tzw. lini─Ö Focha. Mapa zosta┼éa wydana przez Oddzia┼é Geograficzny Biura Kongresowego w dniu 29 lipca 1919 roku, czyli mo┼╝na przypuszcza─ç, ┼╝e bezpo┼Ťrednim powodem je przygotowania i publikacji by┼éo w┼éa┼Ťnie wytyczenie tzw. linii Focha. Zosta┼éa ona zaproponowana jako kompromis pomi─Ödzy wcze┼Ťniejszymi o miesi─ůc propozycjami Ententy oraz strony polskiej.\nSpo┼Ťr├│d trzech linii przedstawionych na mapie, najwcze┼Ťniejsz─ů chronologicznie, jest zaaprobowana przez tzw. ÔÇ×wielk─ů czw├│rk─ÖÔÇŁ Ententy, linia demarkacyjna z 18 czerwca. Zostawia ona po polskiej stronie Wilno i po┼éudniow─ů Wile┼äszczyzn─Ö oraz Grodno wraz z lini─ů kolejow─ů ┼é─ůcz─ůce te miasta. Natomiast w cz─Ö┼Ťci po┼éudniowo-zachodniej zosta┼éa poprowadzona wzd┼éu┼╝ Kana┼éu Augustowskiego, w konsekwencji czego ca┼éa Suwalszczyzna znalaz┼éa si─Ö po stronie litewskiej. Ten niekorzystny, z polskiego punktu widzenia, przebieg linii demarkacyjnej, spowodowa┼é ju┼╝ po dw├│ch dniach pojawienie si─Ö polskiej propozycji przebiegu granicy polsko-litewskiej. Linia graniczna zaproponowana przez stron─Ö polsk─ů ma przebieg zdecydowanie odmienny. Zosta┼éa wytyczona wyra┼║nie na zach├│d od linii demarkacyjnej, prawie na ca┼éym swoim przebiegu przecina obszar zaznaczony jako ÔÇ×Litwa etnograficznaÔÇŁ, pozostawia po stronie polskiej nie tylko Wilno, ale tak┼╝e p├│┼énocno-zachodni─ů Wile┼äszczyzn─Ö. W cz─Ö┼Ťci po┼éudniowej, na kr├│tkim odcinku biegnie wzd┼éu┼╝ Niemna, a nast─Öpnie (wyra┼║nie na p├│┼énoc od linii demarkacyjnej), odbija r├│wnole┼╝nikowo, docieraj─ůc do granicy Prus Wschodnich w okolicach Wiszty┼äca, zostawiaj─ůc po polskiej stronie Suwalszczyzn─Ö, z Wi┼╝ajnami, Pu┼äskiem i Sejnami. Trzecia z linii granicznych, tzw. linia Focha z lipca 1919 roku, by┼éa propozycj─ů kompromisow─ů, w kilku aspektach korzystn─ů dla Polski. W cz─Ö┼Ťci p├│┼énocno-wschodniej, mia┼éa przebieg zbli┼╝ony do wcze┼Ťniejszej propozycji Ententy, by┼éa jednak nieznacznie przesuni─Öta na zach├│d, zwi─Ökszaj─ůc tym samym obszar przyznany Polsce. Natomiast w cz─Ö┼Ťci po┼éudniowo-zachodniej, zdecydowanie odbija┼éa od Niemna i Kana┼éu Augustowskiego na p├│┼énoc, zostawiaj─ůc po polskiej stronie Suwalszczyzn─Ö, a od okolic Pu┼äska do granicy Prus Wschodnich, pokrywaj─ůc si─Ö z wcze┼Ťniejsz─ů propozycj─ů polsk─ů.  \nPo wytyczeniu linii Focha, strona litewska, na obszarze wschodniej Suwalszczyzny, w okolicach Sejn, nie przestrzega┼éa rozgraniczenia wojsk i administracji wzd┼éu┼╝ nowej linii demarkacyjnej. By┼éo to bezpo┼Ťredni─ů przyczyn─ů wybuchu miesi─ůc p├│┼║niej, 23 sierpnia 1919 roku, powstania sejne┼äskiego, zako┼äczonego zwyci─Östwem oddzia┼é├│w polskich i skutecznym wyparciem litewskiej administracji z ca┼éej Suwalszczyzny, poza lini─Ö Focha.\nPod map─ů odr─Öcznie o┼é├│wkiem dopisano warto┼Ť─ç skali [1:1 000 000]		granica polsko-litewska, Litwa, Wile┼äszczyzna, Suwalszczyzna, sie─ç rzeczna, linie kolejowe		linia demarkacyjna, linia Focha, 	\N	Biuro Kongresowe (Oddzia┼é Geograficzny)	1 000 000 (na podstawie odr─Öcznego zapisu pod map─ů)		Przedstawienie trzech r├│┼╝nych wariant├│w rozgraniczenia terytorium Polski i Litwy, powsta┼éych w po┼éowie 1919 roku. Dw├│ch wariant├│w zaproponowanych przez Entent─Ö (w tym tzw. linii Focha) oraz jednej propozycji polskiej.	maps/1FLIKDC9_e7FloeTiGdUvAoe5ZXSFGbi7.jpg	2022-04-03 13:21:42.86052+02		Mapa r─Ökopi┼Ťmienna z dodatkowymi adnotacjami	thumbnails/1FLIKDC9_e7FloeTiGdUvAoe5ZXSFGbi7_copy.jpg
41		39	\N		Grafika przedstawia sytuacj─Ö narodow─ů w zachodniej Polsce. Na wykresach przedstawiono procentowy udzia┼é ludno┼Ťci w poszczeg├│lnych miastach z uwzgl─Ödnieniem nast─Öpuj─ůcych grup: ┼╗ydzi, Niemcy, urz─Ödnicy wojskowi, osadnicy, inne narodowo┼Ťci z wyj─ůtkiem polski (?), polskie dzieci ze szk├│┼é podstawowych.	Die nationalen Verh├Ąltnisse Westpolens in graphischer Darstellung. 	zachodnia polska		narodowo┼Ťci	14		nie dotyczy		Sytuacja narodowa w zachodniej Polsce w przedstawieniu graficznym. 	maps/1jmnVwI4TlgWLITIKWhcdRLE8M_8rHUzr.jpg	2022-04-03 13:21:43.548036+02		Mapa drukowana	thumbnails/1jmnVwI4TlgWLITIKWhcdRLE8M_8rHUzr_copy.jpg
9		7	\N	, prawdopodobnie 1919	Powstanie mapy jest konsekwencj─ů polsko-czeskich spor├│w o przynale┼╝no┼Ť─ç pa┼ästwow─ů ┼Ül─ůska Cieszy┼äskiego, a bezpo┼Ťrednio jest zwi─ůzane z podpisaniem 5 listopada 1918 roku wst─Öpnego porozumienia w┼éadz lokalnych (polskich i czeskich) tymczasowo dziel─ůcego ten region wed┼éug kryterium etnicznego (a precyzyjniej j─Özykowego). Umowa ta przydziela┼éa polskiej administracji powiaty, kt├│re zamieszka┼ée by┼éy w wi─Ökszo┼Ťci przez ludno┼Ť─ç polskoj─Özyczn─ů: bielski, cieszy┼äski oraz wi─Öksz─ů cz─Ö┼Ť─ç powiatu frysztackiego (na mapie kolor bia┼éy), a czechos┼éowackiej powiat frydecki i pozosta┼é─ů cz─Ö┼Ťci─ů powiatu frysztackiego (na mapie kolor niebieski). Podzia┼é ten nie ko┼äczy┼é i nie rozwi─ůzywa┼é konfliktu, a ostateczne rozgraniczenie terytorialne pozostawia┼é si─Ö do rozstrzygni─Öcia przez rz─ůdy Polski i Czechos┼éowacji. By┼é on korzystny dla strony polskiej i stanowi┼é podstaw─Ö dla dalszego podtrzymania roszcze┼ä terytorialnych. Przydziela┼é Polsce zdecydowan─ů wi─Ökszo┼Ť─ç ┼Ül─ůska Cieszy┼äskiego wraz z cz─Ö┼Ťci─ů kopal┼ä w─Ögla kamiennego i zak┼éad├│w przemys┼éowych w okolicach Karwiny, Rychwa┼édu i Bogumina. Strona czechos┼éowacka nie zaakceptowa┼éa podzia┼éu wed┼éug kryterium etnicznego, domagaj─ůc si─Ö na podstawie argument├│w historycznych, ca┼éego obszaru Ksi─Östwa Cieszy┼äskiego.\nNa mapie przedstawiono Ksi─Östwo Cieszy┼äskie z podzia┼éem na powiaty, z zaznaczonymi g┼é├│wnymi miastami, liniami kolejowymi, rzekami, zag┼é─Öbiami w─Öglowymi w okolicach Ostrawy i Karwiny oraz Czechowic (kolor ┼╝├│┼éty). Najistotniejszym elementem zamieszczonym na mapie jest zaznaczenie obszar├│w (powiat├│w i gmin) obj─Ötych tymczasow─ů administracj─ů polsk─ů (kolor bia┼éy) oraz czesk─ů (kolor niebieski), na podstawie porozumienia z 5 listopada 1918 roku. \nPonadto obok mapy dodano informacje o strukturze narodowo┼Ťciowej tego obszaru, wed┼éug wynik├│w spis├│w ludno┼Ťci z lat 1880, 1890, 1900, 1910 z podzia┼éem na Polak├│w, Niemc├│w i Czech├│w, zar├│wno w odniesieniu do ca┼éego obszaru Ksi─Östwa Cieszy┼äskiego, jak i z wy┼é─ůczeniem, najliczniej zamieszkanego przez Czech├│w, powiatu frydeckiego. Jednocze┼Ťnie autorzy mapy podkre┼Ťlili, ┼╝e wyniki ostatniego spisu powszechnego z 1910 roku przeprowadzonego w Monarchii Austro-W─Ögierskiej, s─ů ÔÇ×niekorzystne dla narodowo┼Ťci polskiej w wyniku fa┼észerstw i r├│┼╝nych nacisk├│wÔÇŁ. W trakcie tego spisu (jak i w trakcie wcze┼Ťniejszych) nie by┼éo pytania o narodowo┼Ť─ç, a struktur─Ö etniczn─ů ustalano wed┼éug odpowiedzi na pytanie o ÔÇ×j─Özyk domowyÔÇŁ. Wszystkie zamieszczone na mapie dane statystyczne dowodzi┼éy wyra┼║nej dominacji ludno┼Ťci polskiej na obszarze ┼Ül─ůska Cieszy┼äskiego.\nPoza danymi pochodz─ůcymi ze spis├│w powszechnych, autorzy mapy zamie┼Ťcili tak┼╝e informacje dotycz─ůce ÔÇ×linii j─ÖzykowychÔÇŁ, przytaczaj─ůc opinie trzech badaczy (Polaka i dw├│ch Czech├│w), dowodz─ůce, ┼╝e obszar ┼Ül─ůska Cieszy┼äskiego jest obj─Öty zasi─Ögiem j─Özyka polskiego, a j─Özyk czeski pojawia si─Ö dopiero na zach├│d od tego regionu. Naniesiono tak┼╝e granic─Ö (linia czerwona) oddzielaj─ůc─ů j─Özyk polski (cz─Ö┼Ť─ç wschodnia) od dialekt├│w przej┼Ťciowych (cz─Ö┼Ť─ç zachodnia), kt├│ra cz─Ö┼Ťciowo biegnie wzd┼éu┼╝ granicy powiatu frydeckiego, a nast─Öpnie przecina go, zostawiaj─ůc ca┼éy powiat frysztacki po stronie j─Özyka polskiego, co nie znalaz┼éo potwierdzenia w wynikach spisu powszechnego z 1910 roku. \nZ tre┼Ťci mapy oraz zamieszczonych obok niej danych statystycznych, mo┼╝na wnioskowa─ç, ┼╝e do Polski powinna nale┼╝e─ç nie tylko cz─Ö┼Ť─ç ┼Ül─ůska Cieszy┼äskiego wst─Öpnie przyznana jej w administrowanie na podstawie porozumienia z 5 listopada 1918 roku, ale tak┼╝e niekt├│ry gminy przyznane stronie czeskiej, zw┼éaszcza w najbardziej uprzemys┼éowionym powiecie frysztackim. \nPomimo u nazwiska autora mapy oraz wydawcy czy miejsca wydania, tre┼Ť─ç mapy jednoznacznie wskazuje, i┼╝ zosta┼éa ona przygotowana przez stron─Ö polsk─ů, a u┼╝yty w niej j─Özyk francuski, wskazuje, i┼╝ adresatem s─ů politycy i eksperci francuscy. Mapa ta zosta┼éa do┼é─ůczona jako aneks do memoria┼éu dotycz─ůcego wytyczenia granicy pomi─Ödzy Polsk─ů a Czechos┼éowacj─ů na ┼Ül─ůsku Cieszy┼äskim, Orawie i Spiszu, przygotowanego przez delegacj─Ö polsk─ů na konferencj─Ö pokojow─ů w Pary┼╝u w 1919 roku.	Le Duche de Cieszyn (Teschen) Silesie	┼Ül─ůsk Cieszy┼äski, Ksi─Östwo Cieszy┼äskie, pogranicze polsko-czeskie		struktura narodowo┼Ťciowa, struktura j─Özykowa, polsko-czeskie porozumienie z 5 listopada 1918 roku, Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u, w─Ögiel kamienny ; zag┼é─Öbie ostrawsko-karwi┼äskie i ko┼éo Czechowic	\N		 (na mapie odr─Öcznie wrysowana podzia┼éka liniowa)		Podzia┼é ┼Ül─ůska Cieszy┼äskiego wed┼éug kryterium etnicznego (j─Özykowego), na powiaty i gminy obj─Öte administracj─ů polsk─ů oraz czesk─ů, na podstawie porozumienia z 5 listopada 1918 roku	maps/1bQSTP0r-aoRbYkjUtpk6Bdp99MtnNASg.jpg	2022-04-03 13:21:42.945428+02	https://drive.google.com/drive/folders/1_ucV-brrrWyavyeuiax8Fk10bsLd1Pj_?usp=sharing	Mapa r─Ökopi┼Ťmienna z dodatkowymi adnotacjami	thumbnails/1bQSTP0r-aoRbYkjUtpk6Bdp99MtnNASg_copy.jpg
11		9	\N	28 lipca 1920	Mapa przedstawia fragment pogranicza polsko-czechos┼éowackiego obejmuj─ůcego ┼Ül─ůsk Cieszy┼äski, Oraw─Ö oraz Spisz. Podstawowymi punktami spornymi, przedstawionymi na mapie, jest podzia┼é tych trzech region├│w pomi─Ödzy Polsk─Ö a Czechos┼éowacj─ů.\nDo I wojny ┼Ťwiatowej Spisz oraz Orawa znajdowa┼éy si─Ö w granicach W─Ögier, a ┼Ül─ůsk Cieszy┼äski w granicach Austrii. Po rozpadzie monarchii Austro-W─Ögierskiej oraz zako┼äczeniu wojny, nowopowsta┼éa Czechos┼éowacja ro┼Ťci┼éa pretensje terytorialne do ca┼éego obszaru p├│┼énocnych W─Ögier (w tym do Spiszu i Orawy), oraz do uprzemys┼éowionego i zasobnego w z┼éo┼╝a w─Ögla kamiennego ┼Ül─ůska Cieszy┼äskiego. Z kolei liczna na tych obszarach ludno┼Ť─ç polska, zw┼éaszcza we wschodniej i centralnej cz─Ö┼Ťci ┼Ül─ůska Cieszy┼äskim, na p├│┼énocnym Spiszu oraz p├│┼énocnej Orawie, domaga┼éa si─Ö przy┼é─ůczenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Pary┼╝u, podj─Öto decyzj─Ö o przeprowadzeniu w tych trzech regionach w po┼éowie 1920 roku plebiscyt├│w, kt├│re mia┼éy zadecydowa─ç o ich przynale┼╝no┼Ťci politycznej. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podj─Öto decyzj─Ö o rezygnacji z plebiscyt├│w (z powodu wojny polsko-bolszewickiej), a decyzj─Ö o podziale tych region├│w scedowano na Rad─Ö Ambasador├│w, kt├│ra 28 lipca 1920 roku w Pary┼╝u, podj─Ö┼éa arbitraln─ů decyzj─Ö, przyznaj─ůc Polsce tylko niewielkie fragmenty spornych obszar├│w, co nie zako┼äczy┼éo spor├│w terytorialnych polsko-czechos┼éowackich. \nMapa przedstawia efekt decyzji Rady Ambasador├│w z dnia 18 lipca 1920 roku.\nKolorem zielonym zaznaczono zasi─Ög terytorialny Spiszu, Orawy i ┼Ül─ůska Cieszy┼äskiego (z tym, ┼╝e w przypadku Spiszu, dotyczy to tylko jego p├│┼énocnej cz─Ö┼Ťci), a kolorem czerwonym granice wytyczone na podstawie decyzji Rady Ambasador├│w z 28 lipca 1920, czyli tzw. ÔÇ×linie Ambasador├│wÔÇŁ, kt├│re mia┼éy sta─ç si─Ö granicami Polski i Czechos┼éowacji.\nW przypadku podzia┼éu wszystkich trzech region├│w, decyzja Rady Ambasador├│w by┼éa niekorzystna dla Polski i spotka┼éa si─Ö z protestami polskich w┼éadz. W ┼╝adnym z tych region├│w granica polsko-czechos┼éowacka nie mia┼éa identycznego przebiegu jak na omawianej mapie. Wszelkie modyfikacje zosta┼éy ostatecznie ustalone w roku 1924 przez Komisj─Ö Delimitacyjn─ů, a nast─Öpnie zaakceptowane przez Lig─Ö Narod├│w oraz rz─ůdy Polski i Czechos┼éowacji. Zmiany by┼éy jednak nieznaczne, cz─Östo dotyczy┼éy wzajemnej wymiany niewielkich terytori├│w (wsi) i w ┼╝adnym przypadku nie zmieni┼éy w istotny spos├│b niekorzystnej dla Polski decyzji Rady Ambasador├│w z 28 lipca 1920 roku. Na Spiszu modyfikacja dotyczy┼éa niewielkiego obszaru na po┼éudnie od wsi Jurg├│w i Brzegi (z korzy┼Ťci─ů dla Polski) oraz na po┼éudnie od wsi Niedzica, na Orawie przekazano Czechos┼éowacji dwie wsie (G┼éod├│wka i Sucha G├│ra) na zach├│d od Chocho┼éowa, w zamian za cz─Ö┼Ť─ç wsi Lipnica Wielka, a na ┼Ül─ůsku Cieszy┼äskim Czechos┼éowacja otrzyma┼éa wie┼Ť Herczaw─Ö w po┼éudniowej cz─Ö┼Ťci regionu. W tak ustalonej formie granice te funkcjonuj─ů r├│wnie┼╝ wsp├│┼écze┼Ťnie.	Teschen, Orawa et Spisz	┼Ül─ůsk Cieszy┼äski, Orawa, Spisz, granica polsko-czechos┼éowacka, granica polsko-s┼éowacka		Rada Ambasador├│w, linia Ambasador├│w, podzia┼é Orawy, Spisza i ┼Ül─ůska Cieszy┼äskiego, w─Ögiel kamienny, zag┼é─Öbie ostrawsko-karwi┼äskie, oraz wydobycie w─Ögla w okolicy Czechowic	6	S.G.A.	200000		podzia┼é ┼Ül─ůska Cieszy┼äskiego, Orawy i Spiszu pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, wed┼éug decyzji Rady Ambasador├│w z 28 lipca 1920 roku 	maps/1MPS4f1CWOG3E2I9zqzX3cFeND05IVmBO.jpg	2022-04-03 13:21:42.988532+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1MPS4f1CWOG3E2I9zqzX3cFeND05IVmBO_copy.jpg
12		10	\N	28 lipca 1920	Mapa przedstawia podzia┼é ┼Ül─ůska Cieszy┼äskiego pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, wed┼éug decyzji Rady Ambasador├│w z 28 lipca 1920 roku.\nDo I wojny ┼Ťwiatowej ┼Ül─ůsk Cieszy┼äski znajdowa┼é si─Ö w granicach Austrii. Po rozpadzie monarchii Austro-W─Ögierskiej oraz zako┼äczeniu wojny, pretensje terytorialne do ┼Ül─ůska Cieszy┼äskiego zg┼éasza┼éa zar├│wno Polska, jak i Czechos┼éowacja, zw┼éaszcza do zasobnego w w─Ögiel kamienny i uprzemys┼éowionego Zag┼é─Öbia Ostrawsko-Karwi┼äskiego. 5 listopada 1918 roku na podstawie porozumienia w┼éadz lokalnych (polskich i czeskich) tymczasowo podzielono ┼Ül─ůsk Cieszy┼äski wed┼éug kryterium etnicznego (a precyzyjniej j─Özykowego). By┼é to podzia┼é korzystny dla strony polskiej, kt├│rej przypad┼éa zdecydowana wi─Ökszo┼Ť─ç regionu wraz z cz─Ö┼Ťci─ů kopal┼ä w─Ögla kamiennego i zak┼éad├│w przemys┼éowych w cz─Ö┼Ťci p├│┼énocnej i p├│┼énocno-zachodniej. Strona czechos┼éowacka nie zaakceptowa┼éa podzia┼éu wed┼éug kryterium etnicznego, domagaj─ůc si─Ö na podstawie argument├│w historycznych, ca┼éego obszaru Ksi─Östwa Cieszy┼äskiego. W styczniu 1919 roku Czechos┼éowacja rozpocz─Ö┼éa dzia┼éania zbrojne, zajmuj─ůc ostatecznie oko┼éo po┼éow─Ö ┼Ül─ůska Cieszy┼äskiego. W po┼éowie 1919 roku, podczas konferencji w Pary┼╝u, podj─Öto decyzj─Ö o przeprowadzeniu w tym regionie w 1920 roku plebiscytu, kt├│ry mia┼é zadecydowa─ç o jego przynale┼╝no┼Ťci politycznej. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podj─Öto decyzj─Ö o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzj─Ö o podziale ┼Ül─ůska Cieszy┼äskiego scedowano na Rad─Ö Ambasador├│w, kt├│ra 28 lipca 1920 roku w Pary┼╝u, podj─Ö┼éa arbitraln─ů decyzj─Ö, przyznaj─ůc Polsce tylko wschodni─ů cz─Ö┼Ť─ç regionu, wytyczaj─ůc granic─Ö cz─Ö┼Ťciowo na rzece Olzie, co doprowadzi┼éo m.in. do podzia┼éu Cieszyna. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnych granic (na p├│┼énocy by┼éa to granica pomi─Ödzy Austri─ů a Prusami, a na po┼éudniu pomi─Ödzy Austri─ů a W─Ögrami), natomiast kolorem czerwonym granic─Ö wytyczon─ů na podstawie decyzji Rady Ambasador├│w z 28 lipca 1920, czyli tzw. ÔÇ×lini─Ö Ambasador├│wÔÇŁ, kt├│ra mia┼éa sta─ç si─Ö granic─ů Polski i Czechos┼éowacji.\nDecyzja Rady Ambasador├│w dotycz─ůca podzia┼éu ┼Ül─ůska Cieszy┼äskiego by┼éa bardzo niekorzystna dla Polski i wywo┼éa┼éa protesty polskich w┼éadz. Nie uwzgl─Ödnia┼éa kryterium narodowo┼Ťciowego i j─Özykowego, pozostawiaj─ůc po stronie czechos┼éowackiej ok. 150 tys. Polak├│w (g┼é├│wnie na obszarze tzw. Zaolzia). Ponadto Czechos┼éowacji w ca┼éo┼Ťci przypad┼éo bogate w z┼éo┼╝a w─Ögla kamiennego Zag┼é─Öbie Ostrawsko-Karwi┼äskie oraz linia kolejowa Bogumin-Koszyce. Wytyczona na mapie granica z lipca 1920 roku, zosta┼éa nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Lig─Ö Narod├│w, przyznano Czechos┼éowacji wie┼Ť Herczaw─Ö, na samym po┼éudniu ┼Ül─ůska Cieszy┼äskiego. W tak ustalonej formie granica ta funkcjonuje r├│wnie┼╝ wsp├│┼écze┼Ťnie.	Fronti├Ęre dans la R├ęgion de Teschen	┼Ül─ůsk Cieszy┼äski, Ksi─Östwo Cieszy┼äskie, granica polsko-czechos┼éowacka		Rada Ambasador├│w, linia Ambasador├│w, podzia┼é ┼Ül─ůska Cieszy┼äskiego	6	S.G.A.	75000		Podzia┼é ┼Ül─ůska Cieszy┼äskiego pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, wed┼éug decyzji Rady Ambasador├│w z 28 lipca 1920 roku	maps/1GoYAQQ1b0uuH_iOvU_abZXhcuts3acXf.jpg	2022-04-03 13:21:43.004593+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1GoYAQQ1b0uuH_iOvU_abZXhcuts3acXf_copy.jpg
13		11	\N	1919	Na mapie przedstawiono Ksi─Östwo Cieszy┼äskie z podzia┼éem na powiaty, z zaznaczonymi g┼é├│wnymi miastami, liniami kolejowymi, rzekami. Ponadto szrafem zaznaczono region wydobycia w─Ögla kamiennego w okolicach Ostrawy i Karwiny oraz obszar obj─Öty tymczasow─ů administracj─ů czesk─ů na podstawie porozumienia z 5 listopada 1918 roku. \nMapa zosta┼éa zamieszczona w artykule ÔÇ×La Pologne et la Silesie de TeschenÔÇŁ, autorstwa Henri Austruy, wydanym w Pary┼╝u w roku 1919, w czasopi┼Ťmie ÔÇ×La Nouvelle RevueÔÇŁ.\nPowstanie mapy jest prawdopodobnie konsekwencj─ů polsko-czeskich spor├│w o przynale┼╝no┼Ť─ç pa┼ästwow─ů ┼Ül─ůska Cieszy┼äskiego i jest zwi─ůzane z podpisaniem 5 listopada 1918 roku wst─Öpnego porozumienia w┼éadz lokalnych (polskich i czeskich) tymczasowo dziel─ůcego ten region wed┼éug kryterium etnicznego (a precyzyjniej j─Özykowego). Umowa ta przydziela┼éa polskiej administracji powiaty, kt├│re zamieszka┼ée by┼éy w wi─Ökszo┼Ťci przez ludno┼Ť─ç polskoj─Özyczn─ů: bielski, cieszy┼äski oraz wi─Öksz─ů cz─Ö┼Ť─ç powiatu frysztackiego, czyli zdecydowan─ů wi─Ökszo┼Ť─ç ┼Ül─ůska Cieszy┼äskiego. Natomiast administracja czechos┼éowacka przej─Ö┼éa zdominowany przez ludno┼Ť─ç czesk─ů powiat frydecki i pozosta┼é─ů cz─Ö┼Ťci─ů powiatu frysztackiego (na mapie zaznaczone szrafem) wraz ze znajduj─ůcymi si─Ö tam kopalniami w─Ögla kamiennego. \nTen podzia┼é utrzyma┼é si─Ö w praktyce tylko nieca┼ée trzy miesi─Öcy. Pod koniec stycznia 1919 roku wojska czechos┼éowackie przekroczy┼éy lini─Ö demarkacyjn─ů i zaj─Ö┼éy zbrojnie oko┼éo po┼éow─Ö obszaru ┼Ül─ůska Cieszy┼äskiego. 		┼Ül─ůsk Cieszy┼äski, Ksi─Östwo Cieszy┼äskie, pogranicze polsko-czeskie, granica polsko-czeska		struktura narodowo┼Ťciowa, Polacy, Czesi, porozumienie z 5 listopada 1918 roku, w─Ögiel kamienny, zag┼é─Öbie ostrawsko-karwi┼äskie	7		 (na mapie odr─Öcznie wrysowano podzia┼ék─Ö liniow─ů)		podzia┼é ┼Ül─ůska Cieszy┼äskiego pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, wed┼éug porozumienia z 5 listopada 1918 roku	maps/1ynRfnx7QptCMIt_q4XFd1kcXdryldSP2.jpg	2022-04-03 13:21:43.020204+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa r─Ökopi┼Ťmienna	thumbnails/1ynRfnx7QptCMIt_q4XFd1kcXdryldSP2_copy.jpg
29		27	\N	1919	Mapa przedstawia rozmieszczenie ludno┼Ťci polskiej w p├│┼énocnych powiatach dawnych W─Ögier. Zosta┼éa opracowana w roku 1919, przez za┼éo┼╝ony w Krakowie Narodowy Komitet Obrony Spisza, Orawy i Podhala i do┼é─ůczona do kilkustronicowej, francuskoj─Özycznej broszury, omawiaj─ůcej argumenty za przynale┼╝no┼Ťci─ů do Polski cz─Ö┼Ťci Spiszu i Orawy.\nNa mapie przedstawiono za pomoc─ů szrafu rozmieszczenie i udzia┼é procentowy ludno┼Ťci polskiej na obszarze regionu Czadeckiego, Orawy oraz Spiszu, w jednym przedziale liczbowym (75-90%). Ponadto zaznaczono dawn─ů granic─Ö pomi─Ödzy W─Ögrami a Galicj─ů (Austri─ů), sie─ç rzeczn─ů, g┼é├│wne miejscowo┼Ťci oraz krainy historyczno-geograficzne. Z mapy wynika, ┼╝e Czadeckie, Orawa i Spisz, kt├│re po zako┼äczeniu I wojny ┼Ťwiatowej by┼éy regionami spornymi na pograniczu polsko-s┼éowacki, by┼éy w├│wczas, zw┼éaszcza w cz─Ö┼Ťci p├│┼énocnej, wyra┼║nie zdominowane przez ludno┼Ť─ç polsk─ů (polskoj─Özyczn─ů).\nNa mapie  podania ┼║r├│de┼é u┼╝ytych danych liczbowych, ponadto nie zaznaczono rozmieszczenia ludno┼Ťci s┼éowackiej i niemieckiej (licznej zw┼éaszcza na Spiszu), a tak┼╝e powszechnych w tych regionach ÔÇ×obszar├│w przej┼ŤciowychÔÇŁ, mieszanych narodowo┼Ťciowo i j─Özykowo. Z powod├│w propagandowych oraz dla udokumentowania polskich ┼╝─ůda┼ä terytorialnych na pograniczu polsko-s┼éowackim, zasi─Ög ludno┼Ťci polskiej zosta┼é przedstawiony w spos├│b maksymalistyczny, a rzeczywista struktura etniczno-j─Özykowa mieszka┼äc├│w tych region├│w (zw┼éaszcza Spiszu) by┼éa z pewno┼Ťci─ů bardziej skomplikowana.\nPomimo tych zastrze┼╝e┼ä, mo┼╝na stwierdzi─ç, ┼╝e formu┼éowane m.in. podczas konferencji pokojowej w Pary┼╝u, polskie roszczenia terytorialne dotycz─ůce p├│┼énocnej Orawy i p├│┼énocnego Spiszu, by┼éy uzasadnione kryteriami j─Özykowymi i etnicznymi, a arbitralne rozstrzygni─Öcia Rady Ambasador├│w z 28 lipca 1920 roku, dziel─ůce te obszary pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, bez zachowania nadrz─Ödno┼Ťci kryteri├│w j─Özykowo-etnicznych, by┼éy dla Polski oraz ludno┼Ťci mieszkaj─ůcej na polsko-s┼éowackim pograniczu, niesprawiedliwe i krzywdz─ůce.	Carte de la population polonaise dans les comitats septentrionaux de lÔÇÖancienne Hongrie	granica polsko-s┼éowacka, Spisz, Orawa, Czadeckie		Narodowy Komitet Obrony Spisza, Orawy i Podhala, rozmieszczenie ludno┼Ťci polskiej, struktura narodowo┼Ťciowa, struktura j─Özykowa	12	Comit├ę National pour la d├Ęfence du Spisz, de lÔÇÖOrawa et du Podhale	1200000		Rozmieszczenie ludno┼Ťci polskiej (polskoj─Özycznej) w p├│┼énocnych powiatach dawnych W─Ögier (Spisz, Orawa, Czadeckie). 	maps/1hrtJwd_n50BbOW3LmUSRHBhox020Xx1Z.jpg	2022-04-03 13:21:43.341982+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/1hrtJwd_n50BbOW3LmUSRHBhox020Xx1Z_copy.jpg
30		28	\N		Na mapie przedstawiono sie─ç komunikacyjn─ů w postaci linii kolejowych i kana┼é├│w. Na mapie nie zaznaczono Kana┼éu K┼éodnickiego. Ponadto wyr├│┼╝niono granice Polski z 1772 roku oraz granice pa┼ästw i prowincji z 1914 roku oraz wa┼╝niejsze miasta. Odr─Öcznie (kolorem czerwonym) podkre┼Ťlono linie kolejowe na obszarze ograniczonym miejscowo┼Ťciami: Berno, Cieszyn, Bratys┼éawa. Na mapie zaznaczono r├│wnie┼╝ lokalizacje nast─Öpuj─ůcych miejscowo┼Ťci: 	Carte des communications	granica polsko-s┼éowacka, Spisz, Orawa		komunikacja, granice administracyjne	\N		2000000		komunikacja	maps/11WLlDlCEEE2qVmtMFfivH5ZlcP3Vt2Zi.jpg	2022-04-03 13:21:43.358625+02	https://drive.google.com/drive/folders/1byOiIoyqWT2t274Z2BLpUNNm3_rouX3D?usp=sharing	Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/11WLlDlCEEE2qVmtMFfivH5ZlcP3Vt2Zi_copy.jpg
31		29	\N	1919	Mapa nr II ilustruj─ůca memoria┼é "Polska i Finlandia".\nObejmuje rozleg┼éy obszar Europy ┼Ürodkowo-Wschodniej, od p├│┼énocnej Finlandii, po Morze Czarne. Wyr├│┼╝niono na niej rozleg┼ée terytorium Federacji Fi┼äsko-Esto┼äskiej (z p├│┼éwyspem Kola i wyra┼║nie na wsch├│d przesuni─Ötymi granicami Finlandii) oraz Federacji Polsko-Litewsko-Ruskiej wraz z dwoma regionami ÔÇ×pod czasow─ů okupacj─ůÔÇŁ ÔÇô pomi─Ödzy Kijowem a Odess─ů oraz  na wsch├│d od Estonii\nZasadniczym elementem mapy jest wyra┼║nie zaznaczona linia ÔÇ×frontu antyrosyjskiegoÔÇŁ, biegn─ůca od Morza Bia┼éego na p├│┼énocy, poprzez Petersburg i Kij├│w, po Odess─Ö nad Morzem Czarnym.\n	Finlandia i Polska II	Finlandia, Polska, granica polsko-rosyjska	J├│zef Ziabiczi 	Federacja Fi┼äsko-Esto┼äska, Federacja Polsko-Litewsko-Ruska, front antyrosyjski	10				Federacja Fi┼äsko-Esto┼äska oraz Polsko-Litewsko-Ruska	maps/1Aq2yGf_lu2UpqB99IPMOx2EU3rDd0TIR.jpg	2022-04-03 13:21:43.375878+02	https://drive.google.com/drive/folders/1J0iVuKiQIpnP71ztxLMurhKYIY9vVUCp?usp=sharing	Mapa r─Ökopi┼Ťmienna	thumbnails/1Aq2yGf_lu2UpqB99IPMOx2EU3rDd0TIR_copy.jpg
51		49	\N	1921	Tytu┼é mo┼╝na t┼éumaczy─ç jako ÔÇ×mapa etnograficzna i polityczna ziem dawnego Wielkiego Ksi─Östwa LitewskiegoÔÇŁ, z tym, ┼╝e trzeba pami─Öta─ç, i┼╝ w├│wczas pod poj─Öciem ÔÇ×etnograficzneÔÇŁ rozumiano, to co wsp├│┼écze┼Ťnie okre┼Ťlamy jako ÔÇ×narodowo┼ŤcioweÔÇŁ, czyli jest to mapa narodowo┼Ťciowo-polityczna.\nNa mapie przedstawiono metod─ů zasi─Ög├│w, wsp├│┼éczesne dla Autora, obszary etnograficzne (narodowo┼Ťciowe) na terytorium historycznego Wielkiego Ksi─Östwa Litewskiego: litewskie (kolor ┼╝├│┼éty, ┼╗mud┼║ i Gubernia Kowie┼äska), polskie (kolor czerwony, Wile┼äszczyzna, Suwalszczyzna, region Grodna i Dyneburga), ┼éotewskie (kolor pomara┼äczowy, Kurlandia, Inflanty), bia┼éoruskie (kolor r├│┼╝owy, rozlegle obszary na wsch├│d i po┼éudnie od Wile┼äszczyzny). \nPonadto naniesiono liczne linie graniczne, zar├│wno historyczne (rozbiorowe, Wielkiego Ksi─Östwa Litewskiego), jak i bezpo┼Ťrednio zwi─ůzane z licznymi traktatami zawieranymi w konsekwencji walk polsko-litewskich i polsko-bolszewickich w roku 1920 i 1921 oraz innych ustale┼ä dyplomatycznych (np. linia Curzona).\nMapa pokazuje bardzo du┼╝e zr├│┼╝nicowanie narodowo┼Ťciowe obszaru dawnego Wielkiego Ksi─Östwa Litewskiego oraz przecinaj─ůce go w trzeciej dekadzie XX wieku liczne podzia┼éy polityczne. W momencie wydania mapy, powojenny podzia┼é polityczno-terytorialny tego obszaru, nie by┼é jeszcze definitywnie zako┼äczony.  \n	Carte ethnographique et politique des territoires de l'ancien Grande Duch├ę de Lithuanie. Edition du Comit├ę Politique Provisoire des terres de Kowno	Wielkie Ksi─Östwo Litewskie, Litwa, granica polsko-rosyjska		struktura narodowo┼Ťciowa, konflikt polsko-litewski, konflikt polsko-bolszewicki, zar├│┼╝nicowanie narodowo┼Ťciowe i polityczne Litwy	18	Zak┼éad Kartograficzno W. G┼é├│wczewski	2000000		podzia┼éy narodowo┼Ťciowe i polityczne ziem dawnego Wielkiego Ksi─Östwa Litewskiego po roku 1920	maps/1CrXvqjG71WEmIB1IK-dOQ5ZZlYdaarHE.jpg	2022-04-03 13:21:43.721803+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV	Mapa drukowana	thumbnails/1CrXvqjG71WEmIB1IK-dOQ5ZZlYdaarHE_copy.jpg
52		50	\N		do wykonania	 tytu┼éu	Galicja		granice	\N				granice	maps/1knakHHFR-xt_qT4pMvA0fGeq_Zg069ee.jpg	2022-04-03 13:21:43.737802+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1knakHHFR-xt_qT4pMvA0fGeq_Zg069ee_copy.jpg
25		23	\N	, ok. 1919	Na mapie zosta┼éy przedstawione proponowane granice Polski na tle procentowego udzia┼éu ludno┼Ťci polskiej oraz historycznych granic Polski z roku 1772.\nUdzia┼é ludno┼Ťci polskiej zosta┼é przedstawiony szrafem w sze┼Ťciu r├│┼╝nych przedzia┼éach: wi─Ökszo┼Ť─ç polska, mniejszo┼Ť─ç (w domy┼Ťle polska) powy┼╝ej 33%, mniejszo┼Ť─ç 20-33%, mniejszo┼Ť─ç 5-20%, mniejszo┼Ť─ç poni┼╝ej 5% oraz mniejszo┼Ť─ç poza granicami proponowanego pa┼ästwa polskiego.\nNie podano ┼║r├│de┼é danych liczbowych u┼╝ytych do wyznaczenia wielko┼Ťci udzia┼éu ludno┼Ťci polskiej w poszczeg├│lnych regionach (co uniemo┼╝liwia ich weryfikacj─Ö), a tak┼╝e autora oraz daty wykonania mapy.\nTre┼Ť─ç mapy sugeruje odwo┼éanie si─Ö, przy wytyczaniu proponowanych granic Polski, do kryteri├│w narodowo┼Ťciowych oraz historycznych, jednak nie zawsze by┼éy one stosowane konsekwentnie. \nDo proponowanego terytorium Polski w┼é─ůczono wszystkie regiony, gdzie Polacy stanowili wi─Ökszo┼Ť─ç mieszka┼äc├│w (wed┼éug danych wykorzystanych do opracowania mapy), tak┼╝e te, kt├│re wykracza┼éy poza granice przedrozbiorowe z 1772 roku (Spisz, Orawa, cz─Ö┼Ť─ç Opolszczyzny i Dolnego ┼Ül─ůska oraz po┼éudniowe Mazury). W tych przypadkach zastosowano nadrz─Ödno┼Ť─ç kryterium narodowo┼Ťciowego nad historycznym. Jednak do terytorium Polski w┼é─ůczono tak┼╝e regiony, kt├│re przed 1772 rokiem znajdowa┼éy si─Ö w jej granicach, ale w momencie opracowywania omawianej mapy, Polacy byli w nich mniejszo┼Ťci─ů narodow─ů, niejednokrotnie relatywnie nieliczn─ů (20-33% lub zaledwie 5-20% spo┼Ťr├│d og├│┼éu mieszka┼äc├│w). Dotyczy to g┼é├│wnie wschodniej cz─Ö┼Ťci ÔÇô Galicji Wschodniej, Podola, Wo┼éynia, Polesia, wschodniej i p├│┼énocnej Wile┼äszczyzny, ale tak┼╝e zachodniej i p├│┼énocnej cz─Ö┼Ťci Wielkopolski, oraz cz─Ö┼Ťciowo Warmii. W tych przypadkach zastosowano nadrz─Ödno┼Ť─ç kryterium historycznego nad narodowo┼Ťciowym. Najbardziej jaskrawym przyk┼éadem jest p├│┼énocna Warmia, ┼╗u┼éawy i okolice Gda┼äska. Natomiast w odniesieniu do zachodniej cz─Ö┼Ťci Pomorza Gda┼äskiego, postanowiono ca┼ékowicie odej┼Ť─ç, zar├│wno od kryterium narodowo┼Ťciowego, jak i historycznego, proponuj─ůc wytyczenie p├│┼énocno-zachodniej granicy Polski na zach├│d od granicy przedrozbiorowej, ponadto w regionie ze znikomym udzia┼éem ludno┼Ťci polskiej (okolice S┼éupska). Postulowany szeroki dost─Öp Polski do morza (od okolic S┼éupska po Mierzej─Ö Wi┼Ťlan─ů i Elbl─ůg), by┼é oczywi┼Ťcie warunkowany czynnikami strategicznymi i gospodarczymi. \nProponowane p├│┼énocne, zachodnie i cz─Ö┼Ťciowo po┼éudniowe granice Polski, by┼éy ÔÇô poza kilkoma wyj─ůtkami w cz─Ö┼Ťci p├│┼énocnej ÔÇô zgodne z przyj─Ötym przez tw├│rc├│w mapy kryterium narodowo┼Ťciowym oraz cz─Ö┼Ťciowo z przebiegiem granicy z 1772 roku, natomiast granice wschodnie z oczywistych powod├│w nie nawi─ůzywa┼éy do historycznych granic przedrozbiorowych, ponadto si─Öga┼éy daleko na wsch├│d od region├│w, w kt├│rych Polacy stanowili wi─Ökszo┼Ť─ç mieszka┼äc├│w. \nPostulowane terytorium Polski, obejmowa┼éo bardzo rozleg┼éy obszar ÔÇô na p├│┼énocy z Pomorzem Gda┼äskim, Warmi─ů i po┼éudniow─ů cz─Ö┼Ťci─ů Mazur, na zachodzie z Wielkopolsk─ů i Opolszczyzn─ů, na po┼éudniu z Oraw─ů i Spiszem, na wschodzie si─Öga┼éo daleko za Zbrucz, a na kra┼äcach p├│┼énocno-wschodnich nie ogranicza┼éo si─Ö do Wile┼äszczyzny i Polesia, ale w┼é─ůcza┼éo do Polski m.in. tak┼╝e Mi┼äsk, Dyneburg i Po┼éock. \nBy┼é to zdecydowanie wi─Ökszy zakres terytorialny ni┼╝ uda┼éo si─Ö ostatecznie Polsce uzyska─ç w konsekwencji decyzji konferencji paryskiej, plebiscyt├│w, powsta┼ä ┼Ťl─ůskich i wojny z Rosj─ů bolszewick─ů.	Pologne et Pays Limitrophes	granice Polski, Polska		proponowane granice Polski, struktura narodowo┼Ťciowa, Komitet Narodowy Polski	\N				proponowane granice Polski na tle procentowego udzia┼éu ludno┼Ťci polskiej oraz historycznych granic Polski z roku 1772	maps/1RZ-AINxdw2DBaveArdGhxr04sSYlFw_P.jpg	2022-04-03 13:21:43.262181+02		Mapa drukowana	thumbnails/1RZ-AINxdw2DBaveArdGhxr04sSYlFw_P_copy.jpg
17		15	\N	, ok. 1917-1919	Na mapie, obejmuj─ůcej fragment pogranicza polsko-s┼éowackiego, rozci─ůgaj─ůcego si─Ö od Popradu na wschodzie po rejon Czadcy na po┼éudnie od ┼Ül─ůska Cieszy┼äskiego, przedstawiono polskie roszczenia terytorialne na W─Ögrzech. De facto dotyczy┼éy one p├│┼énocnej S┼éowacji, zw┼éaszcza Spiszu, Orawy i Czadeckiego, jednak prawdopodobnie w momencie powstania mapy istnia┼éa jeszcze Monarchia Austro-W─Ögierska, a S┼éowacja formalnie nale┼╝a┼éa do W─Ögier.\nNa mapie zaznaczono linie kolejowe, drogi, sie─ç rzeczn─ů, granice polityczne z roku 1914 oraz z ko┼äca XVIII wieku. G┼é├│wnymi elementami mapy s─ů naniesione szrafem polskie i s┼éowackie terytoria j─Özykowe oraz po┼éudniowa granica polskich roszcze┼ä terytorialnych obejmuj─ůcych p├│┼énocny Spisz, p├│┼énocn─ů Oraw─Ö i Czadeckie. \nPodstaw─ů wytyczenia zasi─Ögu polskich roszcze┼ä terytorialnych na obszarze p├│┼énocnych W─Ögier (p├│┼énocnej S┼éowacji) by┼éo kryterium j─Özykowe. Nigdzie na omawianej mapie granica polskich roszcze┼ä terytorialnych nie wkracza na s┼éowackie terytorium j─Özykowe. Granica ta ┼Ťci┼Ťle pokrywa si─Ö z po┼éudniowym zasi─Ögiem polskiego terytorium j─Özykowego, tylko na obszarze Spiszu wykracza dalej na po┼éudnie, obejmuj─ůc cz─Ö┼Ťciowo obszary z przewag─ů ludno┼Ťci niemieckiej oraz z polskimi ÔÇ×wyspami j─ÖzykowymiÔÇŁ. \nMapa ta zosta┼éa do┼é─ůczona jako aneks do memoria┼éu dotycz─ůcego wytyczenia granicy pomi─Ödzy Polsk─ů a Czechos┼éowacj─ů na ┼Ül─ůsku Cieszy┼äskim, Orawie i Spiszu, przygotowanego przez delegacj─Ö polsk─ů na konferencj─Ö pokojow─ů w Pary┼╝u w 1919 roku.\nNie podano autora mapy, ani ┼║r├│d┼éa danych, mo┼╝na jednak przypuszcza─ç (na podstawie por├│wnania z innymi mapami), ┼╝e zosta┼éa opracowana na podstawie wynik├│w bada┼ä Kazimierza Nitscha, polskiego j─Özykoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiello┼äskiego, jednego z ekspert├│w delegacji polskiej na konferencj─Ö pokojow─ů w Pary┼╝u w 1919 roku.\nNa podstawie tej mapy mo┼╝na stwierdzi─ç, ┼╝e formu┼éowane m.in. podczas konferencji pokojowej w Pary┼╝u, polskie roszczenia terytorialne dotycz─ůce Orawy i Spiszu, by┼éy ca┼ékowicie uzasadnione kryteriami j─Özykowymi i etnicznymi, a arbitralne rozstrzygni─Öcia Rady Ambasador├│w z 28 lipca 1920 roku, dziel─ůce te obszary pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, bez zachowania nadrz─Ödno┼Ťci kryteri├│w j─Özykowo-etnicznych, by┼éy dla Polski oraz ludno┼Ťci mieszkaj─ůcej na polsko-s┼éowackim pograniczu, niesprawiedliwe i krzywdz─ůce.	Revendications Polonaises en Hongrie	granica polsko-s┼éowacka, pogranicze polsko-s┼éowackie, Spisz, Orawa	Kazimierz Nitsch	struktura j─Özykowa, granice j─Özykowe, Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u	\N		600000		polskie roszczenia terytorialne na obszarze p├│┼énocnych W─Ögier (p├│┼énocnej S┼éowacji) na podstawie kryteri├│w j─Özykowych	maps/14R4j7UEpK0bzS3DUAuzNnQfz2hTfUKJ-.jpg	2022-04-03 13:21:43.108688+02	https://drive.google.com/drive/folders/1_ucV-brrrWyavyeuiax8Fk10bsLd1Pj_?usp=sharing	Mapa drukowana	thumbnails/14R4j7UEpK0bzS3DUAuzNnQfz2hTfUKJ-_copy.jpg
37		35	\N		Tytu┼é mapy sugeruje ograniczenie jej zasi─Ögu do Litwy i Rusi (Bia┼éoru┼Ť i Ukraina), natomiast w rzeczywisto┼Ťci mapa obejmuje bardzo rozleg┼éy obszar, obejmuj─ůcy poza Litw─ů, Bia┼éorusi─ů i zdecydowan─ů wi─Ökszo┼Ťci─ů Ukrainy, tak┼╝e cz─Ö┼Ťciowo ┼üotw─Ö oraz wschodnie Podlasie z Bia┼éostocczyzn─ů.\nCa┼éy obszar zosta┼é przedstawiony w podziale administracyjnym na gubernatorstwa oraz wchodz─ůce w ich sk┼éad dystrykty.\n	Lithuanie et Ruthenie	Litwa, Bia┼éoru┼Ť, Ukraina		podzia┼é administracyjny	\N		5000000		podzia┼é administracyjny Litwy, Bia┼éorusi, Ukrainy oraz fragmentu ┼üotwy i Podlasia	maps/12UnPfMY86-khkdF4u5orDRCixwS_E-yX.jpg	2022-04-03 13:21:43.472653+02	https://drive.google.com/drive/folders/15CILHwTWajYurkxrQyaw-rN9chNYeU-g?usp=sharing	Mapa drukowana	thumbnails/12UnPfMY86-khkdF4u5orDRCixwS_E-yX_copy.jpg
40		38	\N		Na mapie przedstawiono rozmieszczenie i liczebno┼Ť─ç ludno┼Ťci niemieckiej w zachodniej Polsce wed┼éug oficjalnego spisu powszechnego z 1910 lub 1905 r., statystyki zawod├│w i innych urz─Ödowych publikacji.\nPomimo zawartego w tytule okre┼Ťlenia ÔÇ×zachodnia PolskaÔÇŁ, mapa obejmuje wi─Ökszy obszar ni┼╝ ten, kt├│ry znalaz┼é si─Ö w granicach Polski w konsekwencji decyzji konferencji paryskiej. Jest to wyra┼║nie widoczne zar├│wno na Mazurach, Pomorzu Gda┼äskim, Wielkopolsce, jak i G├│rnym ┼Ül─ůsku oraz Opolszczy┼║nie.  \nAutor mapy, dzieli Niemc├│w zamieszkuj─ůcych na tym obszarze na ludno┼Ť─ç bezpo┼Ťrednio zale┼╝n─ů od rz─ůdu (urz─Ödnicy, wojskowi, osadnicy zamieszkuj─ůcy mieszkania publiczne), zaznaczaj─ůc ich kolorem czerwonym oraz kolonist├│w osiedlonych przez rz─ůd pruski od 1886 r., tylko cz─Ö┼Ťciowo zale┼╝nych od rz─ůdu lub ca┼ékowicie niezale┼╝nych od polityk├│w (kolor niebieski).\nWed┼éug autora mapy, ludno┼Ť─ç niemiecka bezpo┼Ťrednio uzale┼╝niona od w┼éasnego rz─ůdu, zdecydowanie dominuje na tym obszarze, zw┼éaszcza na G├│rnym ┼Ül─ůsku, Opolszczy┼║nie, Mazurach i Pomorzy Gda┼äskim. Natomiast w Wielkopolsce, Kujawach, Powi┼Ťlu oraz na Kaszubach, zamieszkuje zar├│wno ludno┼Ť─ç zale┼╝na od rz─ůdu (zw┼éaszcza w miastach), jak i koloni┼Ťci niezale┼╝ni od polityk├│w (szczeg├│lnie na terenach wiejskich).\n	The German population in West Poland	zachodnia Polska, Pomorze Gda┼äskie, Mazury, Wielkopolska, G├│rny ┼Ül─ůsk, Opolszczyzna		ludno┼Ť─ç niemiecka	\N				ludno┼Ť─ç niemiecka w zachodniej Polsce	maps/1dmirt85xe4oACzQtMtWE-Zn-0Ul8MGvk.jpg	2022-04-03 13:21:43.529298+02		Mapa r─Ökopi┼Ťmienna	thumbnails/1dmirt85xe4oACzQtMtWE-Zn-0Ul8MGvk_copy.jpg
42		40	\N		Na mapie zaprezentowano dominuj─ůcy udzia┼é ludno┼Ťci niemieckiej lub polskiej na obszarze wschodnich prowincji Rzeszy Niemieckiej. \nJest to mapa w j─Özyku niemieckim wydana w Niemczech, w zak┼éadzie kartograficznym Perthesa, przedstawiaj─ůca przewa┼╝aj─ůcy udzia┼é ludno┼Ťci niemieckiej lub polskiej w poszczeg├│lnych gminach wschodniej cz─Ö┼Ťci Prus. Kolorem oraz szrafem przedstawiono procentowy udzia┼é Niemc├│w (kolor czerwony) oraz Polak├│w (kolor zielony) w trzech przedzia┼éach: powy┼╝ej 50 %; powy┼╝ej 70% oraz powy┼╝ej 85% na tle podzia┼éu administracyjnego na gminy, powiaty, rejencje i prowincje. Mapa zosta┼éa wykonana na podstawie danych pruskiego spisu powszechnego z 1910 roku, kt├│ry zani┼╝a┼é udzia┼é ludno┼Ťci polskiej. W spisie tym narodowo┼Ť─ç by┼éa ustalana na podstawie odpowiedzi na pytanie o j─Özyk ojczysty, a w pruskim spisie powszechnym m.in. istnia┼éa mo┼╝liwo┼Ť─ç zadeklarowania dw├│ch j─Özyk├│w i cz─Ö┼Ť─ç Polak├│w, znaj─ůcych tak┼╝e j─Özyk niemiecki, deklarowa┼éo j─Özyk polski wraz z niemieckim, co skutkowa┼éo zaliczeniem ich do tzw. ÔÇ×os├│b dwuj─ÖzycznychÔÇŁ.\nPomimo tego, mapa jednoznacznie obrazuje dominacj─Ö w 1910 roku ludno┼Ťci polskiej (deklaruj─ůcej u┼╝ywanie j─Özyka polskiego) w strukturze narodowo┼Ťciowej mieszka┼äc├│w rozleg┼éych obszar├│w wschodniej cz─Ö┼Ťci ├│wczesnych Prus, m.in.: po┼éudniowej cz─Ö┼Ťci Mazur, Kaszub, Wielkopolski, G├│rnego ┼Ül─ůska, Opolszczyzny i p├│┼énocno-wschodniej cz─Ö┼Ťci Dolnego ┼Ül─ůska.\nMapa ta po zako┼äczeniu I wojny budzi┼éa liczne kontrowersje i dyskusje. By┼éa niejednokrotnie krytykowana przez niemieckich kartograf├│w, kt├│rzy zarzucali jej b┼é─Ödy metodologiczne, a nawet fa┼észerstwa, z kolei opinie polskich kartograf├│w by┼éy przychylne (szerzej M. G├│rny, 2017, Kre┼Ťlarze ojczyzn. Geografowie i granice mi─Ödzywojennej Europy, s. 141-145).  	Nationalit├Ątenkarte der ├Âstlichen Provinzen des Deutschen Reichs nach den Ergebnissen der amtlichen  Volkszahlung vom Jahre 1910	Wschodnie prowincje Rzeszy Niemieckiej, Mazury, Wielkopolska, ┼Ül─ůsk, Opolszczyzna, Pobrze┼╝e Gda┼äskie, Kaszuby		pruski spis powszechny 1910 roku, struktura narodowo┼Ťciowa, struktura j─Özykowa, Niemcy, Polacy	15	Gotha: Justus Perthes	500000	Nationalit├Ątenkarte der ├Âstlichen Provinzen des Deutschen Reichs	Mapa narodowo┼Ťciowa wschodnich prowincji Rzeszy Niemieckiej na podstawie wynik├│w spisu ludno┼Ťci z 1910 r. 	maps/17HXvGMonyJANUXQfvJ1ivdz_5IwcW8nJ.jpg	2022-04-03 13:21:43.566119+02		Mapa drukowana	thumbnails/17HXvGMonyJANUXQfvJ1ivdz_5IwcW8nJ_copy.jpg
44		42	\N	1915	Mapa fizyczno-geograficzna Galicji i Bukowiny, obrazuj─ůca przede wszystkim ukszta┼étowanie powierzchni oraz sie─ç rzeczn─ů, ale tak┼╝e uwzgl─Ödniaj─ůca sie─ç komunikacyjn─ů i jednostki osadnicze.	Mapa Galicyi i Bukowiny z Wielkim Ksi─Östwem Krakowskiem	Galicja, Bukowina		Galicja	16	Gubrynowicz i Syn	700000		ukszta┼étowanie powierzchni i sie─ç rzeczna Galicji i Bukowiny	maps/1QuEvNoXt0BZqXfbla06cSGyTqZ0EDqSy.jpg	2022-04-03 13:21:43.607826+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1QuEvNoXt0BZqXfbla06cSGyTqZ0EDqSy_copy.jpg
14		12	\N	28 lipca 1920	Mapa przedstawia podzia┼é Orawy pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, wed┼éug decyzji Rady Ambasador├│w z 28 lipca 1920 roku.\nDo I wojny ┼Ťwiatowej Orawa znajdowa┼éa si─Ö w granicach W─Ögier. Po rozpadzie monarchii Austro-W─Ögierskiej oraz zako┼äczeniu wojny, nowopowsta┼éa Czechos┼éowacja ro┼Ťci┼éa pretensje terytorialne do ca┼éego obszaru p├│┼énocnych W─Ögier (w tym do Orawy). Z kolei liczna na Orawie ludno┼Ť─ç polska, zw┼éaszcza w jej p├│┼énocnej cz─Ö┼Ťci, domaga┼éa si─Ö przy┼é─ůczenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Pary┼╝u, podj─Öto decyzj─Ö o przeprowadzeniu w po┼éowie 1920 roku plebiscytu, kt├│ry mia┼é zadecydowa─ç o przynale┼╝no┼Ťci politycznej Orawy. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podj─Öto decyzj─Ö o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzj─Ö o podziale tego regionu scedowano na Rad─Ö Ambasador├│w, kt├│ra 28 lipca 1920 roku w Pary┼╝u, podj─Ö┼éa arbitraln─ů decyzj─Ö, przyznaj─ůc Polsce tylko niewielki p├│┼énocno-wschodni fragment spornych obszar├│w, co nie zako┼äczy┼éo spor├│w terytorialnych polsko-czechos┼éowackich. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnej granicy pomi─Ödzy Austri─ů (Galicj─ů) a W─Ögrami, natomiast kolorem czerwonym granic─Ö wytyczon─ů na podstawie decyzji Rady Ambasador├│w z 28 lipca 1920, czyli tzw. ÔÇ×lini─Ö Ambasador├│wÔÇŁ, kt├│ra mia┼éa sta─ç si─Ö granic─ů Polski i Czechos┼éowacji.\nDecyzja Rady Ambasador├│w dotycz─ůca podzia┼éu Orawy by┼éa niekorzystna dla Polski, rozgraniczenie nie zosta┼éo przeprowadzone wed┼éug kryterium j─Özykowego czy etnicznego. Wytyczona na mapie granica z lipca 1920 roku, zosta┼éa nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Lig─Ö Narod├│w, przekazano Czechos┼éowacji dwie wsie G┼éod├│wk─Ö (Hladovka) i Such─ů G├│r─Ö (Sucha Hora) na zach├│d od Chocho┼éowa, w zamian za przekazan─ů Polsce cz─Ö┼Ť─ç wsi Lipnica Wielka (Dolna Lipnica). W tak ustalonej formie (1924) granica ta funkcjonuje r├│wnie┼╝ wsp├│┼écze┼Ťnie.	Fronti├Ęre dans la R├ęgion dÔÇśOrawa	Orawa, granica polsko-czechos┼éowacka, granica polsko-s┼éowacka		Rada Ambasador├│w, linia Ambasador├│w, podzia┼é Orawy	6	S.G.A.	75000		podzia┼é Orawy pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, wed┼éug decyzji Rady Ambasador├│w z 28 lipca 1920 roku	maps/14Xdi6q7m_W18g7L0J2_a-UVahlAdaQFJ.jpg	2022-04-03 13:21:43.045235+02		Mapa drukowana	thumbnails/14Xdi6q7m_W18g7L0J2_a-UVahlAdaQFJ_copy.jpg
15		13	\N	28 lipca 1920	Mapa przedstawia podzia┼é Spiszu pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, wed┼éug decyzji Rady Ambasador├│w z 28 lipca 1920 roku.\nDo I wojny ┼Ťwiatowej Spisz znajdowa┼é si─Ö w granicach W─Ögier (o czym przypomina nazewnictwo mapy). Po rozpadzie monarchii Austro-W─Ögierskiej oraz zako┼äczeniu wojny, nowopowsta┼éa Czechos┼éowacja ro┼Ťci┼éa pretensje terytorialne do ca┼éego obszaru p├│┼énocnych W─Ögier (w tym do Spiszu). Z kolei liczna na Spiszu ludno┼Ť─ç polska, zw┼éaszcza w jego p├│┼énocnej cz─Ö┼Ťci, domaga┼éa si─Ö przy┼é─ůczenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Pary┼╝u, podj─Öto decyzj─Ö o przeprowadzeniu w po┼éowie 1920 roku plebiscytu, kt├│ry mia┼é zadecydowa─ç o przynale┼╝no┼Ťci politycznej Spiszu. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podj─Öto decyzj─Ö o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzj─Ö o podziale tego regionu scedowano na Rad─Ö Ambasador├│w, kt├│ra 28 lipca 1920 roku w Pary┼╝u, podj─Ö┼éa arbitraln─ů decyzj─Ö, przyznaj─ůc Polsce tylko niewielki fragment spornych obszar├│w, co nie zako┼äczy┼éo spor├│w terytorialnych polsko-czechos┼éowackich. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnej granicy pomi─Ödzy Austri─ů (Galicj─ů) a W─Ögrami, natomiast kolorem czerwonym granic─Ö wytyczon─ů na podstawie decyzji Rady Ambasador├│w z 28 lipca 1920, czyli tzw. ÔÇ×lini─Ö Ambasador├│wÔÇŁ, kt├│ra mia┼éa sta─ç si─Ö granic─ů Polski i Czechos┼éowacji.\nDecyzja Rady Ambasador├│w dotycz─ůca podzia┼éu Spiszu by┼éa niekorzystna dla Polski i wywo┼éa┼éa protesty polskich w┼éadz. Nie rozstrzygni─Öto w├│wczas tak┼╝e spornej kwestii przynale┼╝no┼Ťci Doliny Jaworzyny (Tatry Wysokie). Wytyczona na mapie granica z lipca 1920 roku, zosta┼éa nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Lig─Ö Narod├│w, Polsce przekazano niewielki obszaru na po┼éudnie od wsi Jurg├│w i Brzegi oraz dokonano wzajemnej wymiany niewielkich terytori├│w na po┼éudnie od wsi Niedzica. W tak ustalonej formie (1924 rok) granica ta funkcjonuje r├│wnie┼╝ wsp├│┼écze┼Ťnie.	Fronti├Ęre dans la R├ęgion de Spisz	Spisz, granica polsko-czechos┼éowacka, granica polsko-s┼éowacka		Rada Ambasador├│w, linia Ambasador├│w, podzia┼é Spiszu	6	S.G.A.	75000		podzia┼é Spiszu pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö wed┼éug decyzji Rady Ambasador├│w z 28 lipca 1920 roku	maps/1wB0xU_DD5FmRxvGRPie-jA80MJ1M2cw-.jpg	2022-04-03 13:21:43.065759+02		Mapa drukowana	thumbnails/1wB0xU_DD5FmRxvGRPie-jA80MJ1M2cw-_copy.jpg
45		43	\N	1902	Na niemieckiej mapie topograficznej, obejmuj─ůcej Dolny ┼Ül─ůsk i cz─Ö┼Ťciowo Wielkopolsk─Ö po rozbiorow─ů granic─Ö prusko-rosyjsk─ů na Pro┼Ťnie, wrysowano niebieskim d┼éugopisem fragment proponowanej powojennej granicy polsko-niemieckiej na Dolnym ┼Ül─ůsku oraz na zach├│d od niej, czerwon─ů kredk─ů zaznaczono obszar okre┼Ťlony jako "Polsko┼Ť─ç". Zamalowana na czerwono strefa si─Öga na zachodzie po Namys┼é├│w (Namslau) i Twardog├│r─Ö (Festenberg), a na p├│┼énocny ko┼äczy si─Ö na rozlewiskach Baryczy pomi─Ödzy Odolanowem (Adenlau) a Miliczem (Militsch), czyli na historycznym pograniczu ┼Ül─ůska i Wielkopolski.	├ťbersichtskarte von Mitteleuropa. Breslau	pogranicze polsko-pruskie, Dolny ┼Ül─ůsk		zab├│r pruski, strefa zamieszkiwania ludno┼Ťci polskiej	\N	K├Âniglich-Preussische Landesaufnahme	300000		Lokalizacja ludno┼Ťci polskiej na Dolnym ┼Ül─ůsku 	maps/1kk9tJI-lyVsfOOI3DV-JaYgzv9D1xv3f.jpg	2022-04-03 13:21:43.63209+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1kk9tJI-lyVsfOOI3DV-JaYgzv9D1xv3f_copy.jpg
18		16	\N	11 kwietnia 1919	Mapa przedstawia przypuszczenia dotycz─ůce pi─Öciu propozycji obszaru spornego na terenie Ksi─Östwa Cieszy┼äskiego w konsekwencji przeprowadzenia plebiscytu, dotycz─ůcego przynale┼╝no┼Ťci pa┼ästwowej tego regionu. Pokazano w formie graficznej (pi─Ö─ç odr─Öcznych szkic├│w map) i tekstowej (kr├│tkie notatki) udzia┼é ludno┼Ťci polskiej w ka┼╝dym z pi─Öciu wariant├│w, zar├│wno w uj─Öciu przestrzennym (na mapie), jak i liczbowym (na podstawie danych z austriackiego spisu z 1910 roku, w trakcie kt├│rego nie by┼éo pytania o narodowo┼Ť─ç, a struktur─Ö etniczn─ů ustalano wed┼éug odpowiedzi na pytanie o ÔÇ×j─Özyk domowyÔÇŁ). Wszystkie zamieszczone na mapie dane statystyczne dowodzi┼éy dominacji ludno┼Ťci polskiej na obszarze Ksi─Östwa Cieszy┼äskiego. Udzia┼é Polak├│w waha┼é si─Ö od 54,8% (ca┼ée Ksi─Östwo Cieszy┼äskie), do 84,7% (powiat frysztacki i cieszy┼äski oraz 27 gmin z zachodniej cz─Ö┼Ťci powiatu bielskiego i 1 gmina z p├│┼énocnej cz─Ö┼Ťci powiatu frydeckiego). \nOpracowanie zosta┼éo wykonane 11 kwietnia 1919 roku, podpis autora nieczytelny.\nOstatecznie plebiscyt planowany na rok 1920, nie zosta┼é przeprowadzony, dlatego nie ma mo┼╝liwo┼Ťci weryfikacji tych przypuszcze┼ä. 		Ksi─Östwo Cieszy┼äskie, ┼Ül─ůsk Cieszy┼äski, granica polsko-czeska		struktura j─Özykowa, austriacki spis powszechny 1910 roku,  plebiscyt, Delegacja Polska na Konferencj─Ö Pokojow─ů w Pary┼╝u	\N				przypuszczenia dotycz─ůce pi─Öciu propozycji obszaru spornego na terenie Ksi─Östwa Cieszy┼äskiego w konsekwencji przeprowadzenia plebiscytu	maps/1qFsaLOTTVUkFcQidzsCEO1csbL9-SjA1.jpg	2022-04-03 13:21:43.128169+02		Mapa r─Ökopi┼Ťmienna z dodatkowymi adnotacjami	thumbnails/1qFsaLOTTVUkFcQidzsCEO1csbL9-SjA1_copy.jpg
20		18	\N	, ok. 1917-1919	Tytu┼é mapy mo┼╝na t┼éumaczy─ç jako ÔÇ×mapa etnograficzna ziem polskich pod zaborem pruskimÔÇŁ.\nJest to mapa w j─Özyku angielskim wydana przez Biuro Kartograficzne ÔÇ×Encyklopedii PolskiejÔÇŁ, przedstawiaj─ůca udzia┼é ludno┼Ťci polskiej w powiatach wschodniej cz─Ö┼Ťci Prus.\nSzrafem przedstawiono procentowy udzia┼é Polak├│w w czterech nier├│wnych przedzia┼éach: 0-10%; 10-25%; 25-50%; 50-100%, na tle podzia┼éu administracyjnego na powiaty, rejencje i prowincje. Nie podano daty wykonania mapy, ani ┼║r├│de┼é danych. Mo┼╝na przypuszcza─ç, ┼╝e u┼╝yto danych pruskiego spisu powszechnego z 1910 roku, cho─çby dlatego, ┼╝e w por├│wnaniu z podobnymi mapami wydanymi przez Centraln─ů Agencj─Ö Polsk─ů w Lozannie, przedstawiaj─ůc─ů udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych w powiatach wschodniej cz─Ö┼Ťci Prus, wed┼éug ze spisu szkolnego z roku 1911, w wi─Ökszej liczbie powiat├│w zosta┼é odnotowany wy┼╝szy udzia┼é procentowy os├│b narodowo┼Ťci polskiej ni┼╝ na omawianej mapie. Najwi─Öksze r├│┼╝nice s─ů widoczne na Mazurach, Kaszubach i na Opolszczy┼║nie. W pruskim spisie powszechnym z 1910 roku narodowo┼Ť─ç by┼éa ustalana na podstawie odpowiedzi na pytanie o j─Özyk ojczysty, a statystyka pruska wyszczeg├│lnia┼éa obok j─Özyka polskiego, tak┼╝e j─Özyk kaszubski i mazurski, co skutecznie zmniejsza┼éo liczb─Ö os├│b deklaruj─ůcych j─Özyk polski (a tym samym liczb─Ö os├│b zaliczonych do polskiej narodowo┼Ťci). Ponadto w pruskim spisie powszechnym istnia┼éa mo┼╝liwo┼Ť─ç zadeklarowania dw├│ch j─Özyk├│w i cz─Ö┼Ť─ç Polak├│w, znaj─ůcych tak┼╝e j─Özyk niemiecki, deklarowa┼éo j─Özyk polski wraz z niemieckim, co skutkowa┼éo zaliczeniem ich do tzw. ÔÇ×os├│b dwuj─ÖzycznychÔÇŁ.\nZ danych przedstawionych na mapie wynika dominuj─ůcy (ponad 50%) udzia┼é ludno┼Ťci polskiej w wi─Ökszo┼Ťci powiat├│w G├│rnego ┼Ül─ůska (poza raciborskim), we wschodniej cz─Ö┼Ťci Opolszczyzny, zdecydowanej wi─Ökszo┼Ťci Wielkopolski, wschodniej cz─Ö┼Ťci Kaszub oraz w po┼éudniowej cz─Ö┼Ťci Mazur.	Ethnographical Map of Prussian Poland 	Prusy	Tadeusz Skowro┼äski	struktura narodowo┼Ťciowa, pruski spis powszechny z 1910 roku, ludno┼Ť─ç polska w Prusach 	\N	Cartographical Bureau of the "Polish Encyclopedia"	 (podzia┼éka)		udzia┼é ludno┼Ťci polskiej w powiatach wschodniej cz─Ö┼Ťci Prus	maps/1hRcAkJzBZ9sOKIW5XrkFA_6M2kj907CQ.jpg	2022-04-03 13:21:43.167768+02		Mapa drukowana	thumbnails/1hRcAkJzBZ9sOKIW5XrkFA_6M2kj907CQ_copy.jpg
48		46	\N		Na mapie w formie kartogramu przedstawiono procentowy udzia┼é Polak├│w w podziale na okr─Ögi s─ůdowe Galicji Wschodniej w roku 1910. Udzia┼é ludno┼Ťci polskiej zosta┼é przedstawiony w czterech przedzia┼éach (mniej ni┼╝ 10%, 10-25%, 25-50%, wi─Öcej ni┼╝ 50%). ┼╣r├│d┼éem danych prawdopodobnie by austriacki spis powszechny z 1910 roku. Najwi─Ökszy, dominuj─ůcy udzia┼é Polak├│w, by┼é w cz─Ö┼Ťci zachodniej, nad Sanem, ponadto w okolicach Lwowa oraz w cz─Ö┼Ťci wschodniej w okolicach Tarnopola. Najmniej liczny wzd┼éu┼╝ ┼éuku Karpat, w cz─Ö┼Ťci po┼éudniowo-zachodniej. \nZ boku mapy r─Öcznie dopisano w j─Özyku francuskim tytu┼é mapy i legend─Ö, w identycznym brzmieniu jak na mapie.\n	Des Polonais dans les districts judiciaires 1910	Galicja Wschodnia		struktura narodowo┼Ťciowa, udzia┼é ludno┼Ťci polskiej, spis powszechny 1910 r., Galicja Wschodnia	\N				udzia┼é Polak├│w w podziale na okr─Ögi s─ůdowe Galicji Wschodniej w roku 1910	maps/1Hx7H48BtD_OAZOYlAHnuawxreyHRwd8Q.jpg	2022-04-03 13:21:43.674732+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV	Mapa r─Ökopi┼Ťmienna z dodatkowymi adnotacjami	thumbnails/1Hx7H48BtD_OAZOYlAHnuawxreyHRwd8Q_copy.jpg
21		19	\N	, ok. 1917-1919	Tytu┼é mapy mo┼╝na t┼éumaczy─ç jako ÔÇ×mapa etnograficzna ziem polskich pod zaborem pruskimÔÇŁ.\nJest to mapa w j─Özyku angielskim wydana przez Biuro Kartograficzne ÔÇ×Encyklopedii PolskiejÔÇŁ, przedstawiaj─ůca udzia┼é ludno┼Ťci polskiej w powiatach wschodniej cz─Ö┼Ťci Prus.\nSzrafem przedstawiono procentowy udzia┼é Polak├│w w czterech nier├│wnych przedzia┼éach: 0-10%; 10-25%; 25-50%; 50-100%, na tle podzia┼éu administracyjnego na powiaty, rejencje i prowincje. Nie podano daty wykonania mapy, ani ┼║r├│de┼é danych. Mo┼╝na przypuszcza─ç, ┼╝e u┼╝yto danych pruskiego spisu powszechnego z 1910 roku, cho─çby dlatego, ┼╝e w por├│wnaniu z podobnymi mapami wydanymi przez Centraln─ů Agencj─Ö Polsk─ů w Lozannie, przedstawiaj─ůc─ů udzia┼é dzieci narodowo┼Ťci polskiej w┼Ťr├│d uczni├│w szk├│┼é podstawowych w powiatach wschodniej cz─Ö┼Ťci Prus, wed┼éug ze spisu szkolnego z roku 1911, w wi─Ökszej liczbie powiat├│w zosta┼é odnotowany wy┼╝szy udzia┼é procentowy os├│b narodowo┼Ťci polskiej ni┼╝ na omawianej mapie. Najwi─Öksze r├│┼╝nice s─ů widoczne na Mazurach, Kaszubach i na Opolszczy┼║nie. W pruskim spisie powszechnym z 1910 roku narodowo┼Ť─ç by┼éa ustalana na podstawie odpowiedzi na pytanie o j─Özyk ojczysty, a statystyka pruska wyszczeg├│lnia┼éa obok j─Özyka polskiego, tak┼╝e j─Özyk kaszubski i mazurski, co skutecznie zmniejsza┼éo liczb─Ö os├│b deklaruj─ůcych j─Özyk polski (a tym samym liczb─Ö os├│b zaliczonych do polskiej narodowo┼Ťci). Ponadto w pruskim spisie powszechnym istnia┼éa mo┼╝liwo┼Ť─ç zadeklarowania dw├│ch j─Özyk├│w i cz─Ö┼Ť─ç Polak├│w, znaj─ůcych tak┼╝e j─Özyk niemiecki, deklarowa┼éo j─Özyk polski wraz z niemieckim, co skutkowa┼éo zaliczeniem ich do tzw. ÔÇ×os├│b dwuj─ÖzycznychÔÇŁ.\nZ danych przedstawionych na mapie wynika dominuj─ůcy (ponad 50%) udzia┼é ludno┼Ťci polskiej w wi─Ökszo┼Ťci powiat├│w G├│rnego ┼Ül─ůska (poza raciborskim), we wschodniej cz─Ö┼Ťci Opolszczyzny, zdecydowanej wi─Ökszo┼Ťci Wielkopolski, wschodniej cz─Ö┼Ťci Kaszub oraz w po┼éudniowej cz─Ö┼Ťci Mazur.	Ethnographical Map of Prussian Poland 	Prusy	Tadeusz Skowro┼äski	struktura narodowo┼Ťciowa, ludno┼Ť─ç polska w Prusach, pruski spis powszechny z 1910 roku	\N	Cartographical Bureau of the "Polish Encyclopedia"	 (podzia┼éka)		udzia┼é ludno┼Ťci polskiej w powiatach wschodniej cz─Ö┼Ťci Prus	maps/1NJXX6muvnRGgw5hJUAzW5kqVaKHcNVAE.jpg	2022-04-03 13:21:43.185005+02		Mapa drukowana	thumbnails/1NJXX6muvnRGgw5hJUAzW5kqVaKHcNVAE_copy.jpg
23		21	\N	1919	Na mapie, na obszarze szeroko poj─Ötego pogranicza polsko-s┼éowackiego, rozci─ůgaj─ůcego si─Ö od ┼Ül─ůska Cieszy┼äskiego i regionu Czadeckiego na zachodzie po Beskid Niski na wschodzie, przedstawiono rozmieszczenie ludno┼Ťci polskiej i s┼éowackiej oraz ludno┼Ťci m├│wi─ůcej dialektami przej┼Ťciowymi.\nZosta┼éa zaznaczona sie─ç rzeczna, linie kolejowe, g┼é├│wne miejscowo┼Ťci (zw┼éaszcza na Spiszu, Orawie i w regionie Czadeckim) granice prowincji i powiat├│w w─Ögierskich oraz ÔÇ×granice po┼éudniowe istotne (kluczowe) dla PolskiÔÇŁ. G┼é├│wnymi elementami mapy s─ů obszary rozmieszczenia Polak├│w ÔÇ×w zwartej masieÔÇŁ (kolor czerwony), S┼éowak├│w (kolor zielony) oraz Polak├│w ÔÇ×rozproszonych w┼Ťr├│d innych narodowo┼ŤciÔÇŁ (szraf) i ludno┼Ťci m├│wi─ůcej dialektami przej┼Ťciowymi, w domy┼Ťle polsko-s┼éowackimi (szraf). Rozmieszczenie Polak├│w i S┼éowak├│w zosta┼éo opracowane na podstawie kryteri├│w j─Özykowych.\nMapa zosta┼éa do┼é─ůczona do szczeg├│┼éowego opracowania w j─Özyku francuskim dotycz─ůcego historii oraz kwestii j─Özykowych, etnicznych i gospodarczych Spiszu, Orawy i Czadeckiego, przygotowanego w 1919 roku przez Polsk─ů Komisj─Ö Prac Przygotowawczych do Konferencji Pokojowej. Mo┼╝na przypuszcza─ç (na podstawie por├│wna┼ä z innymi mapami z tego okresu), ┼╝e zosta┼éa ona opracowana na podstawie wynik├│w bada┼ä Kazimierza Nitscha, polskiego j─Özykoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiello┼äskiego, jednego z ekspert├│w delegacji polskiej na konferencj─Ö pokojow─ů w Pary┼╝u w 1919 roku.\nZ mapy jednoznacznie wynika, ┼╝e g┼é├│wne regiony sporne na pograniczu polsko-czechos┼éowacki po zako┼äczeniu I wojny ┼Ťwiatowej, czyli ┼Ül─ůsk Cieszy┼äski, region Czadecki, Orawa oraz p├│┼énocny Spisz, by┼éy w├│wczas zdominowane przez ludno┼Ť─ç polsk─ů, ewentualnie ludno┼Ť─ç pos┼éuguj─ůc─ů si─Ö dialektami przej┼Ťciowymi (po┼éudniowa Orawa). Najbardziej jaskrawo jest to widoczne na przyk┼éadzie ┼Ül─ůska Cieszy┼äskiego, regionu Czadeckiego oraz p├│┼énocnej Orawy. Z kolei najbardziej skomplikowana sytuacja j─Özykowo-etniczna by┼éa na Spiszu, na kt├│rym wyst─Öpowa┼éy liczne ÔÇ×wyspy j─ÖzykoweÔÇŁ (w tym niemieckie) i strefy dialekt├│w przej┼Ťciowych. Natomiast w Galicji (Beskid Niski) obszary zamieszkane przez Polak├│w (na p├│┼énocy) oraz S┼éowak├│w (na po┼éudniu), s─ů rozdzielone szerok─ů stref─ů oznaczan─ů na mapie jako ÔÇ×Polacy rozproszeni w┼Ťr├│d innych narodowo┼ŤciÔÇŁ. W rzeczywisto┼Ťci by┼é to obszar w spos├│b zwarty zamieszkany przez Rusin├│w (┼üemk├│w, Rusnak├│w), pos┼éuguj─ůcych si─Ö dialektem j─Özyka ukrai┼äskiego, z bardzo nielicznym osadnictwem polskim i s┼éowackim.\nNa mapie zaznaczono tak┼╝e propozycj─Ö ÔÇ×po┼éudniowej granicy istotnej (kluczowej) dla PolskiÔÇŁ. Obejmuje ona w ca┼éo┼Ťci region Czadecki (na po┼éudnie od ┼Ül─ůska Cieszy┼äskiego), praktycznie ca┼é─ů Oraw─Ö, w┼é─ůcznie z po┼éudniowymi fragmentami zamieszkanymi przez ludno┼Ť─ç m├│wi─ůc─ů dialektami mieszanymi oraz bardzo rozleg┼éy obszar Spiszu, z Popradem i Kiezmarkiem. Granica ta, na Orawie i Spiszu si─Öga wyra┼║nie na po┼éudnie od obszaru oznaczonego jako ÔÇ×Polacy w zwartej masieÔÇŁ. Ta propozycja ÔÇ×po┼éudniowej granicy istotnej (kluczowej) dla PolskiÔÇŁ z roku 1919, nie mia┼éa nic wsp├│lnego z ustalon─ů rok p├│┼║niej granic─ů polsko-czechos┼éowack─ů. Na wielu odcinkach (zw┼éaszcza na Spiszu i Orawie) zosta┼éa wytyczona w oderwaniu nie tylko do przedstawionych na mapie kryteri├│w etniczno-j─Özykowych, ale tak┼╝e od kryteri├│w historycznych i reali├│w politycznych. \nPomimo tego, na podstawie tej mapy, mo┼╝na stwierdzi─ç, ┼╝e formu┼éowane m.in. podczas konferencji pokojowej w Pary┼╝u, polskie roszczenia terytorialne dotycz─ůce ┼Ül─ůska Cieszy┼äskiego, regionu Czadeckiego, p├│┼énocnej Orawy i p├│┼énocnego Spiszu, by┼éy uzasadnione kryteriami j─Özykowymi i etnicznymi, a arbitralne rozstrzygni─Öcia Rady Ambasador├│w z 28 lipca 1920 roku, dziel─ůce te obszary pomi─Ödzy Polsk─Ö a Czechos┼éowacj─Ö, bez zachowania nadrz─Ödno┼Ťci kryteri├│w j─Özykowo-etnicznych, by┼éy dla Polski oraz ludno┼Ťci mieszkaj─ůcej na polsko-czechos┼éowackim pograniczu, niesprawiedliwe i krzywdz─ůce.	Carte du Spisz, de lÔÇÖOrawa et du district de Czaca	Spisz, Orawa, region Czadecki, pogranicze polsko-s┼éowackie, granica polsko-s┼éowacka	Kazimierz Nitsch	struktura narodowo┼Ťciowa, struktura j─Özykowa, Polacy, S┼éowacy	9	LITH. ING. W. Krzeptowski	600000		Rozmieszczenie ludno┼Ťci polskiej i s┼éowackiej oraz ludno┼Ťci m├│wi─ůcej dialektami przej┼Ťciowymi na pograniczu polsko-s┼éowackim oraz propozycja wytyczenia po┼éudniowej granicy Polski	maps/1j3yfU2yjEZ4q9g37lYe1PSda2NHA9pss.jpg	2022-04-03 13:21:43.225903+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/1j3yfU2yjEZ4q9g37lYe1PSda2NHA9pss_copy.jpg
26		24	\N	, po 1916	Na mapie przedstawiono granice Polski w r├│┼╝nych okresach historycznych, w podziale na najdalsze granice Polski, granice Polski z roku 1772, granice pa┼ästw wasalnych, granice Ksi─Östwa Warszawskiego z lat 1807-1815 oraz granice Kr├│lestwa Polskiego z lat 1815-1831. Ponadto wypisano okresy czasowe, w kt├│rych dane terytorium znajdowa┼éo si─Ö pod zwierzchnictwem Polski oraz kolorami zaznaczono zasi─Ögi poszczeg├│lnych rozbior├│w Polski wraz z pa┼ästwami zaborczymi. Zapisano tak┼╝e nazwy g┼é├│wnych region├│w geograficzno-historycznych.\nW efekcie mapa przedstawia wszystkie terytoria, kt├│re kiedykolwiek bezpo┼Ťrednio nale┼╝a┼éy do Polski lub by┼éy od Polski w jaki┼Ť spos├│b zale┼╝ne, od Rugi, ┼üu┼╝yc i Czech na zachodzie, po wybrze┼╝e Morza Czarnego i Inflanty na wschodzie.\nPod legend─ů znajduje si─Ö informacja, ┼╝e zosta┼éa ona opracowana i wygrawerowana z serii map wydanych w 1916 roku przez Eugeniusza Romera, profesora geografii z Uniwersytetu Lwowskiego.	Historical map of Poland	granice Polski	Eugeniusz Romer	historyczne granice Polski, historyczne terytorium Polski, rozbiory	11	Rand McNally	, (podzia┼éka)		granice Polski w r├│┼╝nych okresach historycznych wraz z zaznaczeniem wszystkich terytori├│w, kt├│re kiedykolwiek bezpo┼Ťrednio nale┼╝a┼éy do Polski lub by┼éy od Polski w jaki┼Ť spos├│b zale┼╝ne	maps/1m2a2KCNDdn_OgCfn11rVYQFskl_1e9L2.jpg	2022-04-03 13:21:43.282192+02		Mapa drukowana	thumbnails/1m2a2KCNDdn_OgCfn11rVYQFskl_1e9L2_copy.jpg
27		25	\N		Na mapie przedstawiono podzia┼é polityczny ziem polskich przed I wojn─ů na tle og├│lnej struktury j─Özykowej (obszar├│w j─Özykowych), w spos├│b nie do ko┼äca konsekwentny.\nW ramach podzia┼éu politycznego przedstawiono przedwojenne granice pa┼ästw zaborczych oraz w cz─Ö┼Ťci zachodniej i po┼éudniowej g┼é├│wne regiony historyczno-geograficzne (Galicja, ┼Ül─ůsk, Pozna┼äskie, Prusy Zachodnie, Prusy Wschodnie). Natomiast na obszarze zaboru rosyjskiego  jest odwo┼éania do region├│w historyczno-geograficznych, a zamiast nich przedstawiono podzia┼é administracyjny na poszczeg├│lne gubernie (na obszarze w┼é─ůczonym do Cesarstwa Rosyjskiego) oraz Kr├│lestwo Polskie (na pozosta┼éym obszarze). Pomimo tego, ┼╝e mapa zosta┼éa opracowana podczas I wojny (lub tu┼╝ po niej), nie zaznaczono guberni che┼émskiej utworzonej w roku 1912, a wydzielonej z Kr├│lestwa Polskiego w roku 1915.\nPoza podzia┼éem polityczno-administracyjnym, mapa przedstawia ÔÇ×obszary j─ÖzykoweÔÇŁ ÔÇô polski, rusi┼äski (ukrai┼äski), bia┼éoruski i litewski.  jest wyszczeg├│lnienia obszar├│w z dominacj─ů ludno┼Ťci niemieckoj─Özycznej. Ponadto w odniesieniu do ludno┼Ťci m├│wi─ůcej w j─Özyku rusi┼äskim (ukrai┼äskim), bia┼éoruskim i litewskim, za pomoc─ů kolor├│w zaznaczono wy┼é─ůcznie zwarte obszary na kt├│rych stanowi ona ponad 50% og├│┼éu mieszka┼äc├│w. Inn─ů metod─Ö zastosowano wobec pokazania rozmieszczenia ludno┼Ťci polskoj─Özycznej, zaznaczaj─ůc kolorem obszar jej liczbowej dominacji, ale tak┼╝e przedstawiaj─ůc szrafem mniejszo┼Ťciowy udzia┼é os├│b pos┼éuguj─ůcych si─Ö j─Özykiem polskim, w trzech przedzia┼éach procentowych (25-50%; 10-25%; poni┼╝ej 10%). Dzi─Öki temu mo┼╝liwe by┼éo pokazanie obecno┼Ťci ludno┼Ťci polskoj─Özycznej na bardzo rozleg┼éym obszarze, zdecydowanie wykraczaj─ůcym poza ÔÇ×polski obszar j─ÖzykowyÔÇŁ, szczeg├│lnie na wschodzie (obejmuje wszystkie ziemie w granicach z 1772 roku), ale tak┼╝e na zachodzie i po┼éudniu, gdzie w kilku miejscach wykracza poza granice przedrozbiorowe (Spisz, Orawa, Ksi─Östwo Cieszy┼äskie, ┼Ül─ůsk, Pomorze, Mazury). \nNie podano ┼║r├│de┼é statystycznych dotycz─ůcych struktury j─Özykowej, co utrudnia weryfikacj─Ö danych.	The political subdivision of the Polish territory before the war and its linguistic areas.			struktura j─Özykowa, Polacy, Ukrai┼äcy, Bia┼éorusini, Litwini, historyczne terytorium Polski	\N				podzia┼é polityczny ziem polskich przed I wojn─ů na tle og├│lnej struktury j─Özykowej (obszar├│w j─Özykowych) - polskiego, rusi┼äskiego (ukrai┼äskiego), bia┼éoruskiego, litewskiego	maps/1WkjPYruEHs-0sBhT0CgAjvoV3RbfqRkP.jpg	2022-04-03 13:21:43.302897+02		Mapa r─Ökopi┼Ťmienna	thumbnails/1WkjPYruEHs-0sBhT0CgAjvoV3RbfqRkP_copy.jpg
28		26	\N	, prawdopodobnie 1919	Pomimo tego, ┼╝e na mapie nie ma podanego nazwiska autora oraz daty jej wykonania, mo┼╝na stwierdzi─ç, i┼╝ jest to mapa z propozycj─ů granic przysz┼éego terytorium Polski przedstawiona wiosn─ů 1919 roku przez polsk─ů delegacj─Ö pod przewodnictwem Romana Dmowskiego, podczas Konferencji Paryskiej.\nNa mapie przedstawiono proponowane granice Polski na tle struktury narodowo┼Ťciowej (j─Özykowej), z podzia┼éem na Polak├│w, Rusin├│w (Ukrai┼äc├│w), Litwin├│w i Bia┼éorusin├│w. Kolorami zaznaczono obszary, gdzie te cztery narodowo┼Ťci stanowi─ů od 50 do 100% og├│┼éu mieszka┼äc├│w, natomiast dodatkowo, tylko w odniesieniu do ludno┼Ťci polskiej (polskoj─Özycznej), zaznaczono szrafem regiony gdzie s─ů grup─ů mniejszo┼Ťciow─ů, w przedzia┼éach 25-50%, 10-25% oraz mniej ni┼╝ 10%.\nNie podano ┼║r├│de┼é danych statystycznych, co utrudnia ich weryfikacj─Ö.\nPonadto na mapie naniesiono sie─ç rzeczn─ů, g┼é├│wne miasta oraz granice innych pa┼ästw: Rosji, Niemiec, Czechos┼éowacji, W─Ögier i Rumunii. Zaznaczono tak┼╝e obszary wyst─Öpowania surowc├│w mineralnych: w─Ögla i cynku na ┼Ül─ůsku, ┼╝elaza i miedzi w ┼Üwi─Ötokrzyskim, soli w Ma┼éopolsce i ropy naftowej w Galicji Wschodniej.\nProponowane granice Polski nie nawi─ůzuj─ů do granic historycznych z roku 1772 (co w roku 1919 by┼éo nierealne), ale z drugiej strony nie ograniczaj─ů si─Ö tylko do region├│w z wi─Ökszo┼Ťci─ů ludno┼Ťci polskiej, nie s─ů wytyczone wed┼éug kryteri├│w etnicznych. Zw┼éaszcza na wschodzie postulowane jest przy┼é─ůczenie rozleg┼éych obszar├│w z dominacja ludno┼Ťci litewskiej, bia┼éoruskiej i ukrai┼äskiej, a proponowana granica z Rosj─ů zosta┼éa wytyczona zdecydowanie na wsch├│d od dawnego Kr├│lestwa Kongresowego, tak┼╝e wyra┼║nie na wsch├│d od Zbrucza czy Mi┼äska oraz na p├│┼énoc od D┼║winy. R├│wnie┼╝ na zachodzie i p├│┼énocy polskie ┼╝─ůdania terytorialne wzgl─Ödem Niemiec, dotyczy┼éy niejednokrotnie obszar├│w z niewielkim udzia┼éem ludno┼Ťci polskiej, zw┼éaszcza na Pomorzu, Warmii i Mazurach oraz zachodniej Opolszczy┼║nie. Z kolei proponowana granica po┼éudniowa obejmowa┼éa m.in. ┼Ül─ůsk Cieszy┼äski, Oraw─Ö i Spisz. Jednak najdalej szed┼é postulat w┼é─ůczenia w granice Polski ca┼éego terytorium tzw. Litwy etnicznej.\nTaki kszta┼ét postulowanego terytorium przysz┼éej Polski, odbiegaj─ůcy od kryteri├│w historycznych oraz narodowo┼Ťciowych (j─Özykowych) by┼é uzasadniony czynnikami gospodarczymi, strategicznymi i politycznymi.\nPostulowane terytorium Polski, zw┼éaszcza w cz─Ö┼Ťci zachodniej i p├│┼énocnej, by┼éo w ├│wczesnych uwarunkowaniach politycznych, ma┼éo prawdopodobne do urzeczywistnienia. Nie uda┼éo si─Ö przeforsowa─ç m.in. propozycji dotycz─ůcych ┼Ül─ůska Opolskiego i ca┼éo┼Ťci G├│rnego ┼Ül─ůska, ponadto Warmii i Mazur, Gda┼äska czy szerszego dost─Öpu do Ba┼étyku. Nierealny by┼é tak┼╝e postulat przy┼é─ůczenia ca┼éego terytorium Litwy. R├│wnie┼╝ ustalona ostatecznie w wyniku wojny polsko-bolszewickiej granica na wschodzie, by┼éa mniej korzystna, ni┼╝ proponowana na omawianej mapie.	The proposed frontiers of Poland	granice Polski	Roman Dmowski	Konferencja Paryska, Komitet Narodowy Polski, delegacja polska, struktura narodowo┼Ťciowa, struktura j─Özykowa	\N				Propozycja granic przysz┼éego terytorium Polski przedstawiona wiosn─ů 1919 roku przez polsk─ů delegacj─Ö pod przewodnictwem Romana Dmowskiego, podczas Konferencji Paryskiej.	maps/1gB_U1of3C6dZHn3GuhhmfpcqaLaAPond.jpg	2022-04-03 13:21:43.325132+02		Mapa drukowana	thumbnails/1gB_U1of3C6dZHn3GuhhmfpcqaLaAPond_copy.jpg
33		31	\N	prawdopodobnie grudzie┼ä 1919 lub pocz─ůtek 1920	Mapa jest za┼é─ůcznikiem do deklaracji Rady Najwy┼╝szej mocarstw sprzymierzonych i stowarzyszonych w sprawie tymczasowych granic wschodnich RP z 8 grudnia 1919 roku. Przedstawia przebieg granic ju┼╝ wyznaczonych oraz tych, kt├│re powinny zosta─ç ustalone. Dodatkowo prezentuje obszary plebiscytowe.\nNa uwag─Ö zas┼éuguje wytyczony na mapie przebieg polskiej granicy wschodniej, kt├│ry zdecydowanie odbiega od ├│wczesnych polskich postulat├│w terytorialnych. Jest on bardzo zbli┼╝ony do wsp├│┼éczesnego przebiegu granicy polskiej, od Karpat, wzd┼éu┼╝ Bugu, po Suwalszczyzn─Ö, z tym ┼╝e w Bieszczadach oraz na Podlasiu, linia graniczna jest wytyczona jeszcze dalej na zach├│d ni┼╝ obecna wschodnia granica Polski. Poza terytorium Polski znajduje si─Ö m.in. Wile┼äszczyzna, Grodno, Bia┼éowie┼╝a wraz z Puszcz─ů Bia┼éowiesk─ů, Lw├│w oraz cala Galicja Wschodnia. W lipcu 1920 roku, dyplomacja brytyjska, zaproponowa┼éa lini─Ö demarkacyjn─ů pomi─Ödzy wojskami polskimi a rosyjskimi, zwan─ů ÔÇ×lini─ů CurzonaÔÇŁ, wzoruj─ůc j─ů w g┼é├│wnych zarysach na linii granicznej pierwszy raz wytyczonej na omawianej mapie. Tak┼╝e w┼éadze radzieckie w 1945 roku, postuluj─ůc wytyczenie nowej granicy pomi─Ödzy ZSRR a Polsk─ů, skutecznie odwo┼éywa┼éy si─Ö do przebiegu granicy okre┼Ťlonej przez Rad─Ö Najwy┼╝sz─ů w grudniu 1919 roku i wyznaczonej na tej mapie. \n	Pologne	granice Polski	G. Clemenceau	proponowane granice Polski, obszary plebiscytowe, linia Curzona	\N		1000000		granice wymagaj─ůce oraz nie wymagaj─ůce delimitacji w terenie z zaznaczonymi obszarami plebiscytowymi	maps/1hvulai1cPgp1pqxuHYm7cNd-KszBpKO8.jpg	2022-04-03 13:21:43.404817+02	https://drive.google.com/drive/folders/1KjBGsCNbn_Vpt_duxHBHAopMnSfLiFyg?usp=sharing	Mapa drukowana	thumbnails/1hvulai1cPgp1pqxuHYm7cNd-KszBpKO8_copy.jpg
34		32	\N		Na mapie przedstawiono procentowy udzia┼é Polak├│w wed┼éug powiat├│w na obszarze szeroko poj─Ötej tzw. historycznej Litwy, wraz z Suwalszczyzna, ziemi─ů grodzie┼äsk─ů oraz wschodnim Podlasiem, z Bia┼éymstokiem i Bielskiem Podlaskim, czyli poza historyczne granice dawnego Wielkiego Ksi─Östwa Litewskiego. Dane pochodz─ů ze spisu z 1916 r. przeprowadzonego przez administracj─Ö niemieck─ů.\nMapa potwierdza dominuj─ůcy udzia┼é ludno┼Ťci polskiej na obszarze wschodniego Podlasia, Suwalszczyzny oraz w szerokim pasie ┼Ťrodkowej Litwy, wraz z Wile┼äszczyzn─ů, a tak┼╝e powiatami na p├│┼énoc od Wilna. Udzia┼é Polak├│w na tych obszarach wynosi od 50 do 80%, a w niekt├│rych powiatach (zw┼éaszcza na Wile┼äszczy┼║nie i w cz─Ö┼Ťci Podlasia), przekracza 80%.  W mniejszym udziale (do 5 do 50%) ludno┼Ť─ç polska zamieszkiwa┼éa tak┼╝e powiaty po┼éo┼╝one zar├│wno na po┼éudnie na Wile┼äszczyzny oraz ziemi grodzie┼äskiej, jak i na p├│┼énoc, a┼╝ po Kiejdany.\n	Polonais en Lithuanie statistique allemande 1916. Copie d'un croquis officiel	Litwa, Suwalszczyzna, wschodnie Podlasie		spis ludno┼Ťci, struktura narodowo┼Ťciowa, Polacy na obszarze Litwy, Suwalszczyzny, wschodniego Podlasia	\N			Polonais en Lithuanie	Udzia┼é Polak├│w w og├│lnej liczbie mieszka┼äc├│w na szeroko poj─Ötym obszarze tzw. historycznej Litwy, wraz z Suwalszczyzn─ů i wschodnim Podlasiem	maps/1Ib7uPHNEjtyXl8Or3mK1gDjwxokcAD3r.jpg	2022-04-03 13:21:43.423225+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1Ib7uPHNEjtyXl8Or3mK1gDjwxokcAD3r_copy.jpg
50		48	\N		Na mapie przedstawiono udzia┼é ludno┼Ťci rzymsko-katolickiej w polsko-ruskiej cz─Ö┼Ťci Galicji wg. stanu z 1910 roku. Dane zaprezentowano w postaci metody kropkowej z wskazaniem procentowego udzia┼éu rzymskich katolik├│w w poszczeg├│lnych gminach. ┼╣r├│d┼éem danych prawdopodobnie by austriacki spis powszechny z 1910 roku.\nU┼╝yto czterech przedzia┼é├│w procentowych ÔÇô mniej ni┼╝ 25%, 25-50%, 50-75%, ponad 75%. Tylko przedzia┼é najmniejszy zosta┼é oznaczony kolorem niebieskim, wszystkie pozosta┼ée (od 25%) zaznaczono na czerwono. By┼é to z pewno┼Ťci─ů zabieg celowy. W konsekwencji trudno jednoznacznie okre┼Ťli─ç regiony z dominacj─ů ludno┼Ťci rzymsko-katolickiej, poniewa┼╝ kolor czerwony, poza Karpatami, wyst─Öpuje wsz─Ödzie, cho─ç nie wsz─Ödzie oznacza ponad 50% udzia┼é katolik├│w obrz─ůdku ┼éaci┼äskiego, w┼Ťr├│d kt├│rych na terenie Galicji wyra┼║nie dominowa┼éa ludno┼Ť─ç narodowo┼Ťci polskiej.\n	Ludno┼Ť─ç rzymsko-katolicka w polsko-ruskiej cz─Ö┼Ťci Galicyi. I. Stan w r. 1910.	Galicja Wschodnia		wyznanie rzymsko-katolickie, mapa wyznaniowa, spis powszechny 1910	17	G. Freytag & Berndt, Wien	750000		ludno┼Ť─ç rzymsko-katolicka w Galicji w roku 1910	maps/1HOc57xqNQy6TrLKAIIkqvYpIQO2waZBB.jpg	2022-04-03 13:21:43.703714+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV?usp=sharing	Mapa drukowana	thumbnails/1HOc57xqNQy6TrLKAIIkqvYpIQO2waZBB_copy.jpg
35		33	\N		Na mapie przedstawiono procentowy udzia┼é Litwin├│w wed┼éug powiat├│w na obszarze szeroko poj─Ötej tzw. historycznej Litwy, wraz ze ┼╗mudzi─ů, Suwalszczyzn─ů i wschodnim Podlasiem, a┼╝ po Bia┼éystok i Bielsk Podlaski, czyli poza historyczne granice dawnego Wielkiego Ksi─Östwa Litewskiego. Dane pochodz─ů ze spisu z 1918 r. przeprowadzonego administracj─Ö niemieck─ů.\nMapa potwierdza dominuj─ůcy udzia┼é ludno┼Ťci litewskiej na obszarze ┼╗mudzi oraz p├│┼énocnej i ┼Ťrodkowej Litwy. Udzia┼é Litwin├│w na tych obszarach wynosi od 50 do 80%, a w cz─Ö┼Ťci p├│┼énocnej przekracza 80%. \nJednocze┼Ťnie mapa potwierdza znikomy udzia┼é Litwin├│w w┼Ťr├│d mieszka┼äc├│w p├│┼énocnej Wile┼äszczyzny oraz Suwalszczyzny i ich praktyczny  na po┼éudnie od Wilna, Grodna i Augustowa. \n	Lithuaniens en Lithuanie. D'apres la statistique allemande 1918	Litwa, ┼╗mud┼║, Suwalszczyzna, wschodnie Podlasie		spis ludno┼Ťci, struktura narodowo┼Ťciowa, Litwini na szeroko pojetym obszarze tzw. historycznej Litwy	\N			Lithuaniens en Lithuanie	Udzia┼é Litwin├│w w og├│lnej liczbie mieszka┼äc├│w na szeroko poj─Ötym obszarze tzw. historycznej Litwy, wraz z Suwalszczyzn─ů i wschodnim Podlasiem	maps/1mm5LQ7jSijXbmOaBOVFPcWqmYq0R7-t6.jpg	2022-04-03 13:21:43.442121+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1mm5LQ7jSijXbmOaBOVFPcWqmYq0R7-t6_copy.jpg
36		34	\N		Pomimo tytu┼éu mapy sugeruj─ůcego, ┼╝e dotyczy ona wy┼é─ůcznie ludno┼Ťci litewskiej, przedstawiono na niej procentowy udzia┼é Litwin├│w (kolor czarny) oraz Polak├│w (kolor bia┼éy) w diecezji wile┼äskiej. Prezentowane dane s─ů pochodn─ů zapytanie Konsystorza Katolickiego z 1908 r. Zak┼éadaj─ůc, ┼╝e na pocz─ůtku XX w., w┼Ťr├│d katolik├│w na tym obszarze zdecydowanie dominowali Litwini i Polacy, mo┼╝na przyj─ů─ç, ┼╝e mapa przedstawia rozmieszczenie oraz struktur─Ö narodowo┼Ťciow─ů og├│┼éu ludno┼Ťci katolickiej w diecezji wile┼äskiej. \nWyra┼║nie wida─ç bardzo istotne dysproporcje w strukturze narodowo┼Ťciowej ludno┼Ťci nale┼╝─ůcej do diecezji wile┼äskiej. Katolicy narodowo┼Ťci litewskiej przewa┼╝ali w p├│┼énocnej i zachodniej cz─Ö┼Ťci diecezji, natomiast katolicy narodowo┼Ťci polskiej ca┼ékowicie dominowali w centralnej i po┼éudniowej cz─Ö┼Ťci, zw┼éaszcza na Wile┼äszczy┼║nie. \n	Lituaniens dans le dioc├Ęse de Wilno. Enqu├Ęte du Consistoire Catholique 1908	diecezja wile┼äska, Wile┼äszczyzna, Litwa		Struktira narodowo┼Ťciowa, katolicy, diecezja wile┼äska, Litwini, Polacy	\N			Lituaniens dans le dioc├Ęse de Wilno. 	Procentowy udzia┼é Litwin├│w i Polak├│w w diecezji wile┼äskiej, struktura narodowo┼Ťciowa katolik├│w diecezji wile┼äskiej	maps/1jxOCjv4vAtwZCOLnnwjseXY5ii-FPx9-.jpg	2022-04-03 13:21:43.456448+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1jxOCjv4vAtwZCOLnnwjseXY5ii-FPx9-_copy.jpg
38		36	\N	1915	Na mapie, opublikowanej w 1915 r., przedstawiono wizj─Ö podzia┼éu politycznego Europy po zako┼äczeniu I wojny ┼Ťwiatowej, wraz z nowym przebiegiem granic pa┼ästwowych, z perspektywy angielskiej.\nJak w przypadku zdecydowanej wi─Ökszo┼Ťci ÔÇ×map futurystycznychÔÇŁ rzeczywisto┼Ť─ç okaza┼éo si─Ö w bardzo wielu aspektach odmienna od przewidywa┼ä, jednak na uwag─Ö zas┼éuguje pojawienie si─Ö na mapie z 1915 r. Polski, powsta┼éej kosztem utraty cz─Ö┼Ťci ziem przez wszystkich trzech zaborc├│w, co okaza┼éo si─Ö prorocze. Pomimo tego, ┼╝e wytyczone na mapie terytorium przysz┼éej Polski, okaza┼éo si─Ö, zw┼éaszcza na p├│┼énocy i po┼éudniowym ÔÇô wschodzie, istotnie wi─Öksze ni┼╝ realnie ukszta┼étowane po wojnie, to jednak przewidywany kszta┼ét Polski, du┼╝o lepiej oddawa┼é rzeczywisto┼Ť─ç, ni┼╝ przewidywania dotycz─ůce przysz┼éo┼Ťci Austro-W─Ögier czy Ba┼ékan├│w. \n	L'EUROPE APRES LA GUERRE. CARTE EN PERSPECTIVE dessinee et publiee par la Societe ANGLO-CONTINENTALE & INTERNATIONALE LE 3 aout 1914	Europa, Polska		przewidywany podzia┼é polityczny Europy	13			L'EUROPE APRES LA GUERRE.	wizja zmian granic pa┼ästwowych w Europie po I wojnie ┼Ťwiatowej	maps/15tit5BKNRlTvYBgb_tK9XiNYjt0S8SCV.jpg	2022-04-03 13:21:43.493097+02		Mapa drukowana	thumbnails/15tit5BKNRlTvYBgb_tK9XiNYjt0S8SCV_copy.jpg
39		37	\N		Na mapie przedstawiaj─ůcej schemat sieci kolejowej wraz z granicami rozbiorowymi, zaznaczono odr─Öcznie kredk─ů, przebieg postulowanych zachodnich granic Polski wed┼éug raportu Komisji dla spraw polskich. Mapa jest za┼é─ůcznikiem do listu przes┼éanego do ministra spraw zagranicznych Ignacego Paderewskiego. Tre┼Ť─ç korespondencji zawiera szczeg├│┼éowy opis przebiegu granicy.\nWytyczony na mapie przebieg granicy polsko-niemieckiej, odbiega, zw┼éaszcza na ┼Ül─ůsku i Pomorzu, od ostatecznie ustalonych granic. \n	Ziemie polskie zaboru pruskiego	granica polsko-niemiecka	Ignacy Jan Paderewski, Jules Cambon, William Tyrrel, Isaiah Bowman,	Komisja dla spraw polskich	\N		750000		propozycja zachodnich granic Polski wed┼éug raportu Komisji dla spraw polskich	maps/1k0qShA2HKg-w8sEd2_rOVQM6WaZMHNZ8.jpg	2022-04-03 13:21:43.510221+02	https://drive.google.com/drive/folders/15CILHwTWajYurkxrQyaw-rN9chNYeU-g?usp=sharing	Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1k0qShA2HKg-w8sEd2_rOVQM6WaZMHNZ8_copy.jpg
53		51	\N		Na mapie zaznaczono proponowane przebiegi granic na obszarze Galicji. Mapa zawiera dawne granice administracyjne Galicji Wschodniej, dawne granice powiat├│w oraz nowe granice, zar├│wno Galicji Wschodniej, jak i wchodz─ůcych w jej sk┼éad powiat├│w, wyznaczone wed┼éug Statutu dla Galicji Wschodniej.		Galicja Wschodnia		granice, Statut dla Galicji Wschodniej	\N				propozycje szczeg├│┼éowego przebiegu nowych granic administracyjnych w Galicji	maps/1xi7-kVjySUH8G2TpjZuKx4vhN9ZoBKhD.jpg	2022-04-03 13:21:43.757227+02		Mapa drukowana z odr─Öcznymi adnotacjami	thumbnails/1xi7-kVjySUH8G2TpjZuKx4vhN9ZoBKhD_copy.jpg
43		41	\N	1919	Mapa nr I ilustruj─ůca memoria┼é "Polska i Finlandia" z roku 1919.\nObejmuje rozleg┼éy obszar Europy ┼Ürodkowo-Wschodniej, od p├│┼énocnej Finlandii, po Morze Czarne. Wyr├│┼╝niono na niej terytoria zasiedlone przez poszczeg├│lne narody ÔÇô Fin├│w, Esto┼äczyk├│w, ┼üotyszy, Litwin├│w, Niemc├│w, Polak├│w, Bia┼éorusin├│w, Ukrai┼äc├│w, Czech├│w, S┼éowak├│w, W─Ögr├│w, Rumun├│w. Pomimo pewnego schematyzmu i uog├│lnie┼ä, zaznaczone obszary generalnie s─ů zgodne z rzeczywistym ├│wczesnym rozmieszczeniem dominacji liczebnej poszczeg├│lnych narodowo┼Ťci. Natomiast na mapa nie uwzgl─Ödniono, bardzo licznych w tej cz─Ö┼Ťci Europy, rozproszonych mniejszo┼Ťci narodowych.\nZasadniczym elementem mapy jest wyra┼║nie zaznaczona ÔÇ×zachodnia granica RosjiÔÇŁ, biegn─ůca od Morza Bia┼éego na p├│┼énocy, poprzez Petersburg i okolice Lwowa do Karpat, a nast─Öpnie wschodni─ů granic─ů Rumunii do Mora Czarnego w okolicach Odessy.\nZgodnie z przyj─Ötymi przez Autora mapy za┼éo┼╝eniami, regiony zamieszkane przez Ukrai┼äc├│w i Bia┼éorusin├│w oraz liczn─ů tam mniejszo┼Ť─ç polsk─ů (za wyj─ůtkiem fragment├│w z dominacj─ů ludno┼Ťci katolickiej), powinny zosta─ç w┼é─ůczone do Rosji. \nRzeczywista zachodnia granica Rosji, ustalona w roku 1921, nie odbiega┼éa zasadniczo od propozycji przedstawionej na omawianej mapie.\n	 Finlandia i Polska I	Europa ┼Ürodkowo-Wschodnia, Polska, Finlandia		struktura narodowo┼Ťciowa, front antyrosyjski	10				zr├│┼╝nicowanie narodowo┼Ťciowe Europy ┼Ürodkowo-Wschodniej oraz propozycja podzia┼éu tego regionu pomi─Ödzy Rosj─Ö a pozosta┼ée narody 	maps/1feADX0lwLKF05l9QsqQFm-Pu4LnqrvLN.jpg	2022-04-03 13:21:43.588815+02	https://drive.google.com/drive/folders/1J0iVuKiQIpnP71ztxLMurhKYIY9vVUCp?usp=sharing	Mapa r─Ökopi┼Ťmienna	thumbnails/1feADX0lwLKF05l9QsqQFm-Pu4LnqrvLN_copy.jpg
\.


--
-- Data for Name: map_browser_map_authors; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_map_authors (id, map_id, people_id) FROM stdin;
3	2	3
4	2	4
5	3	5
6	16	6
7	19	7
8	20	8
9	20	9
10	21	8
11	21	9
12	22	7
13	23	10
14	26	11
15	41	12
16	42	13
17	44	14
18	50	15
19	51	16
22	56	5
23	57	4
24	58	4
\.


--
-- Data for Name: map_browser_map_creator; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_map_creator (id, map_id, user_id) FROM stdin;
2	2	1
3	3	2
4	3	3
5	4	2
6	5	2
7	5	3
8	6	2
9	6	3
10	7	2
11	7	3
12	8	2
13	8	3
14	9	2
15	9	3
16	10	2
17	10	3
18	11	2
19	11	3
20	12	2
21	12	3
22	13	2
23	13	3
24	14	2
25	14	3
26	15	2
27	15	3
28	16	2
29	16	3
30	17	2
31	17	3
32	18	2
33	18	3
34	19	2
35	20	2
36	20	3
37	21	2
38	21	3
39	22	2
40	22	3
41	23	2
42	23	3
43	24	2
44	24	3
45	25	2
46	25	3
47	26	2
48	26	3
49	27	2
50	27	3
51	28	2
52	28	3
53	29	2
54	29	3
55	30	1
56	30	3
57	31	1
58	31	2
59	31	3
60	32	1
61	33	1
62	33	2
63	33	4
64	34	1
65	34	2
66	35	1
67	35	2
68	36	1
69	36	2
70	37	1
71	37	2
72	37	4
73	38	1
74	38	2
75	38	4
76	39	1
77	39	2
78	39	4
79	40	1
80	40	2
81	41	1
82	42	1
83	42	2
84	43	1
85	43	2
86	43	4
87	44	1
88	44	5
89	44	6
90	45	1
91	45	2
92	46	1
93	47	1
94	48	1
95	48	2
96	49	1
97	49	2
98	49	4
99	50	2
100	50	7
101	51	1
102	51	2
103	52	1
104	53	1
105	53	2
106	53	4
108	56	3
109	57	2
110	58	2
\.


--
-- Data for Name: map_browser_map_language_id; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_map_language_id (id, map_id, languages_id) FROM stdin;
1	2	1
2	3	2
3	4	3
4	5	3
5	6	2
6	7	3
7	8	2
8	9	2
9	10	2
10	11	2
11	12	2
12	13	2
13	14	2
14	15	2
15	16	2
16	17	2
17	18	3
18	19	4
19	20	4
20	21	4
21	22	2
22	23	2
23	24	3
24	25	2
25	26	4
26	27	4
27	28	4
28	29	2
29	30	2
30	31	3
31	32	2
32	33	2
33	33	4
34	33	5
35	34	2
36	35	2
37	36	2
38	37	2
39	38	2
40	38	4
41	39	3
42	40	2
43	40	4
44	41	1
45	42	1
46	43	3
47	44	3
48	45	1
49	45	3
50	46	2
51	47	2
52	48	2
53	49	2
54	50	1
55	50	2
56	50	3
57	51	2
58	52	3
59	53	3
\.


--
-- Data for Name: map_browser_map_subject_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_map_subject_type (id, map_id, subjecttypes_id) FROM stdin;
1	2	1
2	3	2
3	3	3
4	4	2
5	5	3
6	6	3
7	7	1
8	7	2
9	8	1
10	8	2
11	9	2
12	9	4
13	10	2
14	10	3
15	10	4
16	11	3
17	12	3
18	13	1
19	13	2
20	13	4
21	14	3
22	15	3
23	16	2
24	17	2
25	17	3
26	18	2
27	18	3
28	19	2
29	20	2
30	21	2
31	22	2
32	22	3
33	23	2
34	23	3
35	24	2
36	25	2
37	25	3
38	26	3
39	27	2
40	27	3
41	28	2
42	28	3
43	29	2
44	29	3
45	30	4
46	31	2
47	32	3
48	33	3
49	34	2
50	35	2
51	36	2
52	37	4
53	38	3
54	39	3
55	40	2
56	41	2
57	42	2
58	43	2
59	44	5
60	45	2
61	46	1
62	47	1
63	48	2
64	49	3
65	50	2
66	51	2
67	51	3
68	52	2
69	53	3
72	57	1
73	57	2
74	58	1
\.


--
-- Data for Name: map_browser_people; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_people (id, first_name, last_name) FROM stdin;
3		Pabel
4		Berger
5	M	Biske
6	Casimir	Nitsch
7	M.	Biske
8	O.	Kudrewicz
9	T.	Skowro┼äski
10	W┼éadys┼éaw	Semkowicz
11	Eugeniusz	Romer
12	F.	Pilczek
13	Jakob	Spett
14	Stanis┼éaw	Majerski
15	Teofil	Szuma┼äski
16	M.	┼Üwi─Öchowski
17	AutorImie	AutorNazwisko
18	AutorImie	test
19	aaaTest	
\.


--
-- Data for Name: map_browser_publicationplaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_publicationplaces (id, city_name, country_name) FROM stdin;
2	Wroc┼éaw	
3	Lausanne	Szwajcaria
4	 (wersja drukowana), natomiast elementy naniesione odr─Öcznie wykonano w Brnie	 (wersja drukowana), natomiast elementy naniesione odr─Öcznie wykonano w Czechos┼éowacji
5	Warszawa	[Polska]
6	, prawdopodobnie Pary┼╝	, prawdopodobnie Francja
7	Pary┼╝	Francja
8	Krak├│w	Polska
9	Cracovie	Polska
10	Warszawa	Polska
11	New York	Stany Zjednoczone
12	Warszawa, Krak├│w	Polska
13		Wielka Brytania
14	Pozna┼ä	
15	Gotha	Niemcy
16	Lw├│w	
17	Wiede┼ä	Austria
18	Warszawa	
\.


--
-- Data for Name: map_browser_subjecttypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_subjecttypes (id, name) FROM stdin;
1	Gospodarcza
2	Spo┼éeczna
3	Polityczna
4	Administracyjna
5	Og├│lnogeograficzna
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 48, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 10, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 12, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 41, true);


--
-- Name: map_browser_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_archive_id_seq', 52, true);


--
-- Name: map_browser_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_languages_id_seq', 5, true);


--
-- Name: map_browser_map_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_authors_id_seq', 24, true);


--
-- Name: map_browser_map_creator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_creator_id_seq', 110, true);


--
-- Name: map_browser_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_id_seq', 58, true);


--
-- Name: map_browser_map_language_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_language_id_id_seq', 59, true);


--
-- Name: map_browser_map_subject_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_subject_type_id_seq', 74, true);


--
-- Name: map_browser_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_people_id_seq', 19, true);


--
-- Name: map_browser_publicationplaces_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_publicationplaces_id_seq', 18, true);


--
-- Name: map_browser_subjecttypes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_subjecttypes_id_seq', 5, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: map_browser_archive map_browser_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_archive
    ADD CONSTRAINT map_browser_archive_pkey PRIMARY KEY (id);


--
-- Name: map_browser_languages map_browser_languages_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_languages
    ADD CONSTRAINT map_browser_languages_pkey PRIMARY KEY (id);


--
-- Name: map_browser_map_authors map_browser_map_authors_map_id_people_id_6a1c8bb4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_authors
    ADD CONSTRAINT map_browser_map_authors_map_id_people_id_6a1c8bb4_uniq UNIQUE (map_id, people_id);


--
-- Name: map_browser_map_authors map_browser_map_authors_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_authors
    ADD CONSTRAINT map_browser_map_authors_pkey PRIMARY KEY (id);


--
-- Name: map_browser_map_creator map_browser_map_creator_map_id_user_id_bfd65b29_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_creator
    ADD CONSTRAINT map_browser_map_creator_map_id_user_id_bfd65b29_uniq UNIQUE (map_id, user_id);


--
-- Name: map_browser_map_creator map_browser_map_creator_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_creator
    ADD CONSTRAINT map_browser_map_creator_pkey PRIMARY KEY (id);


--
-- Name: map_browser_map_language_id map_browser_map_language_id_map_id_languages_id_6f7f04fc_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_language_id
    ADD CONSTRAINT map_browser_map_language_id_map_id_languages_id_6f7f04fc_uniq UNIQUE (map_id, languages_id);


--
-- Name: map_browser_map_language_id map_browser_map_language_id_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_language_id
    ADD CONSTRAINT map_browser_map_language_id_pkey PRIMARY KEY (id);


--
-- Name: map_browser_map map_browser_map_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map
    ADD CONSTRAINT map_browser_map_pkey PRIMARY KEY (id);


--
-- Name: map_browser_map_subject_type map_browser_map_subject__map_id_subjecttypes_id_80df52f4_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_subject_type
    ADD CONSTRAINT map_browser_map_subject__map_id_subjecttypes_id_80df52f4_uniq UNIQUE (map_id, subjecttypes_id);


--
-- Name: map_browser_map_subject_type map_browser_map_subject_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_subject_type
    ADD CONSTRAINT map_browser_map_subject_type_pkey PRIMARY KEY (id);


--
-- Name: map_browser_people map_browser_people_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_people
    ADD CONSTRAINT map_browser_people_pkey PRIMARY KEY (id);


--
-- Name: map_browser_publicationplaces map_browser_publicationplaces_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_publicationplaces
    ADD CONSTRAINT map_browser_publicationplaces_pkey PRIMARY KEY (id);


--
-- Name: map_browser_subjecttypes map_browser_subjecttypes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_subjecttypes
    ADD CONSTRAINT map_browser_subjecttypes_pkey PRIMARY KEY (id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: map_browser_map_archive_id_id_1dfe0f78; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_archive_id_id_1dfe0f78 ON public.map_browser_map USING btree (archive_id_id);


--
-- Name: map_browser_map_authors_map_id_02ecf302; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_authors_map_id_02ecf302 ON public.map_browser_map_authors USING btree (map_id);


--
-- Name: map_browser_map_authors_people_id_8a9fdb81; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_authors_people_id_8a9fdb81 ON public.map_browser_map_authors USING btree (people_id);


--
-- Name: map_browser_map_corrector_id_id_2890de96; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_corrector_id_id_2890de96 ON public.map_browser_map USING btree (corrector_id_id);


--
-- Name: map_browser_map_creator_map_id_3c82fb13; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_creator_map_id_3c82fb13 ON public.map_browser_map_creator USING btree (map_id);


--
-- Name: map_browser_map_creator_user_id_cdb5362a; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_creator_user_id_cdb5362a ON public.map_browser_map_creator USING btree (user_id);


--
-- Name: map_browser_map_language_id_languages_id_681c7cad; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_language_id_languages_id_681c7cad ON public.map_browser_map_language_id USING btree (languages_id);


--
-- Name: map_browser_map_language_id_map_id_841559ee; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_language_id_map_id_841559ee ON public.map_browser_map_language_id USING btree (map_id);


--
-- Name: map_browser_map_publication_place_id_3df1af68; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_publication_place_id_3df1af68 ON public.map_browser_map USING btree (publication_place_id);


--
-- Name: map_browser_map_subject_type_map_id_d39a0cb5; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_subject_type_map_id_d39a0cb5 ON public.map_browser_map_subject_type USING btree (map_id);


--
-- Name: map_browser_map_subject_type_subjecttypes_id_cffc841b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX map_browser_map_subject_type_subjecttypes_id_cffc841b ON public.map_browser_map_subject_type USING btree (subjecttypes_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map map_browser_map_archive_id_id_1dfe0f78_fk_map_brows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map
    ADD CONSTRAINT map_browser_map_archive_id_id_1dfe0f78_fk_map_brows FOREIGN KEY (archive_id_id) REFERENCES public.map_browser_archive(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map_authors map_browser_map_auth_people_id_8a9fdb81_fk_map_brows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_authors
    ADD CONSTRAINT map_browser_map_auth_people_id_8a9fdb81_fk_map_brows FOREIGN KEY (people_id) REFERENCES public.map_browser_people(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map_authors map_browser_map_authors_map_id_02ecf302_fk_map_browser_map_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_authors
    ADD CONSTRAINT map_browser_map_authors_map_id_02ecf302_fk_map_browser_map_id FOREIGN KEY (map_id) REFERENCES public.map_browser_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map map_browser_map_corrector_id_id_2890de96_fk_map_brows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map
    ADD CONSTRAINT map_browser_map_corrector_id_id_2890de96_fk_map_brows FOREIGN KEY (corrector_id_id) REFERENCES public.map_browser_people(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map_creator map_browser_map_creator_map_id_3c82fb13_fk_map_browser_map_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_creator
    ADD CONSTRAINT map_browser_map_creator_map_id_3c82fb13_fk_map_browser_map_id FOREIGN KEY (map_id) REFERENCES public.map_browser_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map_creator map_browser_map_creator_user_id_cdb5362a_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_creator
    ADD CONSTRAINT map_browser_map_creator_user_id_cdb5362a_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map_language_id map_browser_map_lang_languages_id_681c7cad_fk_map_brows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_language_id
    ADD CONSTRAINT map_browser_map_lang_languages_id_681c7cad_fk_map_brows FOREIGN KEY (languages_id) REFERENCES public.map_browser_languages(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map_language_id map_browser_map_lang_map_id_841559ee_fk_map_brows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_language_id
    ADD CONSTRAINT map_browser_map_lang_map_id_841559ee_fk_map_brows FOREIGN KEY (map_id) REFERENCES public.map_browser_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map map_browser_map_publication_place_id_3df1af68_fk_map_brows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map
    ADD CONSTRAINT map_browser_map_publication_place_id_3df1af68_fk_map_brows FOREIGN KEY (publication_place_id) REFERENCES public.map_browser_publicationplaces(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map_subject_type map_browser_map_subj_map_id_d39a0cb5_fk_map_brows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_subject_type
    ADD CONSTRAINT map_browser_map_subj_map_id_d39a0cb5_fk_map_brows FOREIGN KEY (map_id) REFERENCES public.map_browser_map(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: map_browser_map_subject_type map_browser_map_subj_subjecttypes_id_cffc841b_fk_map_brows; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.map_browser_map_subject_type
    ADD CONSTRAINT map_browser_map_subj_subjecttypes_id_cffc841b_fk_map_brows FOREIGN KEY (subjecttypes_id) REFERENCES public.map_browser_subjecttypes(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

