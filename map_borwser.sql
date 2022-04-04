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
2	Testing4321	\N	f	MarekBarwiński	Marek	Barwiński		f	t	2022-04-03 13:21:42.814959+02
3	Testing4321	\N	f	ElżbietaKościk	Elżbieta	Kościk		f	t	2022-04-03 13:21:42.817617+02
4	Testing4321	\N	f	KawalecSuleja	Kawalec	Suleja		f	t	2022-04-03 13:21:43.40949+02
5	Testing4321	\N	f	KuźmaMarek	Kuźma	Marek		f	t	2022-04-03 13:21:43.612896+02
6	Testing4321	\N	f	Barwiński	Barwiński			f	t	2022-04-03 13:21:43.615918+02
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
4	Archiwum Akt Nowych w Warszawie	107/56	AAN/463 Ambasada RP w Paryżu/107/56	Ambasada RP w Paryżu
5	Archiwum Akt Nowych w Warszawie	84	Kolekcja kartograficzna	AAN/260 Kolekcja kartograficzna/84
6	Archiwum Akt Nowych w Warszawie	83	AAN/260 Kolekcja kartograficzna/83	Kolekcja kartograficzna
7	Archiwum Akt Nowych w Warszawie	79/30	Delegacja Polska na Konferencję Pokojową w Paryżu	AAN/40 Delegacja Polska na Konferencję Pokojową w Paryżu/79/30
8	Archiwum Akt Nowych w Warszawie	927/28	AAN/100 Archiwum Padarewskiego/927/28	Archiwum Paderewskiego
9	Archiwum Akt Nowych w Warszawie	928/105	AAN/100 Archiwum Padarewskiego/928/105	Archiwum Paderewskiego
10	Archiwum Akt Nowym w Warszawie	928/106	AAN/100 Archiwum Padarewskiego/928/106	Archiwum Paderewskiego
11	Archiwum Akt Nowych w Warszawie	920/4	AAN/100 Archiwum Padarewskiego/920/4	Archiwum Paderewskiego
12	Archiwum Akt Nowych w Warszawie	928/107	AAN/100 Archiwum Padarewskiego/928/107	Archiwum Paderewskiego
13	Archiwum Akt Nowych w Warszawie	928/108	AAN/100 Archiwum Padarewskiego/928/108	Archiwum Paderewskiego
14	Archiwum Akt Nowych w Warszawie	315/41	AAN/39 Komitet Narodowy Polski w Paryżu/315/41	Komitet Narodowy Polski w Paryżu
15	Archiwum Akt Nowych w Warszawie	79/29	AAN/40 Delegacja Polska na Konferencję Pokojową w Paryżu/79/29	Delegacja Polska na Konferencję Pokojową w Paryżu
16	Archiwum Akt Nowych w Warszawie	17/96	AAN/40 Delegacja Polska na Konferencję Pokojową w Paryżu/17/96	Delegacja Polska na Konferencję Pokojową w Paryżu
17	Archiwum Akt Nowych w Warszawie	896/3	AAN/100 Archiwum Padarewskiego/896/3	Archiwum Paderewskiego
18	Archiwum Akt Nowych w Warszawie	867/7	AAN/100 Archiwum Padarewskiego/896/7	Archiwum Paderewskiego
19	Archiwum Akt Nowych w Warszawie	896/2	AAN/100 Archiwum Padarewskiego/896/2	Archiwum Paderewskiego
20	Archiwum Akt Nowych w Warszawie	896/6	AAN/100 Archiwum Padarewskiego/896/6	Archiwum Paderewskiego
21	Archiwum Akt Nowych w Warszawie	920/113	AAN/100 Archiwum Padarewskiego/920/113	Archiwum Paderewskiego
22	Archiwum Akt Nowych w Warszawie	920/114	AAN/100 Archiwum Padarewskiego/920/114	Archiwum Paderewskiego
23	Archiwum Akt Nowych w Warszawie	1860/179	AAN/39 Komitet Narodowy Polski w Paryżu/1860/179	Komitet Narodowy Polski
24	Archiwum Akt Nowych w Warszawie	884/67	AAN/100 Archiwum Padarewskiego/884/67	Archiwum Paderewskiego
25	Archiwum Akt Nowych w Warszawie	884/65	AAN/100 Archiwum Padarewskiego/884/65	Archiwum Paderewskiego
26	Archiwum Akt Nowych w Warszawie	884/66	AAN/100 Archiwum Padarewskiego/884/66	Archiwum Paderewskiego
27	Archiwum Akt Nowych w Warszawie	920/93	AAN/100 Archiwum Padarewskiego/920/93	Archiwum Paderewskiego
28	Archiwum Akt Nowych	931/7	AAN/100 Archiwum Padarewskiego/931/7	Archiwum Paderewskiego
29	Archiwum Akt Nowych	933/20	AAN/100 Archiwum Padarewskiego/933/20	Archiwum Padarewskiego
30	Archiwum Akt Nowych	122/72	AAN/39 Komitet Narodowy Polski w Paryżu/122/72	Komitet Narodowy Polski w Paryżu
31	Archiwum Akt Nowych	73/7	AAN/40 Delegacja Polska na Konferencję Pokojową w Paryżu/73/7	Delegacja Polska na Konferencję Pokojową w Paryżu
32	Archiwum Akt Nowych	153/69	AAN/40 Delegacja Polska na Konferencję Pokojową w Paryżu/153/69	Delegacja Polska na Konferencję Pokojową w Paryżu
33	Archiwum Akt Nowych	153/70	AAN/40 Delegacja Polska na Konferencję Pokojową w Paryżu/153/70	Delegacja Polska na Konferencję Pokojową w Paryżu
34	Archiwum Akt Nowych	153/76	AAN/40 Delegacja Polska na Konferencję Pokojową w Paryżu/153/76	Delegacja Polska na Konferencję Pokojową w Paryżu
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
5		Hiszpański
\.


