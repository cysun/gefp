--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: csjobs; Type: SCHEMA; Schema: -; Owner: hgadhia
--

CREATE SCHEMA csjobs;


ALTER SCHEMA csjobs OWNER TO hgadhia;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: cell_checkpoints; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE cell_checkpoints (
    cell_id bigint NOT NULL,
    checkpoint_id bigint NOT NULL,
    order_num integer NOT NULL
);


ALTER TABLE public.cell_checkpoints OWNER TO hgadhia;

--
-- Name: cells; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE cells (
    id bigint NOT NULL,
    flightplan_id bigint,
    runway_id bigint,
    stage_id bigint,
    parent_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.cells OWNER TO hgadhia;

--
-- Name: checkpoint_info; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE checkpoint_info (
    id bigint NOT NULL,
    message character varying(255),
    checkpoint_id bigint
);


ALTER TABLE public.checkpoint_info OWNER TO hgadhia;

--
-- Name: checkpoint_info_comments; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE checkpoint_info_comments (
    checkpoint_info_id bigint NOT NULL,
    comment_id bigint NOT NULL
);


ALTER TABLE public.checkpoint_info_comments OWNER TO hgadhia;

--
-- Name: checkpoints; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE checkpoints (
    id bigint NOT NULL,
    name text NOT NULL,
    parent_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.checkpoints OWNER TO hgadhia;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE comments (
    id bigint NOT NULL,
    comment text,
    commentedby_id bigint,
    datetime timestamp without time zone,
    visibletostudent boolean DEFAULT true,
    deleted boolean DEFAULT false
);


ALTER TABLE public.comments OWNER TO hgadhia;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying(255),
    plan_id bigint,
    active boolean NOT NULL,
    deleted boolean DEFAULT false
);


ALTER TABLE public.departments OWNER TO hgadhia;

--
-- Name: flightplan_runways; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE flightplan_runways (
    flightplan_id bigint NOT NULL,
    runway_id bigint NOT NULL,
    order_num integer NOT NULL
);


ALTER TABLE public.flightplan_runways OWNER TO hgadhia;

--
-- Name: flightplan_stages; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE flightplan_stages (
    flightplan_id bigint NOT NULL,
    stage_id bigint NOT NULL,
    order_num integer NOT NULL
);


ALTER TABLE public.flightplan_stages OWNER TO hgadhia;

--
-- Name: flightplans; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE flightplans (
    id bigint NOT NULL,
    name character varying(255),
    department_id bigint,
    published boolean NOT NULL,
    term_name character varying(255),
    term_year character varying(4),
    parent_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.flightplans OWNER TO hgadhia;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: hgadhia
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO hgadhia;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO hgadhia;

--
-- Name: runways; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE runways (
    id bigint NOT NULL,
    name character varying(255),
    parent_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.runways OWNER TO hgadhia;

--
-- Name: stages; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE stages (
    id bigint NOT NULL,
    name character varying(255),
    parent_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.stages OWNER TO hgadhia;

--
-- Name: user_checkpoints_info; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE user_checkpoints_info (
    user_id bigint NOT NULL,
    checkpoint_info_id bigint NOT NULL
);


ALTER TABLE public.user_checkpoints_info OWNER TO hgadhia;

--
-- Name: user_comments; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE user_comments (
    user_id bigint NOT NULL,
    comment_id bigint NOT NULL
);


ALTER TABLE public.user_comments OWNER TO hgadhia;

--
-- Name: user_plan_history; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE user_plan_history (
    user_id bigint NOT NULL,
    plan_id bigint NOT NULL
);


ALTER TABLE public.user_plan_history OWNER TO hgadhia;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO hgadhia;

--
-- Name: users; Type: TABLE; Schema: public; Owner: hgadhia; Tablespace: 
--

CREATE TABLE users (
    id bigint NOT NULL,
    cin character varying(255),
    username character varying(255),
    password character varying(255),
    email character varying(255),
    first_name character varying(255),
    middle_name character varying(255),
    last_name character varying(255),
    department_id integer,
    plan_id bigint,
    major_id integer,
    enabled boolean NOT NULL,
    deleted boolean DEFAULT false,
    newaccount boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO hgadhia;

--
-- Data for Name: cell_checkpoints; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 75, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 76, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 77, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (78, 79, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (81, 80, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (81, 82, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 84, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 85, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 86, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 87, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 88, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 89, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 90, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 91, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 92, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 93, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 94, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 95, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 96, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 97, 13);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 98, 14);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 100, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 102, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 103, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 104, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 105, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 106, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 107, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 109, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 110, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 111, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 112, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 113, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 114, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 115, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 116, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 117, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (108, 118, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (119, 120, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (121, 122, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (123, 124, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 126, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 127, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 128, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 129, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 130, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 131, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 132, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 133, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 134, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 135, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 136, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 137, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 139, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 140, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 141, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 142, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 143, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 144, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 145, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 146, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 147, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 149, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 150, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 151, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 152, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 153, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 154, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 155, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 156, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (148, 157, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (158, 159, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (158, 160, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (158, 161, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (158, 162, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (158, 163, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (158, 164, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 166, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 167, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 168, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 169, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 170, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 171, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (172, 173, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (172, 174, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (172, 175, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (172, 176, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (172, 177, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (172, 178, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 180, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 181, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 182, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 183, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 184, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 185, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 186, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (187, 188, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (187, 189, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (187, 190, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (187, 191, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (187, 192, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (187, 193, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 195, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 196, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 197, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 198, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 199, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 200, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 201, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 202, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 203, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 204, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 205, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (194, 206, 11);


--
-- Data for Name: cells; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (74, 64, 65, 68, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (78, 64, 67, 68, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (81, 64, 66, 68, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (83, 64, 65, 69, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (99, 64, 66, 69, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (108, 64, 67, 69, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (119, 64, 65, 73, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (121, 64, 66, 73, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (123, 64, 67, 73, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (125, 64, 65, 70, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (138, 64, 66, 70, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (148, 64, 67, 70, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (158, 64, 67, 71, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (165, 64, 65, 71, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (172, 64, 65, 72, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (179, 64, 66, 72, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (187, 64, 67, 72, NULL, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (194, 64, 66, 71, NULL, false);


--
-- Data for Name: checkpoint_info; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5003, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5004, '', 113);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5005, '', 102);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5006, '', 92);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5007, '', 93);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5008, '', 84);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5009, '', 85);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5010, '', 86);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5011, '', 87);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5012, '', 198);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5013, '', 197);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5014, '', 195);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5015, '', 167);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5017, '', 159);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5018, '', 176);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5019, '', 186);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5022, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5023, '', 120);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5024, '', 127);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5025, '', 87);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5026, '', 124);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5027, '', 171);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5028, '', 128);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5029, '', 198);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5030, '', 129);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5031, '', 112);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5032, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5033, '', 151);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5034, '', 149);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5035, '', 113);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5036, '', 113);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5037, '', 115);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5038, '', 196);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5039, '', 105);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5040, '', 170);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5041, '', 140);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5042, '', 184);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5043, '', 151);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5044, '', 152);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5045, '', 156);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5046, '', 157);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5047, '', 124);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5048, '', 79);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5049, '', 142);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5050, '', 145);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5051, '', 162);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5052, '', 184);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5053, '', 183);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5055, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5056, '', 103);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5057, '', 106);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5058, '', 98);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5059, '', 115);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5060, '', 159);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5061, '', 196);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5064, '', 82);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5065, '', 100);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5066, '', 144);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5067, '', 136);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5068, '', 130);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5069, '', 152);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5070, '', 159);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5071, '', 164);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5072, '', 188);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5073, '', 180);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5074, '', 174);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5076, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5077, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5079, '', 100);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5080, '', 106);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5081, '', 140);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5082, '', 202);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5083, '', 162);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5084, '', 193);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5085, '', 124);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5086, '', 120);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5087, '', 176);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5088, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5089, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5090, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5091, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5092, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5093, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5094, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5095, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5096, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5097, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5098, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5099, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5100, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5101, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5102, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5103, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5104, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5106, '', 120);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5107, '', 173);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5108, '', 174);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5109, '', 175);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5110, '', 176);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5111, '', 177);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5112, '', 178);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5113, '', 166);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5114, '', 167);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5115, '', 168);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5116, '', 169);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5117, '', 170);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5118, '', 171);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5121, '', 126);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5122, '', 127);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5123, '', 128);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5124, '', 129);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5125, '', 130);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5126, '', 131);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5127, '', 132);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5128, '', 133);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5129, '', 134);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5130, '', 135);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5131, '', 84);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5132, '', 85);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5133, '', 86);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5134, '', 87);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5135, '', 88);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5136, '', 89);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5137, '', 90);


