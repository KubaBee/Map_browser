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
2	Testing4321	\N	f	MarekBarwi??ski	Marek	Barwi??ski		f	t	2022-04-03 13:21:42.814959+02
3	Testing4321	\N	f	El??bietaKo??cik	El??bieta	Ko??cik		f	t	2022-04-03 13:21:42.817617+02
4	Testing4321	\N	f	KawalecSuleja	Kawalec	Suleja		f	t	2022-04-03 13:21:43.40949+02
5	Testing4321	\N	f	Ku??maMarek	Ku??ma	Marek		f	t	2022-04-03 13:21:43.612896+02
6	Testing4321	\N	f	Barwi??ski	Barwi??ski			f	t	2022-04-03 13:21:43.615918+02
7	Testing4321	\N	f	MateuszZawadzki,	Mateusz	Zawadzki,		f	t	2022-04-03 13:21:43.706065+02
8	pbkdf2_sha256$320000$BUdMDVxw50xDIgYMGORw8e$ooaFfCzVykDAK//Kj+EKtZ4mbKrX4NFI11i+eH8YFQg=	2022-04-03 16:19:19.830524+02	t	1kuba			1kubaape1@gmail.com	t	t	2022-04-03 13:54:28.357155+02
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
k9blvm5po3aasz4vv22q9aja3fk67quc	.eJxVjM0OwiAQhN-FsyEF5KcevfsMZFl2pWogKe3J-O62SQ-azGm-b-YtIqxLiWunOU5ZXEQQp98uAT6p7iA_oN6bxFaXeUpyV-RBu7y1TK_r4f4dFOhlWyMTo_PaZm-YVTbDkDCg0tmlwRPwyGMiIE1JsbFWOW2YzlvQUQArPl8gDTlb:1nb14Z:B52MJK_ad_PMmnrQ1H8CHaSsPYFaGUv8j9rBAFL4kqg	2022-04-17 16:19:19.834652+02
\.


--
-- Data for Name: map_browser_archive; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_archive (id, archive_name, archive_number, archive_team, archive_unit) FROM stdin;
1	Archiwum Akt Nowych w Warszawie	429	AAN/260 Kolekcja kartograficzna/429	Kolekcja kartograficzna
2	Archiwum Akt Nowych w Warszawie	427	AAN/260 Kolekcja kartograficzna/427	kolekcja kartograficzna
3	Archiwum Akt Nowych w Warszawie	405	AAN/260 Kolekcja kartograficzna/405	Kolekcja kartograficzna
4	Archiwum Akt Nowych w Warszawie	107/56	AAN/463 Ambasada RP w Pary??u/107/56	Ambasada RP w Pary??u
5	Archiwum Akt Nowych w Warszawie	84	Kolekcja kartograficzna	AAN/260 Kolekcja kartograficzna/84
6	Archiwum Akt Nowych w Warszawie	83	AAN/260 Kolekcja kartograficzna/83	Kolekcja kartograficzna
7	Archiwum Akt Nowych w Warszawie	79/30	Delegacja Polska na Konferencj?? Pokojow?? w Pary??u	AAN/40 Delegacja Polska na Konferencj?? Pokojow?? w Pary??u/79/30
8	Archiwum Akt Nowych w Warszawie	927/28	AAN/100 Archiwum Padarewskiego/927/28	Archiwum Paderewskiego
9	Archiwum Akt Nowych w Warszawie	928/105	AAN/100 Archiwum Padarewskiego/928/105	Archiwum Paderewskiego
10	Archiwum Akt Nowym w Warszawie	928/106	AAN/100 Archiwum Padarewskiego/928/106	Archiwum Paderewskiego
11	Archiwum Akt Nowych w Warszawie	920/4	AAN/100 Archiwum Padarewskiego/920/4	Archiwum Paderewskiego
12	Archiwum Akt Nowych w Warszawie	928/107	AAN/100 Archiwum Padarewskiego/928/107	Archiwum Paderewskiego
13	Archiwum Akt Nowych w Warszawie	928/108	AAN/100 Archiwum Padarewskiego/928/108	Archiwum Paderewskiego
14	Archiwum Akt Nowych w Warszawie	315/41	AAN/39 Komitet Narodowy Polski w Pary??u/315/41	Komitet Narodowy Polski w Pary??u
15	Archiwum Akt Nowych w Warszawie	79/29	AAN/40 Delegacja Polska na Konferencj?? Pokojow?? w Pary??u/79/29	Delegacja Polska na Konferencj?? Pokojow?? w Pary??u
16	Archiwum Akt Nowych w Warszawie	17/96	AAN/40 Delegacja Polska na Konferencj?? Pokojow?? w Pary??u/17/96	Delegacja Polska na Konferencj?? Pokojow?? w Pary??u
17	Archiwum Akt Nowych w Warszawie	896/3	AAN/100 Archiwum Padarewskiego/896/3	Archiwum Paderewskiego
18	Archiwum Akt Nowych w Warszawie	867/7	AAN/100 Archiwum Padarewskiego/896/7	Archiwum Paderewskiego
19	Archiwum Akt Nowych w Warszawie	896/2	AAN/100 Archiwum Padarewskiego/896/2	Archiwum Paderewskiego
20	Archiwum Akt Nowych w Warszawie	896/6	AAN/100 Archiwum Padarewskiego/896/6	Archiwum Paderewskiego
21	Archiwum Akt Nowych w Warszawie	920/113	AAN/100 Archiwum Padarewskiego/920/113	Archiwum Paderewskiego
22	Archiwum Akt Nowych w Warszawie	920/114	AAN/100 Archiwum Padarewskiego/920/114	Archiwum Paderewskiego
23	Archiwum Akt Nowych w Warszawie	1860/179	AAN/39 Komitet Narodowy Polski w Pary??u/1860/179	Komitet Narodowy Polski
24	Archiwum Akt Nowych w Warszawie	884/67	AAN/100 Archiwum Padarewskiego/884/67	Archiwum Paderewskiego
25	Archiwum Akt Nowych w Warszawie	884/65	AAN/100 Archiwum Padarewskiego/884/65	Archiwum Paderewskiego
26	Archiwum Akt Nowych w Warszawie	884/66	AAN/100 Archiwum Padarewskiego/884/66	Archiwum Paderewskiego
27	Archiwum Akt Nowych w Warszawie	920/93	AAN/100 Archiwum Padarewskiego/920/93	Archiwum Paderewskiego
28	Archiwum Akt Nowych	931/7	AAN/100 Archiwum Padarewskiego/931/7	Archiwum Paderewskiego
29	Archiwum Akt Nowych	933/20	AAN/100 Archiwum Padarewskiego/933/20	Archiwum Padarewskiego
30	Archiwum Akt Nowych	122/72	AAN/39 Komitet Narodowy Polski w Pary??u/122/72	Komitet Narodowy Polski w Pary??u
31	Archiwum Akt Nowych	73/7	AAN/40 Delegacja Polska na Konferencj?? Pokojow?? w Pary??u/73/7	Delegacja Polska na Konferencj?? Pokojow?? w Pary??u
32	Archiwum Akt Nowych	153/69	AAN/40 Delegacja Polska na Konferencj?? Pokojow?? w Pary??u/153/69	Delegacja Polska na Konferencj?? Pokojow?? w Pary??u
33	Archiwum Akt Nowych	153/70	AAN/40 Delegacja Polska na Konferencj?? Pokojow?? w Pary??u/153/70	Delegacja Polska na Konferencj?? Pokojow?? w Pary??u
34	Archiwum Akt Nowych	153/76	AAN/40 Delegacja Polska na Konferencj?? Pokojow?? w Pary??u/153/76	Delegacja Polska na Konferencj?? Pokojow?? w Pary??u
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
\.


--
-- Data for Name: map_browser_languages; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_languages (id, language_code, language_name) FROM stdin;
1		Niemiecki
2		Francuski
3		Polski
4		Angielski
5		Hiszpa??ski
\.