--
-- Data for Name: map_browser_map; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_map (id, additional_notes, archive_id_id, corrector_id_id, created_at, description, full_title, keyword_geo, keyword_name, keyword_subject, publication_place_id, publishing_address, scale, short_title, subject, filename, added_at, source_text, creation_type, thumbnail) FROM stdin;
56		\N	\N			TestowaMapaAWS				\N		1	TestowaMapaAWS		maps/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_xXihjc3.jpg	2022-04-03 23:14:04.647588+02			thumbnails/The_Science-Backed_Benefits_of_Being_a_Dog_Owner_copy.jpg
2		\N	\N	1913	Zmiana opisu	Übersichtskarte des Oberschlesischen Industriebezirks. Aus Anlass des XII. Allgemeinen Deutschen Bergmannstages zu Breslau 1913				2	Herausgegeben vom Oberschlesischer Berg- und Hüttenmännischer Verein in Kattowitz, bearbeitet im Kӧniglichen Oberbergamte zu Breslau durch Oberbergamts-Markscheider Jahr.  Pneumadruck F. Pietsch	100000	Übersichtskarte des Oberschlesischen Industriebezirks.	górnictwo, hutnictwo, węgiel kamienny, spis przedsiębiorstw przemysłowych Górnośląskiego Związku Przemysłowców Górniczo-Hutniczych:  górnictwo, hutnictwo, węgiel kamienny	1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg.jpg	2022-04-03 13:21:42.77254+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1Gkh1Q6gwXuO24p9ddsYfjBprmhhiJuFg_copy.jpg
4		2	\N	 daty, po 1905 roku	Mapa przedstawia strukturę narodowościową ludności Królestwa Polskiego, w podziale na powiaty. Za pomocą zróżnicowania szrafu oraz kolorów, przedstawiono zarówno udział procentowy mniejszości narodowych w poszczególnych powiatach (w sześciu przedziałach od 1 do 50%) oraz główne narodowości (Polacy, Niemcy, Żydzi, Rosjanie i Rusini oraz Litwini). Poza powiatami przedstawiono także strukturę narodowościową dwóch największych miast – Warszawy i Łodzi.\nNa zdecydowanej większości obszaru Królestwa Polskiego dominuje ludność polska, a najliczniejszą i obecną we wszystkich powiatach mniejszością są Żydzi oraz w okolicach Łodzi i w powiatach zachodnich Niemcy. Jedynie w północno-wschodniej części guberni suwalskiej dominuje ludność litewska, przy niewielkim udziale Polaków, Niemców i Żydów, a w trzech powiatach południowo-wschodnich (Włodawa, Chełm, Hrubieszów) nieznacznie przeważają Rosjanie i Rusini (faktycznie chodzi o ludność ukraińską), a Polacy, Niemcy i Żydzi są grupami mniejszościowymi, przy czym udział ludności polskiej wynosi 35-50%.\nNie podano źródeł danych oraz daty wykonania mapy. Można jednak przypuszczać, że została ona opracowana na podstawie wyników rosyjskiego powszechnego spisu ludności z roku 1897. Był to pierwszy i ostatni powszechny spisu ludności przeprowadzony w carskiej Rosji. Objął także gubernie wchodzące w skład Królestwa Polskiego. Nie zawierał pytania o narodowość, którą ustalano na podstawie odpowiedzi na pytanie o język ojczysty. W trakcie tego spisu w celu zwiększenia liczby Rosjan, osoby deklarujące język ukraiński i białoruski (lub dialekty tych języków), były często zaliczane do ludności rosyjskojęzycznej, ewentualnie traktowani wspólnie jako Rusini. Następnie łącznie podawana była liczebność „Rosjan i Rusinów”, podobnie jak na tej mapie. W rzeczywistości południowo-wschodnie powiaty Królestwa Kongresowego na początku XX wieku były zamieszkane przez Ukraińców (ewentualnie Rusinów), a nie „Rosjan i Rusinów”. \nWyniki tego spisu zostały ostatecznie opublikowane w roku 1905, więc mapa nie mogła powstać wcześniej, z kolei w roku 1912 z Królestw Polskiego została wyłączona Gubernia Chełmska, czego ta mapa nie uwzględnia. Nie oznacza to jednak, że nie mogła powstać po roku 1912.Wykorzystywanie przez polskie instytucje, na potrzeby przedstawianie argumentów za polskością Śląska, Wielkopolski, Pomorza oraz Warmii i Mazur, danych pochodzących z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, było uzasadnione m.in. tym, że w spisach powszechnych narodowość była ustalana na podstawie odpowiedzi na pytanie o język ojczysty, a statystyka pruska wyszczególniała obok języka polskiego, także język kaszubski i mazurski, co skutecznie zmniejszało liczbę osób deklarujących język polski (a tym samym liczbę osób zaliczonych do polskiej narodowości). Ponadto w pruskim spisie powszechnym istniała możliwość zadeklarowania dwóch języków i część Polaków, znających także język niemiecki, deklarowało język polski wraz z niemieckim, co skutkowało zaliczeniem ich do tzw. „osób dwujęzycznych”.\n	Królestwo Polskie (pod względem etnograficznym)	Królestwo Polskie, Kongresówka		struktura narodowościowa, spis rosyjski z 1897 roku	\N			Królestwo Polskie	struktura narodowościowa ludności Królestwa Polskiego w podziale na powiaty według danych spisu powszechnego z 1897 roku	1voYIurZMGyYMAlFj2SJG-d_ufN8dZyQQ.jpg	2022-04-03 13:21:42.838545+02		Mapa rękopiśmienna	thumbnails/1voYIurZMGyYMAlFj2SJG-d_ufN8dZyQQ_copy.jpg
6		4	\N	 daty, wersja drukowana wykonana ok. 1923 roku, natomiast elementy naniesione odręcznie wykonano w lutym 1924 roku	Mapa obejmuje pogranicze polsko-czechosłowackie na północnym Spiszu i w Tatrach Wysokich. Składa się z części drukowanej oraz naniesionych odręcznie, zaznaczonych szrafem i kolorami, różnych wersji linii granicznych. Posiada także dwie legendy, druga (na doklejonej kartce) dotyczy elementów naniesionych odręcznie.  \nNa drukowanej mapie topograficznej obejmującej północny Spisz, Tatry Wysokie i niewielki fragment Podhala, zostały przedstawione różne wersje przebiegu granicy polsko-czechosłowackiej proponowane i ustalane w latach 1920-1922. Są to: linia graniczna na podstawie traktatu z Sevres (10 sierpnia 1920), tzw. „linia Ambasadorów” (po decyzji z 28 lipca 1920), linia graniczna proponowana przez Polskę, linia graniczna nie wyznaczona decyzją z 28 lipca 1920, linia graniczna przegłosowana przez Komisję Delimitacyjną (25 września 1922) oraz polski projekt linii kolejowej do Nowego Targu-Jaworzyny-Roztoki. \nNatomiast odręczne naniesione, kolorowe linie graniczne, są wersją późniejszą i zostały – według informacji umieszczonej na dodatkowej legendzie mapy – dodane w konsekwencji posiedzenia Komisji Delimitacyjnej w Brnie (Czechosłowacja) 11 lutego 1924 roku. \nKolorami zaznaczony jest przebieg dwóch granic istniejących przed 1924 rokiem, czyli dawnej granicy między Galicją i Węgrami (kolor zielony) oraz granicy wytyczonej na podstawie decyzji Rady Ambasadorów z 28 lipca 1920, czyli tzw. „linii Ambasadorów” (kolor czerwony). Co jednak istotniejsze, dodano trzy kolejne, nie zaznaczone na wcześniejszej wersji drukowanej, warianty przebiegu granicy polsko-czechosłowackiej – propozycję polską, częściowo odmienną od zamieszczonej na wersji drukowanej (kolor żółty), propozycję czechosłowacką sprzed posiedzenia Komisji Delimitacyjnej (kolor niebieski) oraz modyfikację propozycji czechosłowackiej w rozumieniu Komisji Delimitacyjnej (kolor czarny).\nPodstawowymi punktami spornymi, przedstawionymi na mapie, jest podział północnego Spiszu pomiędzy Polskę a Czechosłowacją oraz określenie przynależności państwowej Doliny Jaworzyny.\nSpisz do I wojny światowej znajdował się w granicach Węgier. Po rozpadzie monarchii Austro-Węgierskiej oraz zakończeniu wojny, nowopowstała Czechosłowacja rościła pretensje terytorialne do całego obszaru północnych Węgier, z kolei liczna na północnym Spiszu ludność polska, domagała się przyłączenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Paryżu, podjęto decyzję o przeprowadzeniu na północnym Spiszu w połowie 1920 roku plebiscytu, który miał zadecydować o przynależności politycznej tego obszaru. Ostatecznie plebiscytu nie przeprowadzono (z powodu wojny polsko-bolszewickiej), a podziału północnego Spiszu dokonała Rada Ambasadorów 28 lipca 1920 roku, przyznając Polsce jego niewielki fragment, co nie zakończyło sporów terytorialnych polsko-czechosłowackich. Nie rozstrzygnięto wówczas także przynależności państwowej Doliny Jaworzyny.\nNa mapie widać bardzo dużą zbieżność, zaznaczonych kolorami w lutym 1924 roku, linii granicznych dzielących północny Spisz pomiędzy Polskę a Czechosłowację. Propozycją polska (kolor żółty) oraz czechosłowacka (kolor niebieski) z lutego 1924 roku, są na tym odcinku całkowicie zbieżne, a pomiędzy nimi a przebiegiem wcześniejszej „linii Ambasadorów” z lipca 1920 roku (kolor czerwony), jest tylko kilka nieznacznych różnic. Jedyna istotna modyfikacja propozycji czechosłowackiej (kolor czarny) dotyczyła obszaru na południe od wsi Jurgów i Brzegi, była korzystna dla Polski. \nCo ważne, granica polsko-czechosłowacka na północnym Spiszu, wytyczona odręcznie na tej mapie w lutym 1924 roku, przetrwała do czasów współczesnych, obecnie jako granica polsko-słowacka. \nNatomiast istotne różnice widoczne na mapie dotyczą przebiegu granicy w Tatrach Wysokich. Propozycja polska włączała do Polski położoną na wschód od Morskiego Oka i Roztoki, Dolinę Jaworzyny (kolor żółty), co nie było akceptowane przez stronę czechosłowacką, pomimo tego, że propozycja z lutego 1924 roku, postulowała przyłączenie tego fragmentu Tatr w mniejszym zakresie terytorialnym (w części wschodniej) niż wcześniejsza propozycja polska z roku 1920 (widoczna na mapie w wersji drukowanej).\nCiekawie przedstawia się porównanie wcześniejszej propozycji polskiej (wersja drukowana), kolejnej propozycji polskiej z lutego 1924 roku (kolor żółty) oraz linii granicznej przegłosowanej przez Komisję Delimitacyjną 25 września 1922 roku (wersja drukowana). Ta ostatnia propozycja postulowała włączenie do Polski części Tatr Wysokich na wschód od Rysów i Morskiego Oka oraz dzieliła Dolinę Jaworzyny pomiędzy Polskę a Czechosłowację (granica miała biec dnem doliny). Były to propozycje korzystniejsze dla Polski niż wcześniejsze rozstrzygnięcia Rady Ambasadorów. Natomiast ta sama propozycja Komisji Delimitacyjnej z roku 1922 dzieliła północny Spisz w sposób jeszcze bardziej niekorzystny dla Polski, pozostawiając gminy Kacwin i Niedzica po stronie czechosłowackiej. Co ciekawe taki sam, bardzo niekorzystny dla Polski, podział północnego Spiszu uwzględniała pierwsza propozycja Polski (wersja drukowana), która jednocześnie postulowała włączenie do Polski dużo większego obszaru Tatr Wysokich wraz z całą Doliną Jaworzyny (obszar ten pod względem historycznym także jest zaliczany do Spiszu). Natomiast druga propozycja polska, z lutego 1924 (kolor żółty), rozkłada akcenty zdecydowanie inaczej. Postulowała przyłączenie do Polski gmin Kacwin i Niedzica na północnym Spiszu (zgodnie z propozycją czechosłowacką i wcześniejszą decyzją Rady Ambasadorów), natomiast ograniczała żądania Polski dotyczące fragmentu Tatr na wschód od Morskiego Oka i rezygnowała ze wschodniej części Doliny Jaworzyny. Mimo to, nowe, ograniczone terytorialnie, postulaty strony polskiej dotyczące wschodniej części Tatr Wysokich, nie zyskały akceptacji strony czechosłowackiej oraz Ligi Narodów, która miesiąc później, 12 marca 1924 roku przyznała cały obszar Doliny Jaworzyny Czechosłowacji.	Carte de la frontière Polono-Tchecoslovaque sur le territoire de Spisz (Jaworzyna)	granica polsko-czechosłowacka, granica polsko-słowacka, Spisz, Dolina Jaworzyny, Tatry		Rada Ambasadorów, linia Ambasadorów, Komisja Delimitacyjna	4	Bureau technique de la Delegation Polonaise	75000		liczne propozycje przebiegu granicy pomiędzy Polską a Czechosłowacją na północnym Spiszu  oraz w Dolinie Jaworzyny, proponowane i ustalane w latach 1920-1924	1H745Iz4vzRJVAyLu9JZG678qjg2u7hyK.jpg	2022-04-03 13:21:42.884624+02	https://drive.google.com/drive/folders/18qN9TcqtM6bjoeYefK_E3cpoPm4vZNRg?usp=sharing	Mapa drukowana z odręcznymi adnotacjami	thumbnails/1H745Iz4vzRJVAyLu9JZG678qjg2u7hyK_copy.jpg
10		8	\N	, prawdopodobnie 1919	Powstanie mapy jest konsekwencją polsko-czeskich sporów o przynależność państwową Śląska Cieszyńskiego, a bezpośrednio jest związane z podpisaniem 5 listopada 1918 roku wstępnego porozumienia władz lokalnych (polskich i czeskich) tymczasowo dzielącego ten region według kryterium etnicznego (a precyzyjniej językowego). Umowa ta przydzielała polskiej administracji powiaty, które zamieszkałe były w większości przez ludność polskojęzyczną: bielski, cieszyński oraz większą część powiatu frysztackiego (na mapie kolor biały), a czechosłowackiej powiat frydecki i pozostałą częścią powiatu frysztackiego (na mapie kolor niebieski). Podział ten nie kończył i nie rozwiązywał konfliktu, a ostateczne rozgraniczenie terytorialne pozostawiał się do rozstrzygnięcia przez rządy Polski i Czechosłowacji. Był on korzystny dla strony polskiej i stanowił podstawę dla dalszego podtrzymania roszczeń terytorialnych. Przydzielał Polsce zdecydowaną większość Śląska Cieszyńskiego wraz z częścią kopalń węgla kamiennego i zakładów przemysłowych w okolicach Karwiny, Rychwałdu i Bogumina. Strona czechosłowacka nie zaakceptowała podziału według kryterium etnicznego, domagając się na podstawie argumentów historycznych, całego obszaru Księstwa Cieszyńskiego.\nNa mapie przedstawiono Księstwo Cieszyńskie z podziałem na powiaty, z zaznaczonymi głównymi miastami, liniami kolejowymi, rzekami, zagłębiami węglowymi w okolicach Ostrawy i Karwiny oraz Czechowic (kolor żółty). Najistotniejszym elementem zamieszczonym na mapie jest zaznaczenie obszarów (powiatów i gmin) objętych tymczasową administracją polską (kolor biały) oraz czeską (kolor niebieski), na podstawie porozumienia z 5 listopada 1918 roku. \nPonadto obok mapy dodano informacje o strukturze narodowościowej tego obszaru, według wyników spisów ludności z lat 1880, 1890, 1900, 1910 z podziałem na Polaków, Niemców i Czechów, zarówno w odniesieniu do całego obszaru Księstwa Cieszyńskiego, jak i z wyłączeniem, najliczniej zamieszkanego przez Czechów, powiatu frydeckiego. Jednocześnie autorzy mapy podkreślili, że wyniki ostatniego spisu powszechnego z 1910 roku przeprowadzonego w Monarchii Austro-Węgierskiej, są „niekorzystne dla narodowości polskiej w wyniku fałszerstw i różnych nacisków”. W trakcie tego spisu (jak i w trakcie wcześniejszych) nie było pytania o narodowość, a strukturę etniczną ustalano według odpowiedzi na pytanie o „język domowy”. Wszystkie zamieszczone na mapie dane statystyczne dowodziły wyraźnej dominacji ludności polskiej na obszarze Śląska Cieszyńskiego.\nPoza danymi pochodzącymi ze spisów powszechnych, autorzy mapy zamieścili także informacje dotyczące „linii językowych”, przytaczając opinie trzech badaczy (Polaka i dwóch Czechów), dowodzące, że obszar Śląska Cieszyńskiego jest objęty zasięgiem języka polskiego, a język czeski pojawia się dopiero na zachód od tego regionu. Naniesiono także granicę (linia czerwona) oddzielającą język polski (część wschodnia) od dialektów przejściowych (część zachodnia), która częściowo biegnie wzdłuż granicy powiatu frydeckiego, a następnie przecina go, zostawiając cały powiat frysztacki po stronie języka polskiego, co nie znalazło potwierdzenia w wynikach spisu powszechnego z 1910 roku. \nPod mapą znajduje się nieczytelna, okrągła, czerwona pieczęć, prawdopodobnie jest to pieczęć Archiwum Akt Nowych.\nZ treści mapy oraz zamieszczonych obok niej danych statystycznych, można wnioskować, że do Polski powinna należeć nie tylko część Śląska Cieszyńskiego wstępnie przyznana jej w administrowanie na podstawie porozumienia z 5 listopada 1918 roku, ale także niektóry gminy przyznane stronie czeskiej, zwłaszcza w najbardziej uprzemysłowionym powiecie frysztackim. \nPomimo u nazwiska autora mapy oraz wydawcy czy miejsca wydania, treść mapy jednoznacznie wskazuje, iż została ona przygotowana przez stronę polską, a użyty w niej język francuski, wskazuje, iż adresatem są politycy i eksperci francuscy.\nNajbardziej interesującym elementem mapy, są odręcznie naniesione dwie linie – czerwona i zielona. Z raportu dołączonego do mapy, wynika, że narysował je Roman Dmowski, w Paryżu, 11 września 1919 roku, podczas spotkania z polskim dyplomatą Janem Ciechanowskim (który jest autorem raportu). Raport był przeznaczony dla Józefa Piłsudskiego, omawiał przebieg rozmów pomiędzy R. Dmowskim a J. Cambonem oraz Komisją ds. polskich, dotyczących przeprowadzenia plebiscytu na Śląsku Cieszyńskim. Linie narysowane przez R. Dmowskiego były propozycjami Komisji dotyczącymi przebiegu linii demarkacyjnej (czerwona) oraz granicy (zielona). Wariant czerwony był dla Polski korzystniejszy, ponieważ przyznawał jej północno-zachodnią część Zagłębia Ostrawsko-Karwińskiego. Według raportu, obie te propozycje Dmowski kategorycznie odrzucił, będąc przekonanym, że sytuacja w tym regionie rozwinie się dla Polski pomyślnie.\nOstatecznie Śląsk Cieszyński został w roku 1920 podzielony w sposób dużo bardziej niekorzystny dla Polski.	Le Duche de Cieszyn (Teschen) Silesie	Śląsk Cieszyński, Księstwo Cieszyńskie, pogranicze polsko-czeskie, granica polsko-czeska	Roman Dmowski, Jan Ciechanowski	struktura narodowościowa, struktura językowa, polsko-czeskie porozumienie z 5 listopada 1918 roku, węgiel kamienny;zagłębkie	\N		 (na mapie odręcznie wrysowana podziałka liniowa)		Podział Śląska Cieszyńskiego według kryterium etnicznego (językowego), na powiaty i gminy objęte administracją polską oraz czeską, na podstawie porozumienia z 5 listopada 1918 roku, z odręcznie naniesionymi dwiema propozycjami podziału tego regionu	1C9qAALloCYU2k9sVxHtibZtRo0OmuA4w.jpg	2022-04-03 13:21:42.965158+02	https://drive.google.com/drive/folders/1ar2Q3ruyx-0jB9w7NffXVDUITFEDbsl-?usp=sharing	Mapa rękopiśmienna z dodatkowymi adnotacjami	thumbnails/1C9qAALloCYU2k9sVxHtibZtRo0OmuA4w_copy.jpg
16		14	\N	, ok. 1917-1919	Na mapie, na obszarze szeroko pojętego pogranicza polsko-czesko-słowackiego, rozciągającego się od Sanoka i Koszyc po Opolszczyznę i Śląsk Opawski, przedstawiono granice językowe polsko-czeskie i polsko-słowackie wraz ze strefą dialektów przejściowych.\nAutorem mapy jest Kazimierz Nitsch, polski językoznawca i slawista, profesor Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiellońskiego, jeden z ekspertów delegacji polskiej na konferencję pokojową w Paryżu w 1919 roku.\nNa mapie zaznaczono sieć rzeczną, granice przedwojenne oraz granice Polski z końca XVIII wieku (z reguły fragmentarycznie, natomiast szczegółowo wszelkie przedrozbiorowe polskie enklawy na Spiszu). Głównymi elementami mapy są granice zasięgu języka czeskiego i słowackiego (linia niebieska), południowa granica zasięgu języka polskiego (linia czerwona) oraz zaznaczona szrafem szeroka strefa dialektów przejściowych (w domyśle polsko-czesko-słowackich).Strefa dialektów przejściowych pomiędzy językiem polskim a czeskim i słowackim, rozciąga od Śląska Opawskiego na zachodzie, przez region Frydecki i Czadecki, po Orawę włącznie. Natomiast w Galicji (Beskid Niski) obszary zamieszkane przez ludność posługującą się językiem polskim (na północy) oraz słowackim (na południu), są rozdzielone szeroką strefą osadnictwa ludności rusińskiej (Łemkowie, Rusnacy), posługującej się dialektem języka ukraińskiego, przez co nie dochodzi tam do bezpośredniego kontaktu Polaków i Słowaków.  W pobliżu południowej granicy zasięgu języka polskiego oraz w strefie dialektów przejściowych naniesiono liczne, nawet niewielkie miejscowości i wsie, co umożliwia precyzyjną identyfikację polsko-czeskiej i polsko-słowackiej granicy językowej.\nZ mapy jednoznacznie wynika, że trzy główne regiony sporne na pograniczu polsko-czechosłowacki po zakończeniu I wojny światowej, czyli Śląsk Cieszyński, Orawa oraz północny Spisz, w zdecydowanej większości należą do polskiego obszaru językowego, ewentualnie znajdują się w strefie dialektów przejściowych (południowa Orawa). Najbardziej jaskrawo jest to widoczne na przykładzie Śląska Cieszyńskiego, który prawie w całości znajduje się w polskim obszarze językowym, a granica zasięgu języka polskiego sięga po Ostrawę, obejmując m.in. Bogumin, prawie całe Zagłębie Ostrawsko-Karwińskie, większość Zaolzia, a nawet dużą część powiatu frydeckiego, sięga też na południe od historycznego obszaru Śląska Cieszyńskiego. Z kolei najbardziej skomplikowany jest przebieg granicy języka polskiego na Spiszu, z licznymi „wyspami językowymi” i strefą dialektów przejściowych na południe od Tatr.\nNa podstawie tej mapy można stwierdzić, że formułowane m.in. podczas konferencji pokojowej w Paryżu, polskie roszczenia terytorialne dotyczące Śląska Cieszyńskiego, Orawy i Spiszu, były całkowicie uzasadnione kryteriami językowymi i etnicznymi, a arbitralne rozstrzygnięcia Rady Ambasadorów z 28 lipca 1920 roku, dzielące te obszary pomiędzy Polskę a Czechosłowację, bez zachowania nadrzędności kryteriów językowo-etnicznych, były dla Polski oraz ludności mieszkającej na polsko-czechosłowackim pograniczu, niesprawiedliwe i krzywdzące.	Limites de Linguistiques Polonaise-Tcheque et Polonaise-Slovaque	pogranicze polsko-czeskie, pogranicze polsko-słowackie, Śląsk Cieszyński, Orawa, Spisz	Kazimierz Nitsch	struktura językowa, pogranicze językowe, zasięg języka polskiego, Komitet Narodowy Polski	8	Lit. W. Krzeptowski	600000		granice językowe polsko-czeskie i polsko-słowackie oraz strefa dialektów przejściowych	1yhgoi1jtLzhq2FmGYKvYfRnYX-WCz5H_.jpg	2022-04-03 13:21:43.085188+02	https://drive.google.com/drive/folders/1sYjkaI4qKMWn_7OA1KPpV9kWO_SOVp_V?usp=sharing	Mapa rękopiśmienna	thumbnails/1yhgoi1jtLzhq2FmGYKvYfRnYX-WCz5H__copy.jpg
18		16	\N	11 kwietnia 1919	Mapa przedstawia przypuszczenia dotyczące pięciu propozycji obszaru spornego na terenie Księstwa Cieszyńskiego w konsekwencji przeprowadzenia plebiscytu, dotyczącego przynależności państwowej tego regionu. Pokazano w formie graficznej (pięć odręcznych szkiców map) i tekstowej (krótkie notatki) udział ludności polskiej w każdym z pięciu wariantów, zarówno w ujęciu przestrzennym (na mapie), jak i liczbowym (na podstawie danych z austriackiego spisu z 1910 roku, w trakcie którego nie było pytania o narodowość, a strukturę etniczną ustalano według odpowiedzi na pytanie o „język domowy”). Wszystkie zamieszczone na mapie dane statystyczne dowodziły dominacji ludności polskiej na obszarze Księstwa Cieszyńskiego. Udział Polaków wahał się od 54,8% (całe Księstwo Cieszyńskie), do 84,7% (powiat frysztacki i cieszyński oraz 27 gmin z zachodniej części powiatu bielskiego i 1 gmina z północnej części powiatu frydeckiego). \nOpracowanie zostało wykonane 11 kwietnia 1919 roku, podpis autora nieczytelny.\nOstatecznie plebiscyt planowany na rok 1920, nie został przeprowadzony, dlatego nie ma możliwości weryfikacji tych przypuszczeń. 		Księstwo Cieszyńskie, Śląsk Cieszyński, granica polsko-czeska		struktura językowa, austriacki spis powszechny 1910 roku,  plebiscyt, Delegacja Polska na Konferencję Pokojową w Paryżu	\N				przypuszczenia dotyczące pięciu propozycji obszaru spornego na terenie Księstwa Cieszyńskiego w konsekwencji przeprowadzenia plebiscytu	1qFsaLOTTVUkFcQidzsCEO1csbL9-SjA1.jpg	2022-04-03 13:21:43.128169+02		Mapa rękopiśmienna z dodatkowymi adnotacjami	thumbnails/1qFsaLOTTVUkFcQidzsCEO1csbL9-SjA1_copy.jpg
22		20	\N	, ok. 1917-1919	Tytuł mapy można tłumaczyć jako „mapa etnograficzna ziem polskich pod zaborem pruskim”.\nMapa została wydana przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawia procentowy udział ludności polskiej w poszczególnych powiatach wschodniej części Prus, na podstawie danych spisu powszechnego z 1910 roku i częściowo z roku 1900 oraz odręcznie wrysowaną propozycję przebiegu granicy polsko-niemieckiej. \nPod legendą mapy umieszczono informację w języku francuskim (tłumaczenie) Uwaga. Mapa oparta jest na oficjalnych danych pruskich ze spisu powszechnego z 1910 r., który został opublikowany szczegółowo tylko dla rejencji w Poznaniu, Bydgoszczy, Gdańsku, Kwidzynie, Olsztynie i Opolu. Dla innych okręgów musieliśmy przyjąć dane z 1900 roku.\nNa mapie  daty, ale można przypuszczać, że została wykonana w latach 1917-1919.\nSzrafem, w podziale na powiaty, przedstawiono udział osób narodowości polskiej w pięciu nierównych przedziałach procentowych: 0,5-10%; 10-25%; 25-40%; 40-50%; 50-100%.\nZ danych przedstawionych na mapie wynika dominujący (ponad 50%) udział ludności polskiej w większości powiatów Górnego Śląska (poza raciborskim), we wschodniej części Opolszczyzny, zdecydowanej większości Wielkopolski, wschodniej części Kaszub oraz w południowej części Mazur.\nW pruskich spisach powszechnych narodowość była ustalana na podstawie odpowiedzi na pytanie o język ojczysty, a statystyka pruska wyszczególniała obok języka polskiego, także język kaszubski i mazurski, co skutecznie zmniejszało liczbę osób deklarujących język polski (a tym samym liczbę osób zaliczonych do polskiej narodowości). Ponadto w pruskim spisie powszechnym istniała możliwość zadeklarowania dwóch języków i część Polaków, znających także język niemiecki, deklarowało język polski wraz z niemieckim, co skutkowało zaliczeniem ich do tzw. „osób dwujęzycznych”.\nNa mapie została odręcznie ołówkiem narysowana linia, przypuszczalnie propozycja przebiegu granicy polsko-niemieckiej. Przecina ona Śląsk Cieszyński, powiat Racibórz, Głubczyce i Prądnik, włączając w granice Polski cały Górny Śląsk, a także centralną i wschodnią Opolszczyznę. Następnie linia graniczna pozostawia po polskiej stronie powiaty Namysłów i Syców, włącza do Polski zdecydowaną większość Wielkopolski (m.in. z powiatami Babimost, Międzychód, Wieleń i Chodzież) oraz większość Pomorza Gdańskiego, gdzie przecina powiat Człuchów i Słupsk. \nZaproponowano przebieg granicy w ten sposób, aby włączyć do Polski nie tylko wszystkie powiaty z ponad 50% oraz z ponad 40%, udziałem ludności polskiej, ale także te, gdzie według danych spisu powszechnego Polacy stanowili 25-40% ogółu ludności, a w przypadku zachodniej części Pomorza Gdańskiego, nawet powiaty z zaledwie kilkunasto, czy wręcz kilkuprocentowym udziałem ludności polskiej (Człuchów, Bytów, Słupsk i Lębork).\nPrzedstawiona na mapie propozycja wytyczenia granicy polsko-niemieckiej, bazowała na kryteriach narodowościowych i strategicznych. Kryterium narodowościowe (ponad 50% dominacja Polaków) było wystarczający, żeby włączyć w granice Polski Górny Śląsk oraz wschodnią Opolszczyznę. Jednak w przypadku południowej Opolszczyzny oraz częściowo Wielkopolski (zwłaszcza południowej i północnej) ten "narodowościowy próg włączenia w granice Polski" obniżono do 25%, co przy konsekwentnym stosowaniu „kryterium narodowościowego” powinno oznaczać przyznanie tych powiatów Niemcom. Natomiast na Pomorzu, z powodu dużo większego udziału ludności niemieckiej, zdecydowano o całkowitym odejściu od kryterium narodowościowego na rzecz kryterium strategicznego i gospodarczego (szeroki dostęp do morza). Propozycja granicy polsko-niemieckiej na Warmii i Mazurach nie została naszkicowana.\nNie podano autora (autorów) proponowanej linii granicznej.\nNa marginesach mapy umieszczono odręczne, częściowo nieczytelne, adnotacje, dotyczące m.in. poszczególnych odcinków linii kolejowych. 	Carte Ethnographique de la Pologne Prussienne	Prusy, granica polsko-niemiecka		struktura narodowościowa, Polacy w Prusach, pruski spis powszechny z 1910 roku	3	Bureau Cartographique de l' "Agence Polonaise Central"	1 000 000 (podziałka)		udział ludności polskiej w poszczególnych powiatach wschodniej części Prus, na podstawie danych spisu powszechnego z 1910 roku i częściowo z roku 1900 oraz odręcznie wrysowana propozycja przebiegu granicy polsko-niemieckiej	1Yntg0yApgMSzJD6prn4TnOYiGrhk-U0Z.jpg	2022-04-03 13:21:43.204729+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1Yntg0yApgMSzJD6prn4TnOYiGrhk-U0Z_copy.jpg
49		47	\N		Na mapie przedstawiono projekt granicy polsko-rumuńskiej na tle granic z 1914 r. Ponadto umieszczono na niej schemat linii kolejowych, główne miasta, sieć rzeczną, przebieg łańcuchów górskich oraz „nowe granice”. Ich przebieg (np. wschodnia granica Polski) jest częściowo niezgodny z ostatecznie ustalonym powojennym przebiegiem granic. Natomiast niewielki fragment granicy polsko-rumuńskiej, po ostatecznym wytyczeniu, nie odbiegał od projektu zamieszczonego na omawianej mapie, poza tym, że był krótszy, z powodu nieco odmiennego przebiegu granic Czechosłowacji, Węgier i Rosji.	Projet de la future frontière polono-roumaine	granica polsko-rumuńska		projekt granic	\N		5000000		projekt przebiegu granicy polsko-rumuńskiej	1HNUM8FcdaLjl1XlaF8aZSq88DkHYFjOy.jpg	2022-04-03 13:21:43.687344+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV?usp=sharing	Mapa drukowana	thumbnails/1HNUM8FcdaLjl1XlaF8aZSq88DkHYFjOy_copy.jpg
7	Pierworys wykonany na podkładzie treści mapy wydanej  przez Księgarnia p.f. "Stella" M. Czajkowskiego w Cieszynie.	5	\N	4 listopad 1918	Na mapie Księstwa Cieszyńskiego z listopada 1918 roku przedstawiono rozmieszczenie ludności polskiej (kolor czerwony – wschodnia, centralna i północna część Księstwa) oraz czeskiej i morawskiej (zachodnia część Księstwa), a także zaznaczono zielonym szrafem zagłębia węglowe, z podziałem na „produkujące” i „odkryte”. Zlokalizowane są one w północnej części Księstwa Cieszyńskiego, zwłaszcza w okolicy Ostrawy i Karwina, gdzie jest największa koncentracja „zagłębi produkujących”, co jest zgodne ze stanem faktycznym (Zagłębie Ostrawsko-Karwińskie). Ponadto zaznaczono miasta, w których znajdują się huty żelaza (Bogumin, Frysztat), miasta w których zlokalizowano „fabryki różne” oraz naniesiono poszczególne miejscowości, linie kolejowe, drogi, rzeki, granice Księstwa i granice powiatów.\nNa mapie znajdują się liczne odręczne dopiski, np. dotyczące liczby ludności Księstwa Cieszyńskiego, z podziałem na trzy główne grupy wyznaniowe (katolicy, ewangelicy, Żydzi) oraz trzy główne narodowości (Polacy, Niemcy, Czesi). Można przypuszczać, że te informacje są naniesione przez autora mapy. Ponadto zielonym pisakiem w języku francuskim dopisano przy kilku miastach rodzaje zakładów przemysłowych, które się w nich znajdują. Pod mapą jest także odręczny dopisek „Paryż dnia 8/XII 18” oraz nieczytelny podpis. Nie podano źródeł danych zamieszczonych na mapie, jednak można przypuszczać, że dane dotyczące struktury narodowościowej pochodzą ze spisu powszechnego przeprowadzonego w Monarchii Austro-Węgierskiej w 1910 roku.\nZ mapy wynika, że w listopadzie 1918 roku na obszarze Księstwa Cieszyńskiego wyraźnie dominowała ludność polska, katolicka (zarówno pod względem przestrzennym, jak i liczbowym), a najbardziej uprzemysłowiona była część północna Księstwa, a zwłaszcza północno-zachodnia, która była jednocześnie najbardziej zróżnicowana pod względem narodowościowym.	Mapa ogólna Księstwa Cieszyńskiego	Księstwo Cieszyńskie, Śląsk Cieszyński, pogranicze polsko-czeskie, granica polsko-czeska		struktura narodowościowa, Polacy, Czesi, górnictwo, węgiel kamienny	5	Księgarnia p.f. "Stella" M. Czajkowskiego w Cieszynie	200000		Rozmieszczenie ludności polskiej i czeskiej na obszarze Księstwa Cieszyńskiego oraz lokalizacja zagłębi węglowych i głównych zakładów przemysłowych;zaznaczono części zagłębia węglowego produkujące i odkryte	1b4Dne8muw16rEE9qU3e1-dN9et5H2H-s.jpg	2022-04-03 13:21:42.909116+02		Mapa rękopiśmienna z dodatkowymi adnotacjami	thumbnails/1b4Dne8muw16rEE9qU3e1-dN9et5H2H-s_copy.jpg
3		1	\N	ok. 1917-1919 roku	Na mapie została przedstawiona za pomocą czerwonej linii propozycja przebiegu granicy polsko-niemieckiej, według stanowiska Komitetu Narodowego Polskiego. Jako podkładu użyto mapy wydanej przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawiającej procentowy udział dzieci narodowości polskiej wśród uczniów szkół podstawowych w powiatach wschodniej części Prus, według oficjalnych danych statystycznych rządu pruskiego pochodzących ze spisu szkolnego z roku 1911. Na mapie jest odręczny dopisek "Granica Zachodnia Polski (stanowisko K.N.P.)". Oczywistą intencją przekazu była sugestia, ze proponowana linia przyszłej granicy polsko-niemieckiej uwzględnia realia narodowościowe. Głównym, ale nie jedynym, kryterium zaproponowania przebiegu granicy polsko-niemieckiej, była struktura narodowościowa, a konkretnie udział dzieci narodowości polskiej wśród uczniów szkół podstawowych we wschodnich powiatach Prus. Na obszarze Śląska oraz Warmii i Mazur, zaproponowano przebieg granicy w ten sposób, aby włączyć do Polski wszystkie powiaty z ponad 50% (tylko w pojedynczych przypadkach z ponad 40%), udziałem dzieci narodowości polskiej wśród uczniów szkół podstawowych, ponadto granicę poprowadzono zgodnie z granicami pruskich powiatów (za wyjątkiem powiatu Reszel). Natomiast w Wielkopolsce, na Pomorzu oraz Powiślu odstąpiono od tej zasady - proponowano włączyć powiaty już od ponad 25% udziału dzieci polskich, a na Pomorzu i Powiślu w granicach Polski miały znaleźć się w całości lub częściowo powiaty z zaledwie kilku procentowym udziałem dzieci narodowości polskiej lub wręcz bez polskiej ludności (powiat Elbląg). Ponadto przebieg proponowanej granicy na wielu odcinkach był niezgodny z pruskim podziałem administracyjnym.\nPrzedstawione na mapie stanowisko KNP w sprawie wytyczenia granicy polsko-niemieckiej, bazowało na kryteriach narodowościowych i strategicznych. Kryteria narodowościowe (wyraźny, ponad 50% udział dzieci narodowości polskiej wśród uczniów szkół podstawowych) były wystarczające, żeby włączyć w granice Polski cały obszar Górnego Śląska, większość Śląska Opolskiego oraz szeroki pas południowych Mazur i południowej Warmii. Tam, gdzie przebieg linii granicznej byłby zbyt zawiły (Wielkopolska) lub wchodziły w grę względy strategiczne (szeroki dostęp do morza w rejonie ującia Wisły) kryteria narodowościowe schodziły na plan dalszy. Na mapie  daty, ale mozna przypuszczać, ze została wykonana na przelomie 1918 i 1919 r., lub w początkach 1919 r., w związku z obradami konferencji pokojowej.  W przypadku Wielkopolski ten "narodowościowy próg włączenia w granice Polski" w przypadku kilku powiatów obniżono do 25%, natomiast na Pomorzu i Powiślu, z powodu dużo większego udziału ludności niemieckiej, zdecydowano o odejściu od kryterium narodowościowego na rzecz kryteriów strategicznych (szeroki dostęp do morza, ujście Wisły). Na mapie  daty, ale można przypuszczać, że została wykonana w latach 1917-1918. Wykorzystywanie przez polskie instytucje, na potrzeby przedstawiania argumentów za polskością Śląska, Wielkopolski, Pomorza oraz Warmii i Mazur, danych pochodzących z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, było uzasadnione m.in. tym, że w spisach powszechnych narodowość była ustalana na podstawie odpowiedzi na pytanie o język ojczysty, a statystyka pruska wyszczególniała obok języka polskiego, także język kaszubski i mazurski, co skutecznie zmniejszało liczbę osób deklarujących język polski (a tym samym liczbę osób zaliczonych do polskiej narodowości). Ponadto w pruskim spisie powszechnym istniała możliwość zadeklarowania dwóch języków i część Polaków, znających także język niemiecki, deklarowało język polski wraz z niemieckim, co skutkowało zaliczeniem ich do tzw. „osób dwujęzycznych”.	Pologne Prussienne. La nationalité des enfants dans les école primaires d'après la statistique du gouvernement Prussien de 1911	granica polsko-niemiecka, Prusy, granice zaboru pruskiego		zachodnia granica Polski, Komitet Narodowy Polski, Prusy, dzieci narodowości polskiej w szkołach, statystyka narodowościowa, pruski spis szkolny 1911 r.	3	Bureau Cartographique "l'Agence Polonaise Centrale" a Lausanne	1000000 (podziałka)	Pologne Prussienne	przedstawienie propozycji przebiegu zachodniej granicy Polski według stanowiska Komitetu Narodowego Polskiego, na podkładzie przedstawiającym procentowy udział dzieci narodowości polskiej wśród uczniów szkół podstawowych w powiatach wschodniej części Prus, według danych statystycznych rządu pruskiego z roku 1911  (spis szkolny)	1LqOGQWqHrxRTzz5besNgkv3gWLqIS0vO.jpg	2022-04-03 13:21:42.806679+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1LqOGQWqHrxRTzz5besNgkv3gWLqIS0vO_copy.jpg
5		3	\N	1919 (29 VII 1919)	Mapa nie posiada tytułu. Zostały na niej przedstawione trzy różne warianty rozgraniczenia terytorium Polski i Litwy, powstałe w połowie 1919 roku. Rozbieżności dotyczą głównie Wileńszczyzny i Suwalszczyzny. Na tle rozmieszczenia miast, rzek, linii kolejowych oraz zaznaczonego obszaru tzw. „Litwy etnograficznej” (według dzisiejszej nomenklatury byłby to obszar z dominacją ludności litewskiej) zaznaczono przebieg linii demarkacyjnej polsko-litewskiej z 18 czerwca 1919 roku, linii granicznej proponowanej przez Polaków z 20 czerwca 1919 roku (czyli zaledwie dwa dni później) oraz – jak to ujęto w legendzie mapy – "linii proponowanej przez Naczelnego Wodza Armii Sprzymierzonych z 18 VII 1919 roku". Z pewnością chodzi tu o tzw. linię Focha. Mapa została wydana przez Oddział Geograficzny Biura Kongresowego w dniu 29 lipca 1919 roku, czyli można przypuszczać, że bezpośrednim powodem je przygotowania i publikacji było właśnie wytyczenie tzw. linii Focha. Została ona zaproponowana jako kompromis pomiędzy wcześniejszymi o miesiąc propozycjami Ententy oraz strony polskiej.\nSpośród trzech linii przedstawionych na mapie, najwcześniejszą chronologicznie, jest zaaprobowana przez tzw. „wielką czwórkę” Ententy, linia demarkacyjna z 18 czerwca. Zostawia ona po polskiej stronie Wilno i południową Wileńszczyznę oraz Grodno wraz z linią kolejową łączące te miasta. Natomiast w części południowo-zachodniej została poprowadzona wzdłuż Kanału Augustowskiego, w konsekwencji czego cała Suwalszczyzna znalazła się po stronie litewskiej. Ten niekorzystny, z polskiego punktu widzenia, przebieg linii demarkacyjnej, spowodował już po dwóch dniach pojawienie się polskiej propozycji przebiegu granicy polsko-litewskiej. Linia graniczna zaproponowana przez stronę polską ma przebieg zdecydowanie odmienny. Została wytyczona wyraźnie na zachód od linii demarkacyjnej, prawie na całym swoim przebiegu przecina obszar zaznaczony jako „Litwa etnograficzna”, pozostawia po stronie polskiej nie tylko Wilno, ale także północno-zachodnią Wileńszczyznę. W części południowej, na krótkim odcinku biegnie wzdłuż Niemna, a następnie (wyraźnie na północ od linii demarkacyjnej), odbija równoleżnikowo, docierając do granicy Prus Wschodnich w okolicach Wisztyńca, zostawiając po polskiej stronie Suwalszczyznę, z Wiżajnami, Puńskiem i Sejnami. Trzecia z linii granicznych, tzw. linia Focha z lipca 1919 roku, była propozycją kompromisową, w kilku aspektach korzystną dla Polski. W części północno-wschodniej, miała przebieg zbliżony do wcześniejszej propozycji Ententy, była jednak nieznacznie przesunięta na zachód, zwiększając tym samym obszar przyznany Polsce. Natomiast w części południowo-zachodniej, zdecydowanie odbijała od Niemna i Kanału Augustowskiego na północ, zostawiając po polskiej stronie Suwalszczyznę, a od okolic Puńska do granicy Prus Wschodnich, pokrywając się z wcześniejszą propozycją polską.  \nPo wytyczeniu linii Focha, strona litewska, na obszarze wschodniej Suwalszczyzny, w okolicach Sejn, nie przestrzegała rozgraniczenia wojsk i administracji wzdłuż nowej linii demarkacyjnej. Było to bezpośrednią przyczyną wybuchu miesiąc później, 23 sierpnia 1919 roku, powstania sejneńskiego, zakończonego zwycięstwem oddziałów polskich i skutecznym wyparciem litewskiej administracji z całej Suwalszczyzny, poza linię Focha.\nPod mapą odręcznie ołówkiem dopisano wartość skali [1:1 000 000]		granica polsko-litewska, Litwa, Wileńszczyzna, Suwalszczyzna, sieć rzeczna, linie kolejowe		linia demarkacyjna, linia Focha, 	\N	Biuro Kongresowe (Oddział Geograficzny)	1 000 000 (na podstawie odręcznego zapisu pod mapą)		Przedstawienie trzech różnych wariantów rozgraniczenia terytorium Polski i Litwy, powstałych w połowie 1919 roku. Dwóch wariantów zaproponowanych przez Ententę (w tym tzw. linii Focha) oraz jednej propozycji polskiej.	1FLIKDC9_e7FloeTiGdUvAoe5ZXSFGbi7.jpg	2022-04-03 13:21:42.86052+02		Mapa rękopiśmienna z dodatkowymi adnotacjami	thumbnails/1FLIKDC9_e7FloeTiGdUvAoe5ZXSFGbi7_copy.jpg
41		39	\N		Grafika przedstawia sytuację narodową w zachodniej Polsce. Na wykresach przedstawiono procentowy udział ludności w poszczególnych miastach z uwzględnieniem następujących grup: Żydzi, Niemcy, urzędnicy wojskowi, osadnicy, inne narodowości z wyjątkiem polski (?), polskie dzieci ze szkół podstawowych.	Die nationalen Verhältnisse Westpolens in graphischer Darstellung. 	zachodnia polska		narodowości	14		nie dotyczy		Sytuacja narodowa w zachodniej Polsce w przedstawieniu graficznym. 	1jmnVwI4TlgWLITIKWhcdRLE8M_8rHUzr.jpg	2022-04-03 13:21:43.548036+02		Mapa drukowana	thumbnails/1jmnVwI4TlgWLITIKWhcdRLE8M_8rHUzr_copy.jpg
8		6	\N	, po 1910 a przed 1919	Na mapie Księstwa Cieszyńskiego przedstawiono strukturę narodowościową według danych ze spisu powszechnego przeprowadzonego w Monarchii Austro-Węgierskiej w 1910 roku. W spisie tym, nie zadawano pytania o narodowość, natomiast określano ją na podstawie odpowiedzi na pytanie o „język domowy”. \nNa mapie precyzyjnie wyszczególniono miasta i wsie znajdujące się w Księstwie Cieszyńskim, różnicując sygnatury w zależności od liczby mieszkańców oraz przedstawiając szrafem strukturę narodowościową mieszkańców poszczególnych osad, w podziale na Polaków, Czechów i Niemców. Zaznaczono także, zarówno szrafem jak i kolorem, granice powiatów (kolor niebieski), granice czeskiego terytorium etnograficznego według wyników spisu z 1910 roku (kolor czerwony), obszary wydobycia węgla (kolor żółty). Ponadto naniesiono drogi i linie kolejowe. \nNa mapie  jest daty wydania, można jednak przypuszczać, że powstała po roku 1910, a przed 1919, dlatego że zostały w niej użyte dane ze spisu z 1910 roku, natomiast jako państwa sąsiadujące z Księstwem Cieszyńskim, podano Węgry, Galicję i Prusy, czyli stan sprzed zakończenia I wojny światowej. \nZ mapy wynika, że w według danych spisu z 1910 roku, na obszarze Księstwa Cieszyńskiego wyraźnie dominowała ludność polska, (zarówno pod względem przestrzennym, jak i liczbowym), zwłaszcza w jego części wschodniej, centralnej i północnej. Czesi przeważali w wąskim pasie części zachodniej (bez fragmentu północno-zachodniego). Niemcy, ogółem stanowili 18%, a ich obecność najbardziej zaznaczała się w miastach, zwłaszcza w Bielsku, Cieszynie, Boguminie, Frydku, Skoczowie, gdzie byli ludnością dominującą. Jako obszary wydobycia węgla kamiennego zaznaczono okolice Ostrawy i Karwiny oraz Czechowic.\nRegionem najbardziej zróżnicowanym narodowościowo, a jednocześnie najbardziej uprzemysłowionym i najcenniejszym pod względem gospodarczym, było według danych spisu z 1910 roku Zagłębie Ostrawsko-Karwińskie, którego część zachodnia (okolice Ostrawy) była zdominowana przez ludność czeską, a część wschodnia (okolice Karwiny) i północna przez Polaków. Ponadto w miastach swą obecność zaznaczała także ludność niemiecka. Tak duże zróżnicowanie narodowościowe tego fragmentu Księstwa Cieszyńskiego, było konsekwencją zarówno jego położenia na etnicznym pograniczu polsko-czeskim, jak i silnego uprzemysłowienia oraz wynikających z tego migracji ekonomicznych.	Le Duché de Cieszyn (Teschen). Les nationalités d’aprěs le recensement de 1910	Księstwo Cieszyńskie, Śląsk Cieszyński, pogranicze polsko-czeskie;zagłębie ostrawsko-karwińskie		struktura narodowościowa, austriacki spis powszechny 1910, Polacy, Czesi, Niemcy, górnictwo, węgiel kamienny	\N		300000	Le Duché de Cieszyn (Teschen)	struktura narodowościowa Księstwa Cieszyńskiego na podstawie wyników spisu z 1910 roku, obszary wydobycia węgla kamiennego obejmujące zagłębie ostrawsko-kaewińskie	12konZdBtMZ1nMpQIAwXGj9Ho-1dZSzXw.jpg	2022-04-03 13:21:42.92833+02		Mapa rękopiśmienna	thumbnails/12konZdBtMZ1nMpQIAwXGj9Ho-1dZSzXw_copy.jpg
9		7	\N	, prawdopodobnie 1919	Powstanie mapy jest konsekwencją polsko-czeskich sporów o przynależność państwową Śląska Cieszyńskiego, a bezpośrednio jest związane z podpisaniem 5 listopada 1918 roku wstępnego porozumienia władz lokalnych (polskich i czeskich) tymczasowo dzielącego ten region według kryterium etnicznego (a precyzyjniej językowego). Umowa ta przydzielała polskiej administracji powiaty, które zamieszkałe były w większości przez ludność polskojęzyczną: bielski, cieszyński oraz większą część powiatu frysztackiego (na mapie kolor biały), a czechosłowackiej powiat frydecki i pozostałą częścią powiatu frysztackiego (na mapie kolor niebieski). Podział ten nie kończył i nie rozwiązywał konfliktu, a ostateczne rozgraniczenie terytorialne pozostawiał się do rozstrzygnięcia przez rządy Polski i Czechosłowacji. Był on korzystny dla strony polskiej i stanowił podstawę dla dalszego podtrzymania roszczeń terytorialnych. Przydzielał Polsce zdecydowaną większość Śląska Cieszyńskiego wraz z częścią kopalń węgla kamiennego i zakładów przemysłowych w okolicach Karwiny, Rychwałdu i Bogumina. Strona czechosłowacka nie zaakceptowała podziału według kryterium etnicznego, domagając się na podstawie argumentów historycznych, całego obszaru Księstwa Cieszyńskiego.\nNa mapie przedstawiono Księstwo Cieszyńskie z podziałem na powiaty, z zaznaczonymi głównymi miastami, liniami kolejowymi, rzekami, zagłębiami węglowymi w okolicach Ostrawy i Karwiny oraz Czechowic (kolor żółty). Najistotniejszym elementem zamieszczonym na mapie jest zaznaczenie obszarów (powiatów i gmin) objętych tymczasową administracją polską (kolor biały) oraz czeską (kolor niebieski), na podstawie porozumienia z 5 listopada 1918 roku. \nPonadto obok mapy dodano informacje o strukturze narodowościowej tego obszaru, według wyników spisów ludności z lat 1880, 1890, 1900, 1910 z podziałem na Polaków, Niemców i Czechów, zarówno w odniesieniu do całego obszaru Księstwa Cieszyńskiego, jak i z wyłączeniem, najliczniej zamieszkanego przez Czechów, powiatu frydeckiego. Jednocześnie autorzy mapy podkreślili, że wyniki ostatniego spisu powszechnego z 1910 roku przeprowadzonego w Monarchii Austro-Węgierskiej, są „niekorzystne dla narodowości polskiej w wyniku fałszerstw i różnych nacisków”. W trakcie tego spisu (jak i w trakcie wcześniejszych) nie było pytania o narodowość, a strukturę etniczną ustalano według odpowiedzi na pytanie o „język domowy”. Wszystkie zamieszczone na mapie dane statystyczne dowodziły wyraźnej dominacji ludności polskiej na obszarze Śląska Cieszyńskiego.\nPoza danymi pochodzącymi ze spisów powszechnych, autorzy mapy zamieścili także informacje dotyczące „linii językowych”, przytaczając opinie trzech badaczy (Polaka i dwóch Czechów), dowodzące, że obszar Śląska Cieszyńskiego jest objęty zasięgiem języka polskiego, a język czeski pojawia się dopiero na zachód od tego regionu. Naniesiono także granicę (linia czerwona) oddzielającą język polski (część wschodnia) od dialektów przejściowych (część zachodnia), która częściowo biegnie wzdłuż granicy powiatu frydeckiego, a następnie przecina go, zostawiając cały powiat frysztacki po stronie języka polskiego, co nie znalazło potwierdzenia w wynikach spisu powszechnego z 1910 roku. \nZ treści mapy oraz zamieszczonych obok niej danych statystycznych, można wnioskować, że do Polski powinna należeć nie tylko część Śląska Cieszyńskiego wstępnie przyznana jej w administrowanie na podstawie porozumienia z 5 listopada 1918 roku, ale także niektóry gminy przyznane stronie czeskiej, zwłaszcza w najbardziej uprzemysłowionym powiecie frysztackim. \nPomimo u nazwiska autora mapy oraz wydawcy czy miejsca wydania, treść mapy jednoznacznie wskazuje, iż została ona przygotowana przez stronę polską, a użyty w niej język francuski, wskazuje, iż adresatem są politycy i eksperci francuscy. Mapa ta została dołączona jako aneks do memoriału dotyczącego wytyczenia granicy pomiędzy Polską a Czechosłowacją na Śląsku Cieszyńskim, Orawie i Spiszu, przygotowanego przez delegację polską na konferencję pokojową w Paryżu w 1919 roku.	Le Duche de Cieszyn (Teschen) Silesie	Śląsk Cieszyński, Księstwo Cieszyńskie, pogranicze polsko-czeskie		struktura narodowościowa, struktura językowa, polsko-czeskie porozumienie z 5 listopada 1918 roku, Delegacja Polska na Konferencję Pokojową w Paryżu, węgiel kamienny ; zagłębie ostrawsko-karwińskie i koło Czechowic	\N		 (na mapie odręcznie wrysowana podziałka liniowa)		Podział Śląska Cieszyńskiego według kryterium etnicznego (językowego), na powiaty i gminy objęte administracją polską oraz czeską, na podstawie porozumienia z 5 listopada 1918 roku	1bQSTP0r-aoRbYkjUtpk6Bdp99MtnNASg.jpg	2022-04-03 13:21:42.945428+02	https://drive.google.com/drive/folders/1_ucV-brrrWyavyeuiax8Fk10bsLd1Pj_?usp=sharing	Mapa rękopiśmienna z dodatkowymi adnotacjami	thumbnails/1bQSTP0r-aoRbYkjUtpk6Bdp99MtnNASg_copy.jpg
11		9	\N	28 lipca 1920	Mapa przedstawia fragment pogranicza polsko-czechosłowackiego obejmującego Śląsk Cieszyński, Orawę oraz Spisz. Podstawowymi punktami spornymi, przedstawionymi na mapie, jest podział tych trzech regionów pomiędzy Polskę a Czechosłowacją.\nDo I wojny światowej Spisz oraz Orawa znajdowały się w granicach Węgier, a Śląsk Cieszyński w granicach Austrii. Po rozpadzie monarchii Austro-Węgierskiej oraz zakończeniu wojny, nowopowstała Czechosłowacja rościła pretensje terytorialne do całego obszaru północnych Węgier (w tym do Spiszu i Orawy), oraz do uprzemysłowionego i zasobnego w złoża węgla kamiennego Śląska Cieszyńskiego. Z kolei liczna na tych obszarach ludność polska, zwłaszcza we wschodniej i centralnej części Śląska Cieszyńskim, na północnym Spiszu oraz północnej Orawie, domagała się przyłączenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Paryżu, podjęto decyzję o przeprowadzeniu w tych trzech regionach w połowie 1920 roku plebiscytów, które miały zadecydować o ich przynależności politycznej. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podjęto decyzję o rezygnacji z plebiscytów (z powodu wojny polsko-bolszewickiej), a decyzję o podziale tych regionów scedowano na Radę Ambasadorów, która 28 lipca 1920 roku w Paryżu, podjęła arbitralną decyzję, przyznając Polsce tylko niewielkie fragmenty spornych obszarów, co nie zakończyło sporów terytorialnych polsko-czechosłowackich. \nMapa przedstawia efekt decyzji Rady Ambasadorów z dnia 18 lipca 1920 roku.\nKolorem zielonym zaznaczono zasięg terytorialny Spiszu, Orawy i Śląska Cieszyńskiego (z tym, że w przypadku Spiszu, dotyczy to tylko jego północnej części), a kolorem czerwonym granice wytyczone na podstawie decyzji Rady Ambasadorów z 28 lipca 1920, czyli tzw. „linie Ambasadorów”, które miały stać się granicami Polski i Czechosłowacji.\nW przypadku podziału wszystkich trzech regionów, decyzja Rady Ambasadorów była niekorzystna dla Polski i spotkała się z protestami polskich władz. W żadnym z tych regionów granica polsko-czechosłowacka nie miała identycznego przebiegu jak na omawianej mapie. Wszelkie modyfikacje zostały ostatecznie ustalone w roku 1924 przez Komisję Delimitacyjną, a następnie zaakceptowane przez Ligę Narodów oraz rządy Polski i Czechosłowacji. Zmiany były jednak nieznaczne, często dotyczyły wzajemnej wymiany niewielkich terytoriów (wsi) i w żadnym przypadku nie zmieniły w istotny sposób niekorzystnej dla Polski decyzji Rady Ambasadorów z 28 lipca 1920 roku. Na Spiszu modyfikacja dotyczyła niewielkiego obszaru na południe od wsi Jurgów i Brzegi (z korzyścią dla Polski) oraz na południe od wsi Niedzica, na Orawie przekazano Czechosłowacji dwie wsie (Głodówka i Sucha Góra) na zachód od Chochołowa, w zamian za część wsi Lipnica Wielka, a na Śląsku Cieszyńskim Czechosłowacja otrzymała wieś Herczawę w południowej części regionu. W tak ustalonej formie granice te funkcjonują również współcześnie.	Teschen, Orawa et Spisz	Śląsk Cieszyński, Orawa, Spisz, granica polsko-czechosłowacka, granica polsko-słowacka		Rada Ambasadorów, linia Ambasadorów, podział Orawy, Spisza i Śląska Cieszyńskiego, węgiel kamienny, zagłębie ostrawsko-karwińskie, oraz wydobycie węgla w okolicy Czechowic	6	S.G.A.	200000		podział Śląska Cieszyńskiego, Orawy i Spiszu pomiędzy Polskę a Czechosłowację, według decyzji Rady Ambasadorów z 28 lipca 1920 roku 	1MPS4f1CWOG3E2I9zqzX3cFeND05IVmBO.jpg	2022-04-03 13:21:42.988532+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1MPS4f1CWOG3E2I9zqzX3cFeND05IVmBO_copy.jpg
12		10	\N	28 lipca 1920	Mapa przedstawia podział Śląska Cieszyńskiego pomiędzy Polskę a Czechosłowację, według decyzji Rady Ambasadorów z 28 lipca 1920 roku.\nDo I wojny światowej Śląsk Cieszyński znajdował się w granicach Austrii. Po rozpadzie monarchii Austro-Węgierskiej oraz zakończeniu wojny, pretensje terytorialne do Śląska Cieszyńskiego zgłaszała zarówno Polska, jak i Czechosłowacja, zwłaszcza do zasobnego w węgiel kamienny i uprzemysłowionego Zagłębia Ostrawsko-Karwińskiego. 5 listopada 1918 roku na podstawie porozumienia władz lokalnych (polskich i czeskich) tymczasowo podzielono Śląsk Cieszyński według kryterium etnicznego (a precyzyjniej językowego). Był to podział korzystny dla strony polskiej, której przypadła zdecydowana większość regionu wraz z częścią kopalń węgla kamiennego i zakładów przemysłowych w części północnej i północno-zachodniej. Strona czechosłowacka nie zaakceptowała podziału według kryterium etnicznego, domagając się na podstawie argumentów historycznych, całego obszaru Księstwa Cieszyńskiego. W styczniu 1919 roku Czechosłowacja rozpoczęła działania zbrojne, zajmując ostatecznie około połowę Śląska Cieszyńskiego. W połowie 1919 roku, podczas konferencji w Paryżu, podjęto decyzję o przeprowadzeniu w tym regionie w 1920 roku plebiscytu, który miał zadecydować o jego przynależności politycznej. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podjęto decyzję o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzję o podziale Śląska Cieszyńskiego scedowano na Radę Ambasadorów, która 28 lipca 1920 roku w Paryżu, podjęła arbitralną decyzję, przyznając Polsce tylko wschodnią część regionu, wytyczając granicę częściowo na rzece Olzie, co doprowadziło m.in. do podziału Cieszyna. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnych granic (na północy była to granica pomiędzy Austrią a Prusami, a na południu pomiędzy Austrią a Węgrami), natomiast kolorem czerwonym granicę wytyczoną na podstawie decyzji Rady Ambasadorów z 28 lipca 1920, czyli tzw. „linię Ambasadorów”, która miała stać się granicą Polski i Czechosłowacji.\nDecyzja Rady Ambasadorów dotycząca podziału Śląska Cieszyńskiego była bardzo niekorzystna dla Polski i wywołała protesty polskich władz. Nie uwzględniała kryterium narodowościowego i językowego, pozostawiając po stronie czechosłowackiej ok. 150 tys. Polaków (głównie na obszarze tzw. Zaolzia). Ponadto Czechosłowacji w całości przypadło bogate w złoża węgla kamiennego Zagłębie Ostrawsko-Karwińskie oraz linia kolejowa Bogumin-Koszyce. Wytyczona na mapie granica z lipca 1920 roku, została nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Ligę Narodów, przyznano Czechosłowacji wieś Herczawę, na samym południu Śląska Cieszyńskiego. W tak ustalonej formie granica ta funkcjonuje również współcześnie.	Frontière dans la Région de Teschen	Śląsk Cieszyński, Księstwo Cieszyńskie, granica polsko-czechosłowacka		Rada Ambasadorów, linia Ambasadorów, podział Śląska Cieszyńskiego	6	S.G.A.	75000		Podział Śląska Cieszyńskiego pomiędzy Polskę a Czechosłowację, według decyzji Rady Ambasadorów z 28 lipca 1920 roku	1GoYAQQ1b0uuH_iOvU_abZXhcuts3acXf.jpg	2022-04-03 13:21:43.004593+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1GoYAQQ1b0uuH_iOvU_abZXhcuts3acXf_copy.jpg
13		11	\N	1919	Na mapie przedstawiono Księstwo Cieszyńskie z podziałem na powiaty, z zaznaczonymi głównymi miastami, liniami kolejowymi, rzekami. Ponadto szrafem zaznaczono region wydobycia węgla kamiennego w okolicach Ostrawy i Karwiny oraz obszar objęty tymczasową administracją czeską na podstawie porozumienia z 5 listopada 1918 roku. \nMapa została zamieszczona w artykule „La Pologne et la Silesie de Teschen”, autorstwa Henri Austruy, wydanym w Paryżu w roku 1919, w czasopiśmie „La Nouvelle Revue”.\nPowstanie mapy jest prawdopodobnie konsekwencją polsko-czeskich sporów o przynależność państwową Śląska Cieszyńskiego i jest związane z podpisaniem 5 listopada 1918 roku wstępnego porozumienia władz lokalnych (polskich i czeskich) tymczasowo dzielącego ten region według kryterium etnicznego (a precyzyjniej językowego). Umowa ta przydzielała polskiej administracji powiaty, które zamieszkałe były w większości przez ludność polskojęzyczną: bielski, cieszyński oraz większą część powiatu frysztackiego, czyli zdecydowaną większość Śląska Cieszyńskiego. Natomiast administracja czechosłowacka przejęła zdominowany przez ludność czeską powiat frydecki i pozostałą częścią powiatu frysztackiego (na mapie zaznaczone szrafem) wraz ze znajdującymi się tam kopalniami węgla kamiennego. \nTen podział utrzymał się w praktyce tylko niecałe trzy miesięcy. Pod koniec stycznia 1919 roku wojska czechosłowackie przekroczyły linię demarkacyjną i zajęły zbrojnie około połowę obszaru Śląska Cieszyńskiego. 		Śląsk Cieszyński, Księstwo Cieszyńskie, pogranicze polsko-czeskie, granica polsko-czeska		struktura narodowościowa, Polacy, Czesi, porozumienie z 5 listopada 1918 roku, węgiel kamienny, zagłębie ostrawsko-karwińskie	7		 (na mapie odręcznie wrysowano podziałkę liniową)		podział Śląska Cieszyńskiego pomiędzy Polskę a Czechosłowację, według porozumienia z 5 listopada 1918 roku	1ynRfnx7QptCMIt_q4XFd1kcXdryldSP2.jpg	2022-04-03 13:21:43.020204+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa rękopiśmienna	thumbnails/1ynRfnx7QptCMIt_q4XFd1kcXdryldSP2_copy.jpg
29		27	\N	1919	Mapa przedstawia rozmieszczenie ludności polskiej w północnych powiatach dawnych Węgier. Została opracowana w roku 1919, przez założony w Krakowie Narodowy Komitet Obrony Spisza, Orawy i Podhala i dołączona do kilkustronicowej, francuskojęzycznej broszury, omawiającej argumenty za przynależnością do Polski części Spiszu i Orawy.\nNa mapie przedstawiono za pomocą szrafu rozmieszczenie i udział procentowy ludności polskiej na obszarze regionu Czadeckiego, Orawy oraz Spiszu, w jednym przedziale liczbowym (75-90%). Ponadto zaznaczono dawną granicę pomiędzy Węgrami a Galicją (Austrią), sieć rzeczną, główne miejscowości oraz krainy historyczno-geograficzne. Z mapy wynika, że Czadeckie, Orawa i Spisz, które po zakończeniu I wojny światowej były regionami spornymi na pograniczu polsko-słowacki, były wówczas, zwłaszcza w części północnej, wyraźnie zdominowane przez ludność polską (polskojęzyczną).\nNa mapie  podania źródeł użytych danych liczbowych, ponadto nie zaznaczono rozmieszczenia ludności słowackiej i niemieckiej (licznej zwłaszcza na Spiszu), a także powszechnych w tych regionach „obszarów przejściowych”, mieszanych narodowościowo i językowo. Z powodów propagandowych oraz dla udokumentowania polskich żądań terytorialnych na pograniczu polsko-słowackim, zasięg ludności polskiej został przedstawiony w sposób maksymalistyczny, a rzeczywista struktura etniczno-językowa mieszkańców tych regionów (zwłaszcza Spiszu) była z pewnością bardziej skomplikowana.\nPomimo tych zastrzeżeń, można stwierdzić, że formułowane m.in. podczas konferencji pokojowej w Paryżu, polskie roszczenia terytorialne dotyczące północnej Orawy i północnego Spiszu, były uzasadnione kryteriami językowymi i etnicznymi, a arbitralne rozstrzygnięcia Rady Ambasadorów z 28 lipca 1920 roku, dzielące te obszary pomiędzy Polskę a Czechosłowację, bez zachowania nadrzędności kryteriów językowo-etnicznych, były dla Polski oraz ludności mieszkającej na polsko-słowackim pograniczu, niesprawiedliwe i krzywdzące.	Carte de la population polonaise dans les comitats septentrionaux de l’ancienne Hongrie	granica polsko-słowacka, Spisz, Orawa, Czadeckie		Narodowy Komitet Obrony Spisza, Orawy i Podhala, rozmieszczenie ludności polskiej, struktura narodowościowa, struktura językowa	12	Comité National pour la dèfence du Spisz, de l’Orawa et du Podhale	1200000		Rozmieszczenie ludności polskiej (polskojęzycznej) w północnych powiatach dawnych Węgier (Spisz, Orawa, Czadeckie). 	1hrtJwd_n50BbOW3LmUSRHBhox020Xx1Z.jpg	2022-04-03 13:21:43.341982+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/1hrtJwd_n50BbOW3LmUSRHBhox020Xx1Z_copy.jpg
30		28	\N		Na mapie przedstawiono sieć komunikacyjną w postaci linii kolejowych i kanałów. Na mapie nie zaznaczono Kanału Kłodnickiego. Ponadto wyróżniono granice Polski z 1772 roku oraz granice państw i prowincji z 1914 roku oraz ważniejsze miasta. Odręcznie (kolorem czerwonym) podkreślono linie kolejowe na obszarze ograniczonym miejscowościami: Berno, Cieszyn, Bratysława. Na mapie zaznaczono również lokalizacje następujących miejscowości: 	Carte des communications	granica polsko-słowacka, Spisz, Orawa		komunikacja, granice administracyjne	\N		2000000		komunikacja	11WLlDlCEEE2qVmtMFfivH5ZlcP3Vt2Zi.jpg	2022-04-03 13:21:43.358625+02	https://drive.google.com/drive/folders/1byOiIoyqWT2t274Z2BLpUNNm3_rouX3D?usp=sharing	Mapa drukowana z odręcznymi adnotacjami	thumbnails/11WLlDlCEEE2qVmtMFfivH5ZlcP3Vt2Zi_copy.jpg
31		29	\N	1919	Mapa nr II ilustrująca memoriał "Polska i Finlandia".\nObejmuje rozległy obszar Europy Środkowo-Wschodniej, od północnej Finlandii, po Morze Czarne. Wyróżniono na niej rozległe terytorium Federacji Fińsko-Estońskiej (z półwyspem Kola i wyraźnie na wschód przesuniętymi granicami Finlandii) oraz Federacji Polsko-Litewsko-Ruskiej wraz z dwoma regionami „pod czasową okupacją” – pomiędzy Kijowem a Odessą oraz  na wschód od Estonii\nZasadniczym elementem mapy jest wyraźnie zaznaczona linia „frontu antyrosyjskiego”, biegnąca od Morza Białego na północy, poprzez Petersburg i Kijów, po Odessę nad Morzem Czarnym.\n	Finlandia i Polska II	Finlandia, Polska, granica polsko-rosyjska	Józef Ziabiczi 	Federacja Fińsko-Estońska, Federacja Polsko-Litewsko-Ruska, front antyrosyjski	10				Federacja Fińsko-Estońska oraz Polsko-Litewsko-Ruska	1Aq2yGf_lu2UpqB99IPMOx2EU3rDd0TIR.jpg	2022-04-03 13:21:43.375878+02	https://drive.google.com/drive/folders/1J0iVuKiQIpnP71ztxLMurhKYIY9vVUCp?usp=sharing	Mapa rękopiśmienna	thumbnails/1Aq2yGf_lu2UpqB99IPMOx2EU3rDd0TIR_copy.jpg
32		30	\N	1919	Mapa załącznikowa do memoriału "Caractère physique du territoire de la Pologne"	Caractère physique du territoire de la Pologne	granica polsko-niemiecka, granica polsko-bolszewicka, granica polsko-ukraińska		Komitet Narodowy Polski	\N				granice polski	1XnpiaoXgJxuzgmSR3lR0fi7BS29plIeV.jpg	2022-04-03 13:21:43.3914+02	https://drive.google.com/drive/folders/1AhHPKWNS9-hr_NdQjoOWrNjUie3uF2lr	Mapa rękopiśmienna	thumbnails/1XnpiaoXgJxuzgmSR3lR0fi7BS29plIeV_copy.jpg
51		49	\N	1921	Tytuł można tłumaczyć jako „mapa etnograficzna i polityczna ziem dawnego Wielkiego Księstwa Litewskiego”, z tym, że trzeba pamiętać, iż wówczas pod pojęciem „etnograficzne” rozumiano, to co współcześnie określamy jako „narodowościowe”, czyli jest to mapa narodowościowo-polityczna.\nNa mapie przedstawiono metodą zasięgów, współczesne dla Autora, obszary etnograficzne (narodowościowe) na terytorium historycznego Wielkiego Księstwa Litewskiego: litewskie (kolor żółty, Żmudź i Gubernia Kowieńska), polskie (kolor czerwony, Wileńszczyzna, Suwalszczyzna, region Grodna i Dyneburga), łotewskie (kolor pomarańczowy, Kurlandia, Inflanty), białoruskie (kolor różowy, rozlegle obszary na wschód i południe od Wileńszczyzny). \nPonadto naniesiono liczne linie graniczne, zarówno historyczne (rozbiorowe, Wielkiego Księstwa Litewskiego), jak i bezpośrednio związane z licznymi traktatami zawieranymi w konsekwencji walk polsko-litewskich i polsko-bolszewickich w roku 1920 i 1921 oraz innych ustaleń dyplomatycznych (np. linia Curzona).\nMapa pokazuje bardzo duże zróżnicowanie narodowościowe obszaru dawnego Wielkiego Księstwa Litewskiego oraz przecinające go w trzeciej dekadzie XX wieku liczne podziały polityczne. W momencie wydania mapy, powojenny podział polityczno-terytorialny tego obszaru, nie był jeszcze definitywnie zakończony.  \n	Carte ethnographique et politique des territoires de l'ancien Grande Duché de Lithuanie. Edition du Comité Politique Provisoire des terres de Kowno	Wielkie Księstwo Litewskie, Litwa, granica polsko-rosyjska		struktura narodowościowa, konflikt polsko-litewski, konflikt polsko-bolszewicki, zaróżnicowanie narodowościowe i polityczne Litwy	18	Zakład Kartograficzno W. Główczewski	2000000		podziały narodowościowe i polityczne ziem dawnego Wielkiego Księstwa Litewskiego po roku 1920	1CrXvqjG71WEmIB1IK-dOQ5ZZlYdaarHE.jpg	2022-04-03 13:21:43.721803+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV	Mapa drukowana	thumbnails/1CrXvqjG71WEmIB1IK-dOQ5ZZlYdaarHE_copy.jpg
52		50	\N		do wykonania	 tytułu	Galicja		granice	\N				granice	1knakHHFR-xt_qT4pMvA0fGeq_Zg069ee.jpg	2022-04-03 13:21:43.737802+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1knakHHFR-xt_qT4pMvA0fGeq_Zg069ee_copy.jpg
14		12	\N	28 lipca 1920	Mapa przedstawia podział Orawy pomiędzy Polskę a Czechosłowację, według decyzji Rady Ambasadorów z 28 lipca 1920 roku.\nDo I wojny światowej Orawa znajdowała się w granicach Węgier. Po rozpadzie monarchii Austro-Węgierskiej oraz zakończeniu wojny, nowopowstała Czechosłowacja rościła pretensje terytorialne do całego obszaru północnych Węgier (w tym do Orawy). Z kolei liczna na Orawie ludność polska, zwłaszcza w jej północnej części, domagała się przyłączenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Paryżu, podjęto decyzję o przeprowadzeniu w połowie 1920 roku plebiscytu, który miał zadecydować o przynależności politycznej Orawy. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podjęto decyzję o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzję o podziale tego regionu scedowano na Radę Ambasadorów, która 28 lipca 1920 roku w Paryżu, podjęła arbitralną decyzję, przyznając Polsce tylko niewielki północno-wschodni fragment spornych obszarów, co nie zakończyło sporów terytorialnych polsko-czechosłowackich. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnej granicy pomiędzy Austrią (Galicją) a Węgrami, natomiast kolorem czerwonym granicę wytyczoną na podstawie decyzji Rady Ambasadorów z 28 lipca 1920, czyli tzw. „linię Ambasadorów”, która miała stać się granicą Polski i Czechosłowacji.\nDecyzja Rady Ambasadorów dotycząca podziału Orawy była niekorzystna dla Polski, rozgraniczenie nie zostało przeprowadzone według kryterium językowego czy etnicznego. Wytyczona na mapie granica z lipca 1920 roku, została nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Ligę Narodów, przekazano Czechosłowacji dwie wsie Głodówkę (Hladovka) i Suchą Górę (Sucha Hora) na zachód od Chochołowa, w zamian za przekazaną Polsce część wsi Lipnica Wielka (Dolna Lipnica). W tak ustalonej formie (1924) granica ta funkcjonuje również współcześnie.	Frontière dans la Région d‘Orawa	Orawa, granica polsko-czechosłowacka, granica polsko-słowacka		Rada Ambasadorów, linia Ambasadorów, podział Orawy	6	S.G.A.	75000		podział Orawy pomiędzy Polskę a Czechosłowację, według decyzji Rady Ambasadorów z 28 lipca 1920 roku	14Xdi6q7m_W18g7L0J2_a-UVahlAdaQFJ.jpg	2022-04-03 13:21:43.045235+02		Mapa drukowana	thumbnails/14Xdi6q7m_W18g7L0J2_a-UVahlAdaQFJ_copy.jpg
15		13	\N	28 lipca 1920	Mapa przedstawia podział Spiszu pomiędzy Polskę a Czechosłowację, według decyzji Rady Ambasadorów z 28 lipca 1920 roku.\nDo I wojny światowej Spisz znajdował się w granicach Węgier (o czym przypomina nazewnictwo mapy). Po rozpadzie monarchii Austro-Węgierskiej oraz zakończeniu wojny, nowopowstała Czechosłowacja rościła pretensje terytorialne do całego obszaru północnych Węgier (w tym do Spiszu). Z kolei liczna na Spiszu ludność polska, zwłaszcza w jego północnej części, domagała się przyłączenia tego obszaru do Polski. W 1919 roku, podczas konferencji w Paryżu, podjęto decyzję o przeprowadzeniu w połowie 1920 roku plebiscytu, który miał zadecydować o przynależności politycznej Spiszu. Ostatecznie 2 lipca 1920 roku, podczas konferencji w Spa (Belgia) podjęto decyzję o rezygnacji z plebiscytu (z powodu wojny polsko-bolszewickiej), a decyzję o podziale tego regionu scedowano na Radę Ambasadorów, która 28 lipca 1920 roku w Paryżu, podjęła arbitralną decyzję, przyznając Polsce tylko niewielki fragment spornych obszarów, co nie zakończyło sporów terytorialnych polsko-czechosłowackich. \nNa mapie kolorem zielonym zaznaczono fragmenty dawnej granicy pomiędzy Austrią (Galicją) a Węgrami, natomiast kolorem czerwonym granicę wytyczoną na podstawie decyzji Rady Ambasadorów z 28 lipca 1920, czyli tzw. „linię Ambasadorów”, która miała stać się granicą Polski i Czechosłowacji.\nDecyzja Rady Ambasadorów dotycząca podziału Spiszu była niekorzystna dla Polski i wywołała protesty polskich władz. Nie rozstrzygnięto wówczas także spornej kwestii przynależności Doliny Jaworzyny (Tatry Wysokie). Wytyczona na mapie granica z lipca 1920 roku, została nieznacznie zmodyfikowana w roku 1924. Na wniosek Komisji Delimitacyjnej, zatwierdzony przez Ligę Narodów, Polsce przekazano niewielki obszaru na południe od wsi Jurgów i Brzegi oraz dokonano wzajemnej wymiany niewielkich terytoriów na południe od wsi Niedzica. W tak ustalonej formie (1924 rok) granica ta funkcjonuje również współcześnie.	Frontière dans la Région de Spisz	Spisz, granica polsko-czechosłowacka, granica polsko-słowacka		Rada Ambasadorów, linia Ambasadorów, podział Spiszu	6	S.G.A.	75000		podział Spiszu pomiędzy Polskę a Czechosłowację według decyzji Rady Ambasadorów z 28 lipca 1920 roku	1wB0xU_DD5FmRxvGRPie-jA80MJ1M2cw-.jpg	2022-04-03 13:21:43.065759+02		Mapa drukowana	thumbnails/1wB0xU_DD5FmRxvGRPie-jA80MJ1M2cw-_copy.jpg
17		15	\N	, ok. 1917-1919	Na mapie, obejmującej fragment pogranicza polsko-słowackiego, rozciągającego się od Popradu na wschodzie po rejon Czadcy na południe od Śląska Cieszyńskiego, przedstawiono polskie roszczenia terytorialne na Węgrzech. De facto dotyczyły one północnej Słowacji, zwłaszcza Spiszu, Orawy i Czadeckiego, jednak prawdopodobnie w momencie powstania mapy istniała jeszcze Monarchia Austro-Węgierska, a Słowacja formalnie należała do Węgier.\nNa mapie zaznaczono linie kolejowe, drogi, sieć rzeczną, granice polityczne z roku 1914 oraz z końca XVIII wieku. Głównymi elementami mapy są naniesione szrafem polskie i słowackie terytoria językowe oraz południowa granica polskich roszczeń terytorialnych obejmujących północny Spisz, północną Orawę i Czadeckie. \nPodstawą wytyczenia zasięgu polskich roszczeń terytorialnych na obszarze północnych Węgier (północnej Słowacji) było kryterium językowe. Nigdzie na omawianej mapie granica polskich roszczeń terytorialnych nie wkracza na słowackie terytorium językowe. Granica ta ściśle pokrywa się z południowym zasięgiem polskiego terytorium językowego, tylko na obszarze Spiszu wykracza dalej na południe, obejmując częściowo obszary z przewagą ludności niemieckiej oraz z polskimi „wyspami językowymi”. \nMapa ta została dołączona jako aneks do memoriału dotyczącego wytyczenia granicy pomiędzy Polską a Czechosłowacją na Śląsku Cieszyńskim, Orawie i Spiszu, przygotowanego przez delegację polską na konferencję pokojową w Paryżu w 1919 roku.\nNie podano autora mapy, ani źródła danych, można jednak przypuszczać (na podstawie porównania z innymi mapami), że została opracowana na podstawie wyników badań Kazimierza Nitscha, polskiego językoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiellońskiego, jednego z ekspertów delegacji polskiej na konferencję pokojową w Paryżu w 1919 roku.\nNa podstawie tej mapy można stwierdzić, że formułowane m.in. podczas konferencji pokojowej w Paryżu, polskie roszczenia terytorialne dotyczące Orawy i Spiszu, były całkowicie uzasadnione kryteriami językowymi i etnicznymi, a arbitralne rozstrzygnięcia Rady Ambasadorów z 28 lipca 1920 roku, dzielące te obszary pomiędzy Polskę a Czechosłowację, bez zachowania nadrzędności kryteriów językowo-etnicznych, były dla Polski oraz ludności mieszkającej na polsko-słowackim pograniczu, niesprawiedliwe i krzywdzące.	Revendications Polonaises en Hongrie	granica polsko-słowacka, pogranicze polsko-słowackie, Spisz, Orawa	Kazimierz Nitsch	struktura językowa, granice językowe, Delegacja Polska na Konferencję Pokojową w Paryżu	\N		600000		polskie roszczenia terytorialne na obszarze północnych Węgier (północnej Słowacji) na podstawie kryteriów językowych	14R4j7UEpK0bzS3DUAuzNnQfz2hTfUKJ-.jpg	2022-04-03 13:21:43.108688+02	https://drive.google.com/drive/folders/1_ucV-brrrWyavyeuiax8Fk10bsLd1Pj_?usp=sharing	Mapa drukowana	thumbnails/14R4j7UEpK0bzS3DUAuzNnQfz2hTfUKJ-_copy.jpg
45		43	\N	1902	Na niemieckiej mapie topograficznej, obejmującej Dolny Śląsk i częściowo Wielkopolskę po rozbiorową granicę prusko-rosyjską na Prośnie, wrysowano niebieskim długopisem fragment proponowanej powojennej granicy polsko-niemieckiej na Dolnym Śląsku oraz na zachód od niej, czerwoną kredką zaznaczono obszar określony jako "Polskość". Zamalowana na czerwono strefa sięga na zachodzie po Namysłów (Namslau) i Twardogórę (Festenberg), a na północny kończy się na rozlewiskach Baryczy pomiędzy Odolanowem (Adenlau) a Miliczem (Militsch), czyli na historycznym pograniczu Śląska i Wielkopolski.	Übersichtskarte von Mitteleuropa. Breslau	pogranicze polsko-pruskie, Dolny Śląsk		zabór pruski, strefa zamieszkiwania ludności polskiej	\N	Königlich-Preussische Landesaufnahme	300000		Lokalizacja ludności polskiej na Dolnym Śląsku 	1kk9tJI-lyVsfOOI3DV-JaYgzv9D1xv3f.jpg	2022-04-03 13:21:43.63209+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1kk9tJI-lyVsfOOI3DV-JaYgzv9D1xv3f_copy.jpg
46		44	\N		Na mapie przedstawiono zasięg występowania złóż węgla kamiennego i brunatnego na obszarze Czechosłowacji oraz Śląska	Carte d'ensemble des existences de charbon dans l'Etat Tchéco-slovaque	Czechosłowacja, Śląsk, granica polsko-słowacka, granica polsko-czeska		złoża węgla, surowce naturalne, mapa gospodarcza	\N				Mapa występowania złóż węgla w państwie Czechosłowackim	1xVWY4dURE2fixm1Zg4VbQ7ChD8aArVDk.jpg	2022-04-03 13:21:43.648027+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b	Mapa rękopiśmienna	thumbnails/1xVWY4dURE2fixm1Zg4VbQ7ChD8aArVDk_copy.jpg
19		17	\N	, ok. 1917-1919	Mapa w języku angielskim wydana przez Biuro Kartograficzne Centralnej Agencji Polskiej w Lozannie, przedstawiająca procentowy udział dzieci narodowości polskiej wśród uczniów szkół podstawowych w powiatach wschodniej części Prus, według oficjalnych danych statystycznych rządu pruskiego, pochodzących ze spisu szkolnego z roku 1911. Na mapie  daty, ale można przypuszczać, że została wykonana w latach 1917-1919.\nSzrafem przedstawiono udział dzieci narodowości polskiej wśród uczniów szkół podstawowych w pięciu nierównych przedziałach procentowych – 0,5-10%; 10-25%; 25-40%; 40-50%; 50-100%, na tle podziału administracyjnego na powiaty, rejencje i prowincje.\nZ danych przedstawionych na mapie wynika dominujący (ponad 50%) udział uczniów narodowości polskiej we wszystkich powiatach Górnego Śląska, wschodniej części Opolszczyzny, zdecydowanej większości Wielkopolski, większości Kaszub oraz szerokiego pasa w południowej części Mazur.\nWykorzystywanie przez polskie instytucje, na potrzeby przedstawiania argumentów za polskością Śląska, Wielkopolski, Pomorza, Warmii i Mazur, oraz w celu wykazania słuszności polskich żądań odnośnie przyszłych zachodnich granic Polski, danych pochodzących z pruskiego spisu szkolnego z 1911 roku, a nie ze spisu powszechnego z 1910 roku, było uzasadnione m.in. tym, że w spisach powszechnych narodowość była ustalana na podstawie odpowiedzi na pytanie o język ojczysty, a statystyka pruska wyszczególniała obok języka polskiego, także język kaszubski i mazurski, co skutecznie zmniejszało liczbę osób deklarujących język polski (a tym samym liczbę osób zaliczonych do polskiej narodowości). Ponadto w pruskim spisie powszechnym istniała możliwość zadeklarowania dwóch języków i część Polaków, znających także język niemiecki, deklarowało język polski wraz z niemieckim, co skutkowało zaliczeniem ich do tzw. „osób dwujęzycznych”.\nW lewym górnym rogu mapy dopisano odręcznie w języku francuskim Epreuve, czyli Test.	Ethnographic map of Prussian Poland drafted from official statistic of elementary schools in the Kingdom of Prussia year 1911	Prusy		statystyka narodowościowa, dzieci narodowości polskiej w szkołach, pruski spis szkolny 1911, Centralna Agencja Polska w Lozannie	3	Cartographical Bureau of the "Polish Central Agency" in Lausanne	1 000 000 (podziałka)		procentowy udział dzieci narodowości polskiej wśród uczniów szkół podstawowych w powiatach wschodniej części Prus, według oficjalnych danych statystycznych rządu pruskiego, pochodzących ze spisu szkolnego z roku 1911	1S0-Bw_k93Pea0m0UhXFV9oyc3i30kQ2n.jpg	2022-04-03 13:21:43.147725+02		Mapa drukowana	thumbnails/1S0-Bw_k93Pea0m0UhXFV9oyc3i30kQ2n_copy.jpg
20		18	\N	, ok. 1917-1919	Tytuł mapy można tłumaczyć jako „mapa etnograficzna ziem polskich pod zaborem pruskim”.\nJest to mapa w języku angielskim wydana przez Biuro Kartograficzne „Encyklopedii Polskiej”, przedstawiająca udział ludności polskiej w powiatach wschodniej części Prus.\nSzrafem przedstawiono procentowy udział Polaków w czterech nierównych przedziałach: 0-10%; 10-25%; 25-50%; 50-100%, na tle podziału administracyjnego na powiaty, rejencje i prowincje. Nie podano daty wykonania mapy, ani źródeł danych. Można przypuszczać, że użyto danych pruskiego spisu powszechnego z 1910 roku, choćby dlatego, że w porównaniu z podobnymi mapami wydanymi przez Centralną Agencję Polską w Lozannie, przedstawiającą udział dzieci narodowości polskiej wśród uczniów szkół podstawowych w powiatach wschodniej części Prus, według ze spisu szkolnego z roku 1911, w większej liczbie powiatów został odnotowany wyższy udział procentowy osób narodowości polskiej niż na omawianej mapie. Największe różnice są widoczne na Mazurach, Kaszubach i na Opolszczyźnie. W pruskim spisie powszechnym z 1910 roku narodowość była ustalana na podstawie odpowiedzi na pytanie o język ojczysty, a statystyka pruska wyszczególniała obok języka polskiego, także język kaszubski i mazurski, co skutecznie zmniejszało liczbę osób deklarujących język polski (a tym samym liczbę osób zaliczonych do polskiej narodowości). Ponadto w pruskim spisie powszechnym istniała możliwość zadeklarowania dwóch języków i część Polaków, znających także język niemiecki, deklarowało język polski wraz z niemieckim, co skutkowało zaliczeniem ich do tzw. „osób dwujęzycznych”.\nZ danych przedstawionych na mapie wynika dominujący (ponad 50%) udział ludności polskiej w większości powiatów Górnego Śląska (poza raciborskim), we wschodniej części Opolszczyzny, zdecydowanej większości Wielkopolski, wschodniej części Kaszub oraz w południowej części Mazur.	Ethnographical Map of Prussian Poland 	Prusy	Tadeusz Skowroński	struktura narodowościowa, pruski spis powszechny z 1910 roku, ludność polska w Prusach 	\N	Cartographical Bureau of the "Polish Encyclopedia"	 (podziałka)		udział ludności polskiej w powiatach wschodniej części Prus	1hRcAkJzBZ9sOKIW5XrkFA_6M2kj907CQ.jpg	2022-04-03 13:21:43.167768+02		Mapa drukowana	thumbnails/1hRcAkJzBZ9sOKIW5XrkFA_6M2kj907CQ_copy.jpg
47		45	\N		Mapa będąca częścią artykuły pt. "Węgiel jako postulat żywotności państwa polskiego" autorstwa inż. Franciszka Drobiniaka wydanego w Czasopiśmie Górniczo-Hutniczym w marcu 1919. Na mapie zaznaczono występowanie złóż węgla na obszarze Czechosłowacji i Śląska Cieszyńskiego.	Carte d'ensemble des existences de charbon dans l'Etat Tchéco-slovaque	granica polsko-słowacka, Śląsk Cieszyński		surowce naturalne, węgiel kamienny, węgiel brunatny	\N				surowce naturalne, węgiel kamienny	1QvHT0kjn3OhuY_SH_7EgaU8y7lF5G7N8.jpg	2022-04-03 13:21:43.661275+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b	Mapa drukowana	thumbnails/1QvHT0kjn3OhuY_SH_7EgaU8y7lF5G7N8_copy.jpg
48		46	\N		Na mapie w formie kartogramu przedstawiono procentowy udział Polaków w podziale na okręgi sądowe Galicji Wschodniej w roku 1910. Udział ludności polskiej został przedstawiony w czterech przedziałach (mniej niż 10%, 10-25%, 25-50%, więcej niż 50%). Źródłem danych prawdopodobnie by austriacki spis powszechny z 1910 roku. Największy, dominujący udział Polaków, był w części zachodniej, nad Sanem, ponadto w okolicach Lwowa oraz w części wschodniej w okolicach Tarnopola. Najmniej liczny wzdłuż łuku Karpat, w części południowo-zachodniej. \nZ boku mapy ręcznie dopisano w języku francuskim tytuł mapy i legendę, w identycznym brzmieniu jak na mapie.\n	Des Polonais dans les districts judiciaires 1910	Galicja Wschodnia		struktura narodowościowa, udział ludności polskiej, spis powszechny 1910 r., Galicja Wschodnia	\N				udział Polaków w podziale na okręgi sądowe Galicji Wschodniej w roku 1910	1Hx7H48BtD_OAZOYlAHnuawxreyHRwd8Q.jpg	2022-04-03 13:21:43.674732+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV	Mapa rękopiśmienna z dodatkowymi adnotacjami	thumbnails/1Hx7H48BtD_OAZOYlAHnuawxreyHRwd8Q_copy.jpg
21		19	\N	, ok. 1917-1919	Tytuł mapy można tłumaczyć jako „mapa etnograficzna ziem polskich pod zaborem pruskim”.\nJest to mapa w języku angielskim wydana przez Biuro Kartograficzne „Encyklopedii Polskiej”, przedstawiająca udział ludności polskiej w powiatach wschodniej części Prus.\nSzrafem przedstawiono procentowy udział Polaków w czterech nierównych przedziałach: 0-10%; 10-25%; 25-50%; 50-100%, na tle podziału administracyjnego na powiaty, rejencje i prowincje. Nie podano daty wykonania mapy, ani źródeł danych. Można przypuszczać, że użyto danych pruskiego spisu powszechnego z 1910 roku, choćby dlatego, że w porównaniu z podobnymi mapami wydanymi przez Centralną Agencję Polską w Lozannie, przedstawiającą udział dzieci narodowości polskiej wśród uczniów szkół podstawowych w powiatach wschodniej części Prus, według ze spisu szkolnego z roku 1911, w większej liczbie powiatów został odnotowany wyższy udział procentowy osób narodowości polskiej niż na omawianej mapie. Największe różnice są widoczne na Mazurach, Kaszubach i na Opolszczyźnie. W pruskim spisie powszechnym z 1910 roku narodowość była ustalana na podstawie odpowiedzi na pytanie o język ojczysty, a statystyka pruska wyszczególniała obok języka polskiego, także język kaszubski i mazurski, co skutecznie zmniejszało liczbę osób deklarujących język polski (a tym samym liczbę osób zaliczonych do polskiej narodowości). Ponadto w pruskim spisie powszechnym istniała możliwość zadeklarowania dwóch języków i część Polaków, znających także język niemiecki, deklarowało język polski wraz z niemieckim, co skutkowało zaliczeniem ich do tzw. „osób dwujęzycznych”.\nZ danych przedstawionych na mapie wynika dominujący (ponad 50%) udział ludności polskiej w większości powiatów Górnego Śląska (poza raciborskim), we wschodniej części Opolszczyzny, zdecydowanej większości Wielkopolski, wschodniej części Kaszub oraz w południowej części Mazur.	Ethnographical Map of Prussian Poland 	Prusy	Tadeusz Skowroński	struktura narodowościowa, ludność polska w Prusach, pruski spis powszechny z 1910 roku	\N	Cartographical Bureau of the "Polish Encyclopedia"	 (podziałka)		udział ludności polskiej w powiatach wschodniej części Prus	1NJXX6muvnRGgw5hJUAzW5kqVaKHcNVAE.jpg	2022-04-03 13:21:43.185005+02		Mapa drukowana	thumbnails/1NJXX6muvnRGgw5hJUAzW5kqVaKHcNVAE_copy.jpg
23		21	\N	1919	Na mapie, na obszarze szeroko pojętego pogranicza polsko-słowackiego, rozciągającego się od Śląska Cieszyńskiego i regionu Czadeckiego na zachodzie po Beskid Niski na wschodzie, przedstawiono rozmieszczenie ludności polskiej i słowackiej oraz ludności mówiącej dialektami przejściowymi.\nZostała zaznaczona sieć rzeczna, linie kolejowe, główne miejscowości (zwłaszcza na Spiszu, Orawie i w regionie Czadeckim) granice prowincji i powiatów węgierskich oraz „granice południowe istotne (kluczowe) dla Polski”. Głównymi elementami mapy są obszary rozmieszczenia Polaków „w zwartej masie” (kolor czerwony), Słowaków (kolor zielony) oraz Polaków „rozproszonych wśród innych narodowości” (szraf) i ludności mówiącej dialektami przejściowymi, w domyśle polsko-słowackimi (szraf). Rozmieszczenie Polaków i Słowaków zostało opracowane na podstawie kryteriów językowych.\nMapa została dołączona do szczegółowego opracowania w języku francuskim dotyczącego historii oraz kwestii językowych, etnicznych i gospodarczych Spiszu, Orawy i Czadeckiego, przygotowanego w 1919 roku przez Polską Komisję Prac Przygotowawczych do Konferencji Pokojowej. Można przypuszczać (na podstawie porównań z innymi mapami z tego okresu), że została ona opracowana na podstawie wyników badań Kazimierza Nitscha, polskiego językoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiellońskiego, jednego z ekspertów delegacji polskiej na konferencję pokojową w Paryżu w 1919 roku.\nZ mapy jednoznacznie wynika, że główne regiony sporne na pograniczu polsko-czechosłowacki po zakończeniu I wojny światowej, czyli Śląsk Cieszyński, region Czadecki, Orawa oraz północny Spisz, były wówczas zdominowane przez ludność polską, ewentualnie ludność posługującą się dialektami przejściowymi (południowa Orawa). Najbardziej jaskrawo jest to widoczne na przykładzie Śląska Cieszyńskiego, regionu Czadeckiego oraz północnej Orawy. Z kolei najbardziej skomplikowana sytuacja językowo-etniczna była na Spiszu, na którym występowały liczne „wyspy językowe” (w tym niemieckie) i strefy dialektów przejściowych. Natomiast w Galicji (Beskid Niski) obszary zamieszkane przez Polaków (na północy) oraz Słowaków (na południu), są rozdzielone szeroką strefą oznaczaną na mapie jako „Polacy rozproszeni wśród innych narodowości”. W rzeczywistości był to obszar w sposób zwarty zamieszkany przez Rusinów (Łemków, Rusnaków), posługujących się dialektem języka ukraińskiego, z bardzo nielicznym osadnictwem polskim i słowackim.\nNa mapie zaznaczono także propozycję „południowej granicy istotnej (kluczowej) dla Polski”. Obejmuje ona w całości region Czadecki (na południe od Śląska Cieszyńskiego), praktycznie całą Orawę, włącznie z południowymi fragmentami zamieszkanymi przez ludność mówiącą dialektami mieszanymi oraz bardzo rozległy obszar Spiszu, z Popradem i Kiezmarkiem. Granica ta, na Orawie i Spiszu sięga wyraźnie na południe od obszaru oznaczonego jako „Polacy w zwartej masie”. Ta propozycja „południowej granicy istotnej (kluczowej) dla Polski” z roku 1919, nie miała nic wspólnego z ustaloną rok później granicą polsko-czechosłowacką. Na wielu odcinkach (zwłaszcza na Spiszu i Orawie) została wytyczona w oderwaniu nie tylko do przedstawionych na mapie kryteriów etniczno-językowych, ale także od kryteriów historycznych i realiów politycznych. \nPomimo tego, na podstawie tej mapy, można stwierdzić, że formułowane m.in. podczas konferencji pokojowej w Paryżu, polskie roszczenia terytorialne dotyczące Śląska Cieszyńskiego, regionu Czadeckiego, północnej Orawy i północnego Spiszu, były uzasadnione kryteriami językowymi i etnicznymi, a arbitralne rozstrzygnięcia Rady Ambasadorów z 28 lipca 1920 roku, dzielące te obszary pomiędzy Polskę a Czechosłowację, bez zachowania nadrzędności kryteriów językowo-etnicznych, były dla Polski oraz ludności mieszkającej na polsko-czechosłowackim pograniczu, niesprawiedliwe i krzywdzące.	Carte du Spisz, de l’Orawa et du district de Czaca	Spisz, Orawa, region Czadecki, pogranicze polsko-słowackie, granica polsko-słowacka	Kazimierz Nitsch	struktura narodowościowa, struktura językowa, Polacy, Słowacy	9	LITH. ING. W. Krzeptowski	600000		Rozmieszczenie ludności polskiej i słowackiej oraz ludności mówiącej dialektami przejściowymi na pograniczu polsko-słowackim oraz propozycja wytyczenia południowej granicy Polski	1j3yfU2yjEZ4q9g37lYe1PSda2NHA9pss.jpg	2022-04-03 13:21:43.225903+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/1j3yfU2yjEZ4q9g37lYe1PSda2NHA9pss_copy.jpg
24		22	\N	, ok. 1919	Na mapie przedstawiono za pomocą szrafu, w trzech przedziałach liczbowych (powyżej 75%; powyżej 50%; około 25%), rozmieszczenie i udział procentowy ludności polskiej na obszarze Orawy i Spiszu. Ponadto zaznaczono granicę sprzed 1914 roku pomiędzy Węgrami a Austrią (Galicją), linie kolejowe, główne miasta oraz miasteczka i wsie na Spiszu i Orawie.\nNa mapie  podania źródeł użytych danych liczbowych, można jednak przypuszczać (na podstawie porównań z innymi mapami z tego okresu), że została ona opracowana na podstawie wyników badań Kazimierza Nitscha, polskiego językoznawcy i slawisty, profesora Uniwersytetu Jana Kazimierza we Lwowie i Uniwersytetu Jagiellońskiego, jednego z ekspertów delegacji polskiej na konferencję pokojową w Paryżu w 1919 roku. Oznacza to, że rozmieszczenie i liczba Polaków zostało opracowane na podstawie kryteriów językowych.\nZ mapy wynika, że Orawa i Spisz, które po zakończeniu I wojny światowej były regionami spornymi na pograniczu polsko-słowacki, były wówczas zdominowane przez ludność polską (polskojęzyczną). Najbardziej wyraźna, ponad 75% dominacja ludności polskiej (polskojęzycznej) jest widoczna zwłaszcza w północnej części Orawy i Spiszu. Im dalej na południe, tym sytuacja narodowościowo-językowa tych regionów była bardziej skomplikowana i niejednoznaczna. Dotyczyło to zwłaszcza Spiszu, na którym występowały liczne „wyspy językowe”, w tym niemieckie. \nNa podstawie omawianej mapy, można stwierdzić, że formułowane m.in. podczas konferencji pokojowej w Paryżu, polskie roszczenia terytorialne dotyczące północnej Orawy i północnego Spiszu, były uzasadnione kryteriami językowymi i etnicznymi, a arbitralne rozstrzygnięcia Rady Ambasadorów z 28 lipca 1920 roku, dzielące te obszary pomiędzy Polskę a Czechosłowację, bez zachowania nadrzędności kryteriów językowo-etnicznych, były dla Polski oraz ludności mieszkającej na polsko-słowackim pograniczu, niesprawiedliwe i krzywdzące.\nW lewym górnym roku mapy znajduje się okrągła pieczątka z napisem Komitet Narodowy Obrony Orawy, Spisza i Podhala w Warszawie.	Rozsiedlenie ludności polskiej na Orawie i Spiszu	Orawa, Spisz, pogranicze polsko-słowackie, granica polsko-słowacka	Kazimierz Nitsch	struktura narodowościowa, struktura językowa, Polacy na Spiszu i Orawie	10	Sekcja Miłośników Gór P.T.K. w Warszawie	300000		rozmieszczenie i udział procentowy ludności polskiej na Orawie i Spiszu	18qhsMLJXMmqgEnnrBhFjx1El1BPoeV4C.jpg	2022-04-03 13:21:43.249153+02	https://drive.google.com/drive/folders/1fSv7-Sx177VkV0dNIE4ynvcpz4PvzX2b?usp=sharing	Mapa drukowana	thumbnails/18qhsMLJXMmqgEnnrBhFjx1El1BPoeV4C_copy.jpg
25		23	\N	, ok. 1919	Na mapie zostały przedstawione proponowane granice Polski na tle procentowego udziału ludności polskiej oraz historycznych granic Polski z roku 1772.\nUdział ludności polskiej został przedstawiony szrafem w sześciu różnych przedziałach: większość polska, mniejszość (w domyśle polska) powyżej 33%, mniejszość 20-33%, mniejszość 5-20%, mniejszość poniżej 5% oraz mniejszość poza granicami proponowanego państwa polskiego.\nNie podano źródeł danych liczbowych użytych do wyznaczenia wielkości udziału ludności polskiej w poszczególnych regionach (co uniemożliwia ich weryfikację), a także autora oraz daty wykonania mapy.\nTreść mapy sugeruje odwołanie się, przy wytyczaniu proponowanych granic Polski, do kryteriów narodowościowych oraz historycznych, jednak nie zawsze były one stosowane konsekwentnie. \nDo proponowanego terytorium Polski włączono wszystkie regiony, gdzie Polacy stanowili większość mieszkańców (według danych wykorzystanych do opracowania mapy), także te, które wykraczały poza granice przedrozbiorowe z 1772 roku (Spisz, Orawa, część Opolszczyzny i Dolnego Śląska oraz południowe Mazury). W tych przypadkach zastosowano nadrzędność kryterium narodowościowego nad historycznym. Jednak do terytorium Polski włączono także regiony, które przed 1772 rokiem znajdowały się w jej granicach, ale w momencie opracowywania omawianej mapy, Polacy byli w nich mniejszością narodową, niejednokrotnie relatywnie nieliczną (20-33% lub zaledwie 5-20% spośród ogółu mieszkańców). Dotyczy to głównie wschodniej części – Galicji Wschodniej, Podola, Wołynia, Polesia, wschodniej i północnej Wileńszczyzny, ale także zachodniej i północnej części Wielkopolski, oraz częściowo Warmii. W tych przypadkach zastosowano nadrzędność kryterium historycznego nad narodowościowym. Najbardziej jaskrawym przykładem jest północna Warmia, Żuławy i okolice Gdańska. Natomiast w odniesieniu do zachodniej części Pomorza Gdańskiego, postanowiono całkowicie odejść, zarówno od kryterium narodowościowego, jak i historycznego, proponując wytyczenie północno-zachodniej granicy Polski na zachód od granicy przedrozbiorowej, ponadto w regionie ze znikomym udziałem ludności polskiej (okolice Słupska). Postulowany szeroki dostęp Polski do morza (od okolic Słupska po Mierzeję Wiślaną i Elbląg), był oczywiście warunkowany czynnikami strategicznymi i gospodarczymi. \nProponowane północne, zachodnie i częściowo południowe granice Polski, były – poza kilkoma wyjątkami w części północnej – zgodne z przyjętym przez twórców mapy kryterium narodowościowym oraz częściowo z przebiegiem granicy z 1772 roku, natomiast granice wschodnie z oczywistych powodów nie nawiązywały do historycznych granic przedrozbiorowych, ponadto sięgały daleko na wschód od regionów, w których Polacy stanowili większość mieszkańców. \nPostulowane terytorium Polski, obejmowało bardzo rozległy obszar – na północy z Pomorzem Gdańskim, Warmią i południową częścią Mazur, na zachodzie z Wielkopolską i Opolszczyzną, na południu z Orawą i Spiszem, na wschodzie sięgało daleko za Zbrucz, a na krańcach północno-wschodnich nie ograniczało się do Wileńszczyzny i Polesia, ale włączało do Polski m.in. także Mińsk, Dyneburg i Połock. \nBył to zdecydowanie większy zakres terytorialny niż udało się ostatecznie Polsce uzyskać w konsekwencji decyzji konferencji paryskiej, plebiscytów, powstań śląskich i wojny z Rosją bolszewicką.	Pologne et Pays Limitrophes	granice Polski, Polska		proponowane granice Polski, struktura narodowościowa, Komitet Narodowy Polski	\N				proponowane granice Polski na tle procentowego udziału ludności polskiej oraz historycznych granic Polski z roku 1772	1RZ-AINxdw2DBaveArdGhxr04sSYlFw_P.jpg	2022-04-03 13:21:43.262181+02		Mapa drukowana	thumbnails/1RZ-AINxdw2DBaveArdGhxr04sSYlFw_P_copy.jpg
26		24	\N	, po 1916	Na mapie przedstawiono granice Polski w różnych okresach historycznych, w podziale na najdalsze granice Polski, granice Polski z roku 1772, granice państw wasalnych, granice Księstwa Warszawskiego z lat 1807-1815 oraz granice Królestwa Polskiego z lat 1815-1831. Ponadto wypisano okresy czasowe, w których dane terytorium znajdowało się pod zwierzchnictwem Polski oraz kolorami zaznaczono zasięgi poszczególnych rozbiorów Polski wraz z państwami zaborczymi. Zapisano także nazwy głównych regionów geograficzno-historycznych.\nW efekcie mapa przedstawia wszystkie terytoria, które kiedykolwiek bezpośrednio należały do Polski lub były od Polski w jakiś sposób zależne, od Rugi, Łużyc i Czech na zachodzie, po wybrzeże Morza Czarnego i Inflanty na wschodzie.\nPod legendą znajduje się informacja, że została ona opracowana i wygrawerowana z serii map wydanych w 1916 roku przez Eugeniusza Romera, profesora geografii z Uniwersytetu Lwowskiego.	Historical map of Poland	granice Polski	Eugeniusz Romer	historyczne granice Polski, historyczne terytorium Polski, rozbiory	11	Rand McNally	, (podziałka)		granice Polski w różnych okresach historycznych wraz z zaznaczeniem wszystkich terytoriów, które kiedykolwiek bezpośrednio należały do Polski lub były od Polski w jakiś sposób zależne	1m2a2KCNDdn_OgCfn11rVYQFskl_1e9L2.jpg	2022-04-03 13:21:43.282192+02		Mapa drukowana	thumbnails/1m2a2KCNDdn_OgCfn11rVYQFskl_1e9L2_copy.jpg
27		25	\N		Na mapie przedstawiono podział polityczny ziem polskich przed I wojną na tle ogólnej struktury językowej (obszarów językowych), w sposób nie do końca konsekwentny.\nW ramach podziału politycznego przedstawiono przedwojenne granice państw zaborczych oraz w części zachodniej i południowej główne regiony historyczno-geograficzne (Galicja, Śląsk, Poznańskie, Prusy Zachodnie, Prusy Wschodnie). Natomiast na obszarze zaboru rosyjskiego  jest odwołania do regionów historyczno-geograficznych, a zamiast nich przedstawiono podział administracyjny na poszczególne gubernie (na obszarze włączonym do Cesarstwa Rosyjskiego) oraz Królestwo Polskie (na pozostałym obszarze). Pomimo tego, że mapa została opracowana podczas I wojny (lub tuż po niej), nie zaznaczono guberni chełmskiej utworzonej w roku 1912, a wydzielonej z Królestwa Polskiego w roku 1915.\nPoza podziałem polityczno-administracyjnym, mapa przedstawia „obszary językowe” – polski, rusiński (ukraiński), białoruski i litewski.  jest wyszczególnienia obszarów z dominacją ludności niemieckojęzycznej. Ponadto w odniesieniu do ludności mówiącej w języku rusińskim (ukraińskim), białoruskim i litewskim, za pomocą kolorów zaznaczono wyłącznie zwarte obszary na których stanowi ona ponad 50% ogółu mieszkańców. Inną metodę zastosowano wobec pokazania rozmieszczenia ludności polskojęzycznej, zaznaczając kolorem obszar jej liczbowej dominacji, ale także przedstawiając szrafem mniejszościowy udział osób posługujących się językiem polskim, w trzech przedziałach procentowych (25-50%; 10-25%; poniżej 10%). Dzięki temu możliwe było pokazanie obecności ludności polskojęzycznej na bardzo rozległym obszarze, zdecydowanie wykraczającym poza „polski obszar językowy”, szczególnie na wschodzie (obejmuje wszystkie ziemie w granicach z 1772 roku), ale także na zachodzie i południu, gdzie w kilku miejscach wykracza poza granice przedrozbiorowe (Spisz, Orawa, Księstwo Cieszyńskie, Śląsk, Pomorze, Mazury). \nNie podano źródeł statystycznych dotyczących struktury językowej, co utrudnia weryfikację danych.	The political subdivision of the Polish territory before the war and its linguistic areas.			struktura językowa, Polacy, Ukraińcy, Białorusini, Litwini, historyczne terytorium Polski	\N				podział polityczny ziem polskich przed I wojną na tle ogólnej struktury językowej (obszarów językowych) - polskiego, rusińskiego (ukraińskiego), białoruskiego, litewskiego	1WkjPYruEHs-0sBhT0CgAjvoV3RbfqRkP.jpg	2022-04-03 13:21:43.302897+02		Mapa rękopiśmienna	thumbnails/1WkjPYruEHs-0sBhT0CgAjvoV3RbfqRkP_copy.jpg
28		26	\N	, prawdopodobnie 1919	Pomimo tego, że na mapie nie ma podanego nazwiska autora oraz daty jej wykonania, można stwierdzić, iż jest to mapa z propozycją granic przyszłego terytorium Polski przedstawiona wiosną 1919 roku przez polską delegację pod przewodnictwem Romana Dmowskiego, podczas Konferencji Paryskiej.\nNa mapie przedstawiono proponowane granice Polski na tle struktury narodowościowej (językowej), z podziałem na Polaków, Rusinów (Ukraińców), Litwinów i Białorusinów. Kolorami zaznaczono obszary, gdzie te cztery narodowości stanowią od 50 do 100% ogółu mieszkańców, natomiast dodatkowo, tylko w odniesieniu do ludności polskiej (polskojęzycznej), zaznaczono szrafem regiony gdzie są grupą mniejszościową, w przedziałach 25-50%, 10-25% oraz mniej niż 10%.\nNie podano źródeł danych statystycznych, co utrudnia ich weryfikację.\nPonadto na mapie naniesiono sieć rzeczną, główne miasta oraz granice innych państw: Rosji, Niemiec, Czechosłowacji, Węgier i Rumunii. Zaznaczono także obszary występowania surowców mineralnych: węgla i cynku na Śląsku, żelaza i miedzi w Świętokrzyskim, soli w Małopolsce i ropy naftowej w Galicji Wschodniej.\nProponowane granice Polski nie nawiązują do granic historycznych z roku 1772 (co w roku 1919 było nierealne), ale z drugiej strony nie ograniczają się tylko do regionów z większością ludności polskiej, nie są wytyczone według kryteriów etnicznych. Zwłaszcza na wschodzie postulowane jest przyłączenie rozległych obszarów z dominacja ludności litewskiej, białoruskiej i ukraińskiej, a proponowana granica z Rosją została wytyczona zdecydowanie na wschód od dawnego Królestwa Kongresowego, także wyraźnie na wschód od Zbrucza czy Mińska oraz na północ od Dźwiny. Również na zachodzie i północy polskie żądania terytorialne względem Niemiec, dotyczyły niejednokrotnie obszarów z niewielkim udziałem ludności polskiej, zwłaszcza na Pomorzu, Warmii i Mazurach oraz zachodniej Opolszczyźnie. Z kolei proponowana granica południowa obejmowała m.in. Śląsk Cieszyński, Orawę i Spisz. Jednak najdalej szedł postulat włączenia w granice Polski całego terytorium tzw. Litwy etnicznej.\nTaki kształt postulowanego terytorium przyszłej Polski, odbiegający od kryteriów historycznych oraz narodowościowych (językowych) był uzasadniony czynnikami gospodarczymi, strategicznymi i politycznymi.\nPostulowane terytorium Polski, zwłaszcza w części zachodniej i północnej, było w ówczesnych uwarunkowaniach politycznych, mało prawdopodobne do urzeczywistnienia. Nie udało się przeforsować m.in. propozycji dotyczących Śląska Opolskiego i całości Górnego Śląska, ponadto Warmii i Mazur, Gdańska czy szerszego dostępu do Bałtyku. Nierealny był także postulat przyłączenia całego terytorium Litwy. Również ustalona ostatecznie w wyniku wojny polsko-bolszewickiej granica na wschodzie, była mniej korzystna, niż proponowana na omawianej mapie.	The proposed frontiers of Poland	granice Polski	Roman Dmowski	Konferencja Paryska, Komitet Narodowy Polski, delegacja polska, struktura narodowościowa, struktura językowa	\N				Propozycja granic przyszłego terytorium Polski przedstawiona wiosną 1919 roku przez polską delegację pod przewodnictwem Romana Dmowskiego, podczas Konferencji Paryskiej.	1gB_U1of3C6dZHn3GuhhmfpcqaLaAPond.jpg	2022-04-03 13:21:43.325132+02		Mapa drukowana	thumbnails/1gB_U1of3C6dZHn3GuhhmfpcqaLaAPond_copy.jpg
33		31	\N	prawdopodobnie grudzień 1919 lub początek 1920	Mapa jest załącznikiem do deklaracji Rady Najwyższej mocarstw sprzymierzonych i stowarzyszonych w sprawie tymczasowych granic wschodnich RP z 8 grudnia 1919 roku. Przedstawia przebieg granic już wyznaczonych oraz tych, które powinny zostać ustalone. Dodatkowo prezentuje obszary plebiscytowe.\nNa uwagę zasługuje wytyczony na mapie przebieg polskiej granicy wschodniej, który zdecydowanie odbiega od ówczesnych polskich postulatów terytorialnych. Jest on bardzo zbliżony do współczesnego przebiegu granicy polskiej, od Karpat, wzdłuż Bugu, po Suwalszczyznę, z tym że w Bieszczadach oraz na Podlasiu, linia graniczna jest wytyczona jeszcze dalej na zachód niż obecna wschodnia granica Polski. Poza terytorium Polski znajduje się m.in. Wileńszczyzna, Grodno, Białowieża wraz z Puszczą Białowieską, Lwów oraz cala Galicja Wschodnia. W lipcu 1920 roku, dyplomacja brytyjska, zaproponowała linię demarkacyjną pomiędzy wojskami polskimi a rosyjskimi, zwaną „linią Curzona”, wzorując ją w głównych zarysach na linii granicznej pierwszy raz wytyczonej na omawianej mapie. Także władze radzieckie w 1945 roku, postulując wytyczenie nowej granicy pomiędzy ZSRR a Polską, skutecznie odwoływały się do przebiegu granicy określonej przez Radę Najwyższą w grudniu 1919 roku i wyznaczonej na tej mapie. \n	Pologne	granice Polski	G. Clemenceau	proponowane granice Polski, obszary plebiscytowe, linia Curzona	\N		1000000		granice wymagające oraz nie wymagające delimitacji w terenie z zaznaczonymi obszarami plebiscytowymi	1hvulai1cPgp1pqxuHYm7cNd-KszBpKO8.jpg	2022-04-03 13:21:43.404817+02	https://drive.google.com/drive/folders/1KjBGsCNbn_Vpt_duxHBHAopMnSfLiFyg?usp=sharing	Mapa drukowana	thumbnails/1hvulai1cPgp1pqxuHYm7cNd-KszBpKO8_copy.jpg
34		32	\N		Na mapie przedstawiono procentowy udział Polaków według powiatów na obszarze szeroko pojętej tzw. historycznej Litwy, wraz z Suwalszczyzna, ziemią grodzieńską oraz wschodnim Podlasiem, z Białymstokiem i Bielskiem Podlaskim, czyli poza historyczne granice dawnego Wielkiego Księstwa Litewskiego. Dane pochodzą ze spisu z 1916 r. przeprowadzonego przez administrację niemiecką.\nMapa potwierdza dominujący udział ludności polskiej na obszarze wschodniego Podlasia, Suwalszczyzny oraz w szerokim pasie środkowej Litwy, wraz z Wileńszczyzną, a także powiatami na północ od Wilna. Udział Polaków na tych obszarach wynosi od 50 do 80%, a w niektórych powiatach (zwłaszcza na Wileńszczyźnie i w części Podlasia), przekracza 80%.  W mniejszym udziale (do 5 do 50%) ludność polska zamieszkiwała także powiaty położone zarówno na południe na Wileńszczyzny oraz ziemi grodzieńskiej, jak i na północ, aż po Kiejdany.\n	Polonais en Lithuanie statistique allemande 1916. Copie d'un croquis officiel	Litwa, Suwalszczyzna, wschodnie Podlasie		spis ludności, struktura narodowościowa, Polacy na obszarze Litwy, Suwalszczyzny, wschodniego Podlasia	\N			Polonais en Lithuanie	Udział Polaków w ogólnej liczbie mieszkańców na szeroko pojętym obszarze tzw. historycznej Litwy, wraz z Suwalszczyzną i wschodnim Podlasiem	1Ib7uPHNEjtyXl8Or3mK1gDjwxokcAD3r.jpg	2022-04-03 13:21:43.423225+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1Ib7uPHNEjtyXl8Or3mK1gDjwxokcAD3r_copy.jpg
50		48	\N		Na mapie przedstawiono udział ludności rzymsko-katolickiej w polsko-ruskiej części Galicji wg. stanu z 1910 roku. Dane zaprezentowano w postaci metody kropkowej z wskazaniem procentowego udziału rzymskich katolików w poszczególnych gminach. Źródłem danych prawdopodobnie by austriacki spis powszechny z 1910 roku.\nUżyto czterech przedziałów procentowych – mniej niż 25%, 25-50%, 50-75%, ponad 75%. Tylko przedział najmniejszy został oznaczony kolorem niebieskim, wszystkie pozostałe (od 25%) zaznaczono na czerwono. Był to z pewnością zabieg celowy. W konsekwencji trudno jednoznacznie określić regiony z dominacją ludności rzymsko-katolickiej, ponieważ kolor czerwony, poza Karpatami, występuje wszędzie, choć nie wszędzie oznacza ponad 50% udział katolików obrządku łacińskiego, wśród których na terenie Galicji wyraźnie dominowała ludność narodowości polskiej.\n	Ludność rzymsko-katolicka w polsko-ruskiej części Galicyi. I. Stan w r. 1910.	Galicja Wschodnia		wyznanie rzymsko-katolickie, mapa wyznaniowa, spis powszechny 1910	17	G. Freytag & Berndt, Wien	750000		ludność rzymsko-katolicka w Galicji w roku 1910	1HOc57xqNQy6TrLKAIIkqvYpIQO2waZBB.jpg	2022-04-03 13:21:43.703714+02	https://drive.google.com/drive/folders/1CmbGHBmX4vQ8KWrobQGiZR3TVQEvMYzV?usp=sharing	Mapa drukowana	thumbnails/1HOc57xqNQy6TrLKAIIkqvYpIQO2waZBB_copy.jpg
35		33	\N		Na mapie przedstawiono procentowy udział Litwinów według powiatów na obszarze szeroko pojętej tzw. historycznej Litwy, wraz ze Żmudzią, Suwalszczyzną i wschodnim Podlasiem, aż po Białystok i Bielsk Podlaski, czyli poza historyczne granice dawnego Wielkiego Księstwa Litewskiego. Dane pochodzą ze spisu z 1918 r. przeprowadzonego administrację niemiecką.\nMapa potwierdza dominujący udział ludności litewskiej na obszarze Żmudzi oraz północnej i środkowej Litwy. Udział Litwinów na tych obszarach wynosi od 50 do 80%, a w części północnej przekracza 80%. \nJednocześnie mapa potwierdza znikomy udział Litwinów wśród mieszkańców północnej Wileńszczyzny oraz Suwalszczyzny i ich praktyczny  na południe od Wilna, Grodna i Augustowa. \n	Lithuaniens en Lithuanie. D'apres la statistique allemande 1918	Litwa, Żmudź, Suwalszczyzna, wschodnie Podlasie		spis ludności, struktura narodowościowa, Litwini na szeroko pojetym obszarze tzw. historycznej Litwy	\N			Lithuaniens en Lithuanie	Udział Litwinów w ogólnej liczbie mieszkańców na szeroko pojętym obszarze tzw. historycznej Litwy, wraz z Suwalszczyzną i wschodnim Podlasiem	1mm5LQ7jSijXbmOaBOVFPcWqmYq0R7-t6.jpg	2022-04-03 13:21:43.442121+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1mm5LQ7jSijXbmOaBOVFPcWqmYq0R7-t6_copy.jpg
36		34	\N		Pomimo tytułu mapy sugerującego, że dotyczy ona wyłącznie ludności litewskiej, przedstawiono na niej procentowy udział Litwinów (kolor czarny) oraz Polaków (kolor biały) w diecezji wileńskiej. Prezentowane dane są pochodną zapytanie Konsystorza Katolickiego z 1908 r. Zakładając, że na początku XX w., wśród katolików na tym obszarze zdecydowanie dominowali Litwini i Polacy, można przyjąć, że mapa przedstawia rozmieszczenie oraz strukturę narodowościową ogółu ludności katolickiej w diecezji wileńskiej. \nWyraźnie widać bardzo istotne dysproporcje w strukturze narodowościowej ludności należącej do diecezji wileńskiej. Katolicy narodowości litewskiej przeważali w północnej i zachodniej części diecezji, natomiast katolicy narodowości polskiej całkowicie dominowali w centralnej i południowej części, zwłaszcza na Wileńszczyźnie. \n	Lituaniens dans le diocèse de Wilno. Enquète du Consistoire Catholique 1908	diecezja wileńska, Wileńszczyzna, Litwa		Struktira narodowościowa, katolicy, diecezja wileńska, Litwini, Polacy	\N			Lituaniens dans le diocèse de Wilno. 	Procentowy udział Litwinów i Polaków w diecezji wileńskiej, struktura narodowościowa katolików diecezji wileńskiej	1jxOCjv4vAtwZCOLnnwjseXY5ii-FPx9-.jpg	2022-04-03 13:21:43.456448+02	https://drive.google.com/drive/folders/1y82fI6_LvSiV4EsWVW9HMnT1ITycLdaT?usp=sharing	Mapa drukowana	thumbnails/1jxOCjv4vAtwZCOLnnwjseXY5ii-FPx9-_copy.jpg
37		35	\N		Tytuł mapy sugeruje ograniczenie jej zasięgu do Litwy i Rusi (Białoruś i Ukraina), natomiast w rzeczywistości mapa obejmuje bardzo rozległy obszar, obejmujący poza Litwą, Białorusią i zdecydowaną większością Ukrainy, także częściowo Łotwę oraz wschodnie Podlasie z Białostocczyzną.\nCały obszar został przedstawiony w podziale administracyjnym na gubernatorstwa oraz wchodzące w ich skład dystrykty.\n	Lithuanie et Ruthenie	Litwa, Białoruś, Ukraina		podział administracyjny	\N		5000000		podział administracyjny Litwy, Białorusi, Ukrainy oraz fragmentu Łotwy i Podlasia	12UnPfMY86-khkdF4u5orDRCixwS_E-yX.jpg	2022-04-03 13:21:43.472653+02	https://drive.google.com/drive/folders/15CILHwTWajYurkxrQyaw-rN9chNYeU-g?usp=sharing	Mapa drukowana	thumbnails/12UnPfMY86-khkdF4u5orDRCixwS_E-yX_copy.jpg
38		36	\N	1915	Na mapie, opublikowanej w 1915 r., przedstawiono wizję podziału politycznego Europy po zakończeniu I wojny światowej, wraz z nowym przebiegiem granic państwowych, z perspektywy angielskiej.\nJak w przypadku zdecydowanej większości „map futurystycznych” rzeczywistość okazało się w bardzo wielu aspektach odmienna od przewidywań, jednak na uwagę zasługuje pojawienie się na mapie z 1915 r. Polski, powstałej kosztem utraty części ziem przez wszystkich trzech zaborców, co okazało się prorocze. Pomimo tego, że wytyczone na mapie terytorium przyszłej Polski, okazało się, zwłaszcza na północy i południowym – wschodzie, istotnie większe niż realnie ukształtowane po wojnie, to jednak przewidywany kształt Polski, dużo lepiej oddawał rzeczywistość, niż przewidywania dotyczące przyszłości Austro-Węgier czy Bałkanów. \n	L'EUROPE APRES LA GUERRE. CARTE EN PERSPECTIVE dessinee et publiee par la Societe ANGLO-CONTINENTALE & INTERNATIONALE LE 3 aout 1914	Europa, Polska		przewidywany podział polityczny Europy	13			L'EUROPE APRES LA GUERRE.	wizja zmian granic państwowych w Europie po I wojnie światowej	15tit5BKNRlTvYBgb_tK9XiNYjt0S8SCV.jpg	2022-04-03 13:21:43.493097+02		Mapa drukowana	thumbnails/15tit5BKNRlTvYBgb_tK9XiNYjt0S8SCV_copy.jpg
39		37	\N		Na mapie przedstawiającej schemat sieci kolejowej wraz z granicami rozbiorowymi, zaznaczono odręcznie kredką, przebieg postulowanych zachodnich granic Polski według raportu Komisji dla spraw polskich. Mapa jest załącznikiem do listu przesłanego do ministra spraw zagranicznych Ignacego Paderewskiego. Treść korespondencji zawiera szczegółowy opis przebiegu granicy.\nWytyczony na mapie przebieg granicy polsko-niemieckiej, odbiega, zwłaszcza na Śląsku i Pomorzu, od ostatecznie ustalonych granic. \n	Ziemie polskie zaboru pruskiego	granica polsko-niemiecka	Ignacy Jan Paderewski, Jules Cambon, William Tyrrel, Isaiah Bowman,	Komisja dla spraw polskich	\N		750000		propozycja zachodnich granic Polski według raportu Komisji dla spraw polskich	1k0qShA2HKg-w8sEd2_rOVQM6WaZMHNZ8.jpg	2022-04-03 13:21:43.510221+02	https://drive.google.com/drive/folders/15CILHwTWajYurkxrQyaw-rN9chNYeU-g?usp=sharing	Mapa drukowana z odręcznymi adnotacjami	thumbnails/1k0qShA2HKg-w8sEd2_rOVQM6WaZMHNZ8_copy.jpg
53		51	\N		Na mapie zaznaczono proponowane przebiegi granic na obszarze Galicji. Mapa zawiera dawne granice administracyjne Galicji Wschodniej, dawne granice powiatów oraz nowe granice, zarówno Galicji Wschodniej, jak i wchodzących w jej skład powiatów, wyznaczone według Statutu dla Galicji Wschodniej.		Galicja Wschodnia		granice, Statut dla Galicji Wschodniej	\N				propozycje szczegółowego przebiegu nowych granic administracyjnych w Galicji	1xi7-kVjySUH8G2TpjZuKx4vhN9ZoBKhD.jpg	2022-04-03 13:21:43.757227+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1xi7-kVjySUH8G2TpjZuKx4vhN9ZoBKhD_copy.jpg
40		38	\N		Na mapie przedstawiono rozmieszczenie i liczebność ludności niemieckiej w zachodniej Polsce według oficjalnego spisu powszechnego z 1910 lub 1905 r., statystyki zawodów i innych urzędowych publikacji.\nPomimo zawartego w tytule określenia „zachodnia Polska”, mapa obejmuje większy obszar niż ten, który znalazł się w granicach Polski w konsekwencji decyzji konferencji paryskiej. Jest to wyraźnie widoczne zarówno na Mazurach, Pomorzu Gdańskim, Wielkopolsce, jak i Górnym Śląsku oraz Opolszczyźnie.  \nAutor mapy, dzieli Niemców zamieszkujących na tym obszarze na ludność bezpośrednio zależną od rządu (urzędnicy, wojskowi, osadnicy zamieszkujący mieszkania publiczne), zaznaczając ich kolorem czerwonym oraz kolonistów osiedlonych przez rząd pruski od 1886 r., tylko częściowo zależnych od rządu lub całkowicie niezależnych od polityków (kolor niebieski).\nWedług autora mapy, ludność niemiecka bezpośrednio uzależniona od własnego rządu, zdecydowanie dominuje na tym obszarze, zwłaszcza na Górnym Śląsku, Opolszczyźnie, Mazurach i Pomorzy Gdańskim. Natomiast w Wielkopolsce, Kujawach, Powiślu oraz na Kaszubach, zamieszkuje zarówno ludność zależna od rządu (zwłaszcza w miastach), jak i koloniści niezależni od polityków (szczególnie na terenach wiejskich).\n	The German population in West Poland	zachodnia Polska, Pomorze Gdańskie, Mazury, Wielkopolska, Górny Śląsk, Opolszczyzna		ludność niemiecka	\N				ludność niemiecka w zachodniej Polsce	1dmirt85xe4oACzQtMtWE-Zn-0Ul8MGvk.jpg	2022-04-03 13:21:43.529298+02		Mapa rękopiśmienna	thumbnails/1dmirt85xe4oACzQtMtWE-Zn-0Ul8MGvk_copy.jpg
42		40	\N		Na mapie zaprezentowano dominujący udział ludności niemieckiej lub polskiej na obszarze wschodnich prowincji Rzeszy Niemieckiej. \nJest to mapa w języku niemieckim wydana w Niemczech, w zakładzie kartograficznym Perthesa, przedstawiająca przeważający udział ludności niemieckiej lub polskiej w poszczególnych gminach wschodniej części Prus. Kolorem oraz szrafem przedstawiono procentowy udział Niemców (kolor czerwony) oraz Polaków (kolor zielony) w trzech przedziałach: powyżej 50 %; powyżej 70% oraz powyżej 85% na tle podziału administracyjnego na gminy, powiaty, rejencje i prowincje. Mapa została wykonana na podstawie danych pruskiego spisu powszechnego z 1910 roku, który zaniżał udział ludności polskiej. W spisie tym narodowość była ustalana na podstawie odpowiedzi na pytanie o język ojczysty, a w pruskim spisie powszechnym m.in. istniała możliwość zadeklarowania dwóch języków i część Polaków, znających także język niemiecki, deklarowało język polski wraz z niemieckim, co skutkowało zaliczeniem ich do tzw. „osób dwujęzycznych”.\nPomimo tego, mapa jednoznacznie obrazuje dominację w 1910 roku ludności polskiej (deklarującej używanie języka polskiego) w strukturze narodowościowej mieszkańców rozległych obszarów wschodniej części ówczesnych Prus, m.in.: południowej części Mazur, Kaszub, Wielkopolski, Górnego Śląska, Opolszczyzny i północno-wschodniej części Dolnego Śląska.\nMapa ta po zakończeniu I wojny budziła liczne kontrowersje i dyskusje. Była niejednokrotnie krytykowana przez niemieckich kartografów, którzy zarzucali jej błędy metodologiczne, a nawet fałszerstwa, z kolei opinie polskich kartografów były przychylne (szerzej M. Górny, 2017, Kreślarze ojczyzn. Geografowie i granice międzywojennej Europy, s. 141-145).  	Nationalitätenkarte der östlichen Provinzen des Deutschen Reichs nach den Ergebnissen der amtlichen  Volkszahlung vom Jahre 1910	Wschodnie prowincje Rzeszy Niemieckiej, Mazury, Wielkopolska, Śląsk, Opolszczyzna, Pobrzeże Gdańskie, Kaszuby		pruski spis powszechny 1910 roku, struktura narodowościowa, struktura językowa, Niemcy, Polacy	15	Gotha: Justus Perthes	500000	Nationalitätenkarte der östlichen Provinzen des Deutschen Reichs	Mapa narodowościowa wschodnich prowincji Rzeszy Niemieckiej na podstawie wyników spisu ludności z 1910 r. 	17HXvGMonyJANUXQfvJ1ivdz_5IwcW8nJ.jpg	2022-04-03 13:21:43.566119+02		Mapa drukowana	thumbnails/17HXvGMonyJANUXQfvJ1ivdz_5IwcW8nJ_copy.jpg
43		41	\N	1919	Mapa nr I ilustrująca memoriał "Polska i Finlandia" z roku 1919.\nObejmuje rozległy obszar Europy Środkowo-Wschodniej, od północnej Finlandii, po Morze Czarne. Wyróżniono na niej terytoria zasiedlone przez poszczególne narody – Finów, Estończyków, Łotyszy, Litwinów, Niemców, Polaków, Białorusinów, Ukraińców, Czechów, Słowaków, Węgrów, Rumunów. Pomimo pewnego schematyzmu i uogólnień, zaznaczone obszary generalnie są zgodne z rzeczywistym ówczesnym rozmieszczeniem dominacji liczebnej poszczególnych narodowości. Natomiast na mapa nie uwzględniono, bardzo licznych w tej części Europy, rozproszonych mniejszości narodowych.\nZasadniczym elementem mapy jest wyraźnie zaznaczona „zachodnia granica Rosji”, biegnąca od Morza Białego na północy, poprzez Petersburg i okolice Lwowa do Karpat, a następnie wschodnią granicą Rumunii do Mora Czarnego w okolicach Odessy.\nZgodnie z przyjętymi przez Autora mapy założeniami, regiony zamieszkane przez Ukraińców i Białorusinów oraz liczną tam mniejszość polską (za wyjątkiem fragmentów z dominacją ludności katolickiej), powinny zostać włączone do Rosji. \nRzeczywista zachodnia granica Rosji, ustalona w roku 1921, nie odbiegała zasadniczo od propozycji przedstawionej na omawianej mapie.\n	 Finlandia i Polska I	Europa Środkowo-Wschodnia, Polska, Finlandia		struktura narodowościowa, front antyrosyjski	10				zróżnicowanie narodowościowe Europy Środkowo-Wschodniej oraz propozycja podziału tego regionu pomiędzy Rosję a pozostałe narody 	1feADX0lwLKF05l9QsqQFm-Pu4LnqrvLN.jpg	2022-04-03 13:21:43.588815+02	https://drive.google.com/drive/folders/1J0iVuKiQIpnP71ztxLMurhKYIY9vVUCp?usp=sharing	Mapa rękopiśmienna	thumbnails/1feADX0lwLKF05l9QsqQFm-Pu4LnqrvLN_copy.jpg
44		42	\N	1915	Mapa fizyczno-geograficzna Galicji i Bukowiny, obrazująca przede wszystkim ukształtowanie powierzchni oraz sieć rzeczną, ale także uwzględniająca sieć komunikacyjną i jednostki osadnicze.	Mapa Galicyi i Bukowiny z Wielkim Księstwem Krakowskiem	Galicja, Bukowina		Galicja	16	Gubrynowicz i Syn	700000		ukształtowanie powierzchni i sieć rzeczna Galicji i Bukowiny	1QuEvNoXt0BZqXfbla06cSGyTqZ0EDqSy.jpg	2022-04-03 13:21:43.607826+02		Mapa drukowana z odręcznymi adnotacjami	thumbnails/1QuEvNoXt0BZqXfbla06cSGyTqZ0EDqSy_copy.jpg
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
9	T.	Skowroński
10	Władysław	Semkowicz
11	Eugeniusz	Romer
12	F.	Pilczek
13	Jakob	Spett
14	Stanisław	Majerski
15	Teofil	Szumański
16	M.	Święchowski
\.


--
-- Data for Name: map_browser_publicationplaces; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_publicationplaces (id, city_name, country_name) FROM stdin;
2	Wrocław	
3	Lausanne	Szwajcaria
4	 (wersja drukowana), natomiast elementy naniesione odręcznie wykonano w Brnie	 (wersja drukowana), natomiast elementy naniesione odręcznie wykonano w Czechosłowacji
5	Warszawa	[Polska]
6	, prawdopodobnie Paryż	, prawdopodobnie Francja
7	Paryż	Francja
8	Kraków	Polska
9	Cracovie	Polska
10	Warszawa	Polska
11	New York	Stany Zjednoczone
12	Warszawa, Kraków	Polska
13		Wielka Brytania
14	Poznań	
15	Gotha	Niemcy
16	Lwów	
17	Wiedeń	Austria
18	Warszawa	
\.


--
-- Data for Name: map_browser_subjecttypes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.map_browser_subjecttypes (id, name) FROM stdin;
1	Gospodarcza
2	Społeczna
3	Polityczna
4	Administracyjna
5	Ogólnogeograficzna
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

