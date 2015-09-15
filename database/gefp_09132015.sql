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
-- Name: cell_checkpoints; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE cell_checkpoints (
    cell_id bigint NOT NULL,
    checkpoint_id bigint NOT NULL,
    order_num integer NOT NULL
);


ALTER TABLE public.cell_checkpoints OWNER TO gefp;

--
-- Name: cells; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE cells (
    id bigint NOT NULL,
    flightplan_id bigint,
    runway_id bigint,
    stage_id bigint,
    parent_id bigint
);


ALTER TABLE public.cells OWNER TO gefp;

--
-- Name: checkpoint_info; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE checkpoint_info (
    id bigint NOT NULL,
    message character varying(255),
    checkpoint_id bigint
);


ALTER TABLE public.checkpoint_info OWNER TO gefp;

--
-- Name: checkpoints; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE checkpoints (
    id bigint NOT NULL,
    name text NOT NULL,
    parent_id bigint
);


ALTER TABLE public.checkpoints OWNER TO gefp;

--
-- Name: department_plans; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE department_plans (
    department_id integer NOT NULL,
    plan_id bigint NOT NULL
);


ALTER TABLE public.department_plans OWNER TO gefp;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying(255),
    plan_id bigint,
    active boolean NOT NULL,
    deleted boolean NOT NULL
);


ALTER TABLE public.departments OWNER TO gefp;

--
-- Name: flightplan_runways; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE flightplan_runways (
    flightplan_id bigint NOT NULL,
    runway_id bigint NOT NULL,
    order_num integer NOT NULL
);


ALTER TABLE public.flightplan_runways OWNER TO gefp;

--
-- Name: flightplan_stages; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE flightplan_stages (
    flightplan_id bigint NOT NULL,
    stage_id bigint NOT NULL,
    order_num integer NOT NULL
);


ALTER TABLE public.flightplan_stages OWNER TO gefp;

--
-- Name: flightplans; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE flightplans (
    id bigint NOT NULL,
    name character varying(255),
    department_id bigint,
    published boolean NOT NULL,
    season_name character varying(255),
    season_year character varying(4),
    parent_id bigint
);


ALTER TABLE public.flightplans OWNER TO gefp;

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: gefp
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.hibernate_sequence OWNER TO gefp;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255)
);


ALTER TABLE public.roles OWNER TO gefp;

--
-- Name: runways; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE runways (
    id bigint NOT NULL,
    name character varying(255),
    parent_id bigint
);


ALTER TABLE public.runways OWNER TO gefp;

--
-- Name: stages; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE stages (
    id bigint NOT NULL,
    name character varying(255),
    parent_id bigint
);


ALTER TABLE public.stages OWNER TO gefp;

--
-- Name: user_checkpoints_info; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE user_checkpoints_info (
    user_id bigint NOT NULL,
    checkpoint_info_id bigint NOT NULL
);


ALTER TABLE public.user_checkpoints_info OWNER TO gefp;

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL
);


ALTER TABLE public.user_roles OWNER TO gefp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
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
    deleted boolean NOT NULL,
    newaccount boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO gefp;