--
-- Data for Name: map_browser_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_map (id, additional_notes, archive_id_id, corrector_id_id, created_at, description, full_title, keyword_geo, keyword_name, keyword_subject, publication_place_id, publishing_address, scale, short_title, subject, filename, added_at, source_text, creation_type, thumbnail) FROM stdin;
56		\N	\N			TestowaMapaAWS				\N		1	TestowaMapaAWS		maps/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_xXihjc3.jpg	2022-04-03 23:14:04.647588+02			thumbnails/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_copy.jpg
2		\N	\N	1913	Zmiana opisu	??bersichtskarte des Oberschlesischen Industriebezirks. Aus Anlass des XII. Allgemeinen Deutschen Bergmannstages zu Breslau 1913				2	Herausgegeben vom Oberschlesischer Berg- und H??ttenm??nnischer Verein in Kattowitz, bearbeitet im K??niglichen Oberbergamte zu Breslau durch Oberbergamts-Markscheider Jahr.  Pneumadruck F. Pietsch	100000	??bersichtskarte des Oberschlesischen Industriebezirks.	g??rnictwo, hutnictwo, w??giel kamienny, spis przedsi??biorstw przemys??owych G??rno??l??skiego Zwi??zku Przemys??owc??w G??rniczo-Hutniczych:  g??rnictwo, hutnictwo, w??giel kamienny	1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg.jpg	2022-04-03 13:21:42.77254+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg_copy.jpg
4		2	\N	 daty, po 1905 roku	Mapa przedstawia struktur?? narodowo??ciow?? ludno??ci Kr??lestwa Polskiego, w podziale na powiaty. Za pomoc?? zr????nicowania szrafu oraz kolor??w, przedstawiono zar??wno udzia?? procentowy mniejszo??ci narodowych w poszczeg??lnych powiatach (w sze??ciu przedzia??ach od 1 do 50%) oraz g????wne narodowo??ci (Polacy, Niemcy, ??ydzi, Rosjanie i Rusini oraz Litwini). Poza powiatami przedstawiono tak??e struktur?? narodowo??ciow?? dw??ch najwi??kszych miast ??? Warszawy i ??odzi.\nNa zdecydowanej wi??kszo??ci obszaru Kr??lestwa Polskiego dominuje ludno???? polska, a najliczniejsz?? i obecn?? we wszystkich powiatach mniejszo??ci?? s?? ??ydzi oraz w okolicach ??odzi i w powiatach zachodnich Niemcy. Jedynie w p????nocno-wschodniej cz????ci guberni suwalskiej dominuje ludno???? litewska, przy niewielkim udziale Polak??w, Niemc??w i ??yd??w, a w trzech powiatach po??udniowo-wschodnich (W??odawa, Che??m, Hrubiesz??w) nieznacznie przewa??aj?? Rosjanie i Rusini (faktycznie chodzi o ludno???? ukrai??sk??), a Polacy, Niemcy i ??ydzi s?? grupami mniejszo??ciowymi, przy czym udzia?? ludno??ci polskiej wynosi 35-50%.\nNie podano ??r??de?? danych oraz daty wykonania mapy. Mo??na jednak przypuszcza??, ??e zosta??a ona opracowana na podstawie wynik??w rosyjskiego powszechnego spisu ludno??ci z roku 1897. By?? to pierwszy i ostatni powszechny spisu ludno??ci przeprowadzony w carskiej Rosji. Obj???? tak??e gubernie wchodz??ce w sk??ad Kr??lestwa Polskiego. Nie zawiera?? pytania o narodowo????, kt??r?? ustalano na podstawie odpowiedzi na pytanie o j??zyk ojczysty. W trakcie tego spisu w celu zwi??kszenia liczby Rosjan, osoby deklaruj??ce j??zyk ukrai??ski i bia??oruski (lub dialekty tych j??zyk??w), by??y cz??sto zaliczane do ludno??ci rosyjskoj??zycznej, ewentualnie traktowani wsp??lnie jako Rusini. Nast??pnie ????cznie podawana by??a liczebno???? ???Rosjan i Rusin??w???, podobnie jak na tej mapie. W rzeczywisto??ci po??udniowo-wschodnie powiaty Kr??lestwa Kongresowego na pocz??tku XX wieku by??y zamieszkane przez Ukrai??c??w (ewentualnie Rusin??w), a nie ???Rosjan i Rusin??w???. \nWyniki tego spisu zosta??y ostatecznie opublikowane w roku 1905, wi??c mapa nie mog??a powsta?? wcze??niej, z kolei w roku 1912 z Kr??lestw Polskiego zosta??a wy????czona Gubernia Che??mska, czego ta mapa nie uwzgl??dnia. Nie oznacza to jednak, ??e nie mog??a powsta?? po roku 1912.Wykorzystywanie przez polskie instytucje, na potrzeby przedstawianie argument??w za polsko??ci?? ??l??ska, Wielkopolski, Pomorza oraz Warmii i Mazur, danych pochodz??cych z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, by??o uzasadnione m.in. tym, ??e w spisach powszechnych narodowo???? by??a ustalana na podstawie odpowiedzi na pytanie o j??zyk ojczysty, a statystyka pruska wyszczeg??lnia??a obok j??zyka polskiego, tak??e j??zyk kaszubski i mazurski, co skutecznie zmniejsza??o liczb?? os??b deklaruj??cych j??zyk polski (a tym samym liczb?? os??b zaliczonych do polskiej narodowo??ci). Ponadto w pruskim spisie powszechnym istnia??a mo??liwo???? zadeklarowania dw??ch j??zyk??w i cz?????? Polak??w, znaj??cych tak??e j??zyk niemiecki, deklarowa??o j??zyk polski wraz z niemieckim, co skutkowa??o zaliczeniem ich do tzw. ???os??b dwuj??zycznych???.\n	Kr??lestwo Polskie (pod wzgl??dem etnograficznym)	Kr??lestwo Polskie, Kongres??wka		struktura narodowo??ciowa, spis rosyjski z 1897 roku	\N			Kr??lestwo Polskie	struktura narodowo??ciowa ludno??ci Kr??lestwa Polskiego w podziale na powiaty wed??ug danych spisu powszechnego z 1897 roku	1voYIurZMGyYMAlFj2SJG-d_ufN8dZyQQ.jpg	2022-04-03 13:21:42.838545+02		Mapa r??kopi??mienna	thumbnails/1voYIurZMGyYMAlFj2SJG-d_ufN8dZyQQ_copy.jpg
6		4	\N	 daty, wersja drukowana wykonana ok. 1923 roku, natomiast elementy naniesione odr??cznie wykonano w lutym 1924 roku	Mapa obejmuje pogranicze polsko-czechos??owackie na p????nocnym Spiszu i w Tatrach Wysokich. Sk??ada si?? z cz????ci drukowanej oraz naniesionych odr??cznie, zaznaczonych szrafem i kolorami, r????nych wersji linii granicznych. Posiada tak??e dwie legendy, druga (na doklejonej kartce) dotyczy element??w naniesionych odr??cznie.  \nNa drukowanej mapie topograficznej obejmuj??cej p????nocny Spisz, Tatry Wysokie i niewielki fragment Podhala, zosta??y przedstawione r????ne wersje przebiegu granicy polsko-czechos??owackiej proponowane i ustalane w latach 1920-1922. S?? to: linia graniczna na podstawie traktatu z Sevres (10 sierpnia 1920), tzw. ???linia Ambasador??w??? (po decyzji z 28 lipca 1920), linia graniczna proponowana przez Polsk??, linia graniczna nie wyznaczona decyzj?? z 28 lipca 1920, linia graniczna przeg??osowana przez Komisj?? Delimitacyjn?? (25 wrze??nia 1922) oraz polski projekt linii kolejowej do Nowego Targu-Jaworzyny-Roztoki. \nNatomiast odr??czne naniesione, kolorowe linie graniczne, s?? wersj?? p????niejsz?? i zosta??y ??? wed??ug informacji umieszczonej na dodatkowej legendzie mapy ??? dodane w konsekwencji posiedzenia Komisji Delimitacyjnej w Brnie (Czechos??owacja) 11 lutego 1924 roku. \nKolorami zaznaczony jest przebieg dw??ch granic istniej??cych przed 1924 rokiem, czyli dawnej granicy mi??dzy Galicj?? i W??grami (kolor zielony) oraz granicy wytyczonej na podstawie decyzji Rady Ambasador??w z 28 lipca 1920, czyli tzw. ???linii Ambasador??w??? (kolor czerwony). Co jednak istotniejsze, dodano trzy kolejne, nie zaznaczone na wcze??niejszej wersji drukowanej, warianty przebiegu granicy polsko-czechos??owackiej ??? propozycj?? polsk??, cz????ciowo odmienn?? od zamieszczonej na wersji drukowanej (kolor ??????ty), propozycj?? czechos??owack?? sprzed posiedzenia Komisji Delimitacyjnej (kolor niebieski) oraz modyfikacj?? propozycji czechos??owackiej w rozumieniu Komisji Delimitacyjnej (kolor czarny).\nPodstawowymi punktami spornymi, przedstawionymi na mapie, jest podzia?? p????nocnego Spiszu pomi??dzy Polsk?? a Czechos??owacj?? oraz okre??lenie przynale??no??ci pa??stwowej Doliny Jaworzyny.\nSpisz do I wojny ??wiatowej znajdowa?? si?? w granicach W??gier. Po rozpadzie monarchii Austro-W??gierskiej oraz zako??czeniu wojny, nowopowsta??a Czechos??owacja ro??ci??a pretensje terytorialne do ca??ego obszaru p????nocnych W??gier, z kolei liczna na p????nocnym Spiszu ludno???? polska, domaga??a si?? przy????czenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Pary??u, podj??to decyzj?? o przeprowadzeniu na p????nocnym Spiszu w po??owie 1920 roku plebiscytu, kt??ry mia?? zadecydowa?? o przynale??no??ci politycznej tego obszaru. Ostatecznie plebiscytu nie przeprowadzono (z powodu wojny polsko-bolszewickiej), a podzia??u p????nocnego Spiszu dokona??a Rada Ambasador??w 28 lipca 1920 roku, przyznaj??c Polsce jego niewielki fragment, co nie zako??czy??o spor??w terytorialnych polsko-czechos??owackich. Nie rozstrzygni??to w??wczas tak??e przynale??no??ci pa??stwowej Doliny Jaworzyny.\nNa mapie wida?? bardzo du???? zbie??no????, zaznaczonych kolorami w lutym 1924 roku, linii granicznych dziel??cych p????nocny Spisz pomi??dzy Polsk?? a Czechos??owacj??. Propozycj?? polska (kolor ??????ty) oraz czechos??owacka (kolor niebieski) z lutego 1924 roku, s?? na tym odcinku ca??kowicie zbie??ne, a pomi??dzy nimi a przebiegiem wcze??niejszej ???linii Ambasador??w??? z lipca 1920 roku (kolor czerwony), jest tylko kilka nieznacznych r????nic. Jedyna istotna modyfikacja propozycji czechos??owackiej (kolor czarny) dotyczy??a obszaru na po??udnie od wsi Jurg??w i Brzegi, by??a korzystna dla Polski. \nCo wa??ne, granica polsko-czechos??owacka na p????nocnym Spiszu, wytyczona odr??cznie na tej mapie w lutym 1924 roku, przetrwa??a do czas??w wsp????czesnych, obecnie jako granica polsko-s??owacka. \nNatomiast istotne r????nice widoczne na mapie dotycz?? przebiegu granicy w Tatrach Wysokich. Propozycja polska w????cza??a do Polski po??o??on?? na wsch??d od Morskiego Oka i Roztoki, Dolin?? Jaworzyny (kolor ??????ty), co nie by??o akceptowane przez stron?? czechos??owack??, pomimo tego, ??e propozycja z lutego 1924 roku, postulowa??a przy????czenie tego fragmentu Tatr w mniejszym zakresie terytorialnym (w cz????ci wschodniej) ni?? wcze??niejsza propozycja polska z roku 1920 (widoczna na mapie w wersji drukowanej).\nCiekawie przedstawia si?? por??wnanie wcze??niejszej propozycji polskiej (wersja drukowana), kolejnej propozycji polskiej z lutego 1924 roku (kolor ??????ty) oraz linii granicznej przeg??osowanej przez Komisj?? Delimitacyjn?? 25 wrze??nia 1922 roku (wersja drukowana). Ta ostatnia propozycja postulowa??a w????czenie do Polski cz????ci Tatr Wysokich na wsch??d od Rys??w i Morskiego Oka oraz dzieli??a Dolin?? Jaworzyny pomi??dzy Polsk?? a Czechos??owacj?? (granica mia??a biec dnem doliny). By??y to propozycje korzystniejsze dla Polski ni?? wcze??niejsze rozstrzygni??cia Rady Ambasador??w. Natomiast ta sama propozycja Komisji Delimitacyjnej z roku 1922 dzieli??a p????nocny Spisz w spos??b jeszcze bardziej niekorzystny dla Polski, pozostawiaj??c gminy Kacwin i Niedzica po stronie czechos??owackiej. Co ciekawe taki sam, bardzo niekorzystny dla Polski, podzia?? p????nocnego Spiszu uwzgl??dnia??a pierwsza propozycja Polski (wersja drukowana), kt??ra jednocze??nie postulowa??a w????czenie do Polski du??o wi??kszego obszaru Tatr Wysokich wraz z ca???? Dolin?? Jaworzyny (obszar ten pod wzgl??dem historycznym tak??e jest zaliczany do Spiszu). Natomiast druga propozycja polska, z lutego 1924 (kolor ??????ty), rozk??ada akcenty zdecydowanie inaczej. Postulowa??a przy????czenie do Polski gmin Kacwin i Niedzica na p????nocnym Spiszu (zgodnie z propozycj?? czechos??owack?? i wcze??niejsz?? decyzj?? Rady Ambasador??w), natomiast ogranicza??a ????dania Polski dotycz??ce fragmentu Tatr na wsch??d od Morskiego Oka i rezygnowa??a ze wschodniej cz????ci Doliny Jaworzyny. Mimo to, nowe, ograniczone terytorialnie, postulaty strony polskiej dotycz??ce wschodniej cz????ci Tatr Wysokich, nie zyska??y akceptacji strony czechos??owackiej oraz Ligi Narod??w, kt??ra miesi??c p????niej, 12 marca 1924 roku przyzna??a ca??y obszar Doliny Jaworzyny Czechos??owacji.	Carte de la fronti??re Polono-Tchecoslovaque sur le territoire de Spisz (Jaworzyna)	granica polsko-czechos??owacka, granica polsko-s??owacka, Spisz, Dolina Jaworzyny, Tatry		Rada Ambasador??w, linia Ambasador??w, Komisja Delimitacyjna	4	Bureau technique de la Delegation Polonaise	75000		liczne propozycje przebiegu granicy pomi??dzy Polsk?? a Czechos??owacj?? na p????nocnym Spiszu  oraz w Dolinie Jaworzyny, proponowane i ustalane w latach 1920-1924	1H745Iz4vzRJVAyLu9JZG678qjg2u7hyK.jpg	2022-04-03 13:21:42.884624+02	https://drive.google.com/drive/folders/18qN9TcqtM6bjoeYefK_E3cpoPm4vZNRg?usp=sharing	Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1H745Iz4vzRJVAyLu9JZG678qjg2u7hyK_copy.jpg
10		8	\N	, prawdopodobnie 1919	Powstanie mapy jest konsekwencj?? polsko-czeskich spor??w o przynale??no???? pa??stwow?? ??l??ska Cieszy??skiego, a bezpo??rednio jest zwi??zane z podpisaniem 5 listopada 1918 roku wst??pnego porozumienia w??adz lokalnych (polskich i czeskich) tymczasowo dziel??cego ten region wed??ug kryterium etnicznego (a precyzyjniej j??zykowego). Umowa ta przydziela??a polskiej administracji powiaty, kt??re zamieszka??e by??y w wi??kszo??ci przez ludno???? polskoj??zyczn??: bielski, cieszy??ski oraz wi??ksz?? cz?????? powiatu frysztackiego (na mapie kolor bia??y), a czechos??owackiej powiat frydecki i pozosta???? cz????ci?? powiatu frysztackiego (na mapie kolor niebieski). Podzia?? ten nie ko??czy?? i nie rozwi??zywa?? konfliktu, a ostateczne rozgraniczenie terytorialne pozostawia?? si?? do rozstrzygni??cia przez rz??dy Polski i Czechos??owacji. By?? on korzystny dla strony polskiej i stanowi?? podstaw?? dla dalszego podtrzymania roszcze?? terytorialnych. Przydziela?? Polsce zdecydowan?? wi??kszo???? ??l??ska Cieszy??skiego wraz z cz????ci?? kopal?? w??gla kamiennego i zak??ad??w przemys??owych w okolicach Karwiny, Rychwa??du i Bogumina. Strona czechos??owacka nie zaakceptowa??a podzia??u wed??ug kryterium etnicznego, domagaj??c si?? na podstawie argument??w historycznych, ca??ego obszaru Ksi??stwa Cieszy??skiego.\nNa mapie przedstawiono Ksi??stwo Cieszy??skie z podzia??em na powiaty, z zaznaczonymi g????wnymi miastami, liniami kolejowymi, rzekami, zag????biami w??glowymi w okolicach Ostrawy i Karwiny oraz Czechowic (kolor ??????ty). Najistotniejszym elementem zamieszczonym na mapie jest zaznaczenie obszar??w (powiat??w i gmin) obj??tych tymczasow?? administracj?? polsk?? (kolor bia??y) oraz czesk?? (kolor niebieski), na podstawie porozumienia z 5 listopada 1918 roku. \nPonadto obok mapy dodano informacje o strukturze narodowo??ciowej tego obszaru, wed??ug wynik??w spis??w ludno??ci z lat 1880, 1890, 1900, 1910 z podzia??em na Polak??w, Niemc??w i Czech??w, zar??wno w odniesieniu do ca??ego obszaru Ksi??stwa Cieszy??skiego, jak i z wy????czeniem, najliczniej zamieszkanego przez Czech??w, powiatu frydeckiego. Jednocze??nie autorzy mapy podkre??lili, ??e wyniki ostatniego spisu powszechnego z 1910 roku przeprowadzonego w Monarchii Austro-W??gierskiej, s?? ???niekorzystne dla narodowo??ci polskiej w wyniku fa??szerstw i r????nych nacisk??w???. W trakcie tego spisu (jak i w trakcie wcze??niejszych) nie by??o pytania o narodowo????, a struktur?? etniczn?? ustalano wed??ug odpowiedzi na pytanie o ???j??zyk domowy???. Wszystkie zamieszczone na mapie dane statystyczne dowodzi??y wyra??nej dominacji ludno??ci polskiej na obszarze ??l??ska Cieszy??skiego.\nPoza danymi pochodz??cymi ze spis??w powszechnych, autorzy mapy zamie??cili tak??e informacje dotycz??ce ???linii j??zykowych???, przytaczaj??c opinie trzech badaczy (Polaka i dw??ch Czech??w), dowodz??ce, ??e obszar ??l??ska Cieszy??skiego jest obj??ty zasi??giem j??zyka polskiego, a j??zyk czeski pojawia si?? dopiero na zach??d od tego regionu. Naniesiono tak??e granic?? (linia czerwona) oddzielaj??c?? j??zyk polski (cz?????? wschodnia) od dialekt??w przej??ciowych (cz?????? zachodnia), kt??ra cz????ciowo biegnie wzd??u?? granicy powiatu frydeckiego, a nast??pnie przecina go, zostawiaj??c ca??y powiat frysztacki po stronie j??zyka polskiego, co nie znalaz??o potwierdzenia w wynikach spisu powszechnego z 1910 roku. \nPod map?? znajduje si?? nieczytelna, okr??g??a, czerwona piecz????, prawdopodobnie jest to piecz???? Archiwum Akt Nowych.\nZ tre??ci mapy oraz zamieszczonych obok niej danych statystycznych, mo??na wnioskowa??, ??e do Polski powinna nale??e?? nie tylko cz?????? ??l??ska Cieszy??skiego wst??pnie przyznana jej w administrowanie na podstawie porozumienia z 5 listopada 1918 roku, ale tak??e niekt??ry gminy przyznane stronie czeskiej, zw??aszcza w najbardziej uprzemys??owionym powiecie frysztackim. \nPomimo u nazwiska autora mapy oraz wydawcy czy miejsca wydania, tre???? mapy jednoznacznie wskazuje, i?? zosta??a ona przygotowana przez stron?? polsk??, a u??yty w niej j??zyk francuski, wskazuje, i?? adresatem s?? politycy i eksperci francuscy.\nNajbardziej interesuj??cym elementem mapy, s?? odr??cznie naniesione dwie linie ??? czerwona i zielona. Z raportu do????czonego do mapy, wynika, ??e narysowa?? je Roman Dmowski, w Pary??u, 11 wrze??nia 1919 roku, podczas spotkania z polskim dyplomat?? Janem Ciechanowskim (kt??ry jest autorem raportu). Raport by?? przeznaczony dla J??zefa Pi??sudskiego, omawia?? przebieg rozm??w pomi??dzy R. Dmowskim a J. Cambonem oraz Komisj?? ds. polskich, dotycz??cych przeprowadzenia plebiscytu na ??l??sku Cieszy??skim. Linie narysowane przez R. Dmowskiego by??y propozycjami Komisji dotycz??cymi przebiegu linii demarkacyjnej (czerwona) oraz granicy (zielona). Wariant czerwony by?? dla Polski korzystniejszy, poniewa?? przyznawa?? jej p????nocno-zachodni?? cz?????? Zag????bia Ostrawsko-Karwi??skiego. Wed??ug raportu, obie te propozycje Dmowski kategorycznie odrzuci??, b??d??c przekonanym, ??e sytuacja w tym regionie rozwinie si?? dla Polski pomy??lnie.\nOstatecznie ??l??sk Cieszy??ski zosta?? w roku 1920 podzielony w spos??b du??o bardziej niekorzystny dla Polski.	Le Duche de Cieszyn (Teschen) Silesie	??l??sk Cieszy??ski, Ksi??stwo Cieszy??skie, pogranicze polsko-czeskie, granica polsko-czeska	Roman Dmowski, Jan Ciechanowski	struktura narodowo??ciowa, struktura j??zykowa, polsko-czeskie porozumienie z 5 listopada 1918 roku, w??giel kamienny;zag????bkie	\N		 (na mapie odr??cznie wrysowana podzia??ka liniowa)		Podzia?? ??l??ska Cieszy??skiego wed??ug kryterium etnicznego (j??zykowego), na powiaty i gminy obj??te administracj?? polsk?? oraz czesk??, na podstawie porozumienia z 5 listopada 1918 roku, z odr??cznie naniesionymi dwiema propozycjami podzia??u tego regionu	1C9qAALloCYU2k9sVxHtibZtRo0OmuA4w.jpg	2022-04-03 13:21:42.965158+02	https://drive.google.com/drive/folders/1ar2Q3ruyx-0jB9w7NffXVDUITFEDbsl-?usp=sharing	Mapa r??kopi??mienna z dodatkowymi adnotacjami	thumbnails/1C9qAALloCYU2k9sVxHtibZtRo0OmuA4w_copy.jpg
16		14	\N	, ok. 1917-1919	Na mapie, na obszarze szeroko poj??tego pogranicza polsko-czesko-s??owackiego, rozci??gaj??cego si?? od Sanoka i Koszyc po Opolszczyzn?? i ??l??sk Opawski, przedstawiono granice j??zykowe polsko-czeskie i polsko-s??owackie wraz ze stref?? dialekt??w przej??ciowych.\nAutorem mapy jest Kazimierz Nitsch, polski j??zykoznawca i slawista, profesor Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiello??skiego, jeden z ekspert??w delegacji polskiej na konferencj?? pokojow?? w Pary??u w 1919 roku.\nNa mapie zaznaczono sie?? rzeczn??, granice przedwojenne oraz granice Polski z ko??ca XVIII wieku (z regu??y fragmentarycznie, natomiast szczeg????owo wszelkie przedrozbiorowe polskie enklawy na Spiszu). G????wnymi elementami mapy s?? granice zasi??gu j??zyka czeskiego i s??owackiego (linia niebieska), po??udniowa granica zasi??gu j??zyka polskiego (linia czerwona) oraz zaznaczona szrafem szeroka strefa dialekt??w przej??ciowych (w domy??le polsko-czesko-s??owackich).Strefa dialekt??w przej??ciowych pomi??dzy j??zykiem polskim a czeskim i s??owackim, rozci??ga od ??l??ska Opawskiego na zachodzie, przez region Frydecki i Czadecki, po Oraw?? w????cznie. Natomiast w Galicji (Beskid Niski) obszary zamieszkane przez ludno???? pos??uguj??c?? si?? j??zykiem polskim (na p????nocy) oraz s??owackim (na po??udniu), s?? rozdzielone szerok?? stref?? osadnictwa ludno??ci rusi??skiej (??emkowie, Rusnacy), pos??uguj??cej si?? dialektem j??zyka ukrai??skiego, przez co nie dochodzi tam do bezpo??redniego kontaktu Polak??w i S??owak??w.  W pobli??u po??udniowej granicy zasi??gu j??zyka polskiego oraz w strefie dialekt??w przej??ciowych naniesiono liczne, nawet niewielkie miejscowo??ci i wsie, co umo??liwia precyzyjn?? identyfikacj?? polsko-czeskiej i polsko-s??owackiej granicy j??zykowej.\nZ mapy jednoznacznie wynika, ??e trzy g????wne regiony sporne na pograniczu polsko-czechos??owacki po zako??czeniu I wojny ??wiatowej, czyli ??l??sk Cieszy??ski, Orawa oraz p????nocny Spisz, w zdecydowanej wi??kszo??ci nale???? do polskiego obszaru j??zykowego, ewentualnie znajduj?? si?? w strefie dialekt??w przej??ciowych (po??udniowa Orawa). Najbardziej jaskrawo jest to widoczne na przyk??adzie ??l??ska Cieszy??skiego, kt??ry prawie w ca??o??ci znajduje si?? w polskim obszarze j??zykowym, a granica zasi??gu j??zyka polskiego si??ga po Ostraw??, obejmuj??c m.in. Bogumin, prawie ca??e Zag????bie Ostrawsko-Karwi??skie, wi??kszo???? Zaolzia, a nawet du???? cz?????? powiatu frydeckiego, si??ga te?? na po??udnie od historycznego obszaru ??l??ska Cieszy??skiego. Z kolei najbardziej skomplikowany jest przebieg granicy j??zyka polskiego na Spiszu, z licznymi ???wyspami j??zykowymi??? i stref?? dialekt??w przej??ciowych na po??udnie od Tatr.\nNa podstawie tej mapy mo??na stwierdzi??, ??e formu??owane m.in. podczas konferencji pokojowej w Pary??u, polskie roszczenia terytorialne dotycz??ce ??l??ska Cieszy??skiego, Orawy i Spiszu, by??y ca??kowicie uzasadnione kryteriami j??zykowymi i etnicznymi, a arbitralne rozstrzygni??cia Rady Ambasador??w z 28 lipca 1920 roku, dziel??ce te obszary pomi??dzy Polsk?? a Czechos??owacj??, bez zachowania nadrz??dno??ci kryteri??w j??zykowo-etnicznych, by??y dla Polski oraz ludno??ci mieszkaj??cej na polsko-czechos??owackim pograniczu, niesprawiedliwe i krzywdz??ce.	Limites de Linguistiques Polonaise-Tcheque et Polonaise-Slovaque	pogranicze polsko-czeskie, pogranicze polsko-s??owackie, ??l??sk Cieszy??ski, Orawa, Spisz	Kazimierz Nitsch	struktura j??zykowa, pogranicze j??zykowe, zasi??g j??zyka polskiego, Komitet Narodowy Polski	8	Lit. W. Krzeptowski	600000		granice j??zykowe polsko-czeskie i polsko-s??owackie oraz strefa dialekt??w przej??ciowych	1yhgoi1jtLzhq2FmGYKvYfRnYX-WCz5H_.jpg	2022-04-03 13:21:43.085188+02	https://drive.google.com/drive/folders/1sYjkaI4qKMWn_7OA1KPpV9kWO_SOVp_V?usp=sharing	Mapa r??kopi??mienna	thumbnails/1yhgoi1jtLzhq2FmGYKvYfRnYX-WCz5H__copy.jpg
18		16	\N	11 kwietnia 1919	Mapa przedstawia przypuszczenia dotycz??ce pi??ciu propozycji obszaru spornego na terenie Ksi??stwa Cieszy??skiego w konsekwencji przeprowadzenia plebiscytu, dotycz??cego przynale??no??ci pa??stwowej tego regionu. Pokazano w formie graficznej (pi???? odr??cznych szkic??w map) i tekstowej (kr??tkie notatki) udzia?? ludno??ci polskiej w ka??dym z pi??ciu wariant??w, zar??wno w uj??ciu przestrzennym (na mapie), jak i liczbowym (na podstawie danych z austriackiego spisu z 1910 roku, w trakcie kt??rego nie by??o pytania o narodowo????, a struktur?? etniczn?? ustalano wed??ug odpowiedzi na pytanie o ???j??zyk domowy???). Wszystkie zamieszczone na mapie dane statystyczne dowodzi??y dominacji ludno??ci polskiej na obszarze Ksi??stwa Cieszy??skiego. Udzia?? Polak??w waha?? si?? od 54,8% (ca??e Ksi??stwo Cieszy??skie), do 84,7% (powiat frysztacki i cieszy??ski oraz 27 gmin z zachodniej cz????ci powiatu bielskiego i 1 gmina z p????nocnej cz????ci powiatu frydeckiego). \nOpracowanie zosta??o wykonane 11 kwietnia 1919 roku, podpis autora nieczytelny.\nOstatecznie plebiscyt planowany na rok 1920, nie zosta?? przeprowadzony, dlatego nie ma mo??liwo??ci weryfikacji tych przypuszcze??. 		Ksi??stwo Cieszy??skie, ??l??sk Cieszy??ski, granica polsko-czeska		struktura j??zykowa, austriacki spis powszechny 1910 roku,  plebiscyt, Delegacja Polska na Konferencj?? Pokojow?? w Pary??u	\N				przypuszczenia dotycz??ce pi??ciu propozycji obszaru spornego na terenie Ksi??stwa Cieszy??skiego w konsekwencji przeprowadzenia plebiscytu	1qFsaLOTTVUkFcQidzsCEO1csbL9-SjA1.jpg	2022-04-03 13:21:43.128169+02		Mapa r??kopi??mienna z dodatkowymi adnotacjami	thumbnails/1qFsaLOTTVUkFcQidzsCEO1csbL9-SjA1_copy.jpg
22		20	\N	, ok. 1917-1919	Tytu?? mapy mo??na t??umaczy?? jako ???mapa etnograficzna ziem polskich pod zaborem pruskim???.\nMapa zosta??a wydana przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawia procentowy udzia?? ludno??ci polskiej w poszczeg??lnych powiatach wschodniej cz????ci Prus, na podstawie danych spisu powszechnego z 1910 roku i cz????ciowo z roku 1900 oraz odr??cznie wrysowan?? propozycj?? przebiegu granicy polsko-niemieckiej. \nPod legend?? mapy umieszczono informacj?? w j??zyku francuskim (t??umaczenie) Uwaga. Mapa oparta jest na oficjalnych danych pruskich ze spisu powszechnego z 1910 r., kt??ry zosta?? opublikowany szczeg????owo tylko dla rejencji w Poznaniu, Bydgoszczy, Gda??sku, Kwidzynie, Olsztynie i Opolu. Dla innych okr??g??w musieli??my przyj???? dane z 1900 roku.\nNa mapie  daty, ale mo??na przypuszcza??, ??e zosta??a wykonana w latach 1917-1919.\nSzrafem, w podziale na powiaty, przedstawiono udzia?? os??b narodowo??ci polskiej w pi??ciu nier??wnych przedzia??ach procentowych: 0,5-10%; 10-25%; 25-40%; 40-50%; 50-100%.\nZ danych przedstawionych na mapie wynika dominuj??cy (ponad 50%) udzia?? ludno??ci polskiej w wi??kszo??ci powiat??w G??rnego ??l??ska (poza raciborskim), we wschodniej cz????ci Opolszczyzny, zdecydowanej wi??kszo??ci Wielkopolski, wschodniej cz????ci Kaszub oraz w po??udniowej cz????ci Mazur.\nW pruskich spisach powszechnych narodowo???? by??a ustalana na podstawie odpowiedzi na pytanie o j??zyk ojczysty, a statystyka pruska wyszczeg??lnia??a obok j??zyka polskiego, tak??e j??zyk kaszubski i mazurski, co skutecznie zmniejsza??o liczb?? os??b deklaruj??cych j??zyk polski (a tym samym liczb?? os??b zaliczonych do polskiej narodowo??ci). Ponadto w pruskim spisie powszechnym istnia??a mo??liwo???? zadeklarowania dw??ch j??zyk??w i cz?????? Polak??w, znaj??cych tak??e j??zyk niemiecki, deklarowa??o j??zyk polski wraz z niemieckim, co skutkowa??o zaliczeniem ich do tzw. ???os??b dwuj??zycznych???.\nNa mapie zosta??a odr??cznie o????wkiem narysowana linia, przypuszczalnie propozycja przebiegu granicy polsko-niemieckiej. Przecina ona ??l??sk Cieszy??ski, powiat Racib??rz, G??ubczyce i Pr??dnik, w????czaj??c w granice Polski ca??y G??rny ??l??sk, a tak??e centraln?? i wschodni?? Opolszczyzn??. Nast??pnie linia graniczna pozostawia po polskiej stronie powiaty Namys????w i Syc??w, w????cza do Polski zdecydowan?? wi??kszo???? Wielkopolski (m.in. z powiatami Babimost, Mi??dzych??d, Wiele?? i Chodzie??) oraz wi??kszo???? Pomorza Gda??skiego, gdzie przecina powiat Cz??uch??w i S??upsk. \nZaproponowano przebieg granicy w ten spos??b, aby w????czy?? do Polski nie tylko wszystkie powiaty z ponad 50% oraz z ponad 40%, udzia??em ludno??ci polskiej, ale tak??e te, gdzie wed??ug danych spisu powszechnego Polacy stanowili 25-40% og????u ludno??ci, a w przypadku zachodniej cz????ci Pomorza Gda??skiego, nawet powiaty z zaledwie kilkunasto, czy wr??cz kilkuprocentowym udzia??em ludno??ci polskiej (Cz??uch??w, Byt??w, S??upsk i L??bork).\nPrzedstawiona na mapie propozycja wytyczenia granicy polsko-niemieckiej, bazowa??a na kryteriach narodowo??ciowych i strategicznych. Kryterium narodowo??ciowe (ponad 50% dominacja Polak??w) by??o wystarczaj??cy, ??eby w????czy?? w granice Polski G??rny ??l??sk oraz wschodni?? Opolszczyzn??. Jednak w przypadku po??udniowej Opolszczyzny oraz cz????ciowo Wielkopolski (zw??aszcza po??udniowej i p????nocnej) ten "narodowo??ciowy pr??g w????czenia w granice Polski" obni??ono do 25%, co przy konsekwentnym stosowaniu ???kryterium narodowo??ciowego??? powinno oznacza?? przyznanie tych powiat??w Niemcom. Natomiast na Pomorzu, z powodu du??o wi??kszego udzia??u ludno??ci niemieckiej, zdecydowano o ca??kowitym odej??ciu od kryterium narodowo??ciowego na rzecz kryterium strategicznego i gospodarczego (szeroki dost??p do morza). Propozycja granicy polsko-niemieckiej na Warmii i Mazurach nie zosta??a naszkicowana.\nNie podano autora (autor??w) proponowanej linii granicznej.\nNa marginesach mapy umieszczono odr??czne, cz????ciowo nieczytelne, adnotacje, dotycz??ce m.in. poszczeg??lnych odcink??w linii kolejowych. 	Carte Ethnographique de la Pologne Prussienne	Prusy, granica polsko-niemiecka		struktura narodowo??ciowa, Polacy w Prusach, pruski spis powszechny z 1910 roku	3	Bureau Cartographique de l' "Agence Polonaise Central"	1 000 000 (podzia??ka)		udzia?? ludno??ci polskiej w poszczeg??lnych powiatach wschodniej cz????ci Prus, na podstawie danych spisu powszechnego z 1910 roku i cz????ciowo z roku 1900 oraz odr??cznie wrysowana propozycja przebiegu granicy polsko-niemieckiej	1Yntg0yApgMSzJD6prn4TnOYiGrhk-U0Z.jpg	2022-04-03 13:21:43.204729+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1Yntg0yApgMSzJD6prn4TnOYiGrhk-U0Z_copy.jpg
49		47	\N		Na mapie przedstawiono projekt granicy polsko-rumu??skiej na tle granic z 1914 r. Ponadto umieszczono na niej schemat linii kolejowych, g????wne miasta, sie?? rzeczn??, przebieg ??a??cuch??w g??rskich oraz ???nowe granice???. Ich przebieg (np. wschodnia granica Polski) jest cz????ciowo niezgodny z ostatecznie ustalonym powojennym przebiegiem granic. Natomiast niewielki fragment granicy polsko-rumu??skiej, po ostatecznym wytyczeniu, nie odbiega?? od projektu zamieszczonego na omawianej mapie, poza tym, ??e by?? kr??tszy, z powodu nieco odmiennego przebiegu granic Czechos??owacji, W??gier i Rosji.	Projet de la future fronti??re polono-roumaine	granica polsko-rumu??ska		projekt granic	\N		5000000		projekt przebiegu granicy polsko-rumu??skiej	1HNUM8FcdaLjl1XlaF8aZSq88DkHYFjOy.jpg	2022-04-03 13:21:43.687344+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV?usp=sharing	Mapa drukowana	thumbnails/1HNUM8FcdaLjl1XlaF8aZSq88DkHYFjOy_copy.jpg
7	Pierworys wykonany na podk??adzie tre??ci mapy wydanej  przez Ksi??garnia p.f. "Stella" M. Czajkowskiego w Cieszynie.	5	\N	4 listopad 1918	Na mapie Ksi??stwa Cieszy??skiego z listopada 1918 roku przedstawiono rozmieszczenie ludno??ci polskiej (kolor czerwony ??? wschodnia, centralna i p????nocna cz?????? Ksi??stwa) oraz czeskiej i morawskiej (zachodnia cz?????? Ksi??stwa), a tak??e zaznaczono zielonym szrafem zag????bia w??glowe, z podzia??em na ???produkuj??ce??? i ???odkryte???. Zlokalizowane s?? one w p????nocnej cz????ci Ksi??stwa Cieszy??skiego, zw??aszcza w okolicy Ostrawy i Karwina, gdzie jest najwi??ksza koncentracja ???zag????bi produkuj??cych???, co jest zgodne ze stanem faktycznym (Zag????bie Ostrawsko-Karwi??skie). Ponadto zaznaczono miasta, w kt??rych znajduj?? si?? huty ??elaza (Bogumin, Frysztat), miasta w kt??rych zlokalizowano ???fabryki r????ne??? oraz naniesiono poszczeg??lne miejscowo??ci, linie kolejowe, drogi, rzeki, granice Ksi??stwa i granice powiat??w.\nNa mapie znajduj?? si?? liczne odr??czne dopiski, np. dotycz??ce liczby ludno??ci Ksi??stwa Cieszy??skiego, z podzia??em na trzy g????wne grupy wyznaniowe (katolicy, ewangelicy, ??ydzi) oraz trzy g????wne narodowo??ci (Polacy, Niemcy, Czesi). Mo??na przypuszcza??, ??e te informacje s?? naniesione przez autora mapy. Ponadto zielonym pisakiem w j??zyku francuskim dopisano przy kilku miastach rodzaje zak??ad??w przemys??owych, kt??re si?? w nich znajduj??. Pod map?? jest tak??e odr??czny dopisek ???Pary?? dnia 8/XII 18??? oraz nieczytelny podpis. Nie podano ??r??de?? danych zamieszczonych na mapie, jednak mo??na przypuszcza??, ??e dane dotycz??ce struktury narodowo??ciowej pochodz?? ze spisu powszechnego przeprowadzonego w Monarchii Austro-W??gierskiej w 1910 roku.\nZ mapy wynika, ??e w listopadzie 1918 roku na obszarze Ksi??stwa Cieszy??skiego wyra??nie dominowa??a ludno???? polska, katolicka (zar??wno pod wzgl??dem przestrzennym, jak i liczbowym), a najbardziej uprzemys??owiona by??a cz?????? p????nocna Ksi??stwa, a zw??aszcza p????nocno-zachodnia, kt??ra by??a jednocze??nie najbardziej zr????nicowana pod wzgl??dem narodowo??ciowym.	Mapa og??lna Ksi??stwa Cieszy??skiego	Ksi??stwo Cieszy??skie, ??l??sk Cieszy??ski, pogranicze polsko-czeskie, granica polsko-czeska		struktura narodowo??ciowa, Polacy, Czesi, g??rnictwo, w??giel kamienny	5	Ksi??garnia p.f. "Stella" M. Czajkowskiego w Cieszynie	200000		Rozmieszczenie ludno??ci polskiej i czeskiej na obszarze Ksi??stwa Cieszy??skiego oraz lokalizacja zag????bi w??glowych i g????wnych zak??ad??w przemys??owych;zaznaczono cz????ci zag????bia w??glowego produkuj??ce i odkryte	1b4Dne8muw16rEE9qU3e1-dN9et5H2H-s.jpg	2022-04-03 13:21:42.909116+02		Mapa r??kopi??mienna z dodatkowymi adnotacjami	thumbnails/1b4Dne8muw16rEE9qU3e1-dN9et5H2H-s_copy.jpg
3		1	\N	ok. 1917-1919 roku	Na mapie zosta??a przedstawiona za pomoc?? czerwonej linii propozycja przebiegu granicy polsko-niemieckiej, wed??ug stanowiska Komitetu Narodowego Polskiego. Jako podk??adu u??yto mapy wydanej przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawiaj??cej procentowy udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych w powiatach wschodniej cz????ci Prus, wed??ug oficjalnych danych statystycznych rz??du pruskiego pochodz??cych ze spisu szkolnego z roku 1911. Na mapie jest odr??czny dopisek "Granica Zachodnia Polski (stanowisko K.N.P.)". Oczywist?? intencj?? przekazu by??a sugestia, ze proponowana linia przysz??ej granicy polsko-niemieckiej uwzgl??dnia realia narodowo??ciowe. G????wnym, ale nie jedynym, kryterium zaproponowania przebiegu granicy polsko-niemieckiej, by??a struktura narodowo??ciowa, a konkretnie udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych we wschodnich powiatach Prus. Na obszarze ??l??ska oraz Warmii i Mazur, zaproponowano przebieg granicy w ten spos??b, aby w????czy?? do Polski wszystkie powiaty z ponad 50% (tylko w pojedynczych przypadkach z ponad 40%), udzia??em dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych, ponadto granic?? poprowadzono zgodnie z granicami pruskich powiat??w (za wyj??tkiem powiatu Reszel). Natomiast w Wielkopolsce, na Pomorzu oraz Powi??lu odst??piono od tej zasady - proponowano w????czy?? powiaty ju?? od ponad 25% udzia??u dzieci polskich, a na Pomorzu i Powi??lu w granicach Polski mia??y znale???? si?? w ca??o??ci lub cz????ciowo powiaty z zaledwie kilku procentowym udzia??em dzieci narodowo??ci polskiej lub wr??cz bez polskiej ludno??ci (powiat Elbl??g). Ponadto przebieg proponowanej granicy na wielu odcinkach by?? niezgodny z pruskim podzia??em administracyjnym.\nPrzedstawione na mapie stanowisko KNP w sprawie wytyczenia granicy polsko-niemieckiej, bazowa??o na kryteriach narodowo??ciowych i strategicznych. Kryteria narodowo??ciowe (wyra??ny, ponad 50% udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych) by??y wystarczaj??ce, ??eby w????czy?? w granice Polski ca??y obszar G??rnego ??l??ska, wi??kszo???? ??l??ska Opolskiego oraz szeroki pas po??udniowych Mazur i po??udniowej Warmii. Tam, gdzie przebieg linii granicznej by??by zbyt zawi??y (Wielkopolska) lub wchodzi??y w gr?? wzgl??dy strategiczne (szeroki dost??p do morza w rejonie uj??cia Wis??y) kryteria narodowo??ciowe schodzi??y na plan dalszy. Na mapie  daty, ale mozna przypuszcza??, ze zosta??a wykonana na przelomie 1918 i 1919 r., lub w pocz??tkach 1919 r., w zwi??zku z obradami konferencji pokojowej.  W przypadku Wielkopolski ten "narodowo??ciowy pr??g w????czenia w granice Polski" w przypadku kilku powiat??w obni??ono do 25%, natomiast na Pomorzu i Powi??lu, z powodu du??o wi??kszego udzia??u ludno??ci niemieckiej, zdecydowano o odej??ciu od kryterium narodowo??ciowego na rzecz kryteri??w strategicznych (szeroki dost??p do morza, uj??cie Wis??y). Na mapie  daty, ale mo??na przypuszcza??, ??e zosta??a wykonana w latach 1917-1918. Wykorzystywanie przez polskie instytucje, na potrzeby przedstawiania argument??w za polsko??ci?? ??l??ska, Wielkopolski, Pomorza oraz Warmii i Mazur, danych pochodz??cych z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, by??o uzasadnione m.in. tym, ??e w spisach powszechnych narodowo???? by??a ustalana na podstawie odpowiedzi na pytanie o j??zyk ojczysty, a statystyka pruska wyszczeg??lnia??a obok j??zyka polskiego, tak??e j??zyk kaszubski i mazurski, co skutecznie zmniejsza??o liczb?? os??b deklaruj??cych j??zyk polski (a tym samym liczb?? os??b zaliczonych do polskiej narodowo??ci). Ponadto w pruskim spisie powszechnym istnia??a mo??liwo???? zadeklarowania dw??ch j??zyk??w i cz?????? Polak??w, znaj??cych tak??e j??zyk niemiecki, deklarowa??o j??zyk polski wraz z niemieckim, co skutkowa??o zaliczeniem ich do tzw. ???os??b dwuj??zycznych???.	Pologne Prussienne. La nationalit?? des enfants dans les ??cole primaires d'apr??s la statistique du gouvernement Prussien de 1911	granica polsko-niemiecka, Prusy, granice zaboru pruskiego		zachodnia granica Polski, Komitet Narodowy Polski, Prusy, dzieci narodowo??ci polskiej w szko??ach, statystyka narodowo??ciowa, pruski spis szkolny 1911 r.	3	Bureau Cartographique "l'Agence Polonaise Centrale" a Lausanne	1000000 (podzia??ka)	Pologne Prussienne	przedstawienie propozycji przebiegu zachodniej granicy Polski wed??ug stanowiska Komitetu Narodowego Polskiego, na podk??adzie przedstawiaj??cym procentowy udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych w powiatach wschodniej cz????ci Prus, wed??ug danych statystycznych rz??du pruskiego z roku 1911  (spis szkolny)	1LqOGQWqHrxRTzz5besNgkv3gWLqIS0vO.jpg	2022-04-03 13:21:42.806679+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1LqOGQWqHrxRTzz5besNgkv3gWLqIS0vO_copy.jpg
5		3	\N	1919 (29 VII 1919)	Mapa nie posiada tytu??u. Zosta??y na niej przedstawione trzy r????ne warianty rozgraniczenia terytorium Polski i Litwy, powsta??e w po??owie 1919 roku. Rozbie??no??ci dotycz?? g????wnie Wile??szczyzny i Suwalszczyzny. Na tle rozmieszczenia miast, rzek, linii kolejowych oraz zaznaczonego obszaru tzw. ???Litwy etnograficznej??? (wed??ug dzisiejszej nomenklatury by??by to obszar z dominacj?? ludno??ci litewskiej) zaznaczono przebieg linii demarkacyjnej polsko-litewskiej z 18 czerwca 1919 roku, linii granicznej proponowanej przez Polak??w z 20 czerwca 1919 roku (czyli zaledwie dwa dni p????niej) oraz ??? jak to uj??to w legendzie mapy ??? "linii proponowanej przez Naczelnego Wodza Armii Sprzymierzonych z 18 VII 1919 roku". Z pewno??ci?? chodzi tu o tzw. lini?? Focha. Mapa zosta??a wydana przez Oddzia?? Geograficzny Biura Kongresowego w dniu 29 lipca 1919 roku, czyli mo??na przypuszcza??, ??e bezpo??rednim powodem je przygotowania i publikacji by??o w??a??nie wytyczenie tzw. linii Focha. Zosta??a ona zaproponowana jako kompromis pomi??dzy wcze??niejszymi o miesi??c propozycjami Ententy oraz strony polskiej.\nSpo??r??d trzech linii przedstawionych na mapie, najwcze??niejsz?? chronologicznie, jest zaaprobowana przez tzw. ???wielk?? czw??rk????? Ententy, linia demarkacyjna z 18 czerwca. Zostawia ona po polskiej stronie Wilno i po??udniow?? Wile??szczyzn?? oraz Grodno wraz z lini?? kolejow?? ????cz??ce te miasta. Natomiast w cz????ci po??udniowo-zachodniej zosta??a poprowadzona wzd??u?? Kana??u Augustowskiego, w konsekwencji czego ca??a Suwalszczyzna znalaz??a si?? po stronie litewskiej. Ten niekorzystny, z polskiego punktu widzenia, przebieg linii demarkacyjnej, spowodowa?? ju?? po dw??ch dniach pojawienie si?? polskiej propozycji przebiegu granicy polsko-litewskiej. Linia graniczna zaproponowana przez stron?? polsk?? ma przebieg zdecydowanie odmienny. Zosta??a wytyczona wyra??nie na zach??d od linii demarkacyjnej, prawie na ca??ym swoim przebiegu przecina obszar zaznaczony jako ???Litwa etnograficzna???, pozostawia po stronie polskiej nie tylko Wilno, ale tak??e p????nocno-zachodni?? Wile??szczyzn??. W cz????ci po??udniowej, na kr??tkim odcinku biegnie wzd??u?? Niemna, a nast??pnie (wyra??nie na p????noc od linii demarkacyjnej), odbija r??wnole??nikowo, docieraj??c do granicy Prus Wschodnich w okolicach Wiszty??ca, zostawiaj??c po polskiej stronie Suwalszczyzn??, z Wi??ajnami, Pu??skiem i Sejnami. Trzecia z linii granicznych, tzw. linia Focha z lipca 1919 roku, by??a propozycj?? kompromisow??, w kilku aspektach korzystn?? dla Polski. W cz????ci p????nocno-wschodniej, mia??a przebieg zbli??ony do wcze??niejszej propozycji Ententy, by??a jednak nieznacznie przesuni??ta na zach??d, zwi??kszaj??c tym samym obszar przyznany Polsce. Natomiast w cz????ci po??udniowo-zachodniej, zdecydowanie odbija??a od Niemna i Kana??u Augustowskiego na p????noc, zostawiaj??c po polskiej stronie Suwalszczyzn??, a od okolic Pu??ska do granicy Prus Wschodnich, pokrywaj??c si?? z wcze??niejsz?? propozycj?? polsk??.  \nPo wytyczeniu linii Focha, strona litewska, na obszarze wschodniej Suwalszczyzny, w okolicach Sejn, nie przestrzega??a rozgraniczenia wojsk i administracji wzd??u?? nowej linii demarkacyjnej. By??o to bezpo??redni?? przyczyn?? wybuchu miesi??c p????niej, 23 sierpnia 1919 roku, powstania sejne??skiego, zako??czonego zwyci??stwem oddzia????w polskich i skutecznym wyparciem litewskiej administracji z ca??ej Suwalszczyzny, poza lini?? Focha.\nPod map?? odr??cznie o????wkiem dopisano warto???? skali [1:1 000 000]		granica polsko-litewska, Litwa, Wile??szczyzna, Suwalszczyzna, sie?? rzeczna, linie kolejowe		linia demarkacyjna, linia Focha, 	\N	Biuro Kongresowe (Oddzia?? Geograficzny)	1 000 000 (na podstawie odr??cznego zapisu pod map??)		Przedstawienie trzech r????nych wariant??w rozgraniczenia terytorium Polski i Litwy, powsta??ych w po??owie 1919 roku. Dw??ch wariant??w zaproponowanych przez Entent?? (w tym tzw. linii Focha) oraz jednej propozycji polskiej.	1FLIKDC9_e7FloeTiGdUvAoe5ZXSFGbi7.jpg	2022-04-03 13:21:42.86052+02		Mapa r??kopi??mienna z dodatkowymi adnotacjami	thumbnails/1FLIKDC9_e7FloeTiGdUvAoe5ZXSFGbi7_copy.jpg
41		39	\N		Grafika przedstawia sytuacj?? narodow?? w zachodniej Polsce. Na wykresach przedstawiono procentowy udzia?? ludno??ci w poszczeg??lnych miastach z uwzgl??dnieniem nast??puj??cych grup: ??ydzi, Niemcy, urz??dnicy wojskowi, osadnicy, inne narodowo??ci z wyj??tkiem polski (?), polskie dzieci ze szk???? podstawowych.	Die nationalen Verh??ltnisse Westpolens in graphischer Darstellung. 	zachodnia polska		narodowo??ci	14		nie dotyczy		Sytuacja narodowa w zachodniej Polsce w przedstawieniu graficznym. 	1jmnVwI4TlgWLITIKWhcdRLE8M_8rHUzr.jpg	2022-04-03 13:21:43.548036+02		Mapa drukowana	thumbnails/1jmnVwI4TlgWLITIKWhcdRLE8M_8rHUzr_copy.jpg
8		6	\N	, po 1910 a przed 1919	Na mapie Ksi??stwa Cieszy??skiego przedstawiono struktur?? narodowo??ciow?? wed??ug danych ze spisu powszechnego przeprowadzonego w Monarchii Austro-W??gierskiej w 1910 roku. W spisie tym, nie zadawano pytania o narodowo????, natomiast okre??lano j?? na podstawie odpowiedzi na pytanie o ???j??zyk domowy???. \nNa mapie precyzyjnie wyszczeg??lniono miasta i wsie znajduj??ce si?? w Ksi??stwie Cieszy??skim, r????nicuj??c sygnatury w zale??no??ci od liczby mieszka??c??w oraz przedstawiaj??c szrafem struktur?? narodowo??ciow?? mieszka??c??w poszczeg??lnych osad, w podziale na Polak??w, Czech??w i Niemc??w. Zaznaczono tak??e, zar??wno szrafem jak i kolorem, granice powiat??w (kolor niebieski), granice czeskiego terytorium etnograficznego wed??ug wynik??w spisu z 1910 roku (kolor czerwony), obszary wydobycia w??gla (kolor ??????ty). Ponadto naniesiono drogi i linie kolejowe. \nNa mapie  jest daty wydania, mo??na jednak przypuszcza??, ??e powsta??a po roku 1910, a przed 1919, dlatego ??e zosta??y w niej u??yte dane ze spisu z 1910 roku, natomiast jako pa??stwa s??siaduj??ce z Ksi??stwem Cieszy??skim, podano W??gry, Galicj?? i Prusy, czyli stan sprzed zako??czenia I wojny ??wiatowej. \nZ mapy wynika, ??e w wed??ug danych spisu z 1910 roku, na obszarze Ksi??stwa Cieszy??skiego wyra??nie dominowa??a ludno???? polska, (zar??wno pod wzgl??dem przestrzennym, jak i liczbowym), zw??aszcza w jego cz????ci wschodniej, centralnej i p????nocnej. Czesi przewa??ali w w??skim pasie cz????ci zachodniej (bez fragmentu p????nocno-zachodniego). Niemcy, og????em stanowili 18%, a ich obecno???? najbardziej zaznacza??a si?? w miastach, zw??aszcza w Bielsku, Cieszynie, Boguminie, Frydku, Skoczowie, gdzie byli ludno??ci?? dominuj??c??. Jako obszary wydobycia w??gla kamiennego zaznaczono okolice Ostrawy i Karwiny oraz Czechowic.\nRegionem najbardziej zr????nicowanym narodowo??ciowo, a jednocze??nie najbardziej uprzemys??owionym i najcenniejszym pod wzgl??dem gospodarczym, by??o wed??ug danych spisu z 1910 roku Zag????bie Ostrawsko-Karwi??skie, kt??rego cz?????? zachodnia (okolice Ostrawy) by??a zdominowana przez ludno???? czesk??, a cz?????? wschodnia (okolice Karwiny) i p????nocna przez Polak??w. Ponadto w miastach sw?? obecno???? zaznacza??a tak??e ludno???? niemiecka. Tak du??e zr????nicowanie narodowo??ciowe tego fragmentu Ksi??stwa Cieszy??skiego, by??o konsekwencj?? zar??wno jego po??o??enia na etnicznym pograniczu polsko-czeskim, jak i silnego uprzemys??owienia oraz wynikaj??cych z tego migracji ekonomicznych.	Le Duch?? de Cieszyn (Teschen). Les nationalit??s d???apr??s le recensement de 1910	Ksi??stwo Cieszy??skie, ??l??sk Cieszy??ski, pogranicze polsko-czeskie;zag????bie ostrawsko-karwi??skie		struktura narodowo??ciowa, austriacki spis powszechny 1910, Polacy, Czesi, Niemcy, g??rnictwo, w??giel kamienny	\N		300000	Le Duch?? de Cieszyn (Teschen)	struktura narodowo??ciowa Ksi??stwa Cieszy??skiego na podstawie wynik??w spisu z 1910 roku, obszary wydobycia w??gla kamiennego obejmuj??ce zag????bie ostrawsko-kaewi??skie	12konZdBtMZ1nMpQIAwXGj9Ho-1dZSzXw.jpg	2022-04-03 13:21:42.92833+02		Mapa r??kopi??mienna	thumbnails/12konZdBtMZ1nMpQIAwXGj9Ho-1dZSzXw_copy.jpg
9		7	\N	, prawdopodobnie 1919	Powstanie mapy jest konsekwencj?? polsko-czeskich spor??w o przynale??no???? pa??stwow?? ??l??ska Cieszy??skiego, a bezpo??rednio jest zwi??zane z podpisaniem 5 listopada 1918 roku wst??pnego porozumienia w??adz lokalnych (polskich i czeskich) tymczasowo dziel??cego ten region wed??ug kryterium etnicznego (a precyzyjniej j??zykowego). Umowa ta przydziela??a polskiej administracji powiaty, kt??re zamieszka??e by??y w wi??kszo??ci przez ludno???? polskoj??zyczn??: bielski, cieszy??ski oraz wi??ksz?? cz?????? powiatu frysztackiego (na mapie kolor bia??y), a czechos??owackiej powiat frydecki i pozosta???? cz????ci?? powiatu frysztackiego (na mapie kolor niebieski). Podzia?? ten nie ko??czy?? i nie rozwi??zywa?? konfliktu, a ostateczne rozgraniczenie terytorialne pozostawia?? si?? do rozstrzygni??cia przez rz??dy Polski i Czechos??owacji. By?? on korzystny dla strony polskiej i stanowi?? podstaw?? dla dalszego podtrzymania roszcze?? terytorialnych. Przydziela?? Polsce zdecydowan?? wi??kszo???? ??l??ska Cieszy??skiego wraz z cz????ci?? kopal?? w??gla kamiennego i zak??ad??w przemys??owych w okolicach Karwiny, Rychwa??du i Bogumina. Strona czechos??owacka nie zaakceptowa??a podzia??u wed??ug kryterium etnicznego, domagaj??c si?? na podstawie argument??w historycznych, ca??ego obszaru Ksi??stwa Cieszy??skiego.\nNa mapie przedstawiono Ksi??stwo Cieszy??skie z podzia??em na powiaty, z zaznaczonymi g????wnymi miastami, liniami kolejowymi, rzekami, zag????biami w??glowymi w okolicach Ostrawy i Karwiny oraz Czechowic (kolor ??????ty). Najistotniejszym elementem zamieszczonym na mapie jest zaznaczenie obszar??w (powiat??w i gmin) obj??tych tymczasow?? administracj?? polsk?? (kolor bia??y) oraz czesk?? (kolor niebieski), na podstawie porozumienia z 5 listopada 1918 roku. \nPonadto obok mapy dodano informacje o strukturze narodowo??ciowej tego obszaru, wed??ug wynik??w spis??w ludno??ci z lat 1880, 1890, 1900, 1910 z podzia??em na Polak??w, Niemc??w i Czech??w, zar??wno w odniesieniu do ca??ego obszaru Ksi??stwa Cieszy??skiego, jak i z wy????czeniem, najliczniej zamieszkanego przez Czech??w, powiatu frydeckiego. Jednocze??nie autorzy mapy podkre??lili, ??e wyniki ostatniego spisu powszechnego z 1910 roku przeprowadzonego w Monarchii Austro-W??gierskiej, s?? ???niekorzystne dla narodowo??ci polskiej w wyniku fa??szerstw i r????nych nacisk??w???. W trakcie tego spisu (jak i w trakcie wcze??niejszych) nie by??o pytania o narodowo????, a struktur?? etniczn?? ustalano wed??ug odpowiedzi na pytanie o ???j??zyk domowy???. Wszystkie zamieszczone na mapie dane statystyczne dowodzi??y wyra??nej dominacji ludno??ci polskiej na obszarze ??l??ska Cieszy??skiego.\nPoza danymi pochodz??cymi ze spis??w powszechnych, autorzy mapy zamie??cili tak??e informacje dotycz??ce ???linii j??zykowych???, przytaczaj??c opinie trzech badaczy (Polaka i dw??ch Czech??w), dowodz??ce, ??e obszar ??l??ska Cieszy??skiego jest obj??ty zasi??giem j??zyka polskiego, a j??zyk czeski pojawia si?? dopiero na zach??d od tego regionu. Naniesiono tak??e granic?? (linia czerwona) oddzielaj??c?? j??zyk polski (cz?????? wschodnia) od dialekt??w przej??ciowych (cz?????? zachodnia), kt??ra cz????ciowo biegnie wzd??u?? granicy powiatu frydeckiego, a nast??pnie przecina go, zostawiaj??c ca??y powiat frysztacki po stronie j??zyka polskiego, co nie znalaz??o potwierdzenia w wynikach spisu powszechnego z 1910 roku. \nZ tre??ci mapy oraz zamieszczonych obok niej danych statystycznych, mo??na wnioskowa??, ??e do Polski powinna nale??e?? nie tylko cz?????? ??l??ska Cieszy??skiego wst??pnie przyznana jej w administrowanie na podstawie porozumienia z 5 listopada 1918 roku, ale tak??e niekt??ry gminy przyznane stronie czeskiej, zw??aszcza w najbardziej uprzemys??owionym powiecie frysztackim. \nPomimo u nazwiska autora mapy oraz wydawcy czy miejsca wydania, tre???? mapy jednoznacznie wskazuje, i?? zosta??a ona przygotowana przez stron?? polsk??, a u??yty w niej j??zyk francuski, wskazuje, i?? adresatem s?? politycy i eksperci francuscy. Mapa ta zosta??a do????czona jako aneks do memoria??u dotycz??cego wytyczenia granicy pomi??dzy Polsk?? a Czechos??owacj?? na ??l??sku Cieszy??skim, Orawie i Spiszu, przygotowanego przez delegacj?? polsk?? na konferencj?? pokojow?? w Pary??u w 1919 roku.	Le Duche de Cieszyn (Teschen) Silesie	??l??sk Cieszy??ski, Ksi??stwo Cieszy??skie, pogranicze polsko-czeskie		struktura narodowo??ciowa, struktura j??zykowa, polsko-czeskie porozumienie z 5 listopada 1918 roku, Delegacja Polska na Konferencj?? Pokojow?? w Pary??u, w??giel kamienny ; zag????bie ostrawsko-karwi??skie i ko??o Czechowic	\N		 (na mapie odr??cznie wrysowana podzia??ka liniowa)		Podzia?? ??l??ska Cieszy??skiego wed??ug kryterium etnicznego (j??zykowego), na powiaty i gminy obj??te administracj?? polsk?? oraz czesk??, na podstawie porozumienia z 5 listopada 1918 roku	1bQSTP0r-aoRbYkjUtpk6Bdp99MtnNASg.jpg	2022-04-03 13:21:42.945428+02	https://drive.google.com/drive/folders/1_ucV-brrrWyavyeuiax8Fk10bsLd1Pj_?usp=sharing	Mapa r??kopi??mienna z dodatkowymi adnotacjami	thumbnails/1bQSTP0r-aoRbYkjUtpk6Bdp99MtnNASg_copy.jpg
11		9	\N	28 lipca 1920	Mapa przedstawia fragment pogranicza polsko-czechos??owackiego obejmuj??cego ??l??sk Cieszy??ski, Oraw?? oraz Spisz. Podstawowymi punktami spornymi, przedstawionymi na mapie, jest podzia?? tych trzech region??w pomi??dzy Polsk?? a Czechos??owacj??.\nDo I wojny ??wiatowej Spisz oraz Orawa znajdowa??y si?? w granicach W??gier, a ??l??sk Cieszy??ski w granicach Austrii. Po rozpadzie monarchii Austro-W??gierskiej oraz zako??czeniu wojny, nowopowsta??a Czechos??owacja ro??ci??a pretensje terytorialne do ca??ego obszaru p????nocnych W??gier (w tym do Spiszu i Orawy), oraz do uprzemys??owionego i zasobnego w z??o??a w??gla kamiennego ??l??ska Cieszy??skiego. Z kolei liczna na tych obszarach ludno???? polska, zw??aszcza we wschodniej i centralnej cz????ci ??l??ska Cieszy??skim, na p????nocnym Spiszu oraz p????nocnej Orawie, domaga??a si?? przy????czenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Pary??u, podj??to decyzj?? o przeprowadzeniu w tych trzech regionach w po??owie 1920 roku plebiscyt??w, kt??re mia??y zadecydowa?? o ich przynale??no??ci politycznej. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podj??to decyzj?? o rezygnacji z plebiscyt??w (z powodu wojny polsko-bolszewickiej), a decyzj?? o podziale tych region??w scedowano na Rad?? Ambasador??w, kt??ra 28 lipca 1920 roku w Pary??u, podj????a arbitraln?? decyzj??, przyznaj??c Polsce tylko niewielkie fragmenty spornych obszar??w, co nie zako??czy??o spor??w terytorialnych polsko-czechos??owackich. \nMapa przedstawia efekt decyzji Rady Ambasador??w z dnia 18 lipca 1920 roku.\nKolorem zielonym zaznaczono zasi??g terytorialny Spiszu, Orawy i ??l??ska Cieszy??skiego (z tym, ??e w przypadku Spiszu, dotyczy to tylko jego p????nocnej cz????ci), a kolorem czerwonym granice wytyczone na podstawie decyzji Rady Ambasador??w z 28 lipca 1920, czyli tzw. ???linie Ambasador??w???, kt??re mia??y sta?? si?? granicami Polski i Czechos??owacji.\nW przypadku podzia??u wszystkich trzech region??w, decyzja Rady Ambasador??w by??a niekorzystna dla Polski i spotka??a si?? z protestami polskich w??adz. W ??adnym z tych region??w granica polsko-czechos??owacka nie mia??a identycznego przebiegu jak na omawianej mapie. Wszelkie modyfikacje zosta??y ostatecznie ustalone w roku 1924 przez Komisj?? Delimitacyjn??, a nast??pnie zaakceptowane przez Lig?? Narod??w oraz rz??dy Polski i Czechos??owacji. Zmiany by??y jednak nieznaczne, cz??sto dotyczy??y wzajemnej wymiany niewielkich terytori??w (wsi) i w ??adnym przypadku nie zmieni??y w istotny spos??b niekorzystnej dla Polski decyzji Rady Ambasador??w z 28 lipca 1920 roku. Na Spiszu modyfikacja dotyczy??a niewielkiego obszaru na po??udnie od wsi Jurg??w i Brzegi (z korzy??ci?? dla Polski) oraz na po??udnie od wsi Niedzica, na Orawie przekazano Czechos??owacji dwie wsie (G??od??wka i Sucha G??ra) na zach??d od Chocho??owa, w zamian za cz?????? wsi Lipnica Wielka, a na ??l??sku Cieszy??skim Czechos??owacja otrzyma??a wie?? Herczaw?? w po??udniowej cz????ci regionu. W tak ustalonej formie granice te funkcjonuj?? r??wnie?? wsp????cze??nie.	Teschen, Orawa et Spisz	??l??sk Cieszy??ski, Orawa, Spisz, granica polsko-czechos??owacka, granica polsko-s??owacka		Rada Ambasador??w, linia Ambasador??w, podzia?? Orawy, Spisza i ??l??ska Cieszy??skiego, w??giel kamienny, zag????bie ostrawsko-karwi??skie, oraz wydobycie w??gla w okolicy Czechowic	6	S.G.A.	200000		podzia?? ??l??ska Cieszy??skiego, Orawy i Spiszu pomi??dzy Polsk?? a Czechos??owacj??, wed??ug decyzji Rady Ambasador??w z 28 lipca 1920 roku 	1MPS4f1CWOG3E2I9zqzX3cFeND05IVmBO.jpg	2022-04-03 13:21:42.988532+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1MPS4f1CWOG3E2I9zqzX3cFeND05IVmBO_copy.jpg
12		10	\N	28 lipca 1920	Mapa przedstawia podzia?? ??l??ska Cieszy??skiego pomi??dzy Polsk?? a Czechos??owacj??, wed??ug decyzji Rady Ambasador??w z 28 lipca 1920 roku.\nDo I wojny ??wiatowej ??l??sk Cieszy??ski znajdowa?? si?? w granicach Austrii. Po rozpadzie monarchii Austro-W??gierskiej oraz zako??czeniu wojny, pretensje terytorialne do ??l??ska Cieszy??skiego zg??asza??a zar??wno Polska, jak i Czechos??owacja, zw??aszcza do zasobnego w w??giel kamienny i uprzemys??owionego Zag????bia Ostrawsko-Karwi??skiego. 5 listopada 1918 roku na podstawie porozumienia w??adz lokalnych (polskich i czeskich) tymczasowo podzielono ??l??sk Cieszy??ski wed??ug kryterium etnicznego (a precyzyjniej j??zykowego). By?? to podzia?? korzystny dla strony polskiej, kt??rej przypad??a zdecydowana wi??kszo???? regionu wraz z cz????ci?? kopal?? w??gla kamiennego i zak??ad??w przemys??owych w cz????ci p????nocnej i p????nocno-zachodniej. Strona czechos??owacka nie zaakceptowa??a podzia??u wed??ug kryterium etnicznego, domagaj??c si?? na podstawie argument??w historycznych, ca??ego obszaru Ksi??stwa Cieszy??skiego. W styczniu 1919 roku Czechos??owacja rozpocz????a dzia??ania zbrojne, zajmuj??c ostatecznie oko??o po??ow?? ??l??ska Cieszy??skiego. W po??owie 1919 roku, podczas konferencji w Pary??u, podj??to decyzj?? o przeprowadzeniu w tym regionie w 1920 roku plebiscytu, kt??ry mia?? zadecydowa?? o jego przynale??no??ci politycznej. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podj??to decyzj?? o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzj?? o podziale ??l??ska Cieszy??skiego scedowano na Rad?? Ambasador??w, kt??ra 28 lipca 1920 roku w Pary??u, podj????a arbitraln?? decyzj??, przyznaj??c Polsce tylko wschodni?? cz?????? regionu, wytyczaj??c granic?? cz????ciowo na rzece Olzie, co doprowadzi??o m.in. do podzia??u Cieszyna. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnych granic (na p????nocy by??a to granica pomi??dzy Austri?? a Prusami, a na po??udniu pomi??dzy Austri?? a W??grami), natomiast kolorem czerwonym granic?? wytyczon?? na podstawie decyzji Rady Ambasador??w z 28 lipca 1920, czyli tzw. ???lini?? Ambasador??w???, kt??ra mia??a sta?? si?? granic?? Polski i Czechos??owacji.\nDecyzja Rady Ambasador??w dotycz??ca podzia??u ??l??ska Cieszy??skiego by??a bardzo niekorzystna dla Polski i wywo??a??a protesty polskich w??adz. Nie uwzgl??dnia??a kryterium narodowo??ciowego i j??zykowego, pozostawiaj??c po stronie czechos??owackiej ok. 150 tys. Polak??w (g????wnie na obszarze tzw. Zaolzia). Ponadto Czechos??owacji w ca??o??ci przypad??o bogate w z??o??a w??gla kamiennego Zag????bie Ostrawsko-Karwi??skie oraz linia kolejowa Bogumin-Koszyce. Wytyczona na mapie granica z lipca 1920 roku, zosta??a nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Lig?? Narod??w, przyznano Czechos??owacji wie?? Herczaw??, na samym po??udniu ??l??ska Cieszy??skiego. W tak ustalonej formie granica ta funkcjonuje r??wnie?? wsp????cze??nie.	Fronti??re dans la R??gion de Teschen	??l??sk Cieszy??ski, Ksi??stwo Cieszy??skie, granica polsko-czechos??owacka		Rada Ambasador??w, linia Ambasador??w, podzia?? ??l??ska Cieszy??skiego	6	S.G.A.	75000		Podzia?? ??l??ska Cieszy??skiego pomi??dzy Polsk?? a Czechos??owacj??, wed??ug decyzji Rady Ambasador??w z 28 lipca 1920 roku	1GoYAQQ1b0uuH_iOvU_abZXhcuts3acXf.jpg	2022-04-03 13:21:43.004593+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1GoYAQQ1b0uuH_iOvU_abZXhcuts3acXf_copy.jpg
13		11	\N	1919	Na mapie przedstawiono Ksi??stwo Cieszy??skie z podzia??em na powiaty, z zaznaczonymi g????wnymi miastami, liniami kolejowymi, rzekami. Ponadto szrafem zaznaczono region wydobycia w??gla kamiennego w okolicach Ostrawy i Karwiny oraz obszar obj??ty tymczasow?? administracj?? czesk?? na podstawie porozumienia z 5 listopada 1918 roku. \nMapa zosta??a zamieszczona w artykule ???La Pologne et la Silesie de Teschen???, autorstwa Henri Austruy, wydanym w Pary??u w roku 1919, w czasopi??mie ???La Nouvelle Revue???.\nPowstanie mapy jest prawdopodobnie konsekwencj?? polsko-czeskich spor??w o przynale??no???? pa??stwow?? ??l??ska Cieszy??skiego i jest zwi??zane z podpisaniem 5 listopada 1918 roku wst??pnego porozumienia w??adz lokalnych (polskich i czeskich) tymczasowo dziel??cego ten region wed??ug kryterium etnicznego (a precyzyjniej j??zykowego). Umowa ta przydziela??a polskiej administracji powiaty, kt??re zamieszka??e by??y w wi??kszo??ci przez ludno???? polskoj??zyczn??: bielski, cieszy??ski oraz wi??ksz?? cz?????? powiatu frysztackiego, czyli zdecydowan?? wi??kszo???? ??l??ska Cieszy??skiego. Natomiast administracja czechos??owacka przej????a zdominowany przez ludno???? czesk?? powiat frydecki i pozosta???? cz????ci?? powiatu frysztackiego (na mapie zaznaczone szrafem) wraz ze znajduj??cymi si?? tam kopalniami w??gla kamiennego. \nTen podzia?? utrzyma?? si?? w praktyce tylko nieca??e trzy miesi??cy. Pod koniec stycznia 1919 roku wojska czechos??owackie przekroczy??y lini?? demarkacyjn?? i zaj????y zbrojnie oko??o po??ow?? obszaru ??l??ska Cieszy??skiego. 		??l??sk Cieszy??ski, Ksi??stwo Cieszy??skie, pogranicze polsko-czeskie, granica polsko-czeska		struktura narodowo??ciowa, Polacy, Czesi, porozumienie z 5 listopada 1918 roku, w??giel kamienny, zag????bie ostrawsko-karwi??skie	7		 (na mapie odr??cznie wrysowano podzia??k?? liniow??)		podzia?? ??l??ska Cieszy??skiego pomi??dzy Polsk?? a Czechos??owacj??, wed??ug porozumienia z 5 listopada 1918 roku	1ynRfnx7QptCMIt_q4XFd1kcXdryldSP2.jpg	2022-04-03 13:21:43.020204+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa r??kopi??mienna	thumbnails/1ynRfnx7QptCMIt_q4XFd1kcXdryldSP2_copy.jpg
29		27	\N	1919	Mapa przedstawia rozmieszczenie ludno??ci polskiej w p????nocnych powiatach dawnych W??gier. Zosta??a opracowana w roku 1919, przez za??o??ony w Krakowie Narodowy Komitet Obrony Spisza, Orawy i Podhala i do????czona do kilkustronicowej, francuskoj??zycznej broszury, omawiaj??cej argumenty za przynale??no??ci?? do Polski cz????ci Spiszu i Orawy.\nNa mapie przedstawiono za pomoc?? szrafu rozmieszczenie i udzia?? procentowy ludno??ci polskiej na obszarze regionu Czadeckiego, Orawy oraz Spiszu, w jednym przedziale liczbowym (75-90%). Ponadto zaznaczono dawn?? granic?? pomi??dzy W??grami a Galicj?? (Austri??), sie?? rzeczn??, g????wne miejscowo??ci oraz krainy historyczno-geograficzne. Z mapy wynika, ??e Czadeckie, Orawa i Spisz, kt??re po zako??czeniu I wojny ??wiatowej by??y regionami spornymi na pograniczu polsko-s??owacki, by??y w??wczas, zw??aszcza w cz????ci p????nocnej, wyra??nie zdominowane przez ludno???? polsk?? (polskoj??zyczn??).\nNa mapie  podania ??r??de?? u??ytych danych liczbowych, ponadto nie zaznaczono rozmieszczenia ludno??ci s??owackiej i niemieckiej (licznej zw??aszcza na Spiszu), a tak??e powszechnych w tych regionach ???obszar??w przej??ciowych???, mieszanych narodowo??ciowo i j??zykowo. Z powod??w propagandowych oraz dla udokumentowania polskich ????da?? terytorialnych na pograniczu polsko-s??owackim, zasi??g ludno??ci polskiej zosta?? przedstawiony w spos??b maksymalistyczny, a rzeczywista struktura etniczno-j??zykowa mieszka??c??w tych region??w (zw??aszcza Spiszu) by??a z pewno??ci?? bardziej skomplikowana.\nPomimo tych zastrze??e??, mo??na stwierdzi??, ??e formu??owane m.in. podczas konferencji pokojowej w Pary??u, polskie roszczenia terytorialne dotycz??ce p????nocnej Orawy i p????nocnego Spiszu, by??y uzasadnione kryteriami j??zykowymi i etnicznymi, a arbitralne rozstrzygni??cia Rady Ambasador??w z 28 lipca 1920 roku, dziel??ce te obszary pomi??dzy Polsk?? a Czechos??owacj??, bez zachowania nadrz??dno??ci kryteri??w j??zykowo-etnicznych, by??y dla Polski oraz ludno??ci mieszkaj??cej na polsko-s??owackim pograniczu, niesprawiedliwe i krzywdz??ce.	Carte de la population polonaise dans les comitats septentrionaux de l???ancienne Hongrie	granica polsko-s??owacka, Spisz, Orawa, Czadeckie		Narodowy Komitet Obrony Spisza, Orawy i Podhala, rozmieszczenie ludno??ci polskiej, struktura narodowo??ciowa, struktura j??zykowa	12	Comit?? National pour la d??fence du Spisz, de l???Orawa et du Podhale	1200000		Rozmieszczenie ludno??ci polskiej (polskoj??zycznej) w p????nocnych powiatach dawnych W??gier (Spisz, Orawa, Czadeckie). 	1hrtJwd_n50BbOW3LmUSRHBhox020Xx1Z.jpg	2022-04-03 13:21:43.341982+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/1hrtJwd_n50BbOW3LmUSRHBhox020Xx1Z_copy.jpg
30		28	\N		Na mapie przedstawiono sie?? komunikacyjn?? w postaci linii kolejowych i kana????w. Na mapie nie zaznaczono Kana??u K??odnickiego. Ponadto wyr????niono granice Polski z 1772 roku oraz granice pa??stw i prowincji z 1914 roku oraz wa??niejsze miasta. Odr??cznie (kolorem czerwonym) podkre??lono linie kolejowe na obszarze ograniczonym miejscowo??ciami: Berno, Cieszyn, Bratys??awa. Na mapie zaznaczono r??wnie?? lokalizacje nast??puj??cych miejscowo??ci: 	Carte des communications	granica polsko-s??owacka, Spisz, Orawa		komunikacja, granice administracyjne	\N		2000000		komunikacja	11WLlDlCEEE2qVmtMFfivH5ZlcP3Vt2Zi.jpg	2022-04-03 13:21:43.358625+02	https://drive.google.com/drive/folders/1byOiIoyqWT2t274Z2BLpUNNm3_rouX3D?usp=sharing	Mapa drukowana z odr??cznymi adnotacjami	thumbnails/11WLlDlCEEE2qVmtMFfivH5ZlcP3Vt2Zi_copy.jpg
31		29	\N	1919	Mapa nr II ilustruj??ca memoria?? "Polska i Finlandia".\nObejmuje rozleg??y obszar Europy ??rodkowo-Wschodniej, od p????nocnej Finlandii, po Morze Czarne. Wyr????niono na niej rozleg??e terytorium Federacji Fi??sko-Esto??skiej (z p????wyspem Kola i wyra??nie na wsch??d przesuni??tymi granicami Finlandii) oraz Federacji Polsko-Litewsko-Ruskiej wraz z dwoma regionami ???pod czasow?? okupacj????? ??? pomi??dzy Kijowem a Odess?? oraz  na wsch??d od Estonii\nZasadniczym elementem mapy jest wyra??nie zaznaczona linia ???frontu antyrosyjskiego???, biegn??ca od Morza Bia??ego na p????nocy, poprzez Petersburg i Kij??w, po Odess?? nad Morzem Czarnym.\n	Finlandia i Polska II	Finlandia, Polska, granica polsko-rosyjska	J??zef Ziabiczi 	Federacja Fi??sko-Esto??ska, Federacja Polsko-Litewsko-Ruska, front antyrosyjski	10				Federacja Fi??sko-Esto??ska oraz Polsko-Litewsko-Ruska	1Aq2yGf_lu2UpqB99IPMOx2EU3rDd0TIR.jpg	2022-04-03 13:21:43.375878+02	https://drive.google.com/drive/folders/1J0iVuKiQIpnP71ztxLMurhKYIY9vVUCp?usp=sharing	Mapa r??kopi??mienna	thumbnails/1Aq2yGf_lu2UpqB99IPMOx2EU3rDd0TIR_copy.jpg
32		30	\N	1919	Mapa za????cznikowa do memoria??u "Caract??re physique du territoire de la Pologne"	Caract??re physique du territoire de la Pologne	granica polsko-niemiecka, granica polsko-bolszewicka, granica polsko-ukrai??ska		Komitet Narodowy Polski	\N				granice polski	1XnpiaoXgJxuzgmSR3lR0fi7BS29plIeV.jpg	2022-04-03 13:21:43.3914+02	https://drive.google.com/drive/folders/1AhHPKWNS9-hr_NdQjoOWrNjUie3uF2lr	Mapa r??kopi??mienna	thumbnails/1XnpiaoXgJxuzgmSR3lR0fi7BS29plIeV_copy.jpg
51		49	\N	1921	Tytu?? mo??na t??umaczy?? jako ???mapa etnograficzna i polityczna ziem dawnego Wielkiego Ksi??stwa Litewskiego???, z tym, ??e trzeba pami??ta??, i?? w??wczas pod poj??ciem ???etnograficzne??? rozumiano, to co wsp????cze??nie okre??lamy jako ???narodowo??ciowe???, czyli jest to mapa narodowo??ciowo-polityczna.\nNa mapie przedstawiono metod?? zasi??g??w, wsp????czesne dla Autora, obszary etnograficzne (narodowo??ciowe) na terytorium historycznego Wielkiego Ksi??stwa Litewskiego: litewskie (kolor ??????ty, ??mud?? i Gubernia Kowie??ska), polskie (kolor czerwony, Wile??szczyzna, Suwalszczyzna, region Grodna i Dyneburga), ??otewskie (kolor pomara??czowy, Kurlandia, Inflanty), bia??oruskie (kolor r????owy, rozlegle obszary na wsch??d i po??udnie od Wile??szczyzny). \nPonadto naniesiono liczne linie graniczne, zar??wno historyczne (rozbiorowe, Wielkiego Ksi??stwa Litewskiego), jak i bezpo??rednio zwi??zane z licznymi traktatami zawieranymi w konsekwencji walk polsko-litewskich i polsko-bolszewickich w roku 1920 i 1921 oraz innych ustale?? dyplomatycznych (np. linia Curzona).\nMapa pokazuje bardzo du??e zr????nicowanie narodowo??ciowe obszaru dawnego Wielkiego Ksi??stwa Litewskiego oraz przecinaj??ce go w trzeciej dekadzie XX wieku liczne podzia??y polityczne. W momencie wydania mapy, powojenny podzia?? polityczno-terytorialny tego obszaru, nie by?? jeszcze definitywnie zako??czony.  \n	Carte ethnographique et politique des territoires de l'ancien Grande Duch?? de Lithuanie. Edition du Comit?? Politique Provisoire des terres de Kowno	Wielkie Ksi??stwo Litewskie, Litwa, granica polsko-rosyjska		struktura narodowo??ciowa, konflikt polsko-litewski, konflikt polsko-bolszewicki, zar????nicowanie narodowo??ciowe i polityczne Litwy	18	Zak??ad Kartograficzno W. G????wczewski	2000000		podzia??y narodowo??ciowe i polityczne ziem dawnego Wielkiego Ksi??stwa Litewskiego po roku 1920	1CrXvqjG71WEmIB1IK-dOQ5ZZlYdaarHE.jpg	2022-04-03 13:21:43.721803+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV	Mapa drukowana	thumbnails/1CrXvqjG71WEmIB1IK-dOQ5ZZlYdaarHE_copy.jpg
52		50	\N		do wykonania	 tytu??u	Galicja		granice	\N				granice	1knakHHFR-xt_qT4pMvA0fGeq_Zg069ee.jpg	2022-04-03 13:21:43.737802+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1knakHHFR-xt_qT4pMvA0fGeq_Zg069ee_copy.jpg
14		12	\N	28 lipca 1920	Mapa przedstawia podzia?? Orawy pomi??dzy Polsk?? a Czechos??owacj??, wed??ug decyzji Rady Ambasador??w z 28 lipca 1920 roku.\nDo I wojny ??wiatowej Orawa znajdowa??a si?? w granicach W??gier. Po rozpadzie monarchii Austro-W??gierskiej oraz zako??czeniu wojny, nowopowsta??a Czechos??owacja ro??ci??a pretensje terytorialne do ca??ego obszaru p????nocnych W??gier (w tym do Orawy). Z kolei liczna na Orawie ludno???? polska, zw??aszcza w jej p????nocnej cz????ci, domaga??a si?? przy????czenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Pary??u, podj??to decyzj?? o przeprowadzeniu w po??owie 1920 roku plebiscytu, kt??ry mia?? zadecydowa?? o przynale??no??ci politycznej Orawy. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podj??to decyzj?? o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzj?? o podziale tego regionu scedowano na Rad?? Ambasador??w, kt??ra 28 lipca 1920 roku w Pary??u, podj????a arbitraln?? decyzj??, przyznaj??c Polsce tylko niewielki p????nocno-wschodni fragment spornych obszar??w, co nie zako??czy??o spor??w terytorialnych polsko-czechos??owackich. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnej granicy pomi??dzy Austri?? (Galicj??) a W??grami, natomiast kolorem czerwonym granic?? wytyczon?? na podstawie decyzji Rady Ambasador??w z 28 lipca 1920, czyli tzw. ???lini?? Ambasador??w???, kt??ra mia??a sta?? si?? granic?? Polski i Czechos??owacji.\nDecyzja Rady Ambasador??w dotycz??ca podzia??u Orawy by??a niekorzystna dla Polski, rozgraniczenie nie zosta??o przeprowadzone wed??ug kryterium j??zykowego czy etnicznego. Wytyczona na mapie granica z lipca 1920 roku, zosta??a nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Lig?? Narod??w, przekazano Czechos??owacji dwie wsie G??od??wk?? (Hladovka) i Such?? G??r?? (Sucha Hora) na zach??d od Chocho??owa, w zamian za przekazan?? Polsce cz?????? wsi Lipnica Wielka (Dolna Lipnica). W tak ustalonej formie (1924) granica ta funkcjonuje r??wnie?? wsp????cze??nie.	Fronti??re dans la R??gion d???Orawa	Orawa, granica polsko-czechos??owacka, granica polsko-s??owacka		Rada Ambasador??w, linia Ambasador??w, podzia?? Orawy	6	S.G.A.	75000		podzia?? Orawy pomi??dzy Polsk?? a Czechos??owacj??, wed??ug decyzji Rady Ambasador??w z 28 lipca 1920 roku	14Xdi6q7m_W18g7L0J2_a-UVahlAdaQFJ.jpg	2022-04-03 13:21:43.045235+02		Mapa drukowana	thumbnails/14Xdi6q7m_W18g7L0J2_a-UVahlAdaQFJ_copy.jpg
15		13	\N	28 lipca 1920	Mapa przedstawia podzia?? Spiszu pomi??dzy Polsk?? a Czechos??owacj??, wed??ug decyzji Rady Ambasador??w z 28 lipca 1920 roku.\nDo I wojny ??wiatowej Spisz znajdowa?? si?? w granicach W??gier (o czym przypomina nazewnictwo mapy). Po rozpadzie monarchii Austro-W??gierskiej oraz zako??czeniu wojny, nowopowsta??a Czechos??owacja ro??ci??a pretensje terytorialne do ca??ego obszaru p????nocnych W??gier (w tym do Spiszu). Z kolei liczna na Spiszu ludno???? polska, zw??aszcza w jego p????nocnej cz????ci, domaga??a si?? przy????czenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Pary??u, podj??to decyzj?? o przeprowadzeniu w po??owie 1920 roku plebiscytu, kt??ry mia?? zadecydowa?? o przynale??no??ci politycznej Spiszu. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podj??to decyzj?? o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzj?? o podziale tego regionu scedowano na Rad?? Ambasador??w, kt??ra 28 lipca 1920 roku w Pary??u, podj????a arbitraln?? decyzj??, przyznaj??c Polsce tylko niewielki fragment spornych obszar??w, co nie zako??czy??o spor??w terytorialnych polsko-czechos??owackich. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnej granicy pomi??dzy Austri?? (Galicj??) a W??grami, natomiast kolorem czerwonym granic?? wytyczon?? na podstawie decyzji Rady Ambasador??w z 28 lipca 1920, czyli tzw. ???lini?? Ambasador??w???, kt??ra mia??a sta?? si?? granic?? Polski i Czechos??owacji.\nDecyzja Rady Ambasador??w dotycz??ca podzia??u Spiszu by??a niekorzystna dla Polski i wywo??a??a protesty polskich w??adz. Nie rozstrzygni??to w??wczas tak??e spornej kwestii przynale??no??ci Doliny Jaworzyny (Tatry Wysokie). Wytyczona na mapie granica z lipca 1920 roku, zosta??a nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Lig?? Narod??w, Polsce przekazano niewielki obszaru na po??udnie od wsi Jurg??w i Brzegi oraz dokonano wzajemnej wymiany niewielkich terytori??w na po??udnie od wsi Niedzica. W tak ustalonej formie (1924 rok) granica ta funkcjonuje r??wnie?? wsp????cze??nie.	Fronti??re dans la R??gion de Spisz	Spisz, granica polsko-czechos??owacka, granica polsko-s??owacka		Rada Ambasador??w, linia Ambasador??w, podzia?? Spiszu	6	S.G.A.	75000		podzia?? Spiszu pomi??dzy Polsk?? a Czechos??owacj?? wed??ug decyzji Rady Ambasador??w z 28 lipca 1920 roku	1wB0xU_DD5FmRxvGRPie-jA80MJ1M2cw-.jpg	2022-04-03 13:21:43.065759+02		Mapa drukowana	thumbnails/1wB0xU_DD5FmRxvGRPie-jA80MJ1M2cw-_copy.jpg
17		15	\N	, ok. 1917-1919	Na mapie, obejmuj??cej fragment pogranicza polsko-s??owackiego, rozci??gaj??cego si?? od Popradu na wschodzie po rejon Czadcy na po??udnie od ??l??ska Cieszy??skiego, przedstawiono polskie roszczenia terytorialne na W??grzech. De facto dotyczy??y one p????nocnej S??owacji, zw??aszcza Spiszu, Orawy i Czadeckiego, jednak prawdopodobnie w momencie powstania mapy istnia??a jeszcze Monarchia Austro-W??gierska, a S??owacja formalnie nale??a??a do W??gier.\nNa mapie zaznaczono linie kolejowe, drogi, sie?? rzeczn??, granice polityczne z roku 1914 oraz z ko??ca XVIII wieku. G????wnymi elementami mapy s?? naniesione szrafem polskie i s??owackie terytoria j??zykowe oraz po??udniowa granica polskich roszcze?? terytorialnych obejmuj??cych p????nocny Spisz, p????nocn?? Oraw?? i Czadeckie. \nPodstaw?? wytyczenia zasi??gu polskich roszcze?? terytorialnych na obszarze p????nocnych W??gier (p????nocnej S??owacji) by??o kryterium j??zykowe. Nigdzie na omawianej mapie granica polskich roszcze?? terytorialnych nie wkracza na s??owackie terytorium j??zykowe. Granica ta ??ci??le pokrywa si?? z po??udniowym zasi??giem polskiego terytorium j??zykowego, tylko na obszarze Spiszu wykracza dalej na po??udnie, obejmuj??c cz????ciowo obszary z przewag?? ludno??ci niemieckiej oraz z polskimi ???wyspami j??zykowymi???. \nMapa ta zosta??a do????czona jako aneks do memoria??u dotycz??cego wytyczenia granicy pomi??dzy Polsk?? a Czechos??owacj?? na ??l??sku Cieszy??skim, Orawie i Spiszu, przygotowanego przez delegacj?? polsk?? na konferencj?? pokojow?? w Pary??u w 1919 roku.\nNie podano autora mapy, ani ??r??d??a danych, mo??na jednak przypuszcza?? (na podstawie por??wnania z innymi mapami), ??e zosta??a opracowana na podstawie wynik??w bada?? Kazimierza Nitscha, polskiego j??zykoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiello??skiego, jednego z ekspert??w delegacji polskiej na konferencj?? pokojow?? w Pary??u w 1919 roku.\nNa podstawie tej mapy mo??na stwierdzi??, ??e formu??owane m.in. podczas konferencji pokojowej w Pary??u, polskie roszczenia terytorialne dotycz??ce Orawy i Spiszu, by??y ca??kowicie uzasadnione kryteriami j??zykowymi i etnicznymi, a arbitralne rozstrzygni??cia Rady Ambasador??w z 28 lipca 1920 roku, dziel??ce te obszary pomi??dzy Polsk?? a Czechos??owacj??, bez zachowania nadrz??dno??ci kryteri??w j??zykowo-etnicznych, by??y dla Polski oraz ludno??ci mieszkaj??cej na polsko-s??owackim pograniczu, niesprawiedliwe i krzywdz??ce.	Revendications Polonaises en Hongrie	granica polsko-s??owacka, pogranicze polsko-s??owackie, Spisz, Orawa	Kazimierz Nitsch	struktura j??zykowa, granice j??zykowe, Delegacja Polska na Konferencj?? Pokojow?? w Pary??u	\N		600000		polskie roszczenia terytorialne na obszarze p????nocnych W??gier (p????nocnej S??owacji) na podstawie kryteri??w j??zykowych	14R4j7UEpK0bzS3DUAuzNnQfz2hTfUKJ-.jpg	2022-04-03 13:21:43.108688+02	https://drive.google.com/drive/folders/1_ucV-brrrWyavyeuiax8Fk10bsLd1Pj_?usp=sharing	Mapa drukowana	thumbnails/14R4j7UEpK0bzS3DUAuzNnQfz2hTfUKJ-_copy.jpg
45		43	\N	1902	Na niemieckiej mapie topograficznej, obejmuj??cej Dolny ??l??sk i cz????ciowo Wielkopolsk?? po rozbiorow?? granic?? prusko-rosyjsk?? na Pro??nie, wrysowano niebieskim d??ugopisem fragment proponowanej powojennej granicy polsko-niemieckiej na Dolnym ??l??sku oraz na zach??d od niej, czerwon?? kredk?? zaznaczono obszar okre??lony jako "Polsko????". Zamalowana na czerwono strefa si??ga na zachodzie po Namys????w (Namslau) i Twardog??r?? (Festenberg), a na p????nocny ko??czy si?? na rozlewiskach Baryczy pomi??dzy Odolanowem (Adenlau) a Miliczem (Militsch), czyli na historycznym pograniczu ??l??ska i Wielkopolski.	??bersichtskarte von Mitteleuropa. Breslau	pogranicze polsko-pruskie, Dolny ??l??sk		zab??r pruski, strefa zamieszkiwania ludno??ci polskiej	\N	K??niglich-Preussische Landesaufnahme	300000		Lokalizacja ludno??ci polskiej na Dolnym ??l??sku 	1kk9tJI-lyVsfOOI3DV-JaYgzv9D1xv3f.jpg	2022-04-03 13:21:43.63209+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1kk9tJI-lyVsfOOI3DV-JaYgzv9D1xv3f_copy.jpg
46		44	\N		Na mapie przedstawiono zasi??g wyst??powania z?????? w??gla kamiennego i brunatnego na obszarze Czechos??owacji oraz ??l??ska	Carte d'ensemble des existences de charbon dans l'Etat Tch??co-slovaque	Czechos??owacja, ??l??sk, granica polsko-s??owacka, granica polsko-czeska		z??o??a w??gla, surowce naturalne, mapa gospodarcza	\N				Mapa wyst??powania z?????? w??gla w pa??stwie Czechos??owackim	1xVWY4dURE2fixm1Zg4VbQ7ChD8aArVDk.jpg	2022-04-03 13:21:43.648027+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b	Mapa r??kopi??mienna	thumbnails/1xVWY4dURE2fixm1Zg4VbQ7ChD8aArVDk_copy.jpg
19		17	\N	, ok. 1917-1919	Mapa w j??zyku angielskim wydana przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawiaj??ca procentowy udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych w powiatach wschodniej cz????ci Prus, wed??ug oficjalnych danych statystycznych rz??du pruskiego, pochodz??cych ze spisu szkolnego z roku 1911. Na mapie  daty, ale mo??na przypuszcza??, ??e zosta??a wykonana w latach 1917-1919.\nSzrafem przedstawiono udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych w pi??ciu nier??wnych przedzia??ach procentowych ??? 0,5-10%; 10-25%; 25-40%; 40-50%; 50-100%, na tle podzia??u administracyjnego na powiaty, rejencje i prowincje.\nZ danych przedstawionych na mapie wynika dominuj??cy (ponad 50%) udzia?? uczni??w narodowo??ci polskiej we wszystkich powiatach G??rnego ??l??ska, wschodniej cz????ci Opolszczyzny, zdecydowanej wi??kszo??ci Wielkopolski, wi??kszo??ci Kaszub oraz szerokiego pasa w po??udniowej cz????ci Mazur.\nWykorzystywanie przez polskie instytucje, na potrzeby przedstawiania argument??w za polsko??ci?? ??l??ska, Wielkopolski, Pomorza, Warmii i Mazur, oraz w celu wykazania s??uszno??ci polskich ????da?? odno??nie przysz??ych zachodnich granic Polski, danych pochodz??cych z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, by??o uzasadnione m.in. tym, ??e w spisach powszechnych narodowo???? by??a ustalana na podstawie odpowiedzi na pytanie o j??zyk ojczysty, a statystyka pruska wyszczeg??lnia??a obok j??zyka polskiego, tak??e j??zyk kaszubski i mazurski, co skutecznie zmniejsza??o liczb?? os??b deklaruj??cych j??zyk polski (a tym samym liczb?? os??b zaliczonych do polskiej narodowo??ci). Ponadto w pruskim spisie powszechnym istnia??a mo??liwo???? zadeklarowania dw??ch j??zyk??w i cz?????? Polak??w, znaj??cych tak??e j??zyk niemiecki, deklarowa??o j??zyk polski wraz z niemieckim, co skutkowa??o zaliczeniem ich do tzw. ???os??b dwuj??zycznych???.\nW lewym g??rnym rogu mapy dopisano odr??cznie w j??zyku francuskim Epreuve, czyli Test.	Ethnographic map of Prussian Poland drafted from official statistic of elementary schools in the Kingdom of Prussia year 1911	Prusy		statystyka narodowo??ciowa, dzieci narodowo??ci polskiej w szko??ach, pruski spis szkolny 1911, Centralna Agencja Polska w Lozannie	3	Cartographical Bureau of the "Polish Central Agency" in Lausanne	1 000 000 (podzia??ka)		procentowy udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych w powiatach wschodniej cz????ci Prus, wed??ug oficjalnych danych statystycznych rz??du pruskiego, pochodz??cych ze spisu szkolnego z roku 1911	1S0-Bw_k93Pea0m0UhXFV9oyc3i30kQ2n.jpg	2022-04-03 13:21:43.147725+02		Mapa drukowana	thumbnails/1S0-Bw_k93Pea0m0UhXFV9oyc3i30kQ2n_copy.jpg
20		18	\N	, ok. 1917-1919	Tytu?? mapy mo??na t??umaczy?? jako ???mapa etnograficzna ziem polskich pod zaborem pruskim???.\nJest to mapa w j??zyku angielskim wydana przez Biuro Kartograficzne ???Encyklopedii Polskiej???, przedstawiaj??ca udzia?? ludno??ci polskiej w powiatach wschodniej cz????ci Prus.\nSzrafem przedstawiono procentowy udzia?? Polak??w w czterech nier??wnych przedzia??ach: 0-10%; 10-25%; 25-50%; 50-100%, na tle podzia??u administracyjnego na powiaty, rejencje i prowincje. Nie podano daty wykonania mapy, ani ??r??de?? danych. Mo??na przypuszcza??, ??e u??yto danych pruskiego spisu powszechnego z 1910 roku, cho??by dlatego, ??e w por??wnaniu z podobnymi mapami wydanymi przez Centraln?? Agencj?? Polsk?? w Lozannie, przedstawiaj??c?? udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych w powiatach wschodniej cz????ci Prus, wed??ug ze spisu szkolnego z roku 1911, w wi??kszej liczbie powiat??w zosta?? odnotowany wy??szy udzia?? procentowy os??b narodowo??ci polskiej ni?? na omawianej mapie. Najwi??ksze r????nice s?? widoczne na Mazurach, Kaszubach i na Opolszczy??nie. W pruskim spisie powszechnym z 1910 roku narodowo???? by??a ustalana na podstawie odpowiedzi na pytanie o j??zyk ojczysty, a statystyka pruska wyszczeg??lnia??a obok j??zyka polskiego, tak??e j??zyk kaszubski i mazurski, co skutecznie zmniejsza??o liczb?? os??b deklaruj??cych j??zyk polski (a tym samym liczb?? os??b zaliczonych do polskiej narodowo??ci). Ponadto w pruskim spisie powszechnym istnia??a mo??liwo???? zadeklarowania dw??ch j??zyk??w i cz?????? Polak??w, znaj??cych tak??e j??zyk niemiecki, deklarowa??o j??zyk polski wraz z niemieckim, co skutkowa??o zaliczeniem ich do tzw. ???os??b dwuj??zycznych???.\nZ danych przedstawionych na mapie wynika dominuj??cy (ponad 50%) udzia?? ludno??ci polskiej w wi??kszo??ci powiat??w G??rnego ??l??ska (poza raciborskim), we wschodniej cz????ci Opolszczyzny, zdecydowanej wi??kszo??ci Wielkopolski, wschodniej cz????ci Kaszub oraz w po??udniowej cz????ci Mazur.	Ethnographical Map of Prussian Poland 	Prusy	Tadeusz Skowro??ski	struktura narodowo??ciowa, pruski spis powszechny z 1910 roku, ludno???? polska w Prusach 	\N	Cartographical Bureau of the "Polish Encyclopedia"	 (podzia??ka)		udzia?? ludno??ci polskiej w powiatach wschodniej cz????ci Prus	1hRcAkJzBZ9sOKIW5XrkFA_6M2kj907CQ.jpg	2022-04-03 13:21:43.167768+02		Mapa drukowana	thumbnails/1hRcAkJzBZ9sOKIW5XrkFA_6M2kj907CQ_copy.jpg
47		45	\N		Mapa b??d??ca cz????ci?? artyku??y pt. "W??giel jako postulat ??ywotno??ci pa??stwa polskiego" autorstwa in??. Franciszka Drobiniaka wydanego w Czasopi??mie G??rniczo-Hutniczym w marcu 1919. Na mapie zaznaczono wyst??powanie z?????? w??gla na obszarze Czechos??owacji i ??l??ska Cieszy??skiego.	Carte d'ensemble des existences de charbon dans l'Etat Tch??co-slovaque	granica polsko-s??owacka, ??l??sk Cieszy??ski		surowce naturalne, w??giel kamienny, w??giel brunatny	\N				surowce naturalne, w??giel kamienny	1QvHT0kjn3OhuY_SH_7EgaU8y7lF5G7N8.jpg	2022-04-03 13:21:43.661275+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b	Mapa drukowana	thumbnails/1QvHT0kjn3OhuY_SH_7EgaU8y7lF5G7N8_copy.jpg
48		46	\N		Na mapie w formie kartogramu przedstawiono procentowy udzia?? Polak??w w podziale na okr??gi s??dowe Galicji Wschodniej w roku 1910. Udzia?? ludno??ci polskiej zosta?? przedstawiony w czterech przedzia??ach (mniej ni?? 10%, 10-25%, 25-50%, wi??cej ni?? 50%). ??r??d??em danych prawdopodobnie by austriacki spis powszechny z 1910 roku. Najwi??kszy, dominuj??cy udzia?? Polak??w, by?? w cz????ci zachodniej, nad Sanem, ponadto w okolicach Lwowa oraz w cz????ci wschodniej w okolicach Tarnopola. Najmniej liczny wzd??u?? ??uku Karpat, w cz????ci po??udniowo-zachodniej. \nZ boku mapy r??cznie dopisano w j??zyku francuskim tytu?? mapy i legend??, w identycznym brzmieniu jak na mapie.\n	Des Polonais dans les districts judiciaires 1910	Galicja Wschodnia		struktura narodowo??ciowa, udzia?? ludno??ci polskiej, spis powszechny 1910 r., Galicja Wschodnia	\N				udzia?? Polak??w w podziale na okr??gi s??dowe Galicji Wschodniej w roku 1910	1Hx7H48BtD_OAZOYlAHnuawxreyHRwd8Q.jpg	2022-04-03 13:21:43.674732+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV	Mapa r??kopi??mienna z dodatkowymi adnotacjami	thumbnails/1Hx7H48BtD_OAZOYlAHnuawxreyHRwd8Q_copy.jpg
21		19	\N	, ok. 1917-1919	Tytu?? mapy mo??na t??umaczy?? jako ???mapa etnograficzna ziem polskich pod zaborem pruskim???.\nJest to mapa w j??zyku angielskim wydana przez Biuro Kartograficzne ???Encyklopedii Polskiej???, przedstawiaj??ca udzia?? ludno??ci polskiej w powiatach wschodniej cz????ci Prus.\nSzrafem przedstawiono procentowy udzia?? Polak??w w czterech nier??wnych przedzia??ach: 0-10%; 10-25%; 25-50%; 50-100%, na tle podzia??u administracyjnego na powiaty, rejencje i prowincje. Nie podano daty wykonania mapy, ani ??r??de?? danych. Mo??na przypuszcza??, ??e u??yto danych pruskiego spisu powszechnego z 1910 roku, cho??by dlatego, ??e w por??wnaniu z podobnymi mapami wydanymi przez Centraln?? Agencj?? Polsk?? w Lozannie, przedstawiaj??c?? udzia?? dzieci narodowo??ci polskiej w??r??d uczni??w szk???? podstawowych w powiatach wschodniej cz????ci Prus, wed??ug ze spisu szkolnego z roku 1911, w wi??kszej liczbie powiat??w zosta?? odnotowany wy??szy udzia?? procentowy os??b narodowo??ci polskiej ni?? na omawianej mapie. Najwi??ksze r????nice s?? widoczne na Mazurach, Kaszubach i na Opolszczy??nie. W pruskim spisie powszechnym z 1910 roku narodowo???? by??a ustalana na podstawie odpowiedzi na pytanie o j??zyk ojczysty, a statystyka pruska wyszczeg??lnia??a obok j??zyka polskiego, tak??e j??zyk kaszubski i mazurski, co skutecznie zmniejsza??o liczb?? os??b deklaruj??cych j??zyk polski (a tym samym liczb?? os??b zaliczonych do polskiej narodowo??ci). Ponadto w pruskim spisie powszechnym istnia??a mo??liwo???? zadeklarowania dw??ch j??zyk??w i cz?????? Polak??w, znaj??cych tak??e j??zyk niemiecki, deklarowa??o j??zyk polski wraz z niemieckim, co skutkowa??o zaliczeniem ich do tzw. ???os??b dwuj??zycznych???.\nZ danych przedstawionych na mapie wynika dominuj??cy (ponad 50%) udzia?? ludno??ci polskiej w wi??kszo??ci powiat??w G??rnego ??l??ska (poza raciborskim), we wschodniej cz????ci Opolszczyzny, zdecydowanej wi??kszo??ci Wielkopolski, wschodniej cz????ci Kaszub oraz w po??udniowej cz????ci Mazur.	Ethnographical Map of Prussian Poland 	Prusy	Tadeusz Skowro??ski	struktura narodowo??ciowa, ludno???? polska w Prusach, pruski spis powszechny z 1910 roku	\N	Cartographical Bureau of the "Polish Encyclopedia"	 (podzia??ka)		udzia?? ludno??ci polskiej w powiatach wschodniej cz????ci Prus	1NJXX6muvnRGgw5hJUAzW5kqVaKHcNVAE.jpg	2022-04-03 13:21:43.185005+02		Mapa drukowana	thumbnails/1NJXX6muvnRGgw5hJUAzW5kqVaKHcNVAE_copy.jpg
23		21	\N	1919	Na mapie, na obszarze szeroko poj??tego pogranicza polsko-s??owackiego, rozci??gaj??cego si?? od ??l??ska Cieszy??skiego i regionu Czadeckiego na zachodzie po Beskid Niski na wschodzie, przedstawiono rozmieszczenie ludno??ci polskiej i s??owackiej oraz ludno??ci m??wi??cej dialektami przej??ciowymi.\nZosta??a zaznaczona sie?? rzeczna, linie kolejowe, g????wne miejscowo??ci (zw??aszcza na Spiszu, Orawie i w regionie Czadeckim) granice prowincji i powiat??w w??gierskich oraz ???granice po??udniowe istotne (kluczowe) dla Polski???. G????wnymi elementami mapy s?? obszary rozmieszczenia Polak??w ???w zwartej masie??? (kolor czerwony), S??owak??w (kolor zielony) oraz Polak??w ???rozproszonych w??r??d innych narodowo??ci??? (szraf) i ludno??ci m??wi??cej dialektami przej??ciowymi, w domy??le polsko-s??owackimi (szraf). Rozmieszczenie Polak??w i S??owak??w zosta??o opracowane na podstawie kryteri??w j??zykowych.\nMapa zosta??a do????czona do szczeg????owego opracowania w j??zyku francuskim dotycz??cego historii oraz kwestii j??zykowych, etnicznych i gospodarczych Spiszu, Orawy i Czadeckiego, przygotowanego w 1919 roku przez Polsk?? Komisj?? Prac Przygotowawczych do Konferencji Pokojowej. Mo??na przypuszcza?? (na podstawie por??wna?? z innymi mapami z tego okresu), ??e zosta??a ona opracowana na podstawie wynik??w bada?? Kazimierza Nitscha, polskiego j??zykoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiello??skiego, jednego z ekspert??w delegacji polskiej na konferencj?? pokojow?? w Pary??u w 1919 roku.\nZ mapy jednoznacznie wynika, ??e g????wne regiony sporne na pograniczu polsko-czechos??owacki po zako??czeniu I wojny ??wiatowej, czyli ??l??sk Cieszy??ski, region Czadecki, Orawa oraz p????nocny Spisz, by??y w??wczas zdominowane przez ludno???? polsk??, ewentualnie ludno???? pos??uguj??c?? si?? dialektami przej??ciowymi (po??udniowa Orawa). Najbardziej jaskrawo jest to widoczne na przyk??adzie ??l??ska Cieszy??skiego, regionu Czadeckiego oraz p????nocnej Orawy. Z kolei najbardziej skomplikowana sytuacja j??zykowo-etniczna by??a na Spiszu, na kt??rym wyst??powa??y liczne ???wyspy j??zykowe??? (w tym niemieckie) i strefy dialekt??w przej??ciowych. Natomiast w Galicji (Beskid Niski) obszary zamieszkane przez Polak??w (na p????nocy) oraz S??owak??w (na po??udniu), s?? rozdzielone szerok?? stref?? oznaczan?? na mapie jako ???Polacy rozproszeni w??r??d innych narodowo??ci???. W rzeczywisto??ci by?? to obszar w spos??b zwarty zamieszkany przez Rusin??w (??emk??w, Rusnak??w), pos??uguj??cych si?? dialektem j??zyka ukrai??skiego, z bardzo nielicznym osadnictwem polskim i s??owackim.\nNa mapie zaznaczono tak??e propozycj?? ???po??udniowej granicy istotnej (kluczowej) dla Polski???. Obejmuje ona w ca??o??ci region Czadecki (na po??udnie od ??l??ska Cieszy??skiego), praktycznie ca???? Oraw??, w????cznie z po??udniowymi fragmentami zamieszkanymi przez ludno???? m??wi??c?? dialektami mieszanymi oraz bardzo rozleg??y obszar Spiszu, z Popradem i Kiezmarkiem. Granica ta, na Orawie i Spiszu si??ga wyra??nie na po??udnie od obszaru oznaczonego jako ???Polacy w zwartej masie???. Ta propozycja ???po??udniowej granicy istotnej (kluczowej) dla Polski??? z roku 1919, nie mia??a nic wsp??lnego z ustalon?? rok p????niej granic?? polsko-czechos??owack??. Na wielu odcinkach (zw??aszcza na Spiszu i Orawie) zosta??a wytyczona w oderwaniu nie tylko do przedstawionych na mapie kryteri??w etniczno-j??zykowych, ale tak??e od kryteri??w historycznych i reali??w politycznych. \nPomimo tego, na podstawie tej mapy, mo??na stwierdzi??, ??e formu??owane m.in. podczas konferencji pokojowej w Pary??u, polskie roszczenia terytorialne dotycz??ce ??l??ska Cieszy??skiego, regionu Czadeckiego, p????nocnej Orawy i p????nocnego Spiszu, by??y uzasadnione kryteriami j??zykowymi i etnicznymi, a arbitralne rozstrzygni??cia Rady Ambasador??w z 28 lipca 1920 roku, dziel??ce te obszary pomi??dzy Polsk?? a Czechos??owacj??, bez zachowania nadrz??dno??ci kryteri??w j??zykowo-etnicznych, by??y dla Polski oraz ludno??ci mieszkaj??cej na polsko-czechos??owackim pograniczu, niesprawiedliwe i krzywdz??ce.	Carte du Spisz, de l???Orawa et du district de Czaca	Spisz, Orawa, region Czadecki, pogranicze polsko-s??owackie, granica polsko-s??owacka	Kazimierz Nitsch	struktura narodowo??ciowa, struktura j??zykowa, Polacy, S??owacy	9	LITH. ING. W. Krzeptowski	600000		Rozmieszczenie ludno??ci polskiej i s??owackiej oraz ludno??ci m??wi??cej dialektami przej??ciowymi na pograniczu polsko-s??owackim oraz propozycja wytyczenia po??udniowej granicy Polski	1j3yfU2yjEZ4q9g37lYe1PSda2NHA9pss.jpg	2022-04-03 13:21:43.225903+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/1j3yfU2yjEZ4q9g37lYe1PSda2NHA9pss_copy.jpg
24		22	\N	, ok. 1919	Na mapie przedstawiono za pomoc?? szrafu, w trzech przedzia??ach liczbowych (powy??ej 75%; powy??ej 50%; oko??o 25%), rozmieszczenie i udzia?? procentowy ludno??ci polskiej na obszarze Orawy i Spiszu. Ponadto zaznaczono granic?? sprzed 1914 roku pomi??dzy W??grami a Austri?? (Galicj??), linie kolejowe, g????wne miasta oraz miasteczka i wsie na Spiszu i Orawie.\nNa mapie  podania ??r??de?? u??ytych danych liczbowych, mo??na jednak przypuszcza?? (na podstawie por??wna?? z innymi mapami z tego okresu), ??e zosta??a ona opracowana na podstawie wynik??w bada?? Kazimierza Nitscha, polskiego j??zykoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiello??skiego, jednego z ekspert??w delegacji polskiej na konferencj?? pokojow?? w Pary??u w 1919 roku. Oznacza to, ??e rozmieszczenie i liczba Polak??w zosta??o opracowane na podstawie kryteri??w j??zykowych.\nZ mapy wynika, ??e Orawa i Spisz, kt??re po zako??czeniu I wojny ??wiatowej by??y regionami spornymi na pograniczu polsko-s??owacki, by??y w??wczas zdominowane przez ludno???? polsk?? (polskoj??zyczn??). Najbardziej wyra??na, ponad 75% dominacja ludno??ci polskiej (polskoj??zycznej) jest widoczna zw??aszcza w p????nocnej cz????ci Orawy i Spiszu. Im dalej na po??udnie, tym sytuacja narodowo??ciowo-j??zykowa tych region??w by??a bardziej skomplikowana i niejednoznaczna. Dotyczy??o to zw??aszcza Spiszu, na kt??rym wyst??powa??y liczne ???wyspy j??zykowe???, w tym niemieckie. \nNa podstawie omawianej mapy, mo??na stwierdzi??, ??e formu??owane m.in. podczas konferencji pokojowej w Pary??u, polskie roszczenia terytorialne dotycz??ce p????nocnej Orawy i p????nocnego Spiszu, by??y uzasadnione kryteriami j??zykowymi i etnicznymi, a arbitralne rozstrzygni??cia Rady Ambasador??w z 28 lipca 1920 roku, dziel??ce te obszary pomi??dzy Polsk?? a Czechos??owacj??, bez zachowania nadrz??dno??ci kryteri??w j??zykowo-etnicznych, by??y dla Polski oraz ludno??ci mieszkaj??cej na polsko-s??owackim pograniczu, niesprawiedliwe i krzywdz??ce.\nW lewym g??rnym roku mapy znajduje si?? okr??g??a piecz??tka z napisem Komitet Narodowy Obrony Orawy, Spisza i Podhala w Warszawie.	Rozsiedlenie ludno??ci polskiej na Orawie i Spiszu	Orawa, Spisz, pogranicze polsko-s??owackie, granica polsko-s??owacka	Kazimierz Nitsch	struktura narodowo??ciowa, struktura j??zykowa, Polacy na Spiszu i Orawie	10	Sekcja Mi??o??nik??w G??r P.T.K. w Warszawie	300000		rozmieszczenie i udzia?? procentowy ludno??ci polskiej na Orawie i Spiszu	18qhsMLJXMmqgEnnrBhFjx1El1BPoeV4C.jpg	2022-04-03 13:21:43.249153+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/18qhsMLJXMmqgEnnrBhFjx1El1BPoeV4C_copy.jpg
25		23	\N	, ok. 1919	Na mapie zosta??y przedstawione proponowane granice Polski na tle procentowego udzia??u ludno??ci polskiej oraz historycznych granic Polski z roku 1772.\nUdzia?? ludno??ci polskiej zosta?? przedstawiony szrafem w sze??ciu r????nych przedzia??ach: wi??kszo???? polska, mniejszo???? (w domy??le polska) powy??ej 33%, mniejszo???? 20-33%, mniejszo???? 5-20%, mniejszo???? poni??ej 5% oraz mniejszo???? poza granicami proponowanego pa??stwa polskiego.\nNie podano ??r??de?? danych liczbowych u??ytych do wyznaczenia wielko??ci udzia??u ludno??ci polskiej w poszczeg??lnych regionach (co uniemo??liwia ich weryfikacj??), a tak??e autora oraz daty wykonania mapy.\nTre???? mapy sugeruje odwo??anie si??, przy wytyczaniu proponowanych granic Polski, do kryteri??w narodowo??ciowych oraz historycznych, jednak nie zawsze by??y one stosowane konsekwentnie. \nDo proponowanego terytorium Polski w????czono wszystkie regiony, gdzie Polacy stanowili wi??kszo???? mieszka??c??w (wed??ug danych wykorzystanych do opracowania mapy), tak??e te, kt??re wykracza??y poza granice przedrozbiorowe z 1772 roku (Spisz, Orawa, cz?????? Opolszczyzny i Dolnego ??l??ska oraz po??udniowe Mazury). W tych przypadkach zastosowano nadrz??dno???? kryterium narodowo??ciowego nad historycznym. Jednak do terytorium Polski w????czono tak??e regiony, kt??re przed 1772 rokiem znajdowa??y si?? w jej granicach, ale w momencie opracowywania omawianej mapy, Polacy byli w nich mniejszo??ci?? narodow??, niejednokrotnie relatywnie nieliczn?? (20-33% lub zaledwie 5-20% spo??r??d og????u mieszka??c??w). Dotyczy to g????wnie wschodniej cz????ci ??? Galicji Wschodniej, Podola, Wo??ynia, Polesia, wschodniej i p????nocnej Wile??szczyzny, ale tak??e zachodniej i p????nocnej cz????ci Wielkopolski, oraz cz????ciowo Warmii. W tych przypadkach zastosowano nadrz??dno???? kryterium historycznego nad narodowo??ciowym. Najbardziej jaskrawym przyk??adem jest p????nocna Warmia, ??u??awy i okolice Gda??ska. Natomiast w odniesieniu do zachodniej cz????ci Pomorza Gda??skiego, postanowiono ca??kowicie odej????, zar??wno od kryterium narodowo??ciowego, jak i historycznego, proponuj??c wytyczenie p????nocno-zachodniej granicy Polski na zach??d od granicy przedrozbiorowej, ponadto w regionie ze znikomym udzia??em ludno??ci polskiej (okolice S??upska). Postulowany szeroki dost??p Polski do morza (od okolic S??upska po Mierzej?? Wi??lan?? i Elbl??g), by?? oczywi??cie warunkowany czynnikami strategicznymi i gospodarczymi. \nProponowane p????nocne, zachodnie i cz????ciowo po??udniowe granice Polski, by??y ??? poza kilkoma wyj??tkami w cz????ci p????nocnej ??? zgodne z przyj??tym przez tw??rc??w mapy kryterium narodowo??ciowym oraz cz????ciowo z przebiegiem granicy z 1772 roku, natomiast granice wschodnie z oczywistych powod??w nie nawi??zywa??y do historycznych granic przedrozbiorowych, ponadto si??ga??y daleko na wsch??d od region??w, w kt??rych Polacy stanowili wi??kszo???? mieszka??c??w. \nPostulowane terytorium Polski, obejmowa??o bardzo rozleg??y obszar ??? na p????nocy z Pomorzem Gda??skim, Warmi?? i po??udniow?? cz????ci?? Mazur, na zachodzie z Wielkopolsk?? i Opolszczyzn??, na po??udniu z Oraw?? i Spiszem, na wschodzie si??ga??o daleko za Zbrucz, a na kra??cach p????nocno-wschodnich nie ogranicza??o si?? do Wile??szczyzny i Polesia, ale w????cza??o do Polski m.in. tak??e Mi??sk, Dyneburg i Po??ock. \nBy?? to zdecydowanie wi??kszy zakres terytorialny ni?? uda??o si?? ostatecznie Polsce uzyska?? w konsekwencji decyzji konferencji paryskiej, plebiscyt??w, powsta?? ??l??skich i wojny z Rosj?? bolszewick??.	Pologne et Pays Limitrophes	granice Polski, Polska		proponowane granice Polski, struktura narodowo??ciowa, Komitet Narodowy Polski	\N				proponowane granice Polski na tle procentowego udzia??u ludno??ci polskiej oraz historycznych granic Polski z roku 1772	1RZ-AINxdw2DBaveArdGhxr04sSYlFw_P.jpg	2022-04-03 13:21:43.262181+02		Mapa drukowana	thumbnails/1RZ-AINxdw2DBaveArdGhxr04sSYlFw_P_copy.jpg
26		24	\N	, po 1916	Na mapie przedstawiono granice Polski w r????nych okresach historycznych, w podziale na najdalsze granice Polski, granice Polski z roku 1772, granice pa??stw wasalnych, granice Ksi??stwa Warszawskiego z lat 1807-1815 oraz granice Kr??lestwa Polskiego z lat 1815-1831. Ponadto wypisano okresy czasowe, w kt??rych dane terytorium znajdowa??o si?? pod zwierzchnictwem Polski oraz kolorami zaznaczono zasi??gi poszczeg??lnych rozbior??w Polski wraz z pa??stwami zaborczymi. Zapisano tak??e nazwy g????wnych region??w geograficzno-historycznych.\nW efekcie mapa przedstawia wszystkie terytoria, kt??re kiedykolwiek bezpo??rednio nale??a??y do Polski lub by??y od Polski w jaki?? spos??b zale??ne, od Rugi, ??u??yc i Czech na zachodzie, po wybrze??e Morza Czarnego i Inflanty na wschodzie.\nPod legend?? znajduje si?? informacja, ??e zosta??a ona opracowana i wygrawerowana z serii map wydanych w 1916 roku przez Eugeniusza Romera, profesora geografii z Uniwersytetu Lwowskiego.	Historical map of Poland	granice Polski	Eugeniusz Romer	historyczne granice Polski, historyczne terytorium Polski, rozbiory	11	Rand McNally	, (podzia??ka)		granice Polski w r????nych okresach historycznych wraz z zaznaczeniem wszystkich terytori??w, kt??re kiedykolwiek bezpo??rednio nale??a??y do Polski lub by??y od Polski w jaki?? spos??b zale??ne	1m2a2KCNDdn_OgCfn11rVYQFskl_1e9L2.jpg	2022-04-03 13:21:43.282192+02		Mapa drukowana	thumbnails/1m2a2KCNDdn_OgCfn11rVYQFskl_1e9L2_copy.jpg
27		25	\N		Na mapie przedstawiono podzia?? polityczny ziem polskich przed I wojn?? na tle og??lnej struktury j??zykowej (obszar??w j??zykowych), w spos??b nie do ko??ca konsekwentny.\nW ramach podzia??u politycznego przedstawiono przedwojenne granice pa??stw zaborczych oraz w cz????ci zachodniej i po??udniowej g????wne regiony historyczno-geograficzne (Galicja, ??l??sk, Pozna??skie, Prusy Zachodnie, Prusy Wschodnie). Natomiast na obszarze zaboru rosyjskiego  jest odwo??ania do region??w historyczno-geograficznych, a zamiast nich przedstawiono podzia?? administracyjny na poszczeg??lne gubernie (na obszarze w????czonym do Cesarstwa Rosyjskiego) oraz Kr??lestwo Polskie (na pozosta??ym obszarze). Pomimo tego, ??e mapa zosta??a opracowana podczas I wojny (lub tu?? po niej), nie zaznaczono guberni che??mskiej utworzonej w roku 1912, a wydzielonej z Kr??lestwa Polskiego w roku 1915.\nPoza podzia??em polityczno-administracyjnym, mapa przedstawia ???obszary j??zykowe??? ??? polski, rusi??ski (ukrai??ski), bia??oruski i litewski.  jest wyszczeg??lnienia obszar??w z dominacj?? ludno??ci niemieckoj??zycznej. Ponadto w odniesieniu do ludno??ci m??wi??cej w j??zyku rusi??skim (ukrai??skim), bia??oruskim i litewskim, za pomoc?? kolor??w zaznaczono wy????cznie zwarte obszary na kt??rych stanowi ona ponad 50% og????u mieszka??c??w. Inn?? metod?? zastosowano wobec pokazania rozmieszczenia ludno??ci polskoj??zycznej, zaznaczaj??c kolorem obszar jej liczbowej dominacji, ale tak??e przedstawiaj??c szrafem mniejszo??ciowy udzia?? os??b pos??uguj??cych si?? j??zykiem polskim, w trzech przedzia??ach procentowych (25-50%; 10-25%; poni??ej 10%). Dzi??ki temu mo??liwe by??o pokazanie obecno??ci ludno??ci polskoj??zycznej na bardzo rozleg??ym obszarze, zdecydowanie wykraczaj??cym poza ???polski obszar j??zykowy???, szczeg??lnie na wschodzie (obejmuje wszystkie ziemie w granicach z 1772 roku), ale tak??e na zachodzie i po??udniu, gdzie w kilku miejscach wykracza poza granice przedrozbiorowe (Spisz, Orawa, Ksi??stwo Cieszy??skie, ??l??sk, Pomorze, Mazury). \nNie podano ??r??de?? statystycznych dotycz??cych struktury j??zykowej, co utrudnia weryfikacj?? danych.	The political subdivision of the Polish territory before the war and its linguistic areas.			struktura j??zykowa, Polacy, Ukrai??cy, Bia??orusini, Litwini, historyczne terytorium Polski	\N				podzia?? polityczny ziem polskich przed I wojn?? na tle og??lnej struktury j??zykowej (obszar??w j??zykowych) - polskiego, rusi??skiego (ukrai??skiego), bia??oruskiego, litewskiego	1WkjPYruEHs-0sBhT0CgAjvoV3RbfqRkP.jpg	2022-04-03 13:21:43.302897+02		Mapa r??kopi??mienna	thumbnails/1WkjPYruEHs-0sBhT0CgAjvoV3RbfqRkP_copy.jpg
28		26	\N	, prawdopodobnie 1919	Pomimo tego, ??e na mapie nie ma podanego nazwiska autora oraz daty jej wykonania, mo??na stwierdzi??, i?? jest to mapa z propozycj?? granic przysz??ego terytorium Polski przedstawiona wiosn?? 1919 roku przez polsk?? delegacj?? pod przewodnictwem Romana Dmowskiego, podczas Konferencji Paryskiej.\nNa mapie przedstawiono proponowane granice Polski na tle struktury narodowo??ciowej (j??zykowej), z podzia??em na Polak??w, Rusin??w (Ukrai??c??w), Litwin??w i Bia??orusin??w. Kolorami zaznaczono obszary, gdzie te cztery narodowo??ci stanowi?? od 50 do 100% og????u mieszka??c??w, natomiast dodatkowo, tylko w odniesieniu do ludno??ci polskiej (polskoj??zycznej), zaznaczono szrafem regiony gdzie s?? grup?? mniejszo??ciow??, w przedzia??ach 25-50%, 10-25% oraz mniej ni?? 10%.\nNie podano ??r??de?? danych statystycznych, co utrudnia ich weryfikacj??.\nPonadto na mapie naniesiono sie?? rzeczn??, g????wne miasta oraz granice innych pa??stw: Rosji, Niemiec, Czechos??owacji, W??gier i Rumunii. Zaznaczono tak??e obszary wyst??powania surowc??w mineralnych: w??gla i cynku na ??l??sku, ??elaza i miedzi w ??wi??tokrzyskim, soli w Ma??opolsce i ropy naftowej w Galicji Wschodniej.\nProponowane granice Polski nie nawi??zuj?? do granic historycznych z roku 1772 (co w roku 1919 by??o nierealne), ale z drugiej strony nie ograniczaj?? si?? tylko do region??w z wi??kszo??ci?? ludno??ci polskiej, nie s?? wytyczone wed??ug kryteri??w etnicznych. Zw??aszcza na wschodzie postulowane jest przy????czenie rozleg??ych obszar??w z dominacja ludno??ci litewskiej, bia??oruskiej i ukrai??skiej, a proponowana granica z Rosj?? zosta??a wytyczona zdecydowanie na wsch??d od dawnego Kr??lestwa Kongresowego, tak??e wyra??nie na wsch??d od Zbrucza czy Mi??ska oraz na p????noc od D??winy. R??wnie?? na zachodzie i p????nocy polskie ????dania terytorialne wzgl??dem Niemiec, dotyczy??y niejednokrotnie obszar??w z niewielkim udzia??em ludno??ci polskiej, zw??aszcza na Pomorzu, Warmii i Mazurach oraz zachodniej Opolszczy??nie. Z kolei proponowana granica po??udniowa obejmowa??a m.in. ??l??sk Cieszy??ski, Oraw?? i Spisz. Jednak najdalej szed?? postulat w????czenia w granice Polski ca??ego terytorium tzw. Litwy etnicznej.\nTaki kszta??t postulowanego terytorium przysz??ej Polski, odbiegaj??cy od kryteri??w historycznych oraz narodowo??ciowych (j??zykowych) by?? uzasadniony czynnikami gospodarczymi, strategicznymi i politycznymi.\nPostulowane terytorium Polski, zw??aszcza w cz????ci zachodniej i p????nocnej, by??o w ??wczesnych uwarunkowaniach politycznych, ma??o prawdopodobne do urzeczywistnienia. Nie uda??o si?? przeforsowa?? m.in. propozycji dotycz??cych ??l??ska Opolskiego i ca??o??ci G??rnego ??l??ska, ponadto Warmii i Mazur, Gda??ska czy szerszego dost??pu do Ba??tyku. Nierealny by?? tak??e postulat przy????czenia ca??ego terytorium Litwy. R??wnie?? ustalona ostatecznie w wyniku wojny polsko-bolszewickiej granica na wschodzie, by??a mniej korzystna, ni?? proponowana na omawianej mapie.	The proposed frontiers of Poland	granice Polski	Roman Dmowski	Konferencja Paryska, Komitet Narodowy Polski, delegacja polska, struktura narodowo??ciowa, struktura j??zykowa	\N				Propozycja granic przysz??ego terytorium Polski przedstawiona wiosn?? 1919 roku przez polsk?? delegacj?? pod przewodnictwem Romana Dmowskiego, podczas Konferencji Paryskiej.	1gB_U1of3C6dZHn3GuhhmfpcqaLaAPond.jpg	2022-04-03 13:21:43.325132+02		Mapa drukowana	thumbnails/1gB_U1of3C6dZHn3GuhhmfpcqaLaAPond_copy.jpg
33		31	\N	prawdopodobnie grudzie?? 1919 lub pocz??tek 1920	Mapa jest za????cznikiem do deklaracji Rady Najwy??szej mocarstw sprzymierzonych i stowarzyszonych w sprawie tymczasowych granic wschodnich RP z 8 grudnia 1919 roku. Przedstawia przebieg granic ju?? wyznaczonych oraz tych, kt??re powinny zosta?? ustalone. Dodatkowo prezentuje obszary plebiscytowe.\nNa uwag?? zas??uguje wytyczony na mapie przebieg polskiej granicy wschodniej, kt??ry zdecydowanie odbiega od ??wczesnych polskich postulat??w terytorialnych. Jest on bardzo zbli??ony do wsp????czesnego przebiegu granicy polskiej, od Karpat, wzd??u?? Bugu, po Suwalszczyzn??, z tym ??e w Bieszczadach oraz na Podlasiu, linia graniczna jest wytyczona jeszcze dalej na zach??d ni?? obecna wschodnia granica Polski. Poza terytorium Polski znajduje si?? m.in. Wile??szczyzna, Grodno, Bia??owie??a wraz z Puszcz?? Bia??owiesk??, Lw??w oraz cala Galicja Wschodnia. W lipcu 1920 roku, dyplomacja brytyjska, zaproponowa??a lini?? demarkacyjn?? pomi??dzy wojskami polskimi a rosyjskimi, zwan?? ???lini?? Curzona???, wzoruj??c j?? w g????wnych zarysach na linii granicznej pierwszy raz wytyczonej na omawianej mapie. Tak??e w??adze radzieckie w 1945 roku, postuluj??c wytyczenie nowej granicy pomi??dzy ZSRR a Polsk??, skutecznie odwo??ywa??y si?? do przebiegu granicy okre??lonej przez Rad?? Najwy??sz?? w grudniu 1919 roku i wyznaczonej na tej mapie. \n	Pologne	granice Polski	G. Clemenceau	proponowane granice Polski, obszary plebiscytowe, linia Curzona	\N		1000000		granice wymagaj??ce oraz nie wymagaj??ce delimitacji w terenie z zaznaczonymi obszarami plebiscytowymi	1hvulai1cPgp1pqxuHYm7cNd-KszBpKO8.jpg	2022-04-03 13:21:43.404817+02	https://drive.google.com/drive/folders/1KjBGsCNbn_Vpt_duxHBHAopMnSfLiFyg?usp=sharing	Mapa drukowana	thumbnails/1hvulai1cPgp1pqxuHYm7cNd-KszBpKO8_copy.jpg
34		32	\N		Na mapie przedstawiono procentowy udzia?? Polak??w wed??ug powiat??w na obszarze szeroko poj??tej tzw. historycznej Litwy, wraz z Suwalszczyzna, ziemi?? grodzie??sk?? oraz wschodnim Podlasiem, z Bia??ymstokiem i Bielskiem Podlaskim, czyli poza historyczne granice dawnego Wielkiego Ksi??stwa Litewskiego. Dane pochodz?? ze spisu z 1916 r. przeprowadzonego przez administracj?? niemieck??.\nMapa potwierdza dominuj??cy udzia?? ludno??ci polskiej na obszarze wschodniego Podlasia, Suwalszczyzny oraz w szerokim pasie ??rodkowej Litwy, wraz z Wile??szczyzn??, a tak??e powiatami na p????noc od Wilna. Udzia?? Polak??w na tych obszarach wynosi od 50 do 80%, a w niekt??rych powiatach (zw??aszcza na Wile??szczy??nie i w cz????ci Podlasia), przekracza 80%.  W mniejszym udziale (do 5 do 50%) ludno???? polska zamieszkiwa??a tak??e powiaty po??o??one zar??wno na po??udnie na Wile??szczyzny oraz ziemi grodzie??skiej, jak i na p????noc, a?? po Kiejdany.\n	Polonais en Lithuanie statistique allemande 1916. Copie d'un croquis officiel	Litwa, Suwalszczyzna, wschodnie Podlasie		spis ludno??ci, struktura narodowo??ciowa, Polacy na obszarze Litwy, Suwalszczyzny, wschodniego Podlasia	\N			Polonais en Lithuanie	Udzia?? Polak??w w og??lnej liczbie mieszka??c??w na szeroko poj??tym obszarze tzw. historycznej Litwy, wraz z Suwalszczyzn?? i wschodnim Podlasiem	1Ib7uPHNEjtyXl8Or3mK1gDjwxokcAD3r.jpg	2022-04-03 13:21:43.423225+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1Ib7uPHNEjtyXl8Or3mK1gDjwxokcAD3r_copy.jpg
50		48	\N		Na mapie przedstawiono udzia?? ludno??ci rzymsko-katolickiej w polsko-ruskiej cz????ci Galicji wg. stanu z 1910 roku. Dane zaprezentowano w postaci metody kropkowej z wskazaniem procentowego udzia??u rzymskich katolik??w w poszczeg??lnych gminach. ??r??d??em danych prawdopodobnie by austriacki spis powszechny z 1910 roku.\nU??yto czterech przedzia????w procentowych ??? mniej ni?? 25%, 25-50%, 50-75%, ponad 75%. Tylko przedzia?? najmniejszy zosta?? oznaczony kolorem niebieskim, wszystkie pozosta??e (od 25%) zaznaczono na czerwono. By?? to z pewno??ci?? zabieg celowy. W konsekwencji trudno jednoznacznie okre??li?? regiony z dominacj?? ludno??ci rzymsko-katolickiej, poniewa?? kolor czerwony, poza Karpatami, wyst??puje wsz??dzie, cho?? nie wsz??dzie oznacza ponad 50% udzia?? katolik??w obrz??dku ??aci??skiego, w??r??d kt??rych na terenie Galicji wyra??nie dominowa??a ludno???? narodowo??ci polskiej.\n	Ludno???? rzymsko-katolicka w polsko-ruskiej cz????ci Galicyi. I. Stan w r. 1910.	Galicja Wschodnia		wyznanie rzymsko-katolickie, mapa wyznaniowa, spis powszechny 1910	17	G. Freytag & Berndt, Wien	750000		ludno???? rzymsko-katolicka w Galicji w roku 1910	1HOc57xqNQy6TrLKAIIkqvYpIQO2waZBB.jpg	2022-04-03 13:21:43.703714+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV?usp=sharing	Mapa drukowana	thumbnails/1HOc57xqNQy6TrLKAIIkqvYpIQO2waZBB_copy.jpg
35		33	\N		Na mapie przedstawiono procentowy udzia?? Litwin??w wed??ug powiat??w na obszarze szeroko poj??tej tzw. historycznej Litwy, wraz ze ??mudzi??, Suwalszczyzn?? i wschodnim Podlasiem, a?? po Bia??ystok i Bielsk Podlaski, czyli poza historyczne granice dawnego Wielkiego Ksi??stwa Litewskiego. Dane pochodz?? ze spisu z 1918 r. przeprowadzonego administracj?? niemieck??.\nMapa potwierdza dominuj??cy udzia?? ludno??ci litewskiej na obszarze ??mudzi oraz p????nocnej i ??rodkowej Litwy. Udzia?? Litwin??w na tych obszarach wynosi od 50 do 80%, a w cz????ci p????nocnej przekracza 80%. \nJednocze??nie mapa potwierdza znikomy udzia?? Litwin??w w??r??d mieszka??c??w p????nocnej Wile??szczyzny oraz Suwalszczyzny i ich praktyczny  na po??udnie od Wilna, Grodna i Augustowa. \n	Lithuaniens en Lithuanie. D'apres la statistique allemande 1918	Litwa, ??mud??, Suwalszczyzna, wschodnie Podlasie		spis ludno??ci, struktura narodowo??ciowa, Litwini na szeroko pojetym obszarze tzw. historycznej Litwy	\N			Lithuaniens en Lithuanie	Udzia?? Litwin??w w og??lnej liczbie mieszka??c??w na szeroko poj??tym obszarze tzw. historycznej Litwy, wraz z Suwalszczyzn?? i wschodnim Podlasiem	1mm5LQ7jSijXbmOaBOVFPcWqmYq0R7-t6.jpg	2022-04-03 13:21:43.442121+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1mm5LQ7jSijXbmOaBOVFPcWqmYq0R7-t6_copy.jpg
36		34	\N		Pomimo tytu??u mapy sugeruj??cego, ??e dotyczy ona wy????cznie ludno??ci litewskiej, przedstawiono na niej procentowy udzia?? Litwin??w (kolor czarny) oraz Polak??w (kolor bia??y) w diecezji wile??skiej. Prezentowane dane s?? pochodn?? zapytanie Konsystorza Katolickiego z 1908 r. Zak??adaj??c, ??e na pocz??tku XX w., w??r??d katolik??w na tym obszarze zdecydowanie dominowali Litwini i Polacy, mo??na przyj????, ??e mapa przedstawia rozmieszczenie oraz struktur?? narodowo??ciow?? og????u ludno??ci katolickiej w diecezji wile??skiej. \nWyra??nie wida?? bardzo istotne dysproporcje w strukturze narodowo??ciowej ludno??ci nale????cej do diecezji wile??skiej. Katolicy narodowo??ci litewskiej przewa??ali w p????nocnej i zachodniej cz????ci diecezji, natomiast katolicy narodowo??ci polskiej ca??kowicie dominowali w centralnej i po??udniowej cz????ci, zw??aszcza na Wile??szczy??nie. \n	Lituaniens dans le dioc??se de Wilno. Enqu??te du Consistoire Catholique 1908	diecezja wile??ska, Wile??szczyzna, Litwa		Struktira narodowo??ciowa, katolicy, diecezja wile??ska, Litwini, Polacy	\N			Lituaniens dans le dioc??se de Wilno. 	Procentowy udzia?? Litwin??w i Polak??w w diecezji wile??skiej, struktura narodowo??ciowa katolik??w diecezji wile??skiej	1jxOCjv4vAtwZCOLnnwjseXY5ii-FPx9-.jpg	2022-04-03 13:21:43.456448+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1jxOCjv4vAtwZCOLnnwjseXY5ii-FPx9-_copy.jpg
37		35	\N		Tytu?? mapy sugeruje ograniczenie jej zasi??gu do Litwy i Rusi (Bia??oru?? i Ukraina), natomiast w rzeczywisto??ci mapa obejmuje bardzo rozleg??y obszar, obejmuj??cy poza Litw??, Bia??orusi?? i zdecydowan?? wi??kszo??ci?? Ukrainy, tak??e cz????ciowo ??otw?? oraz wschodnie Podlasie z Bia??ostocczyzn??.\nCa??y obszar zosta?? przedstawiony w podziale administracyjnym na gubernatorstwa oraz wchodz??ce w ich sk??ad dystrykty.\n	Lithuanie et Ruthenie	Litwa, Bia??oru??, Ukraina		podzia?? administracyjny	\N		5000000		podzia?? administracyjny Litwy, Bia??orusi, Ukrainy oraz fragmentu ??otwy i Podlasia	12UnPfMY86-khkdF4u5orDRCixwS_E-yX.jpg	2022-04-03 13:21:43.472653+02	https://drive.google.com/drive/folders/15CILHwTWajYurkxrQyaw-rN9chNYeU-g?usp=sharing	Mapa drukowana	thumbnails/12UnPfMY86-khkdF4u5orDRCixwS_E-yX_copy.jpg
38		36	\N	1915	Na mapie, opublikowanej w 1915 r., przedstawiono wizj?? podzia??u politycznego Europy po zako??czeniu I wojny ??wiatowej, wraz z nowym przebiegiem granic pa??stwowych, z perspektywy angielskiej.\nJak w przypadku zdecydowanej wi??kszo??ci ???map futurystycznych??? rzeczywisto???? okaza??o si?? w bardzo wielu aspektach odmienna od przewidywa??, jednak na uwag?? zas??uguje pojawienie si?? na mapie z 1915 r. Polski, powsta??ej kosztem utraty cz????ci ziem przez wszystkich trzech zaborc??w, co okaza??o si?? prorocze. Pomimo tego, ??e wytyczone na mapie terytorium przysz??ej Polski, okaza??o si??, zw??aszcza na p????nocy i po??udniowym ??? wschodzie, istotnie wi??ksze ni?? realnie ukszta??towane po wojnie, to jednak przewidywany kszta??t Polski, du??o lepiej oddawa?? rzeczywisto????, ni?? przewidywania dotycz??ce przysz??o??ci Austro-W??gier czy Ba??kan??w. \n	L'EUROPE APRES LA GUERRE. CARTE EN PERSPECTIVE dessinee et publiee par la Societe ANGLO-CONTINENTALE & INTERNATIONALE LE 3 aout 1914	Europa, Polska		przewidywany podzia?? polityczny Europy	13			L'EUROPE APRES LA GUERRE.	wizja zmian granic pa??stwowych w Europie po I wojnie ??wiatowej	15tit5BKNRlTvYBgb_tK9XiNYjt0S8SCV.jpg	2022-04-03 13:21:43.493097+02		Mapa drukowana	thumbnails/15tit5BKNRlTvYBgb_tK9XiNYjt0S8SCV_copy.jpg
39		37	\N		Na mapie przedstawiaj??cej schemat sieci kolejowej wraz z granicami rozbiorowymi, zaznaczono odr??cznie kredk??, przebieg postulowanych zachodnich granic Polski wed??ug raportu Komisji dla spraw polskich. Mapa jest za????cznikiem do listu przes??anego do ministra spraw zagranicznych Ignacego Paderewskiego. Tre???? korespondencji zawiera szczeg????owy opis przebiegu granicy.\nWytyczony na mapie przebieg granicy polsko-niemieckiej, odbiega, zw??aszcza na ??l??sku i Pomorzu, od ostatecznie ustalonych granic. \n	Ziemie polskie zaboru pruskiego	granica polsko-niemiecka	Ignacy Jan Paderewski, Jules Cambon, William Tyrrel, Isaiah Bowman,	Komisja dla spraw polskich	\N		750000		propozycja zachodnich granic Polski wed??ug raportu Komisji dla spraw polskich	1k0qShA2HKg-w8sEd2_rOVQM6WaZMHNZ8.jpg	2022-04-03 13:21:43.510221+02	https://drive.google.com/drive/folders/15CILHwTWajYurkxrQyaw-rN9chNYeU-g?usp=sharing	Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1k0qShA2HKg-w8sEd2_rOVQM6WaZMHNZ8_copy.jpg
53		51	\N		Na mapie zaznaczono proponowane przebiegi granic na obszarze Galicji. Mapa zawiera dawne granice administracyjne Galicji Wschodniej, dawne granice powiat??w oraz nowe granice, zar??wno Galicji Wschodniej, jak i wchodz??cych w jej sk??ad powiat??w, wyznaczone wed??ug Statutu dla Galicji Wschodniej.		Galicja Wschodnia		granice, Statut dla Galicji Wschodniej	\N				propozycje szczeg????owego przebiegu nowych granic administracyjnych w Galicji	1xi7-kVjySUH8G2TpjZuKx4vhN9ZoBKhD.jpg	2022-04-03 13:21:43.757227+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1xi7-kVjySUH8G2TpjZuKx4vhN9ZoBKhD_copy.jpg
40		38	\N		Na mapie przedstawiono rozmieszczenie i liczebno???? ludno??ci niemieckiej w zachodniej Polsce wed??ug oficjalnego spisu powszechnego z 1910 lub 1905 r., statystyki zawod??w i innych urz??dowych publikacji.\nPomimo zawartego w tytule okre??lenia ???zachodnia Polska???, mapa obejmuje wi??kszy obszar ni?? ten, kt??ry znalaz?? si?? w granicach Polski w konsekwencji decyzji konferencji paryskiej. Jest to wyra??nie widoczne zar??wno na Mazurach, Pomorzu Gda??skim, Wielkopolsce, jak i G??rnym ??l??sku oraz Opolszczy??nie.  \nAutor mapy, dzieli Niemc??w zamieszkuj??cych na tym obszarze na ludno???? bezpo??rednio zale??n?? od rz??du (urz??dnicy, wojskowi, osadnicy zamieszkuj??cy mieszkania publiczne), zaznaczaj??c ich kolorem czerwonym oraz kolonist??w osiedlonych przez rz??d pruski od 1886 r., tylko cz????ciowo zale??nych od rz??du lub ca??kowicie niezale??nych od polityk??w (kolor niebieski).\nWed??ug autora mapy, ludno???? niemiecka bezpo??rednio uzale??niona od w??asnego rz??du, zdecydowanie dominuje na tym obszarze, zw??aszcza na G??rnym ??l??sku, Opolszczy??nie, Mazurach i Pomorzy Gda??skim. Natomiast w Wielkopolsce, Kujawach, Powi??lu oraz na Kaszubach, zamieszkuje zar??wno ludno???? zale??na od rz??du (zw??aszcza w miastach), jak i koloni??ci niezale??ni od polityk??w (szczeg??lnie na terenach wiejskich).\n	The German population in West Poland	zachodnia Polska, Pomorze Gda??skie, Mazury, Wielkopolska, G??rny ??l??sk, Opolszczyzna		ludno???? niemiecka	\N				ludno???? niemiecka w zachodniej Polsce	1dmirt85xe4oACzQtMtWE-Zn-0Ul8MGvk.jpg	2022-04-03 13:21:43.529298+02		Mapa r??kopi??mienna	thumbnails/1dmirt85xe4oACzQtMtWE-Zn-0Ul8MGvk_copy.jpg
42		40	\N		Na mapie zaprezentowano dominuj??cy udzia?? ludno??ci niemieckiej lub polskiej na obszarze wschodnich prowincji Rzeszy Niemieckiej. \nJest to mapa w j??zyku niemieckim wydana w Niemczech, w zak??adzie kartograficznym Perthesa, przedstawiaj??ca przewa??aj??cy udzia?? ludno??ci niemieckiej lub polskiej w poszczeg??lnych gminach wschodniej cz????ci Prus. Kolorem oraz szrafem przedstawiono procentowy udzia?? Niemc??w (kolor czerwony) oraz Polak??w (kolor zielony) w trzech przedzia??ach: powy??ej 50 %; powy??ej 70% oraz powy??ej 85% na tle podzia??u administracyjnego na gminy, powiaty, rejencje i prowincje. Mapa zosta??a wykonana na podstawie danych pruskiego spisu powszechnego z 1910 roku, kt??ry zani??a?? udzia?? ludno??ci polskiej. W spisie tym narodowo???? by??a ustalana na podstawie odpowiedzi na pytanie o j??zyk ojczysty, a w pruskim spisie powszechnym m.in. istnia??a mo??liwo???? zadeklarowania dw??ch j??zyk??w i cz?????? Polak??w, znaj??cych tak??e j??zyk niemiecki, deklarowa??o j??zyk polski wraz z niemieckim, co skutkowa??o zaliczeniem ich do tzw. ???os??b dwuj??zycznych???.\nPomimo tego, mapa jednoznacznie obrazuje dominacj?? w 1910 roku ludno??ci polskiej (deklaruj??cej u??ywanie j??zyka polskiego) w strukturze narodowo??ciowej mieszka??c??w rozleg??ych obszar??w wschodniej cz????ci ??wczesnych Prus, m.in.: po??udniowej cz????ci Mazur, Kaszub, Wielkopolski, G??rnego ??l??ska, Opolszczyzny i p????nocno-wschodniej cz????ci Dolnego ??l??ska.\nMapa ta po zako??czeniu I wojny budzi??a liczne kontrowersje i dyskusje. By??a niejednokrotnie krytykowana przez niemieckich kartograf??w, kt??rzy zarzucali jej b????dy metodologiczne, a nawet fa??szerstwa, z kolei opinie polskich kartograf??w by??y przychylne (szerzej M. G??rny, 2017, Kre??larze ojczyzn. Geografowie i granice mi??dzywojennej Europy, s. 141-145).  	Nationalit??tenkarte der ??stlichen Provinzen des Deutschen Reichs nach den Ergebnissen der amtlichen  Volkszahlung vom Jahre 1910	Wschodnie prowincje Rzeszy Niemieckiej, Mazury, Wielkopolska, ??l??sk, Opolszczyzna, Pobrze??e Gda??skie, Kaszuby		pruski spis powszechny 1910 roku, struktura narodowo??ciowa, struktura j??zykowa, Niemcy, Polacy	15	Gotha: Justus Perthes	500000	Nationalit??tenkarte der ??stlichen Provinzen des Deutschen Reichs	Mapa narodowo??ciowa wschodnich prowincji Rzeszy Niemieckiej na podstawie wynik??w spisu ludno??ci z 1910 r. 	17HXvGMonyJANUXQfvJ1ivdz_5IwcW8nJ.jpg	2022-04-03 13:21:43.566119+02		Mapa drukowana	thumbnails/17HXvGMonyJANUXQfvJ1ivdz_5IwcW8nJ_copy.jpg
43		41	\N	1919	Mapa nr I ilustruj??ca memoria?? "Polska i Finlandia" z roku 1919.\nObejmuje rozleg??y obszar Europy ??rodkowo-Wschodniej, od p????nocnej Finlandii, po Morze Czarne. Wyr????niono na niej terytoria zasiedlone przez poszczeg??lne narody ??? Fin??w, Esto??czyk??w, ??otyszy, Litwin??w, Niemc??w, Polak??w, Bia??orusin??w, Ukrai??c??w, Czech??w, S??owak??w, W??gr??w, Rumun??w. Pomimo pewnego schematyzmu i uog??lnie??, zaznaczone obszary generalnie s?? zgodne z rzeczywistym ??wczesnym rozmieszczeniem dominacji liczebnej poszczeg??lnych narodowo??ci. Natomiast na mapa nie uwzgl??dniono, bardzo licznych w tej cz????ci Europy, rozproszonych mniejszo??ci narodowych.\nZasadniczym elementem mapy jest wyra??nie zaznaczona ???zachodnia granica Rosji???, biegn??ca od Morza Bia??ego na p????nocy, poprzez Petersburg i okolice Lwowa do Karpat, a nast??pnie wschodni?? granic?? Rumunii do Mora Czarnego w okolicach Odessy.\nZgodnie z przyj??tymi przez Autora mapy za??o??eniami, regiony zamieszkane przez Ukrai??c??w i Bia??orusin??w oraz liczn?? tam mniejszo???? polsk?? (za wyj??tkiem fragment??w z dominacj?? ludno??ci katolickiej), powinny zosta?? w????czone do Rosji. \nRzeczywista zachodnia granica Rosji, ustalona w roku 1921, nie odbiega??a zasadniczo od propozycji przedstawionej na omawianej mapie.\n	 Finlandia i Polska I	Europa ??rodkowo-Wschodnia, Polska, Finlandia		struktura narodowo??ciowa, front antyrosyjski	10				zr????nicowanie narodowo??ciowe Europy ??rodkowo-Wschodniej oraz propozycja podzia??u tego regionu pomi??dzy Rosj?? a pozosta??e narody 	1feADX0lwLKF05l9QsqQFm-Pu4LnqrvLN.jpg	2022-04-03 13:21:43.588815+02	https://drive.google.com/drive/folders/1J0iVuKiQIpnP71ztxLMurhKYIY9vVUCp?usp=sharing	Mapa r??kopi??mienna	thumbnails/1feADX0lwLKF05l9QsqQFm-Pu4LnqrvLN_copy.jpg
44		42	\N	1915	Mapa fizyczno-geograficzna Galicji i Bukowiny, obrazuj??ca przede wszystkim ukszta??towanie powierzchni oraz sie?? rzeczn??, ale tak??e uwzgl??dniaj??ca sie?? komunikacyjn?? i jednostki osadnicze.	Mapa Galicyi i Bukowiny z Wielkim Ksi??stwem Krakowskiem	Galicja, Bukowina		Galicja	16	Gubrynowicz i Syn	700000		ukszta??towanie powierzchni i sie?? rzeczna Galicji i Bukowiny	1QuEvNoXt0BZqXfbla06cSGyTqZ0EDqSy.jpg	2022-04-03 13:21:43.607826+02		Mapa drukowana z odr??cznymi adnotacjami	thumbnails/1QuEvNoXt0BZqXfbla06cSGyTqZ0EDqSy_copy.jpg
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
9	T.	Skowro??ski
10	W??adys??aw	Semkowicz
11	Eugeniusz	Romer
12	F.	Pilczek
13	Jakob	Spett
14	Stanis??aw	Majerski
15	Teofil	Szuma??ski
16	M.	??wi??chowski
\.