--
-- Data for Name: checkpoint_info_comments; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO checkpoint_info_comments (checkpoint_info_id, comment_id) VALUES (5113, 5119);


--
-- Data for Name: checkpoints; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (76, '<p>Pre-calculus (before (Yr 1)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (111, '<p>Share with someone in your community about what you are learning in school</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (84, '<p>Math 206 (Calc I)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (85, '<p>Math 207 (Calc II)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (86, '<p>Math 208 (Calc III)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (87, '<p>Phys 211</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (90, '<p>Go to office hours after 1st assignment in every class</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (91, '<p>Keep track of your grades / progress in each course</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (92, '<p>Get tutoring for any course with grade &lt; B</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (95, '<p>ECST New Student Registration</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (96, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (97, '<p>Group Advising</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (98, '<p>Academic &amp; Personal Advisement</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (132, '<p>200-level&nbsp;computer science&nbsp;courses.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (104, '<p>Identify at least one type of career in your field of interest</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (105, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (106, '<p>Apply for Financial Aid (&nbsp;<a href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (107, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (80, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (82, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (79, '<p>Make a list of questions to ask during orientation and ask them</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (113, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (109, '<p>Find out about ECST student organizations at ECST week</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (114, '<p>Student Faculty Breakfast</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (115, '<p>Leadership Convocation</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (116, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (117, '<p>MEP Welcome Back BBQ</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (118, '<p>ECST Week &ndash; participate</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (120, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (122, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (124, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (126, '<p>Math 209 (Calc IV)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (127, '<p>Math 215 (Diff Eq)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (128, '<p>Physics 212</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (129, '<p>Physics 213</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (130, '<p>Attend Math AEW</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (131, '<p>Attend Physics AEW</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (133, '<p>Lower division GE requirements</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (134, '<p>Get tutoring on courses you need help with</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (135, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (136, '<p><!--[if !supportLists]-->Group Advising</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (75, '<p>Algebra (before Yr 1)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (93, '<p>Attend Math Academic Excellence Workshops (AEW) (i.e. ENGR 154 workshops)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (89, '<p>CS 101</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (88, 'ENGR 150', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (94, '<p>Attend Physics&nbsp; AEW (I.e. ENGR 154 workshops)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (140, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (142, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (143, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (144, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (145, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (146, '<p>ECST Career Fair</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (147, '<p>Apply for financial aid and scholarships</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (139, '<p>Visit career center and find out what services they offer</p><p>(<a target="_blank" href="http://www.calstatela.edu/univ/cdc">http://www.calstatela.edu/univ/cdc</a>)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (137, '<p>Academic &amp; Personal Advisement</p><p>(<a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a>)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (141, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><p>(<a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a>)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (149, '<p>Participate in ECST student council activities</p><p>(&nbsp;<a target="_blank" href="http://web.calstatela.edu/orgs/etsc/">http://web.calstatela.edu/orgs/etsc/</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (112, '<p>Participate in time management workshop (Tutorial Center)</p><p>(&nbsp;<a target="_blank" href="http://www.calstatela.edu/tutorialcenter">http://www.calstatela.edu/tutorialcenter</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (110, '<p>Join at least one student organization and actively participate</p><p>(&nbsp;<a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (150, '<p>Take a service learning course&nbsp;or otherwise participate in a community service project</p><p>(&nbsp;<a target="_blank" href="http://web.calstatela.edu/centers/sl/">http://web.calstatela.edu/centers/sl/</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (151, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (152, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (153, '<p>Student Faculty Breakfast</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (154, '<p>Leadership Convocation</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (155, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (156, '<p>MEP Welcome Back BBQ</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (157, '<p>ECST Week &ndash; help run one of the events</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (159, '<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (160, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (161, '<p>Leadership Convocation</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (162, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (163, '<p>MEP Welcome Back BBQ</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (164, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (166, '<p>Complete 200-level engineering courses</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (167, '<p>Complete 300-level engineering courses</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (168, '<p>Choose upper division specialization</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (169, '<p>Get tutoring on courses you need help with</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (170, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (173, '<p>Upper division&nbsp; specialization</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (174, '<p>Upper division technical electives</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (175, '<p>Upper division GE requirements</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (177, '<p>Any outstanding requirements</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (178, '<p>Get tutoring on courses you need help with</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (181, '<p>Attend career fairs to submit your resume</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (182, '<p>Social media workshop (Career Development Center)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (183, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (184, '<p>Participate in interviewing workshops</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (185, '<p>Apply for jobs and/or &nbsp;graduate school</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (186, '<p>ECST Career Fair</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (188, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (189, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (190, '<p>Leadership Convocation</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (191, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (192, '<p>MEP Welcome Back BBQ</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (193, '<p>ECST Week &ndash; Outreach</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (195, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (196, '<p>Preparing for the career fair workshop (Career Development Center)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (197, '<p>Create/update your resume with help from career center</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (198, '<p>Mock interview workshop (Career Development Center)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (199, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (200, '<p>Apply for summer internships</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (202, '<p>Internship in following summer</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (203, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (204, '<p>ECST Career Fair</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (205, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (206, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (77, '<p>Attend STEP (<a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">Link Here</a>)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (103, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p><ul><li>Civil Engineering (<a href="http://www.calstatela.edu/ecst/ce" target="_blank">http://www.calstatela.edu/ecst/ce</a>)</li><li>Electrical and Computer Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/</a><a href="http://www.calstatela.edu/ecst/ece" target="_blank">ece</a>)</li><li>Mechanical Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/m</a><a href="http://www.calstatela.edu/ecst/me" target="_blank">e</a>)</li><li>Computer Science Technology (<a href="http://www.calstatela.edu/ecst/tech" target="_blank">http://www.calstatela.edu/ecst/tech</a>)</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (180, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources</a></li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (171, '<p>Academic &amp; Personal Advisement</p><p>(<a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a>)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (176, '<p>Senior design</p><p>(<a target="_blank" href="http://www.calstatela.edu/ecst/ppp">http://www.calstatela.edu/ecst/ppp</a>)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (100, '<p>Take online assessment test.</p><div class="clearfix">&nbsp;</div><div class="accordion"><p>Keirsey</p><div><p><a target="_blank" href="http://www.keirsey.com/">http://www.keirsey.com/</a></p></div><p>Rileyguide</p><div><p><a target="_blank" href="http://www.rileyguide.com/assess.html">http://www.rileyguide.com/assess.html</a></p></div></div><div class="clearfix">&nbsp;</div>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (102, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources Link</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">Clubs and Organisations Link</a></li></ol>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (201, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><p>(<a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a>)</p>', NULL, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO comments (id, comment, commentedby_id, datetime, visibletostudent, deleted) VALUES (5078, '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 1, '2015-09-23 12:14:21.475', true, false);
INSERT INTO comments (id, comment, commentedby_id, datetime, visibletostudent, deleted) VALUES (5119, '<p>Student has completed the 200 level clases.</p>', 2, '2015-09-23 12:29:29.133', true, false);
INSERT INTO comments (id, comment, commentedby_id, datetime, visibletostudent, deleted) VALUES (5120, '<p>Student is doing well with Academic Performace.</p>', 2, '2015-09-23 12:30:47.407', true, false);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (2, 'Technology - Graphics Communications', NULL, true, false);
INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (1, 'Electrical Engineering', 64, true, false);


--
-- Data for Name: flightplan_runways; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 65, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 66, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 67, 2);


--
-- Data for Name: flightplan_stages; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 68, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 69, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 70, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 71, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 72, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 73, 5);


--
-- Data for Name: flightplans; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO flightplans (id, name, department_id, published, term_name, term_year, parent_id, deleted) VALUES (64, 'MyGoldenEagle Flight Plan 2.0', 1, true, 'Spring', '2015', NULL, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: hgadhia
--

SELECT pg_catalog.setval('hibernate_sequence', 5137, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO roles (id, name) VALUES (1, 'ADMIN');
INSERT INTO roles (id, name) VALUES (2, 'ADVISOR');
INSERT INTO roles (id, name) VALUES (3, 'STUDENT');


--
-- Data for Name: runways; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO runways (id, name, parent_id, deleted) VALUES (65, 'Academic Performance', NULL, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (66, 'Career Preparation', NULL, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (67, 'Leadership & Community Engagement', NULL, false);


--
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO stages (id, name, parent_id, deleted) VALUES (68, 'Pre-college (pre-flight checklist)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (69, 'Freshman (take-off)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (70, 'Sophomore (climbing altitude)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (71, 'Junior (cruising altitude)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (72, 'Senior (descent)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (73, 'Graduation  (Landing)', NULL, false);


--
-- Data for Name: user_checkpoints_info; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5003);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5004);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5005);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5006);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5007);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5008);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5009);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5010);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5011);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5012);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5013);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5014);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5015);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5017);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5018);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5001, 5019);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5022);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5016, 5023);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5025);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5016, 5026);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5016, 5027);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5028);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5016, 5029);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5030);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5031);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5033);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5034);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5032);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5024);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5036);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5037);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5038);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5039);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5040);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5041);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5042);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5043);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5044);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5045);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5046);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5047);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5048);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5049);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5050);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5051);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5052);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5053);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5055);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5056);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5057);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5058);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5059);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5060);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5061);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5064);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5065);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5066);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5067);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5068);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5069);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5070);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5071);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5072);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5073);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5074);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5076);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5077);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5079);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5080);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5081);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5082);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5083);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5084);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5085);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5086);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5087);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5088);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5002, 5089);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5016, 5090);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5016, 5091);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5016, 5092);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5093);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5094);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5095);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5062, 5096);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5062, 5097);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5062, 5098);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5099);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5100);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5063, 5101);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5102);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5103);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5075, 5104);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5106);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5107);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5108);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5109);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5110);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5111);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5112);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5113);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5114);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5115);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5116);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5117);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5118);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5121);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5122);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5123);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5124);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5125);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5126);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5127);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5128);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5129);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5130);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5131);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5132);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5133);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5134);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5135);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5136);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5020, 5137);