--
-- Data for Name: cell_checkpoints; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 761, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 762, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 763, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 764, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 765, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 766, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 767, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 768, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 769, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 770, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 771, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (760, 772, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (45, 46, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (773, 774, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (773, 775, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (773, 776, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 75, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 76, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 77, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (78, 79, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (773, 777, 3);
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
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (773, 778, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (773, 779, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (780, 781, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (300, 301, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (300, 302, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (300, 303, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (304, 305, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (306, 307, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (306, 308, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 310, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 311, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 312, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 313, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 314, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 315, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 316, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 317, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 318, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 319, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 320, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 321, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 322, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 323, 13);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (309, 324, 14);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (325, 326, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (325, 327, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (325, 328, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (325, 329, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (325, 330, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (325, 331, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (325, 332, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 334, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 335, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 336, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 337, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 338, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 339, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 340, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 341, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 342, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (333, 343, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (344, 345, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (346, 347, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (348, 349, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 351, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 352, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 353, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 354, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 355, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 356, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 357, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 358, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 359, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 360, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 361, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (350, 362, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 364, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 365, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 366, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 367, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 368, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 369, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 370, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 371, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (363, 372, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 374, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 375, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 376, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 377, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 378, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 379, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 380, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 381, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (373, 382, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (383, 384, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (383, 385, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (383, 386, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (383, 387, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (383, 388, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (383, 389, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (390, 391, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (390, 392, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (390, 393, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (390, 394, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (390, 395, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (390, 396, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (397, 398, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (397, 399, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (397, 400, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (397, 401, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (397, 402, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (397, 403, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (404, 405, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (404, 406, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (404, 407, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (404, 408, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (404, 409, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (404, 410, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (404, 411, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (412, 413, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (412, 414, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (412, 415, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (412, 416, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (412, 417, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (412, 418, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 420, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 421, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 422, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 423, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 424, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 425, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 426, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 427, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 428, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 429, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 430, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (419, 431, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (780, 782, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (780, 783, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (780, 784, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (780, 785, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (780, 786, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (780, 787, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (788, 789, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (788, 790, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (788, 791, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (788, 792, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (788, 793, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (788, 794, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (795, 796, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (795, 797, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (795, 798, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (795, 799, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (795, 800, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (795, 801, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (802, 803, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (802, 804, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (802, 805, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (802, 806, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (802, 807, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (802, 808, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 810, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 811, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 812, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 813, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 814, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 815, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 816, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 817, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (809, 818, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 820, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 821, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 822, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 823, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 824, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 825, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 826, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 827, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (819, 828, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 830, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 831, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 832, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 833, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 834, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 835, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 836, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 837, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 838, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 839, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 840, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (829, 841, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (842, 843, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (844, 845, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (846, 847, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 849, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 850, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 851, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 852, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 853, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 854, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 855, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 856, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 857, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (848, 858, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (859, 860, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (859, 861, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (859, 862, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (859, 863, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (859, 864, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (859, 865, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (859, 866, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 868, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 869, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 870, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 871, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 872, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 873, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 874, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 875, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 876, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 877, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 878, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 879, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 880, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 881, 13);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (867, 882, 14);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (883, 884, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (883, 885, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (886, 887, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (888, 889, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (888, 890, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (888, 891, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (45, 612, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (614, 615, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (614, 616, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (614, 617, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (618, 619, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (620, 621, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (620, 622, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 624, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 625, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 626, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 627, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 628, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 629, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 630, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 631, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 632, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 633, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 634, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 635, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 636, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 637, 13);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (623, 638, 14);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (639, 640, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (639, 641, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (639, 642, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (639, 643, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (639, 644, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (639, 645, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (639, 646, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 648, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 649, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 650, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 651, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 652, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 653, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 654, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 655, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 656, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (647, 657, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (658, 659, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (660, 661, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (662, 663, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 665, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 666, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 667, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 668, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 669, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 670, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 671, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 672, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 673, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 674, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 675, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (664, 676, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 678, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 679, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 680, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 681, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 682, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 683, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 684, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 685, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (677, 686, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 688, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 689, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 690, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 691, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 692, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 693, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 694, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 695, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (687, 696, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (697, 698, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (697, 699, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (697, 700, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (697, 701, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (697, 702, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (697, 703, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (704, 705, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (704, 706, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (704, 707, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (704, 708, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (704, 709, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (704, 710, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (711, 712, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (711, 713, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (711, 714, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (711, 715, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (711, 716, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (711, 717, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (718, 719, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (718, 720, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (718, 721, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (718, 722, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (718, 723, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (718, 724, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (718, 725, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (726, 727, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (726, 728, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (726, 729, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (726, 730, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (726, 731, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (726, 732, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 734, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 735, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 736, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 737, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 738, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 739, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 740, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 741, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 742, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 743, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 744, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (733, 745, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 755, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 917, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 918, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 919, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 920, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 921, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 922, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 923, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 924, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 925, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 926, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 927, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (916, 928, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (929, 930, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (929, 931, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (929, 932, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (929, 933, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (929, 934, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (929, 935, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (936, 937, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (936, 938, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (936, 939, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (936, 940, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (936, 941, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (936, 942, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (936, 943, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (944, 945, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (944, 946, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (944, 947, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (944, 948, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (944, 949, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (944, 950, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (951, 952, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (951, 953, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (951, 954, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (951, 955, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (951, 956, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (951, 957, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (958, 959, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (958, 960, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (958, 961, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (958, 962, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (958, 963, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (958, 964, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 966, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 967, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 968, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 969, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 970, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 971, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 972, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 973, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (965, 974, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 976, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 977, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 978, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 979, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 980, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 981, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 982, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 983, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (975, 984, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 986, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 987, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 988, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 989, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 990, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 991, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 992, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 993, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 994, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 995, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 996, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 997, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (985, 998, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (999, 1000, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1001, 1002, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1003, 1004, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1006, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1007, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1008, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1009, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1010, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1011, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1012, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1013, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1014, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1005, 1015, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1016, 1017, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1016, 1018, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1016, 1019, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1016, 1020, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1016, 1021, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1016, 1022, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1016, 1023, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1025, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1026, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1027, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1028, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1029, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1030, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1031, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1032, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1033, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1034, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1035, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1036, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1037, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1038, 13);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1024, 1039, 14);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1040, 1041, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1040, 1042, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1043, 1044, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1045, 1046, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1045, 1047, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (1045, 1048, 2);


--
-- Data for Name: cells; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (45, 2, 42, 44, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (74, 64, 65, 68, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (78, 64, 67, 68, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (81, 64, 66, 68, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (83, 64, 65, 69, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (99, 64, 66, 69, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (108, 64, 67, 69, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (119, 64, 65, 73, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (121, 64, 66, 73, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (123, 64, 67, 73, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (125, 64, 65, 70, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (138, 64, 66, 70, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (148, 64, 67, 70, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (158, 64, 67, 71, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (165, 64, 65, 71, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (172, 64, 65, 72, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (179, 64, 66, 72, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (187, 64, 67, 72, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (194, 64, 66, 71, NULL);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (300, 299, 432, 435, 74);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (304, 299, 434, 435, 78);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (306, 299, 433, 435, 81);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (309, 299, 432, 436, 83);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (325, 299, 433, 436, 99);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (333, 299, 434, 436, 108);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (344, 299, 432, 440, 119);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (346, 299, 433, 440, 121);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (348, 299, 434, 440, 123);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (350, 299, 432, 437, 125);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (363, 299, 433, 437, 138);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (373, 299, 434, 437, 148);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (383, 299, 434, 438, 158);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (390, 299, 432, 438, 165);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (397, 299, 432, 439, 172);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (404, 299, 433, 439, 179);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (412, 299, 434, 439, 187);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (419, 299, 433, 438, 194);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (760, 759, 893, 898, 733);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (773, 759, 894, 899, 726);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (780, 759, 893, 899, 718);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (788, 759, 892, 899, 711);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (795, 759, 892, 898, 704);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (802, 759, 894, 898, 697);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (809, 759, 894, 897, 687);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (819, 759, 893, 897, 677);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (829, 759, 892, 897, 664);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (842, 759, 894, 900, 662);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (844, 759, 893, 900, 660);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (846, 759, 892, 900, 658);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (848, 759, 894, 896, 647);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (859, 759, 893, 896, 639);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (867, 759, 892, 896, 623);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (883, 759, 893, 895, 620);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (886, 759, 894, 895, 618);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (888, 759, 892, 895, 614);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (614, 613, 746, 749, 74);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (618, 613, 748, 749, 78);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (620, 613, 747, 749, 81);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (623, 613, 746, 750, 83);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (639, 613, 747, 750, 99);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (647, 613, 748, 750, 108);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (658, 613, 746, 754, 119);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (660, 613, 747, 754, 121);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (662, 613, 748, 754, 123);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (664, 613, 746, 751, 125);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (677, 613, 747, 751, 138);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (687, 613, 748, 751, 148);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (697, 613, 748, 752, 158);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (704, 613, 746, 752, 165);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (711, 613, 746, 753, 172);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (718, 613, 747, 753, 179);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (726, 613, 748, 753, 187);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (733, 613, 747, 752, 194);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (916, 915, 1050, 1055, 194);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (929, 915, 1051, 1056, 187);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (936, 915, 1050, 1056, 179);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (944, 915, 1049, 1056, 172);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (951, 915, 1049, 1055, 165);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (958, 915, 1051, 1055, 158);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (965, 915, 1051, 1054, 148);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (975, 915, 1050, 1054, 138);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (985, 915, 1049, 1054, 125);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (999, 915, 1051, 1057, 123);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (1001, 915, 1050, 1057, 121);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (1003, 915, 1049, 1057, 119);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (1005, 915, 1051, 1053, 108);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (1016, 915, 1050, 1053, 99);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (1024, 915, 1049, 1053, 83);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (1040, 915, 1050, 1052, 81);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (1043, 915, 1051, 1052, 78);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id) VALUES (1045, 915, 1049, 1052, 74);


--
-- Data for Name: checkpoint_info; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (237, 'user comment here', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (238, 'user comment here', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (239, 'user comment here', 35);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (240, 'user comment here', 35);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (241, 'user comment here', 35);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (242, 'user comment here', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (243, 'user comment here', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (244, 'user comment here', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (245, 'user comment here', 35);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (247, 'user comment here', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (248, 'user comment here', 35);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (249, 'user comment here', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (250, 'user comment here', 35);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (282, '', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (283, 'test', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (284, '', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (285, 'Test Message here', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (286, 'OK, you are good to go.', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (287, 'I attended the STEP on 23rd May. It was a good learning experience.', 35);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (292, '', 46);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (294, '', 120);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (295, '', 124);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (296, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (297, '', 82);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (298, 'You have done an excellent job.', 122);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (584, '', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (586, '', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (588, '', 10);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (589, '<p>Completed on June 22nd 2015. It was fun.</p>', NULL);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (590, '<p>Applied on 22nd June, 2015.</p>', NULL);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (591, '<p>test</p>', 82);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (592, '<p>Test 2</p>', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (593, '<p>Completed online course</p>', 84);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (597, '<p>test test</p>', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (599, '', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (603, '', 46);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (607, '', 46);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (756, '<p>I attended a Career Fair at Calstate LA CDC.</p>', 46);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (757, '', 100);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (904, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (905, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (906, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (907, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (908, '<p>Attended STEP during summer 2014</p>', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (909, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (910, '<p>Attended STEP Summer 2014.</p>', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (911, '', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (912, '', 79);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (913, '', 84);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (914, '<p>Took Math 206 during Spring Quarter 2015.</p>', 84);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1060, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1061, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1062, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1063, '', 82);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1064, '', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1065, '', 79);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1066, '', 85);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1067, '', 89);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1068, '', 91);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1069, '', 93);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1070, '', 95);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1071, '', 97);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1072, '', 84);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1073, '', 98);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (1074, '<p>ABCD</p>', 98);


--
-- Data for Name: checkpoints; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO checkpoints (id, name, parent_id) VALUES (10, '<p>Algebra (before Yr. 1)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (27, '<p>Attend STEP</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (28, '<p>Chem Prep</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (30, '', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (32, '<p>Attend STEP</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (34, '<p>Talk to T Fox</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (35, '<p>Attend STEP</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (39, '<p>Career Professional Developmen Workshop</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (46, '<p>Attend career panel</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (52, '<p>Attended Leadership Convocation</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (76, '<p>Pre-calculus (before (Yr 1)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (111, '<p>Share with someone in your community about what you are learning in school</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (84, '<p>Math 206 (Calc I)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (85, '<p>Math 207 (Calc II)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (86, '<p>Math 208 (Calc III)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (87, '<p>Phys 211</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (90, '<p>Go to office hours after 1st assignment in every class</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (91, '<p>Keep track of your grades / progress in each course</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (92, '<p>Get tutoring for any course with grade &lt; B</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (95, '<p>ECST New Student Registration</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (96, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (97, '<p>Group Advising</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (98, '<p>Academic &amp; Personal Advisement</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (132, '<p>200-level&nbsp;computer science&nbsp;courses.</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (102, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li></ol>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (104, '<p>Identify at least one type of career in your field of interest</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (105, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (106, '<p>Apply for Financial Aid (&nbsp;<a href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (107, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (80, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (82, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (112, '<p>Participate in time management workshop (Tutorial Center)</p><ul><li><a target="_blank" href="http://www.calstatela.edu/tutorialcenter">http://www.calstatela.edu/tutorialcenter</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (79, '<p>Make a list of questions to ask during orientation and ask them</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (113, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (110, '<p>Join at least one student organization and actively participate</p><ul><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (109, '<p>Find out about ECST student organizations at ECST week</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (114, '<p>Student Faculty Breakfast</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (115, '<p>Leadership Convocation</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (116, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (117, '<p>MEP Welcome Back BBQ</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (118, '<p>ECST Week &ndash; participate</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (120, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (122, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (124, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (126, '<p>Math 209 (Calc IV)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (127, '<p>Math 215 (Diff Eq)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (128, '<p>Physics 212</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (129, '<p>Physics 213</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (130, '<p>Attend Math AEW</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (131, '<p>Attend Physics AEW</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (133, '<p>Lower division GE requirements</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (134, '<p>Get tutoring on courses you need help with</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (135, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (136, '<p><!--[if !supportLists]-->Group Advising</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (75, '<p>Algebra (before Yr 1)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (461, '<p>Attend Math Academic Excellence Workshops (AEW)</p>', 319);
INSERT INTO checkpoints (id, name, parent_id) VALUES (462, '<p>Attend Physics&nbsp; AEW</p>', 320);
INSERT INTO checkpoints (id, name, parent_id) VALUES (463, '<p>ECST New Student Registration</p>', 321);
INSERT INTO checkpoints (id, name, parent_id) VALUES (464, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', 322);
INSERT INTO checkpoints (id, name, parent_id) VALUES (93, '<p>Attend Math Academic Excellence Workshops (AEW) (i.e. ENGR 154 workshops)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (89, '<p>CS 101</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (88, '', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (94, '<p>Attend Physics&nbsp; AEW (I.e. ENGR 154 workshops)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (137, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (139, '<p>Visit career center and find out what services they offer</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc">http://www.calstatela.edu/univ/cdc</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (140, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (141, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (142, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (143, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (144, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (145, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (146, '<p>ECST Career Fair</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (147, '<p>Apply for financial aid and scholarships</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (149, '<p>Participate in ECST student council activities</p><ul><li><a target="_blank" href="http://web.calstatela.edu/orgs/etsc/">http://web.calstatela.edu/orgs/etsc/</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (150, '<p>Take a service learning course&nbsp;or otherwise participate in a community service project</p><ul><li><a target="_blank" href="http://web.calstatela.edu/centers/sl/">http://web.calstatela.edu/centers/sl/</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (151, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (152, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (153, '<p>Student Faculty Breakfast</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (154, '<p>Leadership Convocation</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (155, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (156, '<p>MEP Welcome Back BBQ</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (157, '<p>ECST Week &ndash; help run one of the events</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (159, '<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (160, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (161, '<p>Leadership Convocation</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (162, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (163, '<p>MEP Welcome Back BBQ</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (164, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (166, '<p>Complete 200-level engineering courses</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (167, '<p>Complete 300-level engineering courses</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (168, '<p>Choose upper division specialization</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (169, '<p>Get tutoring on courses you need help with</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (170, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (171, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (173, '<p>Upper division&nbsp; specialization</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (174, '<p>Upper division technical electives</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (175, '<p>Upper division GE requirements</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (176, '<p>Senior design</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/ppp">http://www.calstatela.edu/ecst/ppp</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (177, '<p>Any outstanding requirements</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (178, '<p>Get tutoring on courses you need help with</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (180, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (181, '<p>Attend career fairs to submit your resume</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (182, '<p>Social media workshop (Career Development Center)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (183, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (184, '<p>Participate in interviewing workshops</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (185, '<p>Apply for jobs and/or &nbsp;graduate school</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (186, '<p>ECST Career Fair</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (188, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (189, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (190, '<p>Leadership Convocation</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (191, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (192, '<p>MEP Welcome Back BBQ</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (193, '<p>ECST Week &ndash; Outreach</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (195, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (196, '<p>Preparing for the career fair workshop (Career Development Center)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (197, '<p>Create/update your resume with help from career center</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (198, '<p>Mock interview workshop (Career Development Center)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (199, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (200, '<p>Apply for summer internships</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (465, '<p>Group Advising</p>', 323);
INSERT INTO checkpoints (id, name, parent_id) VALUES (202, '<p>Internship in following summer</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (203, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (204, '<p>ECST Career Fair</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (205, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (206, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (214, '<p>tesdf s</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (215, '<p>klkoio</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (220, '<p>aaaaaaaaaaaaaaaaaaaaaaaaa</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (222, '<p>g gfg fgfg f</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (223, '<p>gfd gfdg fdg fdfd gfd</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (225, '<p>&nbsp;gfdg fdgf dgfdg&nbsp;</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (227, '<p>&nbsp;dfgfdg fd gfd gfdgfd g</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (236, '<p>Test test test</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (77, '<p>Attend STEP (<a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">Link Here</a>)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (252, '<p>Student org <a href="http://www.calstatela.edu/ecst">fair</a></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (254, '<p>Visit career development center</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (255, '<p>Attend a workshop on Career.</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (257, '<p>Go to <a href="http://www.calstatela.edu">tutoring center</a></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (263, '<p>MIlestone 123</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (272, '<p>Milestone 11.2</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (271, '<p>Milestone 11.1</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (466, '<p>Academic &amp; Personal Advisement</p>', 324);
INSERT INTO checkpoints (id, name, parent_id) VALUES (258, '<p>qwerty</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (468, '<p>Take a personality assessment</p><ol><li><a target="_blank" href="http://www.keirsey.com/">http://www.keirsey.com/</a></li><li><a target="_blank" href="http://www.rileyguide.com/assess.html">http://www.rileyguide.com/assess.html</a></li></ol>', 326);
INSERT INTO checkpoints (id, name, parent_id) VALUES (469, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li></ol>', 327);
INSERT INTO checkpoints (id, name, parent_id) VALUES (470, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p><ul><li>Civil Engineering (<!--[if !supportLists]--><a target="_blank" href="http://www.calstatela.edu/ecst/ce">http://www.calstatela.edu/ecst/ce</a>)</li><li><!--[if !supportLists]-->Electrical and Computer Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/</a><a target="_blank" href="http://www.calstatela.edu/ecst/ece">ece</a>)</li><li>Mechanical Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/m</a><a target="_blank" href="http://www.calstatela.edu/ecst/me">e</a>)</li><li>Computer Science Technology (<a target="_blank" href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/tech</a>)</li></ul>', 328);
INSERT INTO checkpoints (id, name, parent_id) VALUES (471, '<p>Identify at least one type of career in your field of interest</p>', 329);
INSERT INTO checkpoints (id, name, parent_id) VALUES (274, '<p>Milestone 21.1</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (301, '<p>Algebra (before Yr 1)</p>', 75);
INSERT INTO checkpoints (id, name, parent_id) VALUES (302, '<p>Pre-calculus (before (Yr 1)</p>', 76);
INSERT INTO checkpoints (id, name, parent_id) VALUES (303, '<p>Attend STEP (<a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">Link Here</a>)</p>', 77);
INSERT INTO checkpoints (id, name, parent_id) VALUES (305, '<p>Make a list of questions to ask during orientation and ask them</p>', 79);
INSERT INTO checkpoints (id, name, parent_id) VALUES (307, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 80);
INSERT INTO checkpoints (id, name, parent_id) VALUES (308, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 82);
INSERT INTO checkpoints (id, name, parent_id) VALUES (310, '<p>Math 206 (Calc I)</p>', 84);
INSERT INTO checkpoints (id, name, parent_id) VALUES (311, '<p>Math 207 (Calc II)</p>', 85);
INSERT INTO checkpoints (id, name, parent_id) VALUES (312, '<p>Math 208 (Calc III)</p>', 86);
INSERT INTO checkpoints (id, name, parent_id) VALUES (313, '<p>Phys 211</p>', 87);
INSERT INTO checkpoints (id, name, parent_id) VALUES (314, '<p>Chem 10</p>', 88);
INSERT INTO checkpoints (id, name, parent_id) VALUES (315, '<p>ENGR 150</p>', 89);
INSERT INTO checkpoints (id, name, parent_id) VALUES (316, '<p>Go to office hours after 1st assignment in every class</p>', 90);
INSERT INTO checkpoints (id, name, parent_id) VALUES (317, '<p>Keep track of your grades / progress in each course</p>', 91);
INSERT INTO checkpoints (id, name, parent_id) VALUES (318, '<p>Get tutoring for any course with grade &lt; B</p>', 92);
INSERT INTO checkpoints (id, name, parent_id) VALUES (319, '<p>Attend Math Academic Excellence Workshops (AEW)</p>', 93);
INSERT INTO checkpoints (id, name, parent_id) VALUES (320, '<p>Attend Physics&nbsp; AEW</p>', 94);
INSERT INTO checkpoints (id, name, parent_id) VALUES (321, '<p>ECST New Student Registration</p>', 95);
INSERT INTO checkpoints (id, name, parent_id) VALUES (322, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', 96);
INSERT INTO checkpoints (id, name, parent_id) VALUES (323, '<p>Group Advising</p>', 97);
INSERT INTO checkpoints (id, name, parent_id) VALUES (324, '<p>Academic &amp; Personal Advisement</p>', 98);
INSERT INTO checkpoints (id, name, parent_id) VALUES (326, '<p>Take a personality assessment</p><ol><li><a target="_blank" href="http://www.keirsey.com/">http://www.keirsey.com/</a></li><li><a target="_blank" href="http://www.rileyguide.com/assess.html">http://www.rileyguide.com/assess.html</a></li></ol>', 100);
INSERT INTO checkpoints (id, name, parent_id) VALUES (327, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li></ol>', 102);
INSERT INTO checkpoints (id, name, parent_id) VALUES (472, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 330);
INSERT INTO checkpoints (id, name, parent_id) VALUES (473, '<p>Apply for Financial Aid (&nbsp;<a href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 331);
INSERT INTO checkpoints (id, name, parent_id) VALUES (474, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 332);
INSERT INTO checkpoints (id, name, parent_id) VALUES (476, '<p>Find out about ECST student organizations at ECST week</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 334);
INSERT INTO checkpoints (id, name, parent_id) VALUES (328, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p><ul><li>Civil Engineering (<!--[if !supportLists]--><a target="_blank" href="http://www.calstatela.edu/ecst/ce">http://www.calstatela.edu/ecst/ce</a>)</li><li><!--[if !supportLists]-->Electrical and Computer Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/</a><a target="_blank" href="http://www.calstatela.edu/ecst/ece">ece</a>)</li><li>Mechanical Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/m</a><a target="_blank" href="http://www.calstatela.edu/ecst/me">e</a>)</li><li>Computer Science Technology (<a target="_blank" href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/tech</a>)</li></ul>', 103);
INSERT INTO checkpoints (id, name, parent_id) VALUES (329, '<p>Identify at least one type of career in your field of interest</p>', 104);
INSERT INTO checkpoints (id, name, parent_id) VALUES (330, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 105);
INSERT INTO checkpoints (id, name, parent_id) VALUES (331, '<p>Apply for Financial Aid (&nbsp;<a href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 106);
INSERT INTO checkpoints (id, name, parent_id) VALUES (332, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 107);
INSERT INTO checkpoints (id, name, parent_id) VALUES (334, '<p>Find out about ECST student organizations at ECST week</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 109);
INSERT INTO checkpoints (id, name, parent_id) VALUES (335, '<p>Join at least one student organization and actively participate</p><ul><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 110);
INSERT INTO checkpoints (id, name, parent_id) VALUES (336, '<p>Share with someone in your community about what you are learning in school</p>', 111);
INSERT INTO checkpoints (id, name, parent_id) VALUES (337, '<p>Participate in time management workshop (Tutorial Center)</p><ul><li><a target="_blank" href="http://www.calstatela.edu/tutorialcenter">http://www.calstatela.edu/tutorialcenter</a></li></ul>', 112);
INSERT INTO checkpoints (id, name, parent_id) VALUES (338, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 113);
INSERT INTO checkpoints (id, name, parent_id) VALUES (339, '<p>Student Faculty Breakfast</p>', 114);
INSERT INTO checkpoints (id, name, parent_id) VALUES (340, '<p>Leadership Convocation</p>', 115);
INSERT INTO checkpoints (id, name, parent_id) VALUES (341, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 116);
INSERT INTO checkpoints (id, name, parent_id) VALUES (342, '<p>MEP Welcome Back BBQ</p>', 117);
INSERT INTO checkpoints (id, name, parent_id) VALUES (343, '<p>ECST Week &ndash; participate</p>', 118);
INSERT INTO checkpoints (id, name, parent_id) VALUES (345, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 120);
INSERT INTO checkpoints (id, name, parent_id) VALUES (347, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 122);
INSERT INTO checkpoints (id, name, parent_id) VALUES (349, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 124);
INSERT INTO checkpoints (id, name, parent_id) VALUES (351, '<p>Math 209 (Calc IV)</p>', 126);
INSERT INTO checkpoints (id, name, parent_id) VALUES (352, '<p>Math 215 (Diff Eq)</p>', 127);
INSERT INTO checkpoints (id, name, parent_id) VALUES (353, '<p>Physics 212</p>', 128);
INSERT INTO checkpoints (id, name, parent_id) VALUES (354, '<p>Physics 213</p>', 129);
INSERT INTO checkpoints (id, name, parent_id) VALUES (355, '<p>Attend Math AEW</p>', 130);
INSERT INTO checkpoints (id, name, parent_id) VALUES (356, '<p>Attend Physics AEW</p>', 131);
INSERT INTO checkpoints (id, name, parent_id) VALUES (357, '<p>200-level engineering courses.</p>', 132);
INSERT INTO checkpoints (id, name, parent_id) VALUES (358, '<p>Lower division GE requirements</p>', 133);
INSERT INTO checkpoints (id, name, parent_id) VALUES (359, '<p>Get tutoring on courses you need help with</p>', 134);
INSERT INTO checkpoints (id, name, parent_id) VALUES (360, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 135);
INSERT INTO checkpoints (id, name, parent_id) VALUES (361, '<p><!--[if !supportLists]-->Group Advising</p>', 136);
INSERT INTO checkpoints (id, name, parent_id) VALUES (362, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 137);
INSERT INTO checkpoints (id, name, parent_id) VALUES (364, '<p>Visit career center and find out what services they offer</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc">http://www.calstatela.edu/univ/cdc</a></li></ul>', 139);
INSERT INTO checkpoints (id, name, parent_id) VALUES (365, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', 140);
INSERT INTO checkpoints (id, name, parent_id) VALUES (366, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 141);
INSERT INTO checkpoints (id, name, parent_id) VALUES (367, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 142);
INSERT INTO checkpoints (id, name, parent_id) VALUES (368, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', 143);
INSERT INTO checkpoints (id, name, parent_id) VALUES (369, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', 144);
INSERT INTO checkpoints (id, name, parent_id) VALUES (370, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 145);
INSERT INTO checkpoints (id, name, parent_id) VALUES (371, '<p>ECST Career Fair</p>', 146);
INSERT INTO checkpoints (id, name, parent_id) VALUES (372, '<p>Apply for financial aid and scholarships</p>', 147);
INSERT INTO checkpoints (id, name, parent_id) VALUES (374, '<p>Participate in ECST student council activities</p><ul><li><a target="_blank" href="http://web.calstatela.edu/orgs/etsc/">http://web.calstatela.edu/orgs/etsc/</a></li></ul>', 149);
INSERT INTO checkpoints (id, name, parent_id) VALUES (375, '<p>Take a service learning course&nbsp;or otherwise participate in a community service project</p><ul><li><a target="_blank" href="http://web.calstatela.edu/centers/sl/">http://web.calstatela.edu/centers/sl/</a></li></ul>', 150);
INSERT INTO checkpoints (id, name, parent_id) VALUES (376, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', 151);
INSERT INTO checkpoints (id, name, parent_id) VALUES (377, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 152);
INSERT INTO checkpoints (id, name, parent_id) VALUES (378, '<p>Student Faculty Breakfast</p>', 153);
INSERT INTO checkpoints (id, name, parent_id) VALUES (379, '<p>Leadership Convocation</p>', 154);
INSERT INTO checkpoints (id, name, parent_id) VALUES (380, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 155);
INSERT INTO checkpoints (id, name, parent_id) VALUES (381, '<p>MEP Welcome Back BBQ</p>', 156);
INSERT INTO checkpoints (id, name, parent_id) VALUES (382, '<p>ECST Week &ndash; help run one of the events</p>', 157);
INSERT INTO checkpoints (id, name, parent_id) VALUES (477, '<p>Join at least one student organization and actively participate</p><ul><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 335);
INSERT INTO checkpoints (id, name, parent_id) VALUES (384, '<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>', 159);
INSERT INTO checkpoints (id, name, parent_id) VALUES (385, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 160);
INSERT INTO checkpoints (id, name, parent_id) VALUES (386, '<p>Leadership Convocation</p>', 161);
INSERT INTO checkpoints (id, name, parent_id) VALUES (387, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 162);
INSERT INTO checkpoints (id, name, parent_id) VALUES (388, '<p>MEP Welcome Back BBQ</p>', 163);
INSERT INTO checkpoints (id, name, parent_id) VALUES (389, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', 164);
INSERT INTO checkpoints (id, name, parent_id) VALUES (391, '<p>Complete 200-level engineering courses</p>', 166);
INSERT INTO checkpoints (id, name, parent_id) VALUES (392, '<p>Complete 300-level engineering courses</p>', 167);
INSERT INTO checkpoints (id, name, parent_id) VALUES (393, '<p>Choose upper division specialization</p>', 168);
INSERT INTO checkpoints (id, name, parent_id) VALUES (394, '<p>Get tutoring on courses you need help with</p>', 169);
INSERT INTO checkpoints (id, name, parent_id) VALUES (395, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 170);
INSERT INTO checkpoints (id, name, parent_id) VALUES (396, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 171);
INSERT INTO checkpoints (id, name, parent_id) VALUES (398, '<p>Upper division&nbsp; specialization</p>', 173);
INSERT INTO checkpoints (id, name, parent_id) VALUES (399, '<p>Upper division technical electives</p>', 174);
INSERT INTO checkpoints (id, name, parent_id) VALUES (400, '<p>Upper division GE requirements</p>', 175);
INSERT INTO checkpoints (id, name, parent_id) VALUES (401, '<p>Senior design</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/ppp">http://www.calstatela.edu/ecst/ppp</a></li></ul>', 176);
INSERT INTO checkpoints (id, name, parent_id) VALUES (402, '<p>Any outstanding requirements</p>', 177);
INSERT INTO checkpoints (id, name, parent_id) VALUES (403, '<p>Get tutoring on courses you need help with</p>', 178);
INSERT INTO checkpoints (id, name, parent_id) VALUES (405, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li></ul>', 180);
INSERT INTO checkpoints (id, name, parent_id) VALUES (406, '<p>Attend career fairs to submit your resume</p>', 181);
INSERT INTO checkpoints (id, name, parent_id) VALUES (407, '<p>Social media workshop (Career Development Center)</p>', 182);
INSERT INTO checkpoints (id, name, parent_id) VALUES (408, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', 183);
INSERT INTO checkpoints (id, name, parent_id) VALUES (409, '<p>Participate in interviewing workshops</p>', 184);
INSERT INTO checkpoints (id, name, parent_id) VALUES (410, '<p>Apply for jobs and/or &nbsp;graduate school</p>', 185);
INSERT INTO checkpoints (id, name, parent_id) VALUES (411, '<p>ECST Career Fair</p>', 186);
INSERT INTO checkpoints (id, name, parent_id) VALUES (413, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>', 188);
INSERT INTO checkpoints (id, name, parent_id) VALUES (414, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', 189);
INSERT INTO checkpoints (id, name, parent_id) VALUES (415, '<p>Leadership Convocation</p>', 190);
INSERT INTO checkpoints (id, name, parent_id) VALUES (416, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 191);
INSERT INTO checkpoints (id, name, parent_id) VALUES (417, '<p>MEP Welcome Back BBQ</p>', 192);
INSERT INTO checkpoints (id, name, parent_id) VALUES (418, '<p>ECST Week &ndash; Outreach</p>', 193);
INSERT INTO checkpoints (id, name, parent_id) VALUES (420, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 195);
INSERT INTO checkpoints (id, name, parent_id) VALUES (421, '<p>Preparing for the career fair workshop (Career Development Center)</p>', 196);
INSERT INTO checkpoints (id, name, parent_id) VALUES (422, '<p>Create/update your resume with help from career center</p>', 197);
INSERT INTO checkpoints (id, name, parent_id) VALUES (423, '<p>Mock interview workshop (Career Development Center)</p>', 198);
INSERT INTO checkpoints (id, name, parent_id) VALUES (424, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', 199);
INSERT INTO checkpoints (id, name, parent_id) VALUES (425, '<p>Apply for summer internships</p>', 200);
INSERT INTO checkpoints (id, name, parent_id) VALUES (426, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><!--[if !supportLists]--><a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 201);
INSERT INTO checkpoints (id, name, parent_id) VALUES (427, '<p>Internship in following summer</p>', 202);
INSERT INTO checkpoints (id, name, parent_id) VALUES (428, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 203);
INSERT INTO checkpoints (id, name, parent_id) VALUES (429, '<p>ECST Career Fair</p>', 204);
INSERT INTO checkpoints (id, name, parent_id) VALUES (430, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 205);
INSERT INTO checkpoints (id, name, parent_id) VALUES (431, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 206);
INSERT INTO checkpoints (id, name, parent_id) VALUES (443, '<p>Algebra (before Yr 1)</p>', 301);
INSERT INTO checkpoints (id, name, parent_id) VALUES (444, '<p>Pre-calculus (before (Yr 1)</p>', 302);
INSERT INTO checkpoints (id, name, parent_id) VALUES (445, '<p>Attend STEP (<a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">Link Here</a>)</p>', 303);
INSERT INTO checkpoints (id, name, parent_id) VALUES (447, '<p>Make a list of questions to ask during orientation and ask them</p>', 305);
INSERT INTO checkpoints (id, name, parent_id) VALUES (449, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 307);
INSERT INTO checkpoints (id, name, parent_id) VALUES (450, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 308);
INSERT INTO checkpoints (id, name, parent_id) VALUES (452, '<p>Math 206 (Calc I)</p>', 310);
INSERT INTO checkpoints (id, name, parent_id) VALUES (453, '<p>Math 207 (Calc II)</p>', 311);
INSERT INTO checkpoints (id, name, parent_id) VALUES (454, '<p>Math 208 (Calc III)</p>', 312);
INSERT INTO checkpoints (id, name, parent_id) VALUES (455, '<p>Phys 211</p>', 313);
INSERT INTO checkpoints (id, name, parent_id) VALUES (456, '<p>Chem 10</p>', 314);
INSERT INTO checkpoints (id, name, parent_id) VALUES (457, '<p>ENGR 150</p>', 315);
INSERT INTO checkpoints (id, name, parent_id) VALUES (458, '<p>Go to office hours after 1st assignment in every class</p>', 316);
INSERT INTO checkpoints (id, name, parent_id) VALUES (459, '<p>Keep track of your grades / progress in each course</p>', 317);
INSERT INTO checkpoints (id, name, parent_id) VALUES (460, '<p>Get tutoring for any course with grade &lt; B</p>', 318);
INSERT INTO checkpoints (id, name, parent_id) VALUES (478, '<p>Share with someone in your community about what you are learning in school</p>', 336);
INSERT INTO checkpoints (id, name, parent_id) VALUES (479, '<p>Participate in time management workshop (Tutorial Center)</p><ul><li><a target="_blank" href="http://www.calstatela.edu/tutorialcenter">http://www.calstatela.edu/tutorialcenter</a></li></ul>', 337);
INSERT INTO checkpoints (id, name, parent_id) VALUES (480, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 338);
INSERT INTO checkpoints (id, name, parent_id) VALUES (481, '<p>Student Faculty Breakfast</p>', 339);
INSERT INTO checkpoints (id, name, parent_id) VALUES (482, '<p>Leadership Convocation</p>', 340);
INSERT INTO checkpoints (id, name, parent_id) VALUES (483, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 341);
INSERT INTO checkpoints (id, name, parent_id) VALUES (484, '<p>MEP Welcome Back BBQ</p>', 342);
INSERT INTO checkpoints (id, name, parent_id) VALUES (485, '<p>ECST Week &ndash; participate</p>', 343);
INSERT INTO checkpoints (id, name, parent_id) VALUES (487, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 345);
INSERT INTO checkpoints (id, name, parent_id) VALUES (489, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 347);
INSERT INTO checkpoints (id, name, parent_id) VALUES (491, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 349);
INSERT INTO checkpoints (id, name, parent_id) VALUES (493, '<p>Math 209 (Calc IV)</p>', 351);
INSERT INTO checkpoints (id, name, parent_id) VALUES (494, '<p>Math 215 (Diff Eq)</p>', 352);
INSERT INTO checkpoints (id, name, parent_id) VALUES (495, '<p>Physics 212</p>', 353);
INSERT INTO checkpoints (id, name, parent_id) VALUES (496, '<p>Physics 213</p>', 354);
INSERT INTO checkpoints (id, name, parent_id) VALUES (497, '<p>Attend Math AEW</p>', 355);
INSERT INTO checkpoints (id, name, parent_id) VALUES (498, '<p>Attend Physics AEW</p>', 356);
INSERT INTO checkpoints (id, name, parent_id) VALUES (499, '<p>200-level engineering courses.</p>', 357);
INSERT INTO checkpoints (id, name, parent_id) VALUES (500, '<p>Lower division GE requirements</p>', 358);
INSERT INTO checkpoints (id, name, parent_id) VALUES (501, '<p>Get tutoring on courses you need help with</p>', 359);
INSERT INTO checkpoints (id, name, parent_id) VALUES (502, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 360);
INSERT INTO checkpoints (id, name, parent_id) VALUES (503, '<p><!--[if !supportLists]-->Group Advising</p>', 361);
INSERT INTO checkpoints (id, name, parent_id) VALUES (504, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 362);
INSERT INTO checkpoints (id, name, parent_id) VALUES (506, '<p>Visit career center and find out what services they offer</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc">http://www.calstatela.edu/univ/cdc</a></li></ul>', 364);
INSERT INTO checkpoints (id, name, parent_id) VALUES (507, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', 365);
INSERT INTO checkpoints (id, name, parent_id) VALUES (508, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 366);
INSERT INTO checkpoints (id, name, parent_id) VALUES (509, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 367);
INSERT INTO checkpoints (id, name, parent_id) VALUES (510, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', 368);
INSERT INTO checkpoints (id, name, parent_id) VALUES (511, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', 369);
INSERT INTO checkpoints (id, name, parent_id) VALUES (512, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 370);
INSERT INTO checkpoints (id, name, parent_id) VALUES (513, '<p>ECST Career Fair</p>', 371);
INSERT INTO checkpoints (id, name, parent_id) VALUES (514, '<p>Apply for financial aid and scholarships</p>', 372);
INSERT INTO checkpoints (id, name, parent_id) VALUES (516, '<p>Participate in ECST student council activities</p><ul><li><a target="_blank" href="http://web.calstatela.edu/orgs/etsc/">http://web.calstatela.edu/orgs/etsc/</a></li></ul>', 374);
INSERT INTO checkpoints (id, name, parent_id) VALUES (517, '<p>Take a service learning course&nbsp;or otherwise participate in a community service project</p><ul><li><a target="_blank" href="http://web.calstatela.edu/centers/sl/">http://web.calstatela.edu/centers/sl/</a></li></ul>', 375);
INSERT INTO checkpoints (id, name, parent_id) VALUES (518, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', 376);
INSERT INTO checkpoints (id, name, parent_id) VALUES (519, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 377);
INSERT INTO checkpoints (id, name, parent_id) VALUES (520, '<p>Student Faculty Breakfast</p>', 378);
INSERT INTO checkpoints (id, name, parent_id) VALUES (521, '<p>Leadership Convocation</p>', 379);
INSERT INTO checkpoints (id, name, parent_id) VALUES (522, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 380);
INSERT INTO checkpoints (id, name, parent_id) VALUES (523, '<p>MEP Welcome Back BBQ</p>', 381);
INSERT INTO checkpoints (id, name, parent_id) VALUES (524, '<p>ECST Week &ndash; help run one of the events</p>', 382);
INSERT INTO checkpoints (id, name, parent_id) VALUES (526, '<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>', 384);
INSERT INTO checkpoints (id, name, parent_id) VALUES (527, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 385);
INSERT INTO checkpoints (id, name, parent_id) VALUES (528, '<p>Leadership Convocation</p>', 386);
INSERT INTO checkpoints (id, name, parent_id) VALUES (529, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 387);
INSERT INTO checkpoints (id, name, parent_id) VALUES (530, '<p>MEP Welcome Back BBQ</p>', 388);
INSERT INTO checkpoints (id, name, parent_id) VALUES (531, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', 389);
INSERT INTO checkpoints (id, name, parent_id) VALUES (533, '<p>Complete 200-level engineering courses</p>', 391);
INSERT INTO checkpoints (id, name, parent_id) VALUES (534, '<p>Complete 300-level engineering courses</p>', 392);
INSERT INTO checkpoints (id, name, parent_id) VALUES (535, '<p>Choose upper division specialization</p>', 393);
INSERT INTO checkpoints (id, name, parent_id) VALUES (536, '<p>Get tutoring on courses you need help with</p>', 394);
INSERT INTO checkpoints (id, name, parent_id) VALUES (537, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 395);
INSERT INTO checkpoints (id, name, parent_id) VALUES (538, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 396);
INSERT INTO checkpoints (id, name, parent_id) VALUES (540, '<p>Upper division&nbsp; specialization</p>', 398);
INSERT INTO checkpoints (id, name, parent_id) VALUES (541, '<p>Upper division technical electives</p>', 399);
INSERT INTO checkpoints (id, name, parent_id) VALUES (542, '<p>Upper division GE requirements</p>', 400);
INSERT INTO checkpoints (id, name, parent_id) VALUES (543, '<p>Senior design</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/ppp">http://www.calstatela.edu/ecst/ppp</a></li></ul>', 401);
INSERT INTO checkpoints (id, name, parent_id) VALUES (544, '<p>Any outstanding requirements</p>', 402);
INSERT INTO checkpoints (id, name, parent_id) VALUES (545, '<p>Get tutoring on courses you need help with</p>', 403);
INSERT INTO checkpoints (id, name, parent_id) VALUES (547, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li></ul>', 405);
INSERT INTO checkpoints (id, name, parent_id) VALUES (548, '<p>Attend career fairs to submit your resume</p>', 406);
INSERT INTO checkpoints (id, name, parent_id) VALUES (549, '<p>Social media workshop (Career Development Center)</p>', 407);
INSERT INTO checkpoints (id, name, parent_id) VALUES (550, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', 408);
INSERT INTO checkpoints (id, name, parent_id) VALUES (551, '<p>Participate in interviewing workshops</p>', 409);
INSERT INTO checkpoints (id, name, parent_id) VALUES (552, '<p>Apply for jobs and/or &nbsp;graduate school</p>', 410);
INSERT INTO checkpoints (id, name, parent_id) VALUES (553, '<p>ECST Career Fair</p>', 411);
INSERT INTO checkpoints (id, name, parent_id) VALUES (555, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>', 413);
INSERT INTO checkpoints (id, name, parent_id) VALUES (556, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', 414);
INSERT INTO checkpoints (id, name, parent_id) VALUES (557, '<p>Leadership Convocation</p>', 415);
INSERT INTO checkpoints (id, name, parent_id) VALUES (558, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 416);
INSERT INTO checkpoints (id, name, parent_id) VALUES (559, '<p>MEP Welcome Back BBQ</p>', 417);
INSERT INTO checkpoints (id, name, parent_id) VALUES (560, '<p>ECST Week &ndash; Outreach</p>', 418);
INSERT INTO checkpoints (id, name, parent_id) VALUES (562, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 420);
INSERT INTO checkpoints (id, name, parent_id) VALUES (563, '<p>Preparing for the career fair workshop (Career Development Center)</p>', 421);
INSERT INTO checkpoints (id, name, parent_id) VALUES (564, '<p>Create/update your resume with help from career center</p>', 422);
INSERT INTO checkpoints (id, name, parent_id) VALUES (565, '<p>Mock interview workshop (Career Development Center)</p>', 423);
INSERT INTO checkpoints (id, name, parent_id) VALUES (566, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', 424);
INSERT INTO checkpoints (id, name, parent_id) VALUES (567, '<p>Apply for summer internships</p>', 425);
INSERT INTO checkpoints (id, name, parent_id) VALUES (568, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><!--[if !supportLists]--><a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 426);
INSERT INTO checkpoints (id, name, parent_id) VALUES (569, '<p>Internship in following summer</p>', 427);
INSERT INTO checkpoints (id, name, parent_id) VALUES (570, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 428);
INSERT INTO checkpoints (id, name, parent_id) VALUES (571, '<p>ECST Career Fair</p>', 429);
INSERT INTO checkpoints (id, name, parent_id) VALUES (572, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 430);
INSERT INTO checkpoints (id, name, parent_id) VALUES (573, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 431);
INSERT INTO checkpoints (id, name, parent_id) VALUES (583, '<p>Algebra 2</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (596, '<div class="accordion"><p>Section 1</p><div><p>Mauris mauris ante, blandit et, ultrices a, suscipit eget, quam. Integer ut neque. Vivamus nisi metus, molestie vel, gravida in, condimentum sit amet, nunc. Nam a nibh. Donec suscipit eros. Nam mi. Proin viverra leo ut odio. Curabitur malesuada. Vestibulum a velit eu ante scelerisque vulputate.</p></div><p>Section 2</p><div><p>Sed non urna. Donec et ante. Phasellus eu ligula. Vestibulum sit amet purus. Vivamus hendrerit, dolor at aliquet laoreet, mauris turpis porttitor velit, faucibus interdum tellus libero ac justo. Vivamus non quam. In suscipit faucibus urna.</p></div><p>Section 3</p><div><p>Nam enim risus, molestie et, porta ac, aliquam ac, risus. Quisque lobortis. Phasellus pellentesque purus in massa. Aenean in pede. Phasellus ac libero ac tellus pellentesque semper. Sed ac felis. Sed commodo, magna quis lacinia ornare, quam ante aliquam nisi, eu iaculis leo purus venenatis dui.</p><ul><li>List item one</li><li>List item two</li><li>List item three</li></ul></div><p>Section 4</p><div><p>Cras dictum. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Aenean lacinia mauris vel est.</p><p>Suspendisse eu nisl. Nullam ut libero. Integer dignissim consequat lectus. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos.</p></div></div><div class="clearfix">&nbsp;</div>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (103, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p><ul><li>Civil Engineering (<a href="http://www.calstatela.edu/ecst/ce" target="_blank">http://www.calstatela.edu/ecst/ce</a>)</li><li>Electrical and Computer Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/</a><a href="http://www.calstatela.edu/ecst/ece" target="_blank">ece</a>)</li><li>Mechanical Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/m</a><a href="http://www.calstatela.edu/ecst/me" target="_blank">e</a>)</li><li>Computer Science Technology (<a href="http://www.calstatela.edu/ecst/tech" target="_blank">http://www.calstatela.edu/ecst/tech</a>)</li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (201, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006" target="_blank">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (100, '<p>Take online assessment test.</p><div class="clearfix">&nbsp;</div><div class="accordion"><p>Keirsey</p><div><p><a target="_blank" href="http://www.keirsey.com/">http://www.keirsey.com/</a></p></div><p>Rileyguide</p><div><p><a target="_blank" href="http://www.rileyguide.com/assess.html">http://www.rileyguide.com/assess.html</a></p></div></div><div class="clearfix">&nbsp;</div>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (608, '<p>Pre-Calculus (before Yr 1)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (610, '<p>Apply for financial aid and scholarships</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (612, '<p>Go to the Advisement centre</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (615, '<p>Algebra (before Yr 1)</p>', 75);
INSERT INTO checkpoints (id, name, parent_id) VALUES (616, '<p>Pre-calculus (before (Yr 1)</p>', 76);
INSERT INTO checkpoints (id, name, parent_id) VALUES (617, '<p>Attend STEP (<a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">Link Here</a>)</p>', 77);
INSERT INTO checkpoints (id, name, parent_id) VALUES (619, '<p>Make a list of questions to ask during orientation and ask them</p>', 79);
INSERT INTO checkpoints (id, name, parent_id) VALUES (621, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 80);
INSERT INTO checkpoints (id, name, parent_id) VALUES (622, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 82);
INSERT INTO checkpoints (id, name, parent_id) VALUES (624, '<p>Math 206 (Calc I)</p>', 84);
INSERT INTO checkpoints (id, name, parent_id) VALUES (625, '<p>Math 207 (Calc II)</p>', 85);
INSERT INTO checkpoints (id, name, parent_id) VALUES (626, '<p>Math 208 (Calc III)</p>', 86);
INSERT INTO checkpoints (id, name, parent_id) VALUES (627, '<p>Phys 211</p>', 87);
INSERT INTO checkpoints (id, name, parent_id) VALUES (628, '<p>Chem 10</p>', 88);
INSERT INTO checkpoints (id, name, parent_id) VALUES (629, '<p>ENGR 150</p>', 89);
INSERT INTO checkpoints (id, name, parent_id) VALUES (630, '<p>Go to office hours after 1st assignment in every class</p>', 90);
INSERT INTO checkpoints (id, name, parent_id) VALUES (631, '<p>Keep track of your grades / progress in each course</p>', 91);
INSERT INTO checkpoints (id, name, parent_id) VALUES (632, '<p>Get tutoring for any course with grade &lt; B</p>', 92);
INSERT INTO checkpoints (id, name, parent_id) VALUES (633, '<p>Attend Math Academic Excellence Workshops (AEW)</p>', 93);
INSERT INTO checkpoints (id, name, parent_id) VALUES (634, '<p>Attend Physics&nbsp; AEW</p>', 94);
INSERT INTO checkpoints (id, name, parent_id) VALUES (635, '<p>ECST New Student Registration</p>', 95);
INSERT INTO checkpoints (id, name, parent_id) VALUES (636, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', 96);
INSERT INTO checkpoints (id, name, parent_id) VALUES (637, '<p>Group Advising</p>', 97);
INSERT INTO checkpoints (id, name, parent_id) VALUES (638, '<p>Academic &amp; Personal Advisement</p>', 98);
INSERT INTO checkpoints (id, name, parent_id) VALUES (640, '<p>Take online assessment test.</p><div class="clearfix">&nbsp;</div><div class="accordion"><p>Keirsey</p><div><p><a target="_blank" href="http://www.keirsey.com/">http://www.keirsey.com/</a></p></div><p>Rileyguide</p><div><p><a target="_blank" href="http://www.rileyguide.com/assess.html">http://www.rileyguide.com/assess.html</a></p></div></div><div class="clearfix">&nbsp;</div>', 100);
INSERT INTO checkpoints (id, name, parent_id) VALUES (641, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li></ol>', 102);
INSERT INTO checkpoints (id, name, parent_id) VALUES (642, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p><ul><li>Civil Engineering (<a href="http://www.calstatela.edu/ecst/ce" target="_blank">http://www.calstatela.edu/ecst/ce</a>)</li><li>Electrical and Computer Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/</a><a href="http://www.calstatela.edu/ecst/ece" target="_blank">ece</a>)</li><li>Mechanical Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/m</a><a href="http://www.calstatela.edu/ecst/me" target="_blank">e</a>)</li><li>Computer Science Technology (<a href="http://www.calstatela.edu/ecst/tech" target="_blank">http://www.calstatela.edu/ecst/tech</a>)</li></ul>', 103);
INSERT INTO checkpoints (id, name, parent_id) VALUES (643, '<p>Identify at least one type of career in your field of interest</p>', 104);
INSERT INTO checkpoints (id, name, parent_id) VALUES (644, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 105);
INSERT INTO checkpoints (id, name, parent_id) VALUES (645, '<p>Apply for Financial Aid (&nbsp;<a href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 106);
INSERT INTO checkpoints (id, name, parent_id) VALUES (646, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 107);
INSERT INTO checkpoints (id, name, parent_id) VALUES (648, '<p>Find out about ECST student organizations at ECST week</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 109);
INSERT INTO checkpoints (id, name, parent_id) VALUES (649, '<p>Join at least one student organization and actively participate</p><ul><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 110);
INSERT INTO checkpoints (id, name, parent_id) VALUES (650, '<p>Share with someone in your community about what you are learning in school</p>', 111);
INSERT INTO checkpoints (id, name, parent_id) VALUES (651, '<p>Participate in time management workshop (Tutorial Center)</p><ul><li><a target="_blank" href="http://www.calstatela.edu/tutorialcenter">http://www.calstatela.edu/tutorialcenter</a></li></ul>', 112);
INSERT INTO checkpoints (id, name, parent_id) VALUES (652, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 113);
INSERT INTO checkpoints (id, name, parent_id) VALUES (653, '<p>Student Faculty Breakfast</p>', 114);
INSERT INTO checkpoints (id, name, parent_id) VALUES (654, '<p>Leadership Convocation</p>', 115);
INSERT INTO checkpoints (id, name, parent_id) VALUES (655, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 116);
INSERT INTO checkpoints (id, name, parent_id) VALUES (656, '<p>MEP Welcome Back BBQ</p>', 117);
INSERT INTO checkpoints (id, name, parent_id) VALUES (657, '<p>ECST Week &ndash; participate</p>', 118);
INSERT INTO checkpoints (id, name, parent_id) VALUES (659, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 120);
INSERT INTO checkpoints (id, name, parent_id) VALUES (661, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 122);
INSERT INTO checkpoints (id, name, parent_id) VALUES (663, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 124);
INSERT INTO checkpoints (id, name, parent_id) VALUES (665, '<p>Math 209 (Calc IV)</p>', 126);
INSERT INTO checkpoints (id, name, parent_id) VALUES (666, '<p>Math 215 (Diff Eq)</p>', 127);
INSERT INTO checkpoints (id, name, parent_id) VALUES (667, '<p>Physics 212</p>', 128);
INSERT INTO checkpoints (id, name, parent_id) VALUES (668, '<p>Physics 213</p>', 129);
INSERT INTO checkpoints (id, name, parent_id) VALUES (669, '<p>Attend Math AEW</p>', 130);
INSERT INTO checkpoints (id, name, parent_id) VALUES (670, '<p>Attend Physics AEW</p>', 131);
INSERT INTO checkpoints (id, name, parent_id) VALUES (671, '<p>200-level engineering courses.</p>', 132);
INSERT INTO checkpoints (id, name, parent_id) VALUES (672, '<p>Lower division GE requirements</p>', 133);
INSERT INTO checkpoints (id, name, parent_id) VALUES (673, '<p>Get tutoring on courses you need help with</p>', 134);
INSERT INTO checkpoints (id, name, parent_id) VALUES (674, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 135);
INSERT INTO checkpoints (id, name, parent_id) VALUES (675, '<p><!--[if !supportLists]-->Group Advising</p>', 136);
INSERT INTO checkpoints (id, name, parent_id) VALUES (676, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 137);
INSERT INTO checkpoints (id, name, parent_id) VALUES (678, '<p>Visit career center and find out what services they offer</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc">http://www.calstatela.edu/univ/cdc</a></li></ul>', 139);
INSERT INTO checkpoints (id, name, parent_id) VALUES (679, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', 140);
INSERT INTO checkpoints (id, name, parent_id) VALUES (680, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 141);
INSERT INTO checkpoints (id, name, parent_id) VALUES (681, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 142);
INSERT INTO checkpoints (id, name, parent_id) VALUES (682, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', 143);
INSERT INTO checkpoints (id, name, parent_id) VALUES (683, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', 144);
INSERT INTO checkpoints (id, name, parent_id) VALUES (684, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 145);
INSERT INTO checkpoints (id, name, parent_id) VALUES (685, '<p>ECST Career Fair</p>', 146);
INSERT INTO checkpoints (id, name, parent_id) VALUES (686, '<p>Apply for financial aid and scholarships</p>', 147);
INSERT INTO checkpoints (id, name, parent_id) VALUES (688, '<p>Participate in ECST student council activities</p><ul><li><a target="_blank" href="http://web.calstatela.edu/orgs/etsc/">http://web.calstatela.edu/orgs/etsc/</a></li></ul>', 149);
INSERT INTO checkpoints (id, name, parent_id) VALUES (689, '<p>Take a service learning course&nbsp;or otherwise participate in a community service project</p><ul><li><a target="_blank" href="http://web.calstatela.edu/centers/sl/">http://web.calstatela.edu/centers/sl/</a></li></ul>', 150);
INSERT INTO checkpoints (id, name, parent_id) VALUES (690, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', 151);
INSERT INTO checkpoints (id, name, parent_id) VALUES (691, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 152);
INSERT INTO checkpoints (id, name, parent_id) VALUES (692, '<p>Student Faculty Breakfast</p>', 153);
INSERT INTO checkpoints (id, name, parent_id) VALUES (693, '<p>Leadership Convocation</p>', 154);
INSERT INTO checkpoints (id, name, parent_id) VALUES (694, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 155);
INSERT INTO checkpoints (id, name, parent_id) VALUES (695, '<p>MEP Welcome Back BBQ</p>', 156);
INSERT INTO checkpoints (id, name, parent_id) VALUES (696, '<p>ECST Week &ndash; help run one of the events</p>', 157);
INSERT INTO checkpoints (id, name, parent_id) VALUES (698, '<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>', 159);
INSERT INTO checkpoints (id, name, parent_id) VALUES (699, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 160);
INSERT INTO checkpoints (id, name, parent_id) VALUES (700, '<p>Leadership Convocation</p>', 161);
INSERT INTO checkpoints (id, name, parent_id) VALUES (701, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 162);
INSERT INTO checkpoints (id, name, parent_id) VALUES (702, '<p>MEP Welcome Back BBQ</p>', 163);
INSERT INTO checkpoints (id, name, parent_id) VALUES (703, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', 164);
INSERT INTO checkpoints (id, name, parent_id) VALUES (705, '<p>Complete 200-level engineering courses</p>', 166);
INSERT INTO checkpoints (id, name, parent_id) VALUES (706, '<p>Complete 300-level engineering courses</p>', 167);
INSERT INTO checkpoints (id, name, parent_id) VALUES (707, '<p>Choose upper division specialization</p>', 168);
INSERT INTO checkpoints (id, name, parent_id) VALUES (708, '<p>Get tutoring on courses you need help with</p>', 169);
INSERT INTO checkpoints (id, name, parent_id) VALUES (709, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 170);
INSERT INTO checkpoints (id, name, parent_id) VALUES (710, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 171);
INSERT INTO checkpoints (id, name, parent_id) VALUES (712, '<p>Upper division&nbsp; specialization</p>', 173);
INSERT INTO checkpoints (id, name, parent_id) VALUES (713, '<p>Upper division technical electives</p>', 174);
INSERT INTO checkpoints (id, name, parent_id) VALUES (714, '<p>Upper division GE requirements</p>', 175);
INSERT INTO checkpoints (id, name, parent_id) VALUES (715, '<p>Senior design</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/ppp">http://www.calstatela.edu/ecst/ppp</a></li></ul>', 176);
INSERT INTO checkpoints (id, name, parent_id) VALUES (716, '<p>Any outstanding requirements</p>', 177);
INSERT INTO checkpoints (id, name, parent_id) VALUES (717, '<p>Get tutoring on courses you need help with</p>', 178);
INSERT INTO checkpoints (id, name, parent_id) VALUES (719, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li></ul>', 180);
INSERT INTO checkpoints (id, name, parent_id) VALUES (720, '<p>Attend career fairs to submit your resume</p>', 181);
INSERT INTO checkpoints (id, name, parent_id) VALUES (721, '<p>Social media workshop (Career Development Center)</p>', 182);
INSERT INTO checkpoints (id, name, parent_id) VALUES (722, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', 183);
INSERT INTO checkpoints (id, name, parent_id) VALUES (723, '<p>Participate in interviewing workshops</p>', 184);
INSERT INTO checkpoints (id, name, parent_id) VALUES (724, '<p>Apply for jobs and/or &nbsp;graduate school</p>', 185);
INSERT INTO checkpoints (id, name, parent_id) VALUES (725, '<p>ECST Career Fair</p>', 186);
INSERT INTO checkpoints (id, name, parent_id) VALUES (727, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>', 188);
INSERT INTO checkpoints (id, name, parent_id) VALUES (728, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', 189);
INSERT INTO checkpoints (id, name, parent_id) VALUES (729, '<p>Leadership Convocation</p>', 190);
INSERT INTO checkpoints (id, name, parent_id) VALUES (730, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 191);
INSERT INTO checkpoints (id, name, parent_id) VALUES (731, '<p>MEP Welcome Back BBQ</p>', 192);
INSERT INTO checkpoints (id, name, parent_id) VALUES (732, '<p>ECST Week &ndash; Outreach</p>', 193);
INSERT INTO checkpoints (id, name, parent_id) VALUES (734, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 195);
INSERT INTO checkpoints (id, name, parent_id) VALUES (735, '<p>Preparing for the career fair workshop (Career Development Center)</p>', 196);
INSERT INTO checkpoints (id, name, parent_id) VALUES (736, '<p>Create/update your resume with help from career center</p>', 197);
INSERT INTO checkpoints (id, name, parent_id) VALUES (737, '<p>Mock interview workshop (Career Development Center)</p>', 198);
INSERT INTO checkpoints (id, name, parent_id) VALUES (738, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', 199);
INSERT INTO checkpoints (id, name, parent_id) VALUES (739, '<p>Apply for summer internships</p>', 200);
INSERT INTO checkpoints (id, name, parent_id) VALUES (740, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006" target="_blank">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 201);
INSERT INTO checkpoints (id, name, parent_id) VALUES (741, '<p>Internship in following summer</p>', 202);
INSERT INTO checkpoints (id, name, parent_id) VALUES (742, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 203);
INSERT INTO checkpoints (id, name, parent_id) VALUES (743, '<p>ECST Career Fair</p>', 204);
INSERT INTO checkpoints (id, name, parent_id) VALUES (817, '<p>MEP Welcome Back BBQ</p>', 695);
INSERT INTO checkpoints (id, name, parent_id) VALUES (744, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 205);
INSERT INTO checkpoints (id, name, parent_id) VALUES (745, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 206);
INSERT INTO checkpoints (id, name, parent_id) VALUES (755, '<p>test te4st</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (761, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 734);
INSERT INTO checkpoints (id, name, parent_id) VALUES (762, '<p>Preparing for the career fair workshop (Career Development Center)</p>', 735);
INSERT INTO checkpoints (id, name, parent_id) VALUES (763, '<p>Create/update your resume with help from career center</p>', 736);
INSERT INTO checkpoints (id, name, parent_id) VALUES (764, '<p>Mock interview workshop (Career Development Center)</p>', 737);
INSERT INTO checkpoints (id, name, parent_id) VALUES (765, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', 738);
INSERT INTO checkpoints (id, name, parent_id) VALUES (766, '<p>Apply for summer internships</p>', 739);
INSERT INTO checkpoints (id, name, parent_id) VALUES (767, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006" target="_blank">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 740);
INSERT INTO checkpoints (id, name, parent_id) VALUES (768, '<p>Internship in following summer</p>', 741);
INSERT INTO checkpoints (id, name, parent_id) VALUES (769, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 742);
INSERT INTO checkpoints (id, name, parent_id) VALUES (770, '<p>ECST Career Fair</p>', 743);
INSERT INTO checkpoints (id, name, parent_id) VALUES (771, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 744);
INSERT INTO checkpoints (id, name, parent_id) VALUES (772, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 745);
INSERT INTO checkpoints (id, name, parent_id) VALUES (774, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>', 727);
INSERT INTO checkpoints (id, name, parent_id) VALUES (775, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', 728);
INSERT INTO checkpoints (id, name, parent_id) VALUES (776, '<p>Leadership Convocation</p>', 729);
INSERT INTO checkpoints (id, name, parent_id) VALUES (777, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 730);
INSERT INTO checkpoints (id, name, parent_id) VALUES (778, '<p>MEP Welcome Back BBQ</p>', 731);
INSERT INTO checkpoints (id, name, parent_id) VALUES (779, '<p>ECST Week &ndash; Outreach</p>', 732);
INSERT INTO checkpoints (id, name, parent_id) VALUES (781, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li></ul>', 719);
INSERT INTO checkpoints (id, name, parent_id) VALUES (782, '<p>Attend career fairs to submit your resume</p>', 720);
INSERT INTO checkpoints (id, name, parent_id) VALUES (783, '<p>Social media workshop (Career Development Center)</p>', 721);
INSERT INTO checkpoints (id, name, parent_id) VALUES (784, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', 722);
INSERT INTO checkpoints (id, name, parent_id) VALUES (785, '<p>Participate in interviewing workshops</p>', 723);
INSERT INTO checkpoints (id, name, parent_id) VALUES (786, '<p>Apply for jobs and/or &nbsp;graduate school</p>', 724);
INSERT INTO checkpoints (id, name, parent_id) VALUES (787, '<p>ECST Career Fair</p>', 725);
INSERT INTO checkpoints (id, name, parent_id) VALUES (789, '<p>Upper division&nbsp; specialization</p>', 712);
INSERT INTO checkpoints (id, name, parent_id) VALUES (790, '<p>Upper division technical electives</p>', 713);
INSERT INTO checkpoints (id, name, parent_id) VALUES (791, '<p>Upper division GE requirements</p>', 714);
INSERT INTO checkpoints (id, name, parent_id) VALUES (792, '<p>Senior design</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/ppp">http://www.calstatela.edu/ecst/ppp</a></li></ul>', 715);
INSERT INTO checkpoints (id, name, parent_id) VALUES (793, '<p>Any outstanding requirements</p>', 716);
INSERT INTO checkpoints (id, name, parent_id) VALUES (794, '<p>Get tutoring on courses you need help with</p>', 717);
INSERT INTO checkpoints (id, name, parent_id) VALUES (796, '<p>Complete 200-level engineering courses</p>', 705);
INSERT INTO checkpoints (id, name, parent_id) VALUES (797, '<p>Complete 300-level engineering courses</p>', 706);
INSERT INTO checkpoints (id, name, parent_id) VALUES (798, '<p>Choose upper division specialization</p>', 707);
INSERT INTO checkpoints (id, name, parent_id) VALUES (799, '<p>Get tutoring on courses you need help with</p>', 708);
INSERT INTO checkpoints (id, name, parent_id) VALUES (800, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 709);
INSERT INTO checkpoints (id, name, parent_id) VALUES (801, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 710);
INSERT INTO checkpoints (id, name, parent_id) VALUES (803, '<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>', 698);
INSERT INTO checkpoints (id, name, parent_id) VALUES (804, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 699);
INSERT INTO checkpoints (id, name, parent_id) VALUES (805, '<p>Leadership Convocation</p>', 700);
INSERT INTO checkpoints (id, name, parent_id) VALUES (806, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 701);
INSERT INTO checkpoints (id, name, parent_id) VALUES (807, '<p>MEP Welcome Back BBQ</p>', 702);
INSERT INTO checkpoints (id, name, parent_id) VALUES (808, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', 703);
INSERT INTO checkpoints (id, name, parent_id) VALUES (810, '<p>Participate in ECST student council activities</p><ul><li><a target="_blank" href="http://web.calstatela.edu/orgs/etsc/">http://web.calstatela.edu/orgs/etsc/</a></li></ul>', 688);
INSERT INTO checkpoints (id, name, parent_id) VALUES (811, '<p>Take a service learning course&nbsp;or otherwise participate in a community service project</p><ul><li><a target="_blank" href="http://web.calstatela.edu/centers/sl/">http://web.calstatela.edu/centers/sl/</a></li></ul>', 689);
INSERT INTO checkpoints (id, name, parent_id) VALUES (812, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', 690);
INSERT INTO checkpoints (id, name, parent_id) VALUES (813, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 691);
INSERT INTO checkpoints (id, name, parent_id) VALUES (814, '<p>Student Faculty Breakfast</p>', 692);
INSERT INTO checkpoints (id, name, parent_id) VALUES (815, '<p>Leadership Convocation</p>', 693);
INSERT INTO checkpoints (id, name, parent_id) VALUES (816, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 694);
INSERT INTO checkpoints (id, name, parent_id) VALUES (818, '<p>ECST Week &ndash; help run one of the events</p>', 696);
INSERT INTO checkpoints (id, name, parent_id) VALUES (820, '<p>Visit career center and find out what services they offer</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc">http://www.calstatela.edu/univ/cdc</a></li></ul>', 678);
INSERT INTO checkpoints (id, name, parent_id) VALUES (821, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', 679);
INSERT INTO checkpoints (id, name, parent_id) VALUES (822, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 680);
INSERT INTO checkpoints (id, name, parent_id) VALUES (823, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 681);
INSERT INTO checkpoints (id, name, parent_id) VALUES (824, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', 682);
INSERT INTO checkpoints (id, name, parent_id) VALUES (825, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', 683);
INSERT INTO checkpoints (id, name, parent_id) VALUES (826, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 684);
INSERT INTO checkpoints (id, name, parent_id) VALUES (827, '<p>ECST Career Fair</p>', 685);
INSERT INTO checkpoints (id, name, parent_id) VALUES (828, '<p>Apply for financial aid and scholarships</p>', 686);
INSERT INTO checkpoints (id, name, parent_id) VALUES (830, '<p>Math 209 (Calc IV)</p>', 665);
INSERT INTO checkpoints (id, name, parent_id) VALUES (831, '<p>Math 215 (Diff Eq)</p>', 666);
INSERT INTO checkpoints (id, name, parent_id) VALUES (832, '<p>Physics 212</p>', 667);
INSERT INTO checkpoints (id, name, parent_id) VALUES (833, '<p>Physics 213</p>', 668);
INSERT INTO checkpoints (id, name, parent_id) VALUES (834, '<p>Attend Math AEW</p>', 669);
INSERT INTO checkpoints (id, name, parent_id) VALUES (835, '<p>Attend Physics AEW</p>', 670);
INSERT INTO checkpoints (id, name, parent_id) VALUES (836, '<p>200-level engineering courses.</p>', 671);
INSERT INTO checkpoints (id, name, parent_id) VALUES (837, '<p>Lower division GE requirements</p>', 672);
INSERT INTO checkpoints (id, name, parent_id) VALUES (838, '<p>Get tutoring on courses you need help with</p>', 673);
INSERT INTO checkpoints (id, name, parent_id) VALUES (839, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 674);
INSERT INTO checkpoints (id, name, parent_id) VALUES (840, '<p><!--[if !supportLists]-->Group Advising</p>', 675);
INSERT INTO checkpoints (id, name, parent_id) VALUES (841, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 676);
INSERT INTO checkpoints (id, name, parent_id) VALUES (843, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 663);
INSERT INTO checkpoints (id, name, parent_id) VALUES (845, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 661);
INSERT INTO checkpoints (id, name, parent_id) VALUES (847, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 659);
INSERT INTO checkpoints (id, name, parent_id) VALUES (849, '<p>Find out about ECST student organizations at ECST week</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 648);
INSERT INTO checkpoints (id, name, parent_id) VALUES (850, '<p>Join at least one student organization and actively participate</p><ul><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 649);
INSERT INTO checkpoints (id, name, parent_id) VALUES (851, '<p>Share with someone in your community about what you are learning in school</p>', 650);
INSERT INTO checkpoints (id, name, parent_id) VALUES (852, '<p>Participate in time management workshop (Tutorial Center)</p><ul><li><a target="_blank" href="http://www.calstatela.edu/tutorialcenter">http://www.calstatela.edu/tutorialcenter</a></li></ul>', 651);
INSERT INTO checkpoints (id, name, parent_id) VALUES (853, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 652);
INSERT INTO checkpoints (id, name, parent_id) VALUES (854, '<p>Student Faculty Breakfast</p>', 653);
INSERT INTO checkpoints (id, name, parent_id) VALUES (855, '<p>Leadership Convocation</p>', 654);
INSERT INTO checkpoints (id, name, parent_id) VALUES (856, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 655);
INSERT INTO checkpoints (id, name, parent_id) VALUES (857, '<p>MEP Welcome Back BBQ</p>', 656);
INSERT INTO checkpoints (id, name, parent_id) VALUES (858, '<p>ECST Week &ndash; participate</p>', 657);
INSERT INTO checkpoints (id, name, parent_id) VALUES (860, '<p>Take online assessment test.</p><div class="clearfix">&nbsp;</div><div class="accordion"><p>Keirsey</p><div><p><a target="_blank" href="http://www.keirsey.com/">http://www.keirsey.com/</a></p></div><p>Rileyguide</p><div><p><a target="_blank" href="http://www.rileyguide.com/assess.html">http://www.rileyguide.com/assess.html</a></p></div></div><div class="clearfix">&nbsp;</div>', 640);
INSERT INTO checkpoints (id, name, parent_id) VALUES (861, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li></ol>', 641);
INSERT INTO checkpoints (id, name, parent_id) VALUES (862, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p><ul><li>Civil Engineering (<a href="http://www.calstatela.edu/ecst/ce" target="_blank">http://www.calstatela.edu/ecst/ce</a>)</li><li>Electrical and Computer Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/</a><a href="http://www.calstatela.edu/ecst/ece" target="_blank">ece</a>)</li><li>Mechanical Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/m</a><a href="http://www.calstatela.edu/ecst/me" target="_blank">e</a>)</li><li>Computer Science Technology (<a href="http://www.calstatela.edu/ecst/tech" target="_blank">http://www.calstatela.edu/ecst/tech</a>)</li></ul>', 642);
INSERT INTO checkpoints (id, name, parent_id) VALUES (863, '<p>Identify at least one type of career in your field of interest</p>', 643);
INSERT INTO checkpoints (id, name, parent_id) VALUES (864, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 644);
INSERT INTO checkpoints (id, name, parent_id) VALUES (865, '<p>Apply for Financial Aid (&nbsp;<a href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 645);
INSERT INTO checkpoints (id, name, parent_id) VALUES (866, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 646);
INSERT INTO checkpoints (id, name, parent_id) VALUES (868, '<p>Math 206 (Calc I)</p>', 624);
INSERT INTO checkpoints (id, name, parent_id) VALUES (869, '<p>Math 207 (Calc II)</p>', 625);
INSERT INTO checkpoints (id, name, parent_id) VALUES (870, '<p>Math 208 (Calc III)</p>', 626);
INSERT INTO checkpoints (id, name, parent_id) VALUES (871, '<p>Phys 211</p>', 627);
INSERT INTO checkpoints (id, name, parent_id) VALUES (872, '<p>Chem 10</p>', 628);
INSERT INTO checkpoints (id, name, parent_id) VALUES (873, '<p>ENGR 150</p>', 629);
INSERT INTO checkpoints (id, name, parent_id) VALUES (874, '<p>Go to office hours after 1st assignment in every class</p>', 630);
INSERT INTO checkpoints (id, name, parent_id) VALUES (875, '<p>Keep track of your grades / progress in each course</p>', 631);
INSERT INTO checkpoints (id, name, parent_id) VALUES (876, '<p>Get tutoring for any course with grade &lt; B</p>', 632);
INSERT INTO checkpoints (id, name, parent_id) VALUES (877, '<p>Attend Math Academic Excellence Workshops (AEW)</p>', 633);
INSERT INTO checkpoints (id, name, parent_id) VALUES (878, '<p>Attend Physics&nbsp; AEW</p>', 634);
INSERT INTO checkpoints (id, name, parent_id) VALUES (879, '<p>ECST New Student Registration</p>', 635);
INSERT INTO checkpoints (id, name, parent_id) VALUES (880, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', 636);
INSERT INTO checkpoints (id, name, parent_id) VALUES (881, '<p>Group Advising</p>', 637);
INSERT INTO checkpoints (id, name, parent_id) VALUES (882, '<p>Academic &amp; Personal Advisement</p>', 638);
INSERT INTO checkpoints (id, name, parent_id) VALUES (884, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 621);
INSERT INTO checkpoints (id, name, parent_id) VALUES (885, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 622);
INSERT INTO checkpoints (id, name, parent_id) VALUES (887, '<p>Make a list of questions to ask during orientation and ask them</p>', 619);
INSERT INTO checkpoints (id, name, parent_id) VALUES (889, '<p>Algebra (before Yr 1)</p>', 615);
INSERT INTO checkpoints (id, name, parent_id) VALUES (890, '<p>Pre-calculus (before (Yr 1)</p>', 616);
INSERT INTO checkpoints (id, name, parent_id) VALUES (891, '<p>Attend STEP (<a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">Link Here</a>)</p>', 617);
INSERT INTO checkpoints (id, name, parent_id) VALUES (917, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 195);
INSERT INTO checkpoints (id, name, parent_id) VALUES (918, '<p>Preparing for the career fair workshop (Career Development Center)</p>', 196);
INSERT INTO checkpoints (id, name, parent_id) VALUES (919, '<p>Create/update your resume with help from career center</p>', 197);
INSERT INTO checkpoints (id, name, parent_id) VALUES (920, '<p>Mock interview workshop (Career Development Center)</p>', 198);
INSERT INTO checkpoints (id, name, parent_id) VALUES (921, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', 199);
INSERT INTO checkpoints (id, name, parent_id) VALUES (922, '<p>Apply for summer internships</p>', 200);
INSERT INTO checkpoints (id, name, parent_id) VALUES (923, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006" target="_blank">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 201);
INSERT INTO checkpoints (id, name, parent_id) VALUES (924, '<p>Internship in following summer</p>', 202);
INSERT INTO checkpoints (id, name, parent_id) VALUES (925, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 203);
INSERT INTO checkpoints (id, name, parent_id) VALUES (926, '<p>ECST Career Fair</p>', 204);
INSERT INTO checkpoints (id, name, parent_id) VALUES (927, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 205);
INSERT INTO checkpoints (id, name, parent_id) VALUES (928, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 206);
INSERT INTO checkpoints (id, name, parent_id) VALUES (930, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>', 188);
INSERT INTO checkpoints (id, name, parent_id) VALUES (931, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', 189);
INSERT INTO checkpoints (id, name, parent_id) VALUES (932, '<p>Leadership Convocation</p>', 190);
INSERT INTO checkpoints (id, name, parent_id) VALUES (933, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 191);
INSERT INTO checkpoints (id, name, parent_id) VALUES (934, '<p>MEP Welcome Back BBQ</p>', 192);
INSERT INTO checkpoints (id, name, parent_id) VALUES (935, '<p>ECST Week &ndash; Outreach</p>', 193);
INSERT INTO checkpoints (id, name, parent_id) VALUES (937, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li></ul>', 180);
INSERT INTO checkpoints (id, name, parent_id) VALUES (938, '<p>Attend career fairs to submit your resume</p>', 181);
INSERT INTO checkpoints (id, name, parent_id) VALUES (939, '<p>Social media workshop (Career Development Center)</p>', 182);
INSERT INTO checkpoints (id, name, parent_id) VALUES (940, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', 183);
INSERT INTO checkpoints (id, name, parent_id) VALUES (941, '<p>Participate in interviewing workshops</p>', 184);
INSERT INTO checkpoints (id, name, parent_id) VALUES (942, '<p>Apply for jobs and/or &nbsp;graduate school</p>', 185);
INSERT INTO checkpoints (id, name, parent_id) VALUES (943, '<p>ECST Career Fair</p>', 186);
INSERT INTO checkpoints (id, name, parent_id) VALUES (945, '<p>Upper division&nbsp; specialization</p>', 173);
INSERT INTO checkpoints (id, name, parent_id) VALUES (946, '<p>Upper division technical electives</p>', 174);
INSERT INTO checkpoints (id, name, parent_id) VALUES (947, '<p>Upper division GE requirements</p>', 175);
INSERT INTO checkpoints (id, name, parent_id) VALUES (948, '<p>Senior design</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/ppp">http://www.calstatela.edu/ecst/ppp</a></li></ul>', 176);
INSERT INTO checkpoints (id, name, parent_id) VALUES (949, '<p>Any outstanding requirements</p>', 177);
INSERT INTO checkpoints (id, name, parent_id) VALUES (950, '<p>Get tutoring on courses you need help with</p>', 178);
INSERT INTO checkpoints (id, name, parent_id) VALUES (952, '<p>Complete 200-level engineering courses</p>', 166);
INSERT INTO checkpoints (id, name, parent_id) VALUES (953, '<p>Complete 300-level engineering courses</p>', 167);
INSERT INTO checkpoints (id, name, parent_id) VALUES (954, '<p>Choose upper division specialization</p>', 168);
INSERT INTO checkpoints (id, name, parent_id) VALUES (955, '<p>Get tutoring on courses you need help with</p>', 169);
INSERT INTO checkpoints (id, name, parent_id) VALUES (956, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 170);
INSERT INTO checkpoints (id, name, parent_id) VALUES (957, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 171);
INSERT INTO checkpoints (id, name, parent_id) VALUES (959, '<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>', 159);
INSERT INTO checkpoints (id, name, parent_id) VALUES (960, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 160);
INSERT INTO checkpoints (id, name, parent_id) VALUES (961, '<p>Leadership Convocation</p>', 161);
INSERT INTO checkpoints (id, name, parent_id) VALUES (962, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 162);
INSERT INTO checkpoints (id, name, parent_id) VALUES (963, '<p>MEP Welcome Back BBQ</p>', 163);
INSERT INTO checkpoints (id, name, parent_id) VALUES (964, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', 164);
INSERT INTO checkpoints (id, name, parent_id) VALUES (966, '<p>Participate in ECST student council activities</p><ul><li><a target="_blank" href="http://web.calstatela.edu/orgs/etsc/">http://web.calstatela.edu/orgs/etsc/</a></li></ul>', 149);
INSERT INTO checkpoints (id, name, parent_id) VALUES (967, '<p>Take a service learning course&nbsp;or otherwise participate in a community service project</p><ul><li><a target="_blank" href="http://web.calstatela.edu/centers/sl/">http://web.calstatela.edu/centers/sl/</a></li></ul>', 150);
INSERT INTO checkpoints (id, name, parent_id) VALUES (968, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', 151);
INSERT INTO checkpoints (id, name, parent_id) VALUES (969, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 152);
INSERT INTO checkpoints (id, name, parent_id) VALUES (970, '<p>Student Faculty Breakfast</p>', 153);
INSERT INTO checkpoints (id, name, parent_id) VALUES (971, '<p>Leadership Convocation</p>', 154);
INSERT INTO checkpoints (id, name, parent_id) VALUES (972, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 155);
INSERT INTO checkpoints (id, name, parent_id) VALUES (973, '<p>MEP Welcome Back BBQ</p>', 156);
INSERT INTO checkpoints (id, name, parent_id) VALUES (974, '<p>ECST Week &ndash; help run one of the events</p>', 157);
INSERT INTO checkpoints (id, name, parent_id) VALUES (976, '<p>Visit career center and find out what services they offer</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc">http://www.calstatela.edu/univ/cdc</a></li></ul>', 139);
INSERT INTO checkpoints (id, name, parent_id) VALUES (977, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', 140);
INSERT INTO checkpoints (id, name, parent_id) VALUES (978, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a target="_blank" href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', 141);
INSERT INTO checkpoints (id, name, parent_id) VALUES (979, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 142);
INSERT INTO checkpoints (id, name, parent_id) VALUES (980, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', 143);
INSERT INTO checkpoints (id, name, parent_id) VALUES (981, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', 144);
INSERT INTO checkpoints (id, name, parent_id) VALUES (982, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 145);
INSERT INTO checkpoints (id, name, parent_id) VALUES (983, '<p>ECST Career Fair</p>', 146);
INSERT INTO checkpoints (id, name, parent_id) VALUES (984, '<p>Apply for financial aid and scholarships</p>', 147);
INSERT INTO checkpoints (id, name, parent_id) VALUES (986, '<p>Math 209 (Calc IV)</p>', 126);
INSERT INTO checkpoints (id, name, parent_id) VALUES (987, '<p>Math 215 (Diff Eq)</p>', 127);
INSERT INTO checkpoints (id, name, parent_id) VALUES (988, '<p>Physics 212</p>', 128);
INSERT INTO checkpoints (id, name, parent_id) VALUES (989, '<p>Physics 213</p>', 129);
INSERT INTO checkpoints (id, name, parent_id) VALUES (990, '<p>Attend Math AEW</p>', 130);
INSERT INTO checkpoints (id, name, parent_id) VALUES (991, '<p>Attend Physics AEW</p>', 131);
INSERT INTO checkpoints (id, name, parent_id) VALUES (992, '<p>200-level&nbsp;computer science&nbsp;courses.</p>', 132);
INSERT INTO checkpoints (id, name, parent_id) VALUES (993, '<p>Lower division GE requirements</p>', 133);
INSERT INTO checkpoints (id, name, parent_id) VALUES (994, '<p>Get tutoring on courses you need help with</p>', 134);
INSERT INTO checkpoints (id, name, parent_id) VALUES (995, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 135);
INSERT INTO checkpoints (id, name, parent_id) VALUES (996, '<p><!--[if !supportLists]-->Group Advising</p>', 136);
INSERT INTO checkpoints (id, name, parent_id) VALUES (997, '<p>Academic &amp; Personal Advisement</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/advising">http://www.calstatela.edu/ecst/success/advising</a></li></ul>', 137);
INSERT INTO checkpoints (id, name, parent_id) VALUES (998, '<p>test te4st</p>', 755);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1000, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 124);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1002, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 122);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1004, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 120);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1006, '<p>Find out about ECST student organizations at ECST week</p><ul><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 109);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1007, '<p>Join at least one student organization and actively participate</p><ul><li><a target="_blank" href="http://www.calstatelausu.org/studentorglist">http://www.calstatelausu.org/studentorglist</a></li></ul>', 110);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1008, '<p>Share with someone in your community about what you are learning in school</p>', 111);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1009, '<p>Participate in time management workshop (Tutorial Center)</p><ul><li><a target="_blank" href="http://www.calstatela.edu/tutorialcenter">http://www.calstatela.edu/tutorialcenter</a></li></ul>', 112);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1010, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 113);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1011, '<p>Student Faculty Breakfast</p>', 114);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1012, '<p>Leadership Convocation</p>', 115);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1013, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 116);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1014, '<p>MEP Welcome Back BBQ</p>', 117);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1015, '<p>ECST Week &ndash; participate</p>', 118);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1017, '<p>Take online assessment test.</p><div class="clearfix">&nbsp;</div><div class="accordion"><p>Keirsey</p><div><p><a target="_blank" href="http://www.keirsey.com/">http://www.keirsey.com/</a></p></div><p>Rileyguide</p><div><p><a target="_blank" href="http://www.rileyguide.com/assess.html">http://www.rileyguide.com/assess.html</a></p></div></div><div class="clearfix">&nbsp;</div>', 100);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1018, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">http://www.calstatela.edu/univ/cdc/onlineresources.php</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">http://www.calstatela.edu/ecst/success/clubs-and-organizations</a></li></ol>', 102);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1019, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p><ul><li>Civil Engineering (<a href="http://www.calstatela.edu/ecst/ce" target="_blank">http://www.calstatela.edu/ecst/ce</a>)</li><li>Electrical and Computer Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/</a><a href="http://www.calstatela.edu/ecst/ece" target="_blank">ece</a>)</li><li>Mechanical Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/m</a><a href="http://www.calstatela.edu/ecst/me" target="_blank">e</a>)</li><li>Computer Science Technology (<a href="http://www.calstatela.edu/ecst/tech" target="_blank">http://www.calstatela.edu/ecst/tech</a>)</li></ul>', 103);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1020, '<p>Identify at least one type of career in your field of interest</p>', 104);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1021, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 105);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1022, '<p>Apply for Financial Aid (&nbsp;<a href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 106);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1023, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 107);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1025, '<p>Math 206 (Calc I)</p>', 84);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1026, '<p>Math 207 (Calc II)</p>', 85);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1027, '<p>Math 208 (Calc III)</p>', 86);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1028, '<p>Phys 211</p>', 87);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1029, '', 88);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1030, '<p>CS 101</p>', 89);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1031, '<p>Go to office hours after 1st assignment in every class</p>', 90);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1032, '<p>Keep track of your grades / progress in each course</p>', 91);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1033, '<p>Get tutoring for any course with grade &lt; B</p>', 92);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1034, '<p>Attend Math Academic Excellence Workshops (AEW) (i.e. ENGR 154 workshops)</p>', 93);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1035, '<p>Attend Physics&nbsp; AEW (I.e. ENGR 154 workshops)</p>', 94);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1036, '<p>ECST New Student Registration</p>', 95);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1037, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', 96);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1038, '<p>Group Advising</p>', 97);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1039, '<p>Academic &amp; Personal Advisement</p>', 98);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1041, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', 80);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1042, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', 82);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1044, '<p>Make a list of questions to ask during orientation and ask them</p>', 79);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1046, '<p>Algebra (before Yr 1)</p>', 75);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1047, '<p>Pre-calculus (before (Yr 1)</p>', 76);
INSERT INTO checkpoints (id, name, parent_id) VALUES (1048, '<p>Attend STEP (<a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">Link Here</a>)</p>', 77);


--
-- Data for Name: department_plans; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO department_plans (department_id, plan_id) VALUES (2, 2);
INSERT INTO department_plans (department_id, plan_id) VALUES (2, 288);
INSERT INTO department_plans (department_id, plan_id) VALUES (2, 613);
INSERT INTO department_plans (department_id, plan_id) VALUES (2, 759);
INSERT INTO department_plans (department_id, plan_id) VALUES (1, 64);
INSERT INTO department_plans (department_id, plan_id) VALUES (1, 299);
INSERT INTO department_plans (department_id, plan_id) VALUES (1, 915);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (1, 'Computer Science', 64, true, false);
INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (2, 'Electrical Engineering', 288, true, false);


--
-- Data for Name: flightplan_runways; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (759, 892, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (759, 893, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (759, 894, 2);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (915, 1049, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (915, 1050, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (915, 1051, 2);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (2, 42, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (2, 47, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 65, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 66, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 67, 2);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (299, 432, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (299, 433, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (299, 434, 2);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (613, 746, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (613, 747, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (613, 748, 2);


--
-- Data for Name: flightplan_stages; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (2, 43, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (2, 44, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 68, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 69, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 70, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 71, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 72, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 73, 5);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (299, 435, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (299, 436, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (299, 437, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (299, 438, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (299, 439, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (299, 440, 5);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (613, 749, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (613, 750, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (613, 751, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (613, 752, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (613, 753, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (613, 754, 5);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (759, 895, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (759, 896, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (759, 897, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (759, 898, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (759, 899, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (759, 900, 5);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (915, 1052, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (915, 1053, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (915, 1054, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (915, 1055, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (915, 1056, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (915, 1057, 5);


--
-- Data for Name: flightplans; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplans (id, name, department_id, published, season_name, season_year, parent_id) VALUES (64, 'MyGoldenEagle Flight Plan 2.0', 1, true, 'Spring', '2015', NULL);
INSERT INTO flightplans (id, name, department_id, published, season_name, season_year, parent_id) VALUES (288, 'GEFP-30May2015', 2, true, 'Fall', '2015', NULL);
INSERT INTO flightplans (id, name, department_id, published, season_name, season_year, parent_id) VALUES (299, 'MyGoldenEagle Flight Plan 2.0 - Cloned', 1, false, 'Summer', '2015', 64);
INSERT INTO flightplans (id, name, department_id, published, season_name, season_year, parent_id) VALUES (613, 'Electrical Department Default Plan', 2, true, 'Summer', '2015', 64);
INSERT INTO flightplans (id, name, department_id, published, season_name, season_year, parent_id) VALUES (759, 'Copy Of Electrical Department Default Plan', 2, false, 'Summer', '2015', 613);
INSERT INTO flightplans (id, name, department_id, published, season_name, season_year, parent_id) VALUES (915, 'CS Ideal Flight Plan', 1, false, 'Fall', '2015', 64);
INSERT INTO flightplans (id, name, department_id, published, season_name, season_year, parent_id) VALUES (2, 'Electrical Engineering Flight Plan', 2, true, 'Spring', '2015', NULL);

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: gefp
--

SELECT pg_catalog.setval('hibernate_sequence', 1075, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO roles (id, name) VALUES (1, 'ADMIN');
INSERT INTO roles (id, name) VALUES (2, 'ADVISOR');
INSERT INTO roles (id, name) VALUES (3, 'STUDENT');


--
-- Data for Name: runways; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO runways (id, name, parent_id) VALUES (4, 'Career Preparation', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (5, 'Leadership & Community Engagement', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (14, 'Academic Performance', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (15, 'Career Preparation', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (16, 'Leadership & Community Engagement', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (21, 'Academic Performance', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (23, 'Leadership & Community Engagement', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (22, '', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (42, 'Career Development', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (47, 'leadership', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (65, 'Academic Performance', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (66, 'Career Preparation', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (67, 'Leadership & Community Engagement', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (208, 'Pathways', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (3, 'Academic Performance', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (210, 'TO Be Deleted', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (211, 'Test Ruwnay', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (229, 'Runway 1', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (230, 'Runway 2', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (231, 'Runway 3', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (260, 'Runway 1', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (264, 'Runway 1', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (265, 'Runway 2', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (266, 'Runway 3', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (289, 'Academic', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (291, 'Leadership/Community Engagement', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (433, 'Career Preparation', 66);
INSERT INTO runways (id, name, parent_id) VALUES (434, 'Leadership & Community Engagement', 67);
INSERT INTO runways (id, name, parent_id) VALUES (432, 'Academic Performance1', 65);
INSERT INTO runways (id, name, parent_id) VALUES (575, 'Career Preparation', 433);
INSERT INTO runways (id, name, parent_id) VALUES (576, 'Leadership & Community Engagement', 434);
INSERT INTO runways (id, name, parent_id) VALUES (574, 'Academic Performance', 432);
INSERT INTO runways (id, name, parent_id) VALUES (585, 'Academic Performance', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (746, 'Academic Performance', 65);
INSERT INTO runways (id, name, parent_id) VALUES (747, 'Career Preparation', 66);
INSERT INTO runways (id, name, parent_id) VALUES (748, 'Leadership & Community Engagement', 67);
INSERT INTO runways (id, name, parent_id) VALUES (892, 'Academic Performance', 746);
INSERT INTO runways (id, name, parent_id) VALUES (893, 'Career Preparation', 747);
INSERT INTO runways (id, name, parent_id) VALUES (894, 'Leadership & Community Engagement', 748);
INSERT INTO runways (id, name, parent_id) VALUES (1049, 'Academic Performance', 65);
INSERT INTO runways (id, name, parent_id) VALUES (1050, 'Career Preparation', 66);
INSERT INTO runways (id, name, parent_id) VALUES (1051, 'Leadership & Community Engagement', 67);


--
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO stages (id, name, parent_id) VALUES (6, 'Pre-College (pre-flight checklist)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (7, 'Freshman (take-off)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (8, 'Sophomore (climbing altitude)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (17, 'Pre-College (pre-flight checklist)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (24, 'Pre-College (pre-flight checklist)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (25, 'Freshman (take-off)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (36, '', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (37, '', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (43, 'Pre-frosh', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (44, 'Freshman', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (49, '', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (50, 'Academic Probation', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (53, 'Pre-College', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (68, 'Pre-college (pre-flight checklist)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (69, 'Freshman (take-off)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (70, 'Sophomore (climbing altitude)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (71, 'Junior (cruising altitude)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (72, 'Senior (descent)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (73, 'Graduation  (Landing)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (212, 'test stahe', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (232, 'Stage 1', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (233, 'Stage 2', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (234, 'Stage 3', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (261, 'Stage 1', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (267, 'Stage 1', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (268, 'Stage 2', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (269, 'Stage 3', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (290, 'Freshman', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (435, 'Pre-college (pre-flight checklist)', 68);
INSERT INTO stages (id, name, parent_id) VALUES (436, 'Freshman (take-off)', 69);
INSERT INTO stages (id, name, parent_id) VALUES (437, 'Sophomore (climbing altitude)', 70);
INSERT INTO stages (id, name, parent_id) VALUES (438, 'Junior (cruising altitude)', 71);
INSERT INTO stages (id, name, parent_id) VALUES (439, 'Senior (descent)', 72);
INSERT INTO stages (id, name, parent_id) VALUES (440, 'Graduation  (Landing)', 73);
INSERT INTO stages (id, name, parent_id) VALUES (577, 'Pre-college (pre-flight checklist)', 435);
INSERT INTO stages (id, name, parent_id) VALUES (578, 'Freshman (take-off)', 436);
INSERT INTO stages (id, name, parent_id) VALUES (579, 'Sophomore (climbing altitude)', 437);
INSERT INTO stages (id, name, parent_id) VALUES (580, 'Junior (cruising altitude)', 438);
INSERT INTO stages (id, name, parent_id) VALUES (581, 'Senior (descent)', 439);
INSERT INTO stages (id, name, parent_id) VALUES (582, 'Graduation  (Landing)', 440);
INSERT INTO stages (id, name, parent_id) VALUES (749, 'Pre-college (pre-flight checklist)', 68);
INSERT INTO stages (id, name, parent_id) VALUES (750, 'Freshman (take-off)', 69);
INSERT INTO stages (id, name, parent_id) VALUES (751, 'Sophomore (climbing altitude)', 70);
INSERT INTO stages (id, name, parent_id) VALUES (752, 'Junior (cruising altitude)', 71);
INSERT INTO stages (id, name, parent_id) VALUES (753, 'Senior (descent)', 72);
INSERT INTO stages (id, name, parent_id) VALUES (754, 'Graduation  (Landing)', 73);
INSERT INTO stages (id, name, parent_id) VALUES (895, 'Pre-college (pre-flight checklist)', 749);
INSERT INTO stages (id, name, parent_id) VALUES (896, 'Freshman (take-off)', 750);
INSERT INTO stages (id, name, parent_id) VALUES (897, 'Sophomore (climbing altitude)', 751);
INSERT INTO stages (id, name, parent_id) VALUES (898, 'Junior (cruising altitude)', 752);
INSERT INTO stages (id, name, parent_id) VALUES (899, 'Senior (descent)', 753);
INSERT INTO stages (id, name, parent_id) VALUES (900, 'Graduation  (Landing)', 754);
INSERT INTO stages (id, name, parent_id) VALUES (1052, 'Pre-college (pre-flight checklist)', 68);
INSERT INTO stages (id, name, parent_id) VALUES (1053, 'Freshman (take-off)', 69);
INSERT INTO stages (id, name, parent_id) VALUES (1054, 'Sophomore (climbing altitude)', 70);
INSERT INTO stages (id, name, parent_id) VALUES (1055, 'Junior (cruising altitude)', 71);
INSERT INTO stages (id, name, parent_id) VALUES (1056, 'Senior (descent)', 72);
INSERT INTO stages (id, name, parent_id) VALUES (1057, 'Graduation  (Landing)', 73);


--
-- Data for Name: user_checkpoints_info; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (903, 914);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1070);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1069);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1060);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1072);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1068);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1065);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1067);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1062);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1064);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 287);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (4, 292);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1071);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1066);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1063);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1061);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (1059, 1074);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 586);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 590);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 591);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 592);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 593);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 607);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (611, 756);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (611, 757);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (903, 912);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (903, 904);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (903, 907);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (903, 911);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (903, 910);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO user_roles (user_id, role_id) VALUES (1, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (2, 2);
INSERT INTO user_roles (user_id, role_id) VALUES (3, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (4, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (600, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (606, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (611, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (758, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (903, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (1058, 2);
INSERT INTO user_roles (user_id, role_id) VALUES (1059, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (1075, 3);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (1058, '', 'dwon', '', ' dwon@exchange.calstatela.edu', ' Deborah', '', 'Won', 2, 288, 2, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (1059, '', 'shern123', '', ' shern123@calstatela.edu', ' Sandra', '', 'Hernandez', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (1075, '304351494', 'knaphad', '', ' knaphad@calstatela.edu', ' Kuntal', '', 'Naphade', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (4, '38745120', 'jdoe2', 'abcd', 'jdoe2@calstatela.edu', 'Candi', '', 'Marsh', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (1, '304367456', 'cysun', 'abcd', 'csun@calstatela.edu', 'Chengyu', NULL, 'Sun', 1, NULL, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (2, '354120102', 'tfox', 'abcd', 'tfox@calstatela.edu', 'Teresa', NULL, 'Fox', 1, NULL, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (903, '303437269', 'mdavila8', '', ' mdavila8@calstatela.edu', ' Mirasol', 'Guadalupe', 'Davila', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (3, '310451230', 'jdoe1', 'abcd', 'jdoe1@email.com', 'Joe', 'D.', 'Doe', 2, 2, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (606, '', 'cmarsh', '', ' cmarsh@calstatela.edu', ' Candi', '', 'Marsh', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (611, '302929749', 'nbenavi2', '', ' nbenavi2@calstatela.edu', ' Natalie', '', 'Benavidez', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (600, NULL, 'rramir74', '', ' Rodolfo.Ramirez74@calstatela.edu', ' Rodolfo', '', NULL, 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (758, '304367237', 'gefp', '', ' gefp@calstatela.edu', ' Harsh', 'D', 'Gadhia', 1, 64, 1, true, false, false);


--
-- Name: cell_checkpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY cell_checkpoints
    ADD CONSTRAINT cell_checkpoints_pkey PRIMARY KEY (cell_id, order_num);


--
-- Name: cells_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT cells_pkey PRIMARY KEY (id);


--
-- Name: checkpoint_info_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY checkpoint_info
    ADD CONSTRAINT checkpoint_info_pkey PRIMARY KEY (id);


--
-- Name: checkpoints_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY checkpoints
    ADD CONSTRAINT checkpoints_pkey PRIMARY KEY (id);


--
-- Name: departments_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY departments
    ADD CONSTRAINT departments_pkey PRIMARY KEY (id);


--
-- Name: flightplan_runways_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY flightplan_runways
    ADD CONSTRAINT flightplan_runways_pkey PRIMARY KEY (flightplan_id, order_num);


--
-- Name: flightplan_stages_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY flightplan_stages
    ADD CONSTRAINT flightplan_stages_pkey PRIMARY KEY (flightplan_id, order_num);


--
-- Name: flightplans_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY flightplans
    ADD CONSTRAINT flightplans_pkey PRIMARY KEY (id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- Name: runways_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY runways
    ADD CONSTRAINT runways_pkey PRIMARY KEY (id);


--
-- Name: stages_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY stages
    ADD CONSTRAINT stages_pkey PRIMARY KEY (id);


--
-- Name: uk_1bq0aejed37fc3yhyfoca8qqu; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY cell_checkpoints
    ADD CONSTRAINT uk_1bq0aejed37fc3yhyfoca8qqu UNIQUE (checkpoint_id);


--
-- Name: uk_50kuq1dpt3aqxcs4fbq3g6rub; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY flightplan_runways
    ADD CONSTRAINT uk_50kuq1dpt3aqxcs4fbq3g6rub UNIQUE (runway_id);


--
-- Name: uk_hns371mipbxro6xxw1v3yeosi; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY flightplan_stages
    ADD CONSTRAINT uk_hns371mipbxro6xxw1v3yeosi UNIQUE (stage_id);


--
-- Name: uk_huvk9td7lxurmvpn2a3bji8a3; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY department_plans
    ADD CONSTRAINT uk_huvk9td7lxurmvpn2a3bji8a3 UNIQUE (plan_id);


--
-- Name: uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: user_checkpoints_info_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY user_checkpoints_info
    ADD CONSTRAINT user_checkpoints_info_pkey PRIMARY KEY (user_id, checkpoint_info_id);


--
-- Name: user_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT user_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: fk_1bq0aejed37fc3yhyfoca8qqu; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY cell_checkpoints
    ADD CONSTRAINT fk_1bq0aejed37fc3yhyfoca8qqu FOREIGN KEY (checkpoint_id) REFERENCES checkpoints(id);


--
-- Name: fk_1ua4dr9e77minpmjjwcbhgsk6; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY department_plans
    ADD CONSTRAINT fk_1ua4dr9e77minpmjjwcbhgsk6 FOREIGN KEY (department_id) REFERENCES departments(id);


--
-- Name: fk_3eqlt264c3rc8n84quloojtyk; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_3eqlt264c3rc8n84quloojtyk FOREIGN KEY (flightplan_id) REFERENCES flightplans(id);


--
-- Name: fk_3gx84bsex3s6euk16si98b4bn; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY flightplan_runways
    ADD CONSTRAINT fk_3gx84bsex3s6euk16si98b4bn FOREIGN KEY (flightplan_id) REFERENCES flightplans(id);


--
-- Name: fk_4l75xv25nciaskmgvbxdcd424; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_4l75xv25nciaskmgvbxdcd424 FOREIGN KEY (stage_id) REFERENCES stages(id);


--
-- Name: fk_50kuq1dpt3aqxcs4fbq3g6rub; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY flightplan_runways
    ADD CONSTRAINT fk_50kuq1dpt3aqxcs4fbq3g6rub FOREIGN KEY (runway_id) REFERENCES runways(id);


--
-- Name: fk_5q4rc4fh1on6567qk69uesvyf; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fk_5q4rc4fh1on6567qk69uesvyf FOREIGN KEY (role_id) REFERENCES roles(id);


--
-- Name: fk_7phkg3qghukhuw9kj3ahkmw; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_7phkg3qghukhuw9kj3ahkmw FOREIGN KEY (department_id) REFERENCES departments(id);


--
-- Name: fk_8a20talpum1ntge7ig51igoms; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY flightplan_stages
    ADD CONSTRAINT fk_8a20talpum1ntge7ig51igoms FOREIGN KEY (flightplan_id) REFERENCES flightplans(id);


--
-- Name: fk_8dw4ib1a0lhu8xdh7s4s4tha; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY cells
    ADD CONSTRAINT fk_8dw4ib1a0lhu8xdh7s4s4tha FOREIGN KEY (runway_id) REFERENCES runways(id);


--
-- Name: fk_9yc90uxhxcs0p3y3mex1ah62b; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY checkpoint_info
    ADD CONSTRAINT fk_9yc90uxhxcs0p3y3mex1ah62b FOREIGN KEY (checkpoint_id) REFERENCES checkpoints(id);

--
-- Name: fk_g1uebn6mqk9qiaw45vnacmyo2; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY user_roles
    ADD CONSTRAINT fk_g1uebn6mqk9qiaw45vnacmyo2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_hns371mipbxro6xxw1v3yeosi; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY flightplan_stages
    ADD CONSTRAINT fk_hns371mipbxro6xxw1v3yeosi FOREIGN KEY (stage_id) REFERENCES stages(id);


--
-- Name: fk_huvk9td7lxurmvpn2a3bji8a3; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY department_plans
    ADD CONSTRAINT fk_huvk9td7lxurmvpn2a3bji8a3 FOREIGN KEY (plan_id) REFERENCES flightplans(id);


--
-- Name: fk_km7rd8sgwa1qls24gkxoh2b2i; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_km7rd8sgwa1qls24gkxoh2b2i FOREIGN KEY (plan_id) REFERENCES flightplans(id);


--
-- Name: fk_o7g61i4bgr3mnxyukfi78dsb2; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY user_checkpoints_info
    ADD CONSTRAINT fk_o7g61i4bgr3mnxyukfi78dsb2 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_ppgeqpgh9b3dyqdofg4h00bm8; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY cell_checkpoints
    ADD CONSTRAINT fk_ppgeqpgh9b3dyqdofg4h00bm8 FOREIGN KEY (cell_id) REFERENCES cells(id);


--
-- Name: fk_q37jte7r1ptl16arimkk23y1h; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY users
    ADD CONSTRAINT fk_q37jte7r1ptl16arimkk23y1h FOREIGN KEY (major_id) REFERENCES departments(id);


--
-- Name: fk_s9garnqrhi1ayd9ls9txkx20p; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY user_checkpoints_info
    ADD CONSTRAINT fk_s9garnqrhi1ayd9ls9txkx20p FOREIGN KEY (checkpoint_info_id) REFERENCES checkpoint_info(id);


--
-- Name: fk_teos0btacmvhp1xyob6dx4m16; Type: FK CONSTRAINT; Schema: public; Owner: gefp
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