--
-- Data for Name: map_browser_publicationplaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_publicationplaces (id, city_name, country_name) FROM stdin;
2	Wroc??aw	
3	Lausanne	Szwajcaria
4	 (wersja drukowana), natomiast elementy naniesione odr??cznie wykonano w Brnie	 (wersja drukowana), natomiast elementy naniesione odr??cznie wykonano w Czechos??owacji
5	Warszawa	[Polska]
6	, prawdopodobnie Pary??	, prawdopodobnie Francja
7	Pary??	Francja
8	Krak??w	Polska
9	Cracovie	Polska
10	Warszawa	Polska
11	New York	Stany Zjednoczone
12	Warszawa, Krak??w	Polska
13		Wielka Brytania
14	Pozna??	
15	Gotha	Niemcy
16	Lw??w	
17	Wiede??	Austria
18	Warszawa	
\.


--
-- Data for Name: map_browser_subjecttypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_subjecttypes (id, name) FROM stdin;
1	Gospodarcza
2	Spo??eczna
3	Polityczna
4	Administracyjna
5	Og??lnogeograficzna
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

SELECT pg_catalog.setval('public.auth_user_id_seq', 8, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.map_browser_archive_id_seq', 51, true);


--
-- Name: map_browser_languages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_languages_id_seq', 5, true);


--
-- Name: map_browser_map_authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_authors_id_seq', 22, true);


--
-- Name: map_browser_map_creator_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_creator_id_seq', 108, true);


--
-- Name: map_browser_map_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_id_seq', 56, true);


--
-- Name: map_browser_map_language_id_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_language_id_id_seq', 59, true);


--
-- Name: map_browser_map_subject_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_map_subject_type_id_seq', 71, true);


--
-- Name: map_browser_people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.map_browser_people_id_seq', 16, true);


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