--
-- Data for Name: user_comments; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO user_comments (user_id, comment_id) VALUES (5054, 5078);
INSERT INTO user_comments (user_id, comment_id) VALUES (5021, 5120);


--
-- Data for Name: user_plan_history; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO user_plan_history (user_id, plan_id) VALUES (5001, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5020, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5002, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5016, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5021, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5054, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5063, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5062, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5075, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5105, 64);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO user_roles (user_id, role_id) VALUES (1, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (2, 2);
INSERT INTO user_roles (user_id, role_id) VALUES (3, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (4, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (6, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (7, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (5001, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5002, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5016, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5020, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5021, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5054, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5062, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5063, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5075, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5105, 3);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: hgadhia
--

INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (4, '38745120', 'jdoe2', 'abcd', 'jdoe2@calstatela.edu', 'John', '', 'Doe', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (1, '304367456', 'cysun', 'abcd', 'csun@calstatela.edu', 'Chengyu', NULL, 'Sun', 1, NULL, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (2, '354120102', 'tfox', 'abcd', 'tfox@calstatela.edu', 'T.', NULL, 'Fox', 1, NULL, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (3, '310451230', 'jdoe1', 'abcd', 'jdoe1@email.com', 'Joe', '', 'Doe', 2, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5, '', 'cmarsh', '', 'cmarsh@calstatela.edu', 'Candi', '', 'Marsh', 2, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (6, '', 'rramir74', '', 'Rodolfo.Ramirez74@calstatela.edu', 'Rodolfo', '', '', 2, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (7, '', 'dwon', '', 'dwon@calstatela.edu', 'Deborah', '', 'Won', 2, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5020, '303193025', 'jpatel29', '', ' jpatel29@calstatela.edu', ' Jatinkumar', 'H', 'PATEL', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5002, '304823589', 'pbhayan', '', ' pbhayan@calstatela.edu', ' Pratik', 'Pareshkumar', 'Bhayani', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5016, '304375908', 'mlakde', '', ' mlakde@calstatela.edu', ' Mohit Lomesh', '', 'Lakde', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5001, '304367237', 'hgadhia', '', ' hgadhia@calstatela.edu', ' Harsh', 'Deepak', 'Gadhia', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5021, '304355784', 'rsaggu', '', ' rsaggu@calstatela.edu', 'Ravinder  Singh Satpal Singh', '', 'Saggu', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5054, '303222555', 'Kraghev', '', ' kraghev@calstatela.edu', ' Krishna Venugopal', '', 'Raghvan', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5063, '303555222', 'ngala', '', ' ngala@calstatela.edu', ' Nishant', '', 'Gala', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5062, '304399841', 'clnu', '', ' clnu@calstatela.edu', ' Chaitra Bhoomesh', '', 'Bhoomesh ', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5075, '123456', 'ashetty2', '', ' ashetty2@calstatela.edu', ' Akshay', '', 'Shetty', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5105, '304351494', 'knaphad', '', ' knaphad@calstatela.edu', 'Kuntal', '', 'Naphade', 1, 64, 1, true, false, false);


--
-- Name: cell_checkpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY cell_checkpoints
    ADD CONSTRAINT cell_checkpoints_pkey PRIMARY KEY (cell_id, order_num);


--
-- Name: cells_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT cells_pkey PRIMARY KEY (id);


--
-- Name: checkpoint_info_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY checkpoint_info
    ADD CONSTRAINT checkpoint_info_pkey PRIMARY KEY (id);


--
-- Name: checkpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY checkpoints
    ADD CONSTRAINT checkpoints_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: flightplan_runways_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY flightplan_runways
    ADD CONSTRAINT flightplan_runways_pkey PRIMARY KEY (flightplan_id, order_num);


--
-- Name: flightplan_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY flightplan_stages
    ADD CONSTRAINT flightplan_stages_pkey PRIMARY KEY (flightplan_id, order_num);


--
-- Name: flightplans_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY flightplans
    ADD CONSTRAINT flightplans_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: runways_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY runways
    ADD CONSTRAINT runways_pkey PRIMARY KEY (id);


--
-- Name: stages_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (id);


--
-- Name: uk_2umxy8nc75gwo3e226t49xwud; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY checkpoint_info_comments
    ADD CONSTRAINT uk_2umxy8nc75gwo3e226t49xwud UNIQUE (comment_id);


--
-- Name: uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: hgadhia; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fk_1bq0aejed37fc3yhyfoca8qqu; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY cell_checkpoints
    ADD CONSTRAINT fk_1bq0aejed37fc3yhyfoca8qqu FOREIGN KEY (checkpoint_id) REFERENCES checkpoints(id);


--
-- Name: fk_1wf9r8tt6uplitq11live2dk3; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_1wf9r8tt6uplitq11live2dk3 FOREIGN KEY (commentedby_id) REFERENCES users(id);


--
-- Name: fk_2umxy8nc75gwo3e226t49xwud; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY checkpoint_info_comments
    ADD CONSTRAINT fk_2umxy8nc75gwo3e226t49xwud FOREIGN KEY (comment_id) REFERENCES comments(id);


--
-- Name: fk_3eqlt264c3rc8n84quloojtyk; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_3eqlt264c3rc8n84quloojtyk FOREIGN KEY (flightplan_id) REFERENCES flightplans(id);


--
-- Name: fk_3gx84bsex3s6euk16si98b4bn; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY flightplan_runways
    ADD CONSTRAINT fk_3gx84bsex3s6euk16si98b4bn FOREIGN KEY (flightplan_id) REFERENCES flightplans(id);


--
-- Name: fk_4l75xv25nciaskmgvbxdcd424; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_4l75xv25nciaskmgvbxdcd424 FOREIGN KEY (stage_id) REFERENCES stages(id);


--
-- Name: fk_50kuq1dpt3aqxcs4fbq3g6rub; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY flightplan_runways
    ADD CONSTRAINT fk_50kuq1dpt3aqxcs4fbq3g6rub FOREIGN KEY (runway_id) REFERENCES runways(id);


--
-- Name: fk_5q4rc4fh1on6567qk69uesvyf; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fk_5q4rc4fh1on6567qk69uesvyf FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: fk_616coai34fffxvxpd3jld8lr5; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY user_comments
    ADD CONSTRAINT fk_616coai34fffxvxpd3jld8lr5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_6cqnnuwwyb86k8u38lli3cj87; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY user_plan_history
    ADD CONSTRAINT fk_6cqnnuwwyb86k8u38lli3cj87 FOREIGN KEY (plan_id) REFERENCES flightplans(id);


--
-- Name: fk_7phkg3qghukhuw9kj3ahkmw; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_7phkg3qghukhuw9kj3ahkmw FOREIGN KEY (department_id) REFERENCES departments(id);


--
-- Name: fk_8a20talpum1ntge7ig51igoms; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY flightplan_stages
    ADD CONSTRAINT fk_8a20talpum1ntge7ig51igoms FOREIGN KEY (flightplan_id) REFERENCES flightplans(id);


--
-- Name: fk_8dw4ib1a0lhu8xdh7s4s4tha; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_8dw4ib1a0lhu8xdh7s4s4tha FOREIGN KEY (runway_id) REFERENCES runways(id);


--
-- Name: fk_9yc90uxhxcs0p3y3mex1ah62b; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY checkpoint_info
    ADD CONSTRAINT fk_9yc90uxhxcs0p3y3mex1ah62b FOREIGN KEY (checkpoint_id) REFERENCES checkpoints(id);


--
-- Name: fk_ee923ho25tpwwk7uiqpqi9j5e; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY checkpoint_info_comments
    ADD CONSTRAINT fk_ee923ho25tpwwk7uiqpqi9j5e FOREIGN KEY (checkpoint_info_id) REFERENCES checkpoint_info(id);


--
-- Name: fk_fw07m5a94adnwosnrub52aeh1; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY user_plan_history
    ADD CONSTRAINT fk_fw07m5a94adnwosnrub52aeh1 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_g1uebn6mqk9qiaw45vnacmyo2; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fk_g1uebn6mqk9qiaw45vnacmyo2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_hns371mipbxro6xxw1v3yeosi; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY flightplan_stages
    ADD CONSTRAINT fk_hns371mipbxro6xxw1v3yeosi FOREIGN KEY (stage_id) REFERENCES stages(id);


--
-- Name: fk_kebocneql90di3fku9sfskicl; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY user_comments
    ADD CONSTRAINT fk_kebocneql90di3fku9sfskicl FOREIGN KEY (comment_id) REFERENCES comments(id);


--
-- Name: fk_km7rd8sgwa1qls24gkxoh2b2i; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_km7rd8sgwa1qls24gkxoh2b2i FOREIGN KEY (plan_id) REFERENCES flightplans(id);


--
-- Name: fk_o7g61i4bgr3mnxyukfi78dsb2; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY user_checkpoints_info
    ADD CONSTRAINT fk_o7g61i4bgr3mnxyukfi78dsb2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_ppgeqpgh9b3dyqdofg4h00bm8; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY cell_checkpoints
    ADD CONSTRAINT fk_ppgeqpgh9b3dyqdofg4h00bm8 FOREIGN KEY (cell_id) REFERENCES cells(id);


--
-- Name: fk_q37jte7r1ptl16arimkk23y1h; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_q37jte7r1ptl16arimkk23y1h FOREIGN KEY (major_id) REFERENCES departments(id);


--
-- Name: fk_s9garnqrhi1ayd9ls9txkx20p; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY user_checkpoints_info
    ADD CONSTRAINT fk_s9garnqrhi1ayd9ls9txkx20p FOREIGN KEY (checkpoint_info_id) REFERENCES checkpoint_info(id);


--
-- Name: fk_teos0btacmvhp1xyob6dx4m16; Type: FK CONSTRAINT; Schema: public; Owner: hgadhia
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT fk_teos0btacmvhp1xyob6dx4m16 FOREIGN KEY (plan_id) REFERENCES flightplans(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

