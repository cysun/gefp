--
-- PostgreSQL database dump
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
    parent_id bigint,
    deleted boolean DEFAULT false
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
-- Name: checkpoint_info_comments; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE checkpoint_info_comments (
    checkpoint_info_id bigint NOT NULL,
    comment_id bigint NOT NULL
);


ALTER TABLE public.checkpoint_info_comments OWNER TO gefp;

--
-- Name: checkpoints; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE checkpoints (
    id bigint NOT NULL,
    name text NOT NULL,
    parent_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.checkpoints OWNER TO gefp;

--
-- Name: comments; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE comments (
    id bigint NOT NULL,
    comment text,
    commentedby_id bigint,
    datetime timestamp without time zone,
    visibletostudent boolean DEFAULT true,
    deleted boolean DEFAULT false
);


ALTER TABLE public.comments OWNER TO gefp;

--
-- Name: departments; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying(255),
    plan_id bigint,
    active boolean NOT NULL,
    deleted boolean DEFAULT false
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
    term_name character varying(255),
    term_year character varying(4),
    parent_id bigint,
    deleted boolean DEFAULT false
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
    parent_id bigint,
    deleted boolean DEFAULT false
);


ALTER TABLE public.runways OWNER TO gefp;

--
-- Name: stages; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE stages (
    id bigint NOT NULL,
    name character varying(255),
    parent_id bigint,
    deleted boolean DEFAULT false
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
-- Name: user_comments; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE user_comments (
    user_id bigint NOT NULL,
    comment_id bigint NOT NULL
);


ALTER TABLE public.user_comments OWNER TO gefp;

--
-- Name: user_plan_history; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE user_plan_history (
    user_id bigint NOT NULL,
    plan_id bigint NOT NULL
);


ALTER TABLE public.user_plan_history OWNER TO gefp;

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
    deleted boolean DEFAULT false,
    newaccount boolean DEFAULT false
);


ALTER TABLE public.users OWNER TO gefp;

--
-- Data for Name: cell_checkpoints; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (78, 79, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (81, 80, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (81, 82, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 102, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 100, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 103, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 104, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 105, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 106, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (99, 107, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 129, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 130, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 131, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 132, 5);
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
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 133, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 134, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 135, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 136, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 137, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (125, 5154, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 167, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 168, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 169, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 170, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 171, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (165, 5156, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 77, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 75, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 76, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5311, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5312, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5313, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5314, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5315, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5316, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5317, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5318, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5319, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5320, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5321, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5310, 5322, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5323, 5324, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5323, 5325, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5323, 5326, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5323, 5327, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5323, 5328, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5323, 5329, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (172, 5155, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 95, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 84, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 85, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 86, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 87, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 5152, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 88, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 89, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 90, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 91, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 92, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 93, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 94, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 96, 13);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 97, 14);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 98, 15);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (83, 5153, 16);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (138, 5157, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 5158, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (179, 5160, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5163, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5164, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5165, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5166, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5167, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5168, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5169, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5170, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5171, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5172, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5173, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5162, 5174, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5175, 5176, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5175, 5177, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5175, 5178, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5175, 5179, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5175, 5180, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5175, 5181, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5183, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5184, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5185, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5186, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5187, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5188, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5189, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5190, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5182, 5191, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5192, 5193, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5192, 5194, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5192, 5195, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5192, 5196, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5192, 5197, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5192, 5198, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5192, 5199, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5200, 5201, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5200, 5202, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5200, 5203, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5200, 5204, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5200, 5205, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5200, 5206, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5207, 5208, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5207, 5209, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5207, 5210, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5207, 5211, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5207, 5212, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5207, 5213, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5215, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5216, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5217, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5218, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5219, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5220, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5221, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5222, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5214, 5223, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5225, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5226, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5227, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5228, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5229, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5230, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5231, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5232, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5233, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5224, 5234, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5236, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5237, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5238, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5239, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5240, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5241, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5242, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5243, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5244, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5245, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5246, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5235, 5247, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5248, 5249, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5250, 5251, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5252, 5253, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5255, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5256, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5257, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5258, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5259, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5260, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5261, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5262, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5263, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5254, 5264, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5265, 5266, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5265, 5267, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5265, 5268, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5265, 5269, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5265, 5270, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5265, 5271, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5265, 5272, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5274, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5275, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5276, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5277, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5278, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5279, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5280, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5281, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5282, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5283, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5284, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5285, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5286, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5287, 13);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5288, 14);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5289, 15);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5273, 5290, 16);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5291, 5292, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5291, 5293, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5294, 5295, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5296, 5297, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5296, 5298, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5296, 5299, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5331, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5332, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5333, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5334, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5335, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5336, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5337, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5338, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5330, 5339, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5340, 5341, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5340, 5342, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5340, 5343, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5340, 5344, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5340, 5345, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5340, 5346, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5340, 5347, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5348, 5349, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5348, 5350, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5348, 5351, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5348, 5352, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5348, 5353, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5348, 5354, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5355, 5356, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5355, 5357, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5355, 5358, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5355, 5359, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5355, 5360, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5355, 5361, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5363, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5364, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5365, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5366, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5367, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5368, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5369, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5370, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5362, 5371, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5373, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5374, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5375, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5376, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5377, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5378, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5379, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5380, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5381, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5372, 5382, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5384, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5385, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5386, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5387, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5388, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5389, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5390, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5391, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5392, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5393, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5394, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5383, 5395, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5396, 5397, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5398, 5399, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5400, 5401, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5403, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5404, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5405, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5406, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5407, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5408, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5409, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5410, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5411, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5402, 5412, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5413, 5414, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5413, 5415, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5413, 5416, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5413, 5417, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5413, 5418, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5413, 5419, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5413, 5420, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5422, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5423, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5424, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5425, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5426, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5427, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5428, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5429, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5430, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5431, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5432, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5433, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5434, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5435, 13);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5436, 14);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5437, 15);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5421, 5438, 16);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5439, 5440, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5439, 5441, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5442, 5443, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5444, 5445, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5444, 5446, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5444, 5447, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5459, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5460, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5461, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5462, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5463, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5464, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5465, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5466, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5467, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5468, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5469, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5458, 5470, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5471, 5472, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5471, 5473, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5471, 5474, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5471, 5475, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5471, 5476, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5471, 5477, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5479, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5480, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5481, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5482, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5483, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5484, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5485, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5486, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5478, 5487, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5488, 5489, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5488, 5490, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5488, 5491, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5488, 5492, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5488, 5493, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5488, 5494, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5488, 5495, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5496, 5497, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5496, 5498, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5496, 5499, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5496, 5500, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5496, 5501, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5496, 5502, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5503, 5504, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5503, 5505, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5503, 5506, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5503, 5507, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5503, 5508, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5503, 5509, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5511, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5512, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5513, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5514, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5515, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5516, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5517, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5518, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5510, 5519, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5521, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5522, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5523, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5524, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5525, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5526, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5527, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5528, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5529, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5520, 5530, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5531, 5532, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5531, 5533, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5531, 5534, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5544, 5545, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5546, 5547, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5548, 5549, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5551, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5552, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5553, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5554, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5555, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5556, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5557, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5531, 5537, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5558, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5559, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5550, 5560, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5561, 5562, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5561, 5563, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5561, 5564, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5561, 5565, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5561, 5566, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5561, 5567, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5561, 5568, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5587, 5588, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5587, 5589, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5590, 5591, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5592, 5593, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5592, 5594, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5592, 5595, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5570, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5586, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5605, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5606, 3);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5576, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5578, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5579, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5580, 7);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5581, 8);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5582, 9);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5583, 10);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5584, 11);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5569, 5585, 12);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5531, 5539, 4);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5531, 5540, 5);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5531, 5541, 6);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (5531, 5542, 7);


--
-- Data for Name: cells; Type: TABLE DATA; Schema: public; Owner: gefp
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
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5162, 5161, 5301, 5306, 194, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5175, 5161, 5302, 5307, 187, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5182, 5161, 5301, 5307, 179, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5192, 5161, 5300, 5307, 172, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5200, 5161, 5300, 5306, 165, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5207, 5161, 5302, 5306, 158, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5214, 5161, 5302, 5305, 148, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5224, 5161, 5301, 5305, 138, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5235, 5161, 5300, 5305, 125, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5248, 5161, 5302, 5308, 123, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5250, 5161, 5301, 5308, 121, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5252, 5161, 5300, 5308, 119, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5254, 5161, 5302, 5304, 108, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5265, 5161, 5301, 5304, 99, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5273, 5161, 5300, 5304, 83, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5291, 5161, 5301, 5303, 81, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5294, 5161, 5302, 5303, 78, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5296, 5161, 5300, 5303, 74, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5310, 5309, 5449, 5454, 194, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5323, 5309, 5450, 5455, 187, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5330, 5309, 5449, 5455, 179, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5340, 5309, 5448, 5455, 172, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5348, 5309, 5448, 5454, 165, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5355, 5309, 5450, 5454, 158, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5362, 5309, 5450, 5453, 148, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5372, 5309, 5449, 5453, 138, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5383, 5309, 5448, 5453, 125, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5396, 5309, 5450, 5456, 123, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5398, 5309, 5449, 5456, 121, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5400, 5309, 5448, 5456, 119, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5402, 5309, 5450, 5452, 108, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5413, 5309, 5449, 5452, 99, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5421, 5309, 5448, 5452, 83, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5439, 5309, 5449, 5451, 81, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5442, 5309, 5450, 5451, 78, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5444, 5309, 5448, 5451, 74, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5458, 5457, 5597, 5602, 194, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5471, 5457, 5598, 5603, 187, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5478, 5457, 5597, 5603, 179, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5488, 5457, 5596, 5603, 172, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5496, 5457, 5596, 5602, 165, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5503, 5457, 5598, 5602, 158, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5510, 5457, 5598, 5601, 148, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5520, 5457, 5597, 5601, 138, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5531, 5457, 5596, 5601, 125, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5544, 5457, 5598, 5604, 123, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5546, 5457, 5597, 5604, 121, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5548, 5457, 5596, 5604, 119, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5550, 5457, 5598, 5600, 108, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5561, 5457, 5597, 5600, 99, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5569, 5457, 5596, 5600, 83, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5587, 5457, 5597, 5599, 81, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5590, 5457, 5598, 5599, 78, false);
INSERT INTO cells (id, flightplan_id, runway_id, stage_id, parent_id, deleted) VALUES (5592, 5457, 5596, 5599, 74, false);


--
-- Data for Name: checkpoint_info; Type: TABLE DATA; Schema: public; Owner: gefp
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
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5138, '', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5139, '', 82);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5140, '', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5141, '', 82);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5142, '', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5143, '', 82);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5144, '', 77);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5145, '', 75);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5146, '', 76);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5147, '', 80);
INSERT INTO checkpoint_info (id, message, checkpoint_id) VALUES (5151, '', 76);


--
-- Data for Name: checkpoint_info_comments; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO checkpoint_info_comments (checkpoint_info_id, comment_id) VALUES (5113, 5119);


--
-- Data for Name: checkpoints; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (76, '<p>Pre-calculus (before (Yr 1)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (111, '<p>Share with someone in your community about what you are learning in school</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (84, '<p>Math 206 (Calc I)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (85, '<p>Math 207 (Calc II)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (86, '<p>Math 208 (Calc III)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (90, '<p>Go to office hours after 1st assignment in every class</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (91, '<p>Keep track of your grades / progress in each course</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (95, '<p>ECST New Student Registration</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (96, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (97, '<p>Group Advising</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (104, '<p>Identify at least one type of career in your field of interest</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (105, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (79, '<p>Make a list of questions to ask during orientation and ask them</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (113, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (114, '<p>Student Faculty Breakfast</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (115, '<p>Leadership Convocation</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (116, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (117, '<p>MEP Welcome Back BBQ</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (118, '<p>ECST Week &ndash; participate</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (120, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (122, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (124, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (133, '<p>Lower division GE requirements</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (134, '<p>Get tutoring on courses you need help with</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (135, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (136, '<p><!--[if !supportLists]-->Group Advising</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (75, '<p>Algebra (before Yr 1)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (140, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (142, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (143, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (144, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (145, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (146, '<p>ECST Career Fair</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (141, '<p>Investigate sites and apply for <a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006"><em>Research Experience for Undergraduates (REU) programs</em></a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (98, '<p>Personal academic <a target="_blank" href="http://www.calstatela.edu/ecst/success/appointment-plus">advisement</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (80, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (109, '<p>Find out about <a href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">ECST student organizations</a> at ECST week</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (112, '<p>Participate in time management workshop (<a href="http://www.calstatela.edu/tutorialcenter">Tutorial Center</a>)</p><p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (88, '<p><a target="_blank" href="http://www.calstatela.edu/ecst/engr1500">ENGR 1500</a>:&nbsp;ENGR 150 Sec. 03 + ENGR 154 Sec. 30 OR 31</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (92, '<p>Get <a target="_blank" href="http://www.calstatela.edu/tutorialcenter">tutoring</a> for any course with grade &lt; B</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (149, '<p>Participate in ECST <a href="http://web.calstatela.edu/orgs/etsc/">student council</a> activities</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (87, '<p>Phys 211 (Mechanics)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (89, '<p>CS 242</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (130, '<p>Attend Math SI or AEW</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (94, '<p>Attend Physics SI or AEW (I.e. ENGR 154 workshops)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (131, '<p>Attend Physics SI or AEW</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (126, '<p>Math 2130 (Vector Calculus)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (82, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (129, '<p>Physics 2200</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (127, '<p>Math 2150 (Diff Eq)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (132, '<p>2000-level EE courses.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (128, '<p>Physics 2200</p>', NULL, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (147, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (106, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (107, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (139, '
<p>Visit <a href="http://www.calstatela.edu/univ/cdc">Career Center </a>and find out what services they offer</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (150, '<p>Take a <a href="http://web.calstatela.edu/centers/sl/">service learning</a> course&nbsp;or otherwise participate in a community service project</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (110, '<p>Join at least one <a href="http://www.calstatelausu.org/studentorglist">student organization</a> and actively participate</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (137, '<p>Personal academic <a href="http://www.calstatela.edu/ecst/success/advising">advisement</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (151, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (152, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (153, '<p>Student Faculty Breakfast</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (154, '<p>Leadership Convocation</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (155, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (156, '<p>MEP Welcome Back BBQ</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (157, '<p>ECST Week &ndash; help run one of the events</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (160, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (161, '<p>Leadership Convocation</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (162, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (163, '<p>MEP Welcome Back BBQ</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (164, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (168, '<p>Choose upper division specialization</p>', NULL, false);
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
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (180, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources</a></li></ul>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5185, '<p>Social media workshop (Career Development Center)</p>', 182, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5186, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', 183, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (77, '<p>Attend <a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">STEP</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (169, '<p>Get <a href="http://www.calstatela.edu/tutorialcenter">tutoring</a> on courses you need help with</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (167, '<p>3000-level EE courses</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (166, '<p>Complete 200-level engineering courses</p>', NULL, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (205, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5187, '<p>Participate in interviewing workshops</p>', 184, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (206, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (171, '<p>Personal academic <a href="http://www.calstatela.edu/ecst/success/advising">advisement</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (176, '<p><a href="http://www.calstatela.edu/ecst/ppp">Senior design</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5188, '<p>Apply for jobs and/or &nbsp;graduate school</p>', 185, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5189, '<p>ECST Career Fair</p>', 186, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5190, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 5158, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5191, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 5160, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5193, '<p>Upper division&nbsp; specialization</p>', 173, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5194, '<p>Upper division technical electives</p>', 174, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5195, '<p>Upper division GE requirements</p>', 175, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5196, '<p><a href="http://www.calstatela.edu/ecst/ppp">Senior design</a></p>', 176, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5197, '<p>Any outstanding requirements</p>', 177, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5198, '<p>Get tutoring on courses you need help with</p>', 178, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5199, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&poid=3499&hl=upper+division+general+education&returnto=search">GE Upper Division </a> requirements</p>', 5155, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5201, '<p>3000-level EE courses</p>', 167, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5202, '<p>Choose upper division specialization</p>', 168, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5203, '<p>Get <a href="http://www.calstatela.edu/tutorialcenter">tutoring</a> on courses you need help with</p>', 169, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5204, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 170, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5205, '<p>Personal academic <a href="http://www.calstatela.edu/ecst/success/advising">advisement</a></p>', 171, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5206, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&amp;poid=3500">GE Block C and D </a> requirements</p>', 5156, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5363, '<p>Participate in ECST <a href="http://web.calstatela.edu/orgs/etsc/">student council</a> activities</p>', 149, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5364, '<p>Take a <a href="http://web.calstatela.edu/centers/sl/">service learning</a> course&nbsp;or otherwise participate in a community service project</p>', 150, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5509, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', 164, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (102, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources Link</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">Clubs and Organisations Link</a></li></ol>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5152, '<p>Phys 212 (Waves, Optics, Thermodynamics)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (93, '<p>Attend <a href="http://www.calstatela.edu/ecst/fyre/si">Supplemental Instruction (S.I.)</a> or Math Academic Excellence Workshops (AEW) (i.e. ENGR 154 workshops)</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5153, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&poid=3500">GE Block A </a> requirements</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5154, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&amp;poid=3500">GE Block B</a> requirements</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5155, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&poid=3499&hl=upper+division+general+education&returnto=search">GE Upper Division </a> requirements</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5156, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&amp;poid=3500">GE Block C and D </a> requirements</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (201, '<p>Investigate sites and apply for <a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006"><em>Research Experience for Undergraduates (REU) programs</em></a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5157, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5158, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (100, '<p>Take online assessment test.</p>

<script type="text/javascript">
    function goToNewPage()
    {
        var url = document.getElementById(''list'').value;
        if(url != ''none'') {
            window.location = url;
        }
    }
</script>

<p>
<select name="list" id="list" accesskey="target">
    <option value=''none'' selected>Select a test</option>
<option value="http://www.keirsey.com/">Keirsey</option>
<option value="http://www.rileyguide.com/assess.html">Riley</option>
<select>
<input type=button value="Go" onclick="goToNewPage()" />
</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5159, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', NULL, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5160, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5266, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources Link</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">Clubs and Organisations Link</a></li></ol>', 102, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5267, '<p>Take online assessment test.</p>

<script type="text/javascript">
    function goToNewPage()
    {
        var url = document.getElementById(''list'').value;
        if(url != ''none'') {
            window.location = url;
        }
    }
</script>

<p>
<select name="list" id="list" accesskey="target">
    <option value=''none'' selected>Select a test</option>
<option value="http://www.keirsey.com/">Keirsey</option>
<option value="http://www.rileyguide.com/assess.html">Riley</option>
<select>
<input type=button value="Go" onclick="goToNewPage()" />
</p>', 100, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5268, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to  pursue a career in</p>

<script type="text/javascript">
    function goToNewPage()
    {
        var url = document.getElementById(''list'').value;
        if(url != ''none'') {
            window.location = url;
        }
    }
</script>

<p>
<select name="list" id="list" accesskey="target">
    <option value=''none'' selected>Select a discipline</option>
<option value="http://www.calstatela.edu/ecst/ce">Civil Engineering</option>
<option value="http://www.calstatela.edu/ecst/cs">Computer Science</option>
<option value="http://www.calstatela.edu/ecst/ece">Electrical Engineering</option>
<option value="http://www.calstatela.edu/ecst/me">Mechanical Engineering</option>
<option value="http://www.calstatela.edu/ecst/tech">Technology</option>
<select>
<input type=button value="Go" onclick="goToNewPage()" />
</p>', 103, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5269, '<p>Identify at least one type of career in your field of interest</p>', 104, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5270, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 105, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5271, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 106, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5272, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 107, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5274, '<p>ECST New Student Registration</p>', 95, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5275, '<p>Math 206 (Calc I)</p>', 84, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5276, '<p>Math 207 (Calc II)</p>', 85, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5277, '<p>Math 208 (Calc III)</p>', 86, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5278, '<p>Phys 211 (Mechanics)</p>', 87, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5279, '<p>Phys 212 (Waves, Optics, Thermodynamics)</p>', 5152, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5280, '<p><a target="_blank" href="http://www.calstatela.edu/ecst/engr1500">ENGR 1500</a>:&nbsp;ENGR 150 Sec. 03 + ENGR 154 Sec. 30 OR 31</p>', 88, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5281, '<p>CS 242</p>', 89, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5282, '<p>Go to office hours after 1st assignment in every class</p>', 90, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5283, '<p>Keep track of your grades / progress in each course</p>', 91, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5284, '<p>Get <a target="_blank" href="http://www.calstatela.edu/tutorialcenter">tutoring</a> for any course with grade &lt; B</p>', 92, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5285, '<p>Attend <a href="http://www.calstatela.edu/ecst/fyre/si">Supplemental Instruction (S.I.)</a> or Math Academic Excellence Workshops (AEW) (i.e. ENGR 154 workshops)</p>', 93, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5286, '<p>Attend Physics SI or AEW (I.e. ENGR 154 workshops)</p>', 94, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5287, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', 96, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5288, '<p>Group Advising</p>', 97, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5289, '<p>Personal academic <a target="_blank" href="http://www.calstatela.edu/ecst/success/appointment-plus">advisement</a></p>', 98, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5290, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&poid=3500">GE Block A </a> requirements</p>', 5153, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5292, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 80, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5293, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 82, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5295, '<p>Make a list of questions to ask during orientation and ask them</p>', 79, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5297, '<p>Attend <a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">STEP</a></p>', 77, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5298, '<p>Algebra (before Yr 1)</p>', 75, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5299, '<p>Pre-calculus (before (Yr 1)</p>', 76, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5365, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', 151, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5366, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 152, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5367, '<p>Student Faculty Breakfast</p>', 153, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5368, '<p>Leadership Convocation</p>', 154, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5369, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 155, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5370, '<p>MEP Welcome Back BBQ</p>', 156, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5371, '<p>ECST Week &ndash; help run one of the events</p>', 157, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5373, '
<p>Visit <a href="http://www.calstatela.edu/univ/cdc">Career Center </a>and find out what services they offer</p>', 139, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5374, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', 140, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5375, '<p>Investigate sites and apply for <a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006"><em>Research Experience for Undergraduates (REU) programs</em></a></p>', 141, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5376, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 142, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5377, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', 143, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5378, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', 144, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5379, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 145, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5380, '<p>ECST Career Fair</p>', 146, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5381, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 147, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5382, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 5157, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5384, '<p>Math 2130 (Vector Calculus)</p>', 126, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5385, '<p>Math 2150 (Diff Eq)</p>', 127, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5386, '<p>Physics 2200</p>', 129, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5387, '<p>Attend Math SI or AEW</p>', 130, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5388, '<p>Attend Physics SI or AEW</p>', 131, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5389, '<p>2000-level EE courses.</p>', 132, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5390, '<p>Lower division GE requirements</p>', 133, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5391, '<p>Get tutoring on courses you need help with</p>', 134, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5392, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 135, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5393, '<p><!--[if !supportLists]-->Group Advising</p>', 136, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5394, '<p>Personal academic <a href="http://www.calstatela.edu/ecst/success/advising">advisement</a></p>', 137, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5395, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&amp;poid=3500">GE Block B</a> requirements</p>', 5154, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5397, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 124, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5399, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 122, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5401, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 120, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5403, '<p>Find out about <a href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">ECST student organizations</a> at ECST week</p>', 109, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5404, '<p>Join at least one <a href="http://www.calstatelausu.org/studentorglist">student organization</a> and actively participate</p>', 110, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5405, '<p>Share with someone in your community about what you are learning in school</p>', 111, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5406, '<p>Participate in time management workshop (<a href="http://www.calstatela.edu/tutorialcenter">Tutorial Center</a>)</p><p>', 112, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5407, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 113, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5408, '<p>Student Faculty Breakfast</p>', 114, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5409, '<p>Leadership Convocation</p>', 115, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5410, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 116, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5411, '<p>MEP Welcome Back BBQ</p>', 117, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5412, '<p>ECST Week &ndash; participate</p>', 118, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5414, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources Link</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">Clubs and Organisations Link</a></li></ol>', 102, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5415, '<p>Take online assessment test.</p>

<script type="text/javascript">
    function goToNewPage()
    {
        var url = document.getElementById(''list'').value;
        if(url != ''none'') {
            window.location = url;
        }
    }
</script>

<p>
<select name="list" id="list" accesskey="target">
    <option value=''none'' selected>Select a test</option>
<option value="http://www.keirsey.com/">Keirsey</option>
<option value="http://www.rileyguide.com/assess.html">Riley</option>
<select>
<input type=button value="Go" onclick="goToNewPage()" />
</p>', 100, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5511, '<p>Participate in ECST <a href="http://web.calstatela.edu/orgs/etsc/">student council</a> activities</p>', 149, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5312, '<p>Preparing for the career fair workshop (Career Development Center)</p>', 196, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5313, '<p>Create/update your resume with help from career center</p>', 197, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5314, '<p>Mock interview workshop (Career Development Center)</p>', 198, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5315, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', 199, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5316, '<p>Apply for summer internships</p>', 200, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5317, '<p>Investigate sites and apply for <a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006"><em>Research Experience for Undergraduates (REU) programs</em></a></p>', 201, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5318, '<p>Internship in following summer</p>', 202, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5319, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 203, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5320, '<p>ECST Career Fair</p>', 204, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5321, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 205, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5322, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 206, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5324, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>
', 188, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5325, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', 189, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5326, '<p>Leadership Convocation</p>', 190, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5327, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 191, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5328, '<p>MEP Welcome Back BBQ</p>', 192, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5329, '<p>ECST Week &ndash; Outreach</p>', 193, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5331, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources</a></li></ul>', 180, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5332, '<p>Attend career fairs to submit your resume</p>', 181, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5333, '<p>Social media workshop (Career Development Center)</p>', 182, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5334, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', 183, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5335, '<p>Participate in interviewing workshops</p>', 184, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5336, '<p>Apply for jobs and/or &nbsp;graduate school</p>', 185, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5337, '<p>ECST Career Fair</p>', 186, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5338, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 5158, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5339, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 5160, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5341, '<p>Upper division&nbsp; specialization</p>', 173, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5342, '<p>Upper division technical electives</p>', 174, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5343, '<p>Upper division GE requirements</p>', 175, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5344, '<p><a href="http://www.calstatela.edu/ecst/ppp">Senior design</a></p>', 176, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5345, '<p>Any outstanding requirements</p>', 177, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5346, '<p>Get tutoring on courses you need help with</p>', 178, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5347, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&poid=3499&hl=upper+division+general+education&returnto=search">GE Upper Division </a> requirements</p>', 5155, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5349, '<p>3000-level EE courses</p>', 167, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5350, '<p>Choose upper division specialization</p>', 168, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5351, '<p>Get <a href="http://www.calstatela.edu/tutorialcenter">tutoring</a> on courses you need help with</p>', 169, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5352, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 170, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5353, '<p>Personal academic <a href="http://www.calstatela.edu/ecst/success/advising">advisement</a></p>', 171, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5354, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&amp;poid=3500">GE Block C and D </a> requirements</p>', 5156, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5356, '<head>
  <meta charset="utf-8">
  <title>jQuery UI Accordion - Collapse content</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  });
  </script>
</head>
<body>
 
<div id="accordion">
<h3> Assume 1-3 leadership roles:</h3>
  <div>
    <ul>
<p><input type="checkbox" class="case" name="case" value="1"/>Become a student organization / team leader</p>
<p><input type="checkbox" class="case" name="case" value="2"/>Mentor a freshman</p>
<p><input type="checkbox" class="case" name="case" value="3"/>Lead a community service project</p>
<p><input type="checkbox" class="case" name="case" value="4"/>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</p>
<p><input type="checkbox" class="case" name="case" value="5"/>Serve as a peer-facilitator for AEW&nbsp;</p>
<p><input type="checkbox" class="case" name="case" value="6"/>Serve as a tutor at the Tutorial Center</p>
<p><input type="checkbox" class="case" name="case" value="7"/>Become a peer advisor</p>
<p><input type="checkbox" class="case" name="case" value="8"/>Become a campus tour guide</p>
<p><input type="checkbox" class="case" name="case" value="9"/>Join the ECST council</p>
<p><input type="checkbox" class="case" name="case" value="10"/>Join ASI, or other student body</p>
<p><input type="checkbox" class="case" name="case" value="11"/>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</p></ul>
  </div>
</div>


<!--<p>Assume 1-3 leadership roles:</p><div id="accordion"><div><p>Become a student organization / team leader</p><p>Mentor a freshman</p><p>Lead a community service project</p><p>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</p><p>Serve as a peer-facilitator for SI or AEW&nbsp;</p><p>Serve as a tutor at the Tutorial Center</p><p>Become a peer advisor</p><p>Become a campus tour guide</p><p>Join the ECST council</p><p>Join ASI, or other student body</p><p>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</p><ul></ul></div></div>
-->
<!--
<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>
--><p>&nbsp;</p>', 159, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5357, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 160, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5358, '<p>Leadership Convocation</p>', 161, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5359, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 162, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5360, '<p>MEP Welcome Back BBQ</p>', 163, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5361, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', 164, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5485, '<p>ECST Career Fair</p>', 186, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5486, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 5158, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5163, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 195, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5164, '<p>Preparing for the career fair workshop (Career Development Center)</p>', 196, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5165, '<p>Create/update your resume with help from career center</p>', 197, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5166, '<p>Mock interview workshop (Career Development Center)</p>', 198, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5167, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', 199, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5168, '<p>Apply for summer internships</p>', 200, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5169, '<p>Investigate sites and apply for <a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006"><em>Research Experience for Undergraduates (REU) programs</em></a></p>', 201, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5170, '<p>Internship in following summer</p>', 202, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5171, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 203, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5172, '<p>ECST Career Fair</p>', 204, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5173, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 205, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5174, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 206, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5176, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>
', 188, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5177, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', 189, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5178, '<p>Leadership Convocation</p>', 190, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5179, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 191, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5180, '<p>MEP Welcome Back BBQ</p>', 192, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5181, '<p>ECST Week &ndash; Outreach</p>', 193, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5183, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources</a></li></ul>', 180, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5184, '<p>Attend career fairs to submit your resume</p>', 181, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5487, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 5160, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5489, '<p>Upper division&nbsp; specialization</p>', 173, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5490, '<p>Upper division technical electives</p>', 174, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5491, '<p>Upper division GE requirements</p>', 175, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5492, '<p><a href="http://www.calstatela.edu/ecst/ppp">Senior design</a></p>', 176, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5493, '<p>Any outstanding requirements</p>', 177, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5494, '<p>Get tutoring on courses you need help with</p>', 178, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5495, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&poid=3499&hl=upper+division+general+education&returnto=search">GE Upper Division </a> requirements</p>', 5155, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5497, '<p>3000-level EE courses</p>', 167, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5498, '<p>Choose upper division specialization</p>', 168, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5499, '<p>Get <a href="http://www.calstatela.edu/tutorialcenter">tutoring</a> on courses you need help with</p>', 169, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5500, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 170, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5501, '<p>Personal academic <a href="http://www.calstatela.edu/ecst/success/advising">advisement</a></p>', 171, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5502, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&amp;poid=3500">GE Block C and D </a> requirements</p>', 5156, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5504, '<head>
  <meta charset="utf-8">
  <title>jQuery UI Accordion - Collapse content</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  });
  </script>
</head>
<body>
 
<div id="accordion">
<h3> Assume 1-3 leadership roles:</h3>
  <div>
    <ul>
<p><input type="checkbox" class="case" name="case" value="1"/>Become a student organization / team leader</p>
<p><input type="checkbox" class="case" name="case" value="2"/>Mentor a freshman</p>
<p><input type="checkbox" class="case" name="case" value="3"/>Lead a community service project</p>
<p><input type="checkbox" class="case" name="case" value="4"/>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</p>
<p><input type="checkbox" class="case" name="case" value="5"/>Serve as a peer-facilitator for AEW&nbsp;</p>
<p><input type="checkbox" class="case" name="case" value="6"/>Serve as a tutor at the Tutorial Center</p>
<p><input type="checkbox" class="case" name="case" value="7"/>Become a peer advisor</p>
<p><input type="checkbox" class="case" name="case" value="8"/>Become a campus tour guide</p>
<p><input type="checkbox" class="case" name="case" value="9"/>Join the ECST council</p>
<p><input type="checkbox" class="case" name="case" value="10"/>Join ASI, or other student body</p>
<p><input type="checkbox" class="case" name="case" value="11"/>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</p></ul>
  </div>
</div>


<!--<p>Assume 1-3 leadership roles:</p><div id="accordion"><div><p>Become a student organization / team leader</p><p>Mentor a freshman</p><p>Lead a community service project</p><p>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</p><p>Serve as a peer-facilitator for SI or AEW&nbsp;</p><p>Serve as a tutor at the Tutorial Center</p><p>Become a peer advisor</p><p>Become a campus tour guide</p><p>Join the ECST council</p><p>Join ASI, or other student body</p><p>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</p><ul></ul></div></div>
-->
<!--
<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>
--><p>&nbsp;</p>', 159, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5505, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 160, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5506, '<p>Leadership Convocation</p>', 161, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5507, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 162, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5508, '<p>MEP Welcome Back BBQ</p>', 163, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5208, '<head>
  <meta charset="utf-8">
  <title>jQuery UI Accordion - Collapse content</title>
  <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
  <script src="//code.jquery.com/jquery-1.10.2.js"></script>
  <script src="//code.jquery.com/ui/1.11.4/jquery-ui.js"></script>
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script>
  $(function() {
    $( "#accordion" ).accordion({
      collapsible: true
    });
  });
  </script>
</head>
<body>
 
<div id="accordion">
<h3> Assume 1-3 leadership roles:</h3>
  <div>
    <ul>
<p><input type="checkbox" class="case" name="case" value="1"/>Become a student organization / team leader</p>
<p><input type="checkbox" class="case" name="case" value="2"/>Mentor a freshman</p>
<p><input type="checkbox" class="case" name="case" value="3"/>Lead a community service project</p>
<p><input type="checkbox" class="case" name="case" value="4"/>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</p>
<p><input type="checkbox" class="case" name="case" value="5"/>Serve as a peer-facilitator for AEW&nbsp;</p>
<p><input type="checkbox" class="case" name="case" value="6"/>Serve as a tutor at the Tutorial Center</p>
<p><input type="checkbox" class="case" name="case" value="7"/>Become a peer advisor</p>
<p><input type="checkbox" class="case" name="case" value="8"/>Become a campus tour guide</p>
<p><input type="checkbox" class="case" name="case" value="9"/>Join the ECST council</p>
<p><input type="checkbox" class="case" name="case" value="10"/>Join ASI, or other student body</p>
<p><input type="checkbox" class="case" name="case" value="11"/>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</p></ul>
  </div>
</div>


<!--<p>Assume 1-3 leadership roles:</p><div id="accordion"><div><p>Become a student organization / team leader</p><p>Mentor a freshman</p><p>Lead a community service project</p><p>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</p><p>Serve as a peer-facilitator for SI or AEW&nbsp;</p><p>Serve as a tutor at the Tutorial Center</p><p>Become a peer advisor</p><p>Become a campus tour guide</p><p>Join the ECST council</p><p>Join ASI, or other student body</p><p>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</p><ul></ul></div></div>
-->
<!--
<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>
--><p>&nbsp;</p>', 159, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5209, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 160, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5210, '<p>Leadership Convocation</p>', 161, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5211, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 162, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5212, '<p>MEP Welcome Back BBQ</p>', 163, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5213, '<p>ECST Week<strong> &ndash; </strong>help organize one of the events</p>', 164, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5215, '<p>Participate in ECST <a href="http://web.calstatela.edu/orgs/etsc/">student council</a> activities</p>', 149, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5216, '<p>Take a <a href="http://web.calstatela.edu/centers/sl/">service learning</a> course&nbsp;or otherwise participate in a community service project</p>', 150, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5217, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', 151, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5218, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 152, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5219, '<p>Student Faculty Breakfast</p>', 153, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5220, '<p>Leadership Convocation</p>', 154, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5221, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 155, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5222, '<p>MEP Welcome Back BBQ</p>', 156, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5223, '<p>ECST Week &ndash; help run one of the events</p>', 157, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5225, '
<p>Visit <a href="http://www.calstatela.edu/univ/cdc">Career Center </a>and find out what services they offer</p>', 139, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5226, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', 140, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5227, '<p>Investigate sites and apply for <a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006"><em>Research Experience for Undergraduates (REU) programs</em></a></p>', 141, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5228, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 142, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5229, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', 143, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5230, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', 144, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5231, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 145, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5232, '<p>ECST Career Fair</p>', 146, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5233, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 147, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5234, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 5157, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5236, '<p>Math 2130 (Vector Calculus)</p>', 126, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5237, '<p>Math 2150 (Diff Eq)</p>', 127, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5238, '<p>Physics 2200</p>', 129, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5239, '<p>Attend Math SI or AEW</p>', 130, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5240, '<p>Attend Physics SI or AEW</p>', 131, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5241, '<p>2000-level EE courses.</p>', 132, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5242, '<p>Lower division GE requirements</p>', 133, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5243, '<p>Get tutoring on courses you need help with</p>', 134, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5244, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 135, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5245, '<p><!--[if !supportLists]-->Group Advising</p>', 136, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5246, '<p>Personal academic <a href="http://www.calstatela.edu/ecst/success/advising">advisement</a></p>', 137, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5247, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&amp;poid=3500">GE Block B</a> requirements</p>', 5154, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5249, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 124, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5251, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 122, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5253, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 120, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5255, '<p>Find out about <a href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">ECST student organizations</a> at ECST week</p>', 109, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5256, '<p>Join at least one <a href="http://www.calstatelausu.org/studentorglist">student organization</a> and actively participate</p>', 110, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5257, '<p>Share with someone in your community about what you are learning in school</p>', 111, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5258, '<p>Participate in time management workshop (<a href="http://www.calstatela.edu/tutorialcenter">Tutorial Center</a>)</p><p>', 112, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5259, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 113, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5260, '<p>Student Faculty Breakfast</p>', 114, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5261, '<p>Leadership Convocation</p>', 115, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5262, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 116, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5263, '<p>MEP Welcome Back BBQ</p>', 117, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5264, '<p>ECST Week &ndash; participate</p>', 118, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5311, '<p>Re-assess how well Engineering matches your interests, goals, and natural talents</p>', 195, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5416, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to  pursue a career in</p>

<script type="text/javascript">
    function goToNewPage()
    {
        var url = document.getElementById(''list'').value;
        if(url != ''none'') {
            window.location = url;
        }
    }
</script>

<p>
<select name="list" id="list" accesskey="target">
    <option value=''none'' selected>Select a discipline</option>
<option value="http://www.calstatela.edu/ecst/ce">Civil Engineering</option>
<option value="http://www.calstatela.edu/ecst/cs">Computer Science</option>
<option value="http://www.calstatela.edu/ecst/ece">Electrical Engineering</option>
<option value="http://www.calstatela.edu/ecst/me">Mechanical Engineering</option>
<option value="http://www.calstatela.edu/ecst/tech">Technology</option>
<select>
<input type=button value="Go" onclick="goToNewPage()" />
</p>', 103, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5417, '<p>Identify at least one type of career in your field of interest</p>', 104, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5418, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 105, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5419, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 106, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5420, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 107, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5422, '<p>ECST New Student Registration</p>', 95, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5423, '<p>Math 206 (Calc I)</p>', 84, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5424, '<p>Math 207 (Calc II)</p>', 85, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5425, '<p>Math 208 (Calc III)</p>', 86, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5426, '<p>Phys 211 (Mechanics)</p>', 87, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5427, '<p>Phys 212 (Waves, Optics, Thermodynamics)</p>', 5152, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5428, '<p><a target="_blank" href="http://www.calstatela.edu/ecst/engr1500">ENGR 1500</a>:&nbsp;ENGR 150 Sec. 03 + ENGR 154 Sec. 30 OR 31</p>', 88, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5429, '<p>CS 242</p>', 89, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5430, '<p>Go to office hours after 1st assignment in every class</p>', 90, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5431, '<p>Keep track of your grades / progress in each course</p>', 91, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5432, '<p>Get <a target="_blank" href="http://www.calstatela.edu/tutorialcenter">tutoring</a> for any course with grade &lt; B</p>', 92, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5433, '<p>Attend <a href="http://www.calstatela.edu/ecst/fyre/si">Supplemental Instruction (S.I.)</a> or Math Academic Excellence Workshops (AEW) (i.e. ENGR 154 workshops)</p>', 93, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5434, '<p>Attend Physics SI or AEW (I.e. ENGR 154 workshops)</p>', 94, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5435, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', 96, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5436, '<p>Group Advising</p>', 97, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5437, '<p>Personal academic <a target="_blank" href="http://www.calstatela.edu/ecst/success/appointment-plus">advisement</a></p>', 98, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5438, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&poid=3500">GE Block A </a> requirements</p>', 5153, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5440, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 80, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5441, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 82, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5443, '<p>Make a list of questions to ask during orientation and ask them</p>', 79, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5445, '<p>Attend <a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">STEP</a></p>', 77, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5446, '<p>Algebra (before Yr 1)</p>', 75, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5447, '<p>Pre-calculus (before (Yr 1)</p>', 76, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5460, '<p>Preparing for the career fair workshop (Career Development Center)</p>', 196, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5461, '<p>Create/update your resume with help from career center</p>', 197, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5462, '<p>Mock interview workshop (Career Development Center)</p>', 198, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5463, '<p>Volunteer in a research lab (and sign up for an EE 499) or for a design team</p>', 199, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5464, '<p>Apply for summer internships</p>', 200, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5465, '<p>Investigate sites and apply for <a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006"><em>Research Experience for Undergraduates (REU) programs</em></a></p>', 201, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5466, '<p>Internship in following summer</p>', 202, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5467, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 203, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5468, '<p>ECST Career Fair</p>', 204, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5469, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 205, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5470, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 206, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5472, '<p>Assume one or more leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul><p>&nbsp;</p>
', 188, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5473, '<p>In whatever capacity you are serving, be sure to pass the baton on to a more junior undergrad&nbsp;</p>', 189, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5474, '<p>Leadership Convocation</p>', 190, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5475, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 191, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5476, '<p>MEP Welcome Back BBQ</p>', 192, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5477, '<p>ECST Week &ndash; Outreach</p>', 193, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5479, '<p>Update your resume</p><ul><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources</a></li></ul>', 180, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5480, '<p>Attend career fairs to submit your resume</p>', 181, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5481, '<p>Social media workshop (Career Development Center)</p>', 182, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5482, '<p>Create Linked-In profile (or similar online professional networking tool)</p>', 183, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5483, '<p>Participate in interviewing workshops</p>', 184, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5484, '<p>Apply for jobs and/or &nbsp;graduate school</p>', 185, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5512, '<p>Take a <a href="http://web.calstatela.edu/centers/sl/">service learning</a> course&nbsp;or otherwise participate in a community service project</p>', 150, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5513, '<p>Participate in a campus conversation or local campaign revolving around social and political issues affecting you and your community</p>', 151, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5514, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 152, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5515, '<p>Student Faculty Breakfast</p>', 153, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5516, '<p>Leadership Convocation</p>', 154, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5517, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 155, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5518, '<p>MEP Welcome Back BBQ</p>', 156, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5519, '<p>ECST Week &ndash; help run one of the events</p>', 157, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5521, '
<p>Visit <a href="http://www.calstatela.edu/univ/cdc">Career Center </a>and find out what services they offer</p>', 139, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5522, '<p>Find out what you need to get a summer internship after your 3rd year.</p>', 140, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5523, '<p>Investigate sites and apply for <a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006"><em>Research Experience for Undergraduates (REU) programs</em></a></p>', 141, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5525, '<p>Review the careers you identified in Engr 150 as possible suitable paths for you.&nbsp; Modify if necessary, and determine what skills, knowledge, and experience would be necessary for such a career</p>', 143, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5526, '<p>See faculty advisor for guidance on choosing an UD specialization</p>', 144, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5527, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 145, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5528, '<p>ECST Career Fair</p>', 146, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5529, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 147, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5530, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 5157, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5539, '<p>Get tutoring on courses you need help with</p>', 134, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5540, '<p>Pathways to Success Workshop Series &ndash; <em>Study Skills</em></p>', 135, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5541, '<p><!--[if !supportLists]-->Group Advising</p>', 136, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5542, '<p>Personal academic <a href="http://www.calstatela.edu/ecst/success/advising">advisement</a></p>', 137, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5545, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 124, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5547, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 122, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5549, '<p>Emergence as a highly competent, globally aware, community-engaged technical professional, prepared to solve problems and make the world a better place.</p>', 120, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5551, '<p>Find out about <a href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">ECST student organizations</a> at ECST week</p>', 109, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5552, '<p>Join at least one <a href="http://www.calstatelausu.org/studentorglist">student organization</a> and actively participate</p>', 110, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5553, '<p>Share with someone in your community about what you are learning in school</p>', 111, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5554, '<p>Participate in time management workshop (<a href="http://www.calstatela.edu/tutorialcenter">Tutorial Center</a>)</p><p>', 112, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5555, '<p>Pathways to Success Workshop Series &ndash; <em>Leadership Development</em></p>', 113, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5556, '<p>Student Faculty Breakfast</p>', 114, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5557, '<p>Leadership Convocation</p>', 115, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5558, '<p>Volunteer at one or more outreach events:</p><ul><li>ECST Open House/Boeing Day</li><li>MESA Days</li><li>Science Bowl</li></ul>', 116, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5559, '<p>MEP Welcome Back BBQ</p>', 117, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5560, '<p>ECST Week &ndash; participate</p>', 118, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5562, '<p>Reflect on what career you think you would find most fulfilling</p><ol><li><a target="_blank" href="http://www.calstatela.edu/univ/cdc/onlineresources.php">Online Resources Link</a></li><li><a target="_blank" href="http://www.calstatela.edu/ecst/success/clubs-and-organizations">Clubs and Organisations Link</a></li></ol>', 102, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5563, '<p>Take online assessment test.</p>

<script type="text/javascript">
    function goToNewPage()
    {
        var url = document.getElementById(''list'').value;
        if(url != ''none'') {
            window.location = url;
        }
    }
</script>

<p>
<select name="list" id="list" accesskey="target">
    <option value=''none'' selected>Select a test</option>
<option value="http://www.keirsey.com/">Keirsey</option>
<option value="http://www.rileyguide.com/assess.html">Riley</option>
<select>
<input type=button value="Go" onclick="goToNewPage()" />
</p>', 100, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5564, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to  pursue a career in</p>

<script type="text/javascript">
    function goToNewPage()
    {
        var url = document.getElementById(''list'').value;
        if(url != ''none'') {
            window.location = url;
        }
    }
</script>

<p>
<select name="list" id="list" accesskey="target">
    <option value=''none'' selected>Select a discipline</option>
<option value="http://www.calstatela.edu/ecst/ce">Civil Engineering</option>
<option value="http://www.calstatela.edu/ecst/cs">Computer Science</option>
<option value="http://www.calstatela.edu/ecst/ece">Electrical Engineering</option>
<option value="http://www.calstatela.edu/ecst/me">Mechanical Engineering</option>
<option value="http://www.calstatela.edu/ecst/tech">Technology</option>
<select>
<input type=button value="Go" onclick="goToNewPage()" />
</p>', 103, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5565, '<p>Identify at least one type of career in your field of interest</p>', 104, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5532, '<p>GE Humanities</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5533, '<p>GE Social Sciences</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5534, '<p>GE Lifelong Learning and Self-Development</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5536, '<p>Attend Physics SI or AEW</p>', 131, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5535, '<p>Attend Math SI or AEW</p>', 130, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5538, '<p>Lower division GE requirements</p>', 133, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5543, '<p><a href="http://ecatalog.calstatela.edu/preview_program.php?catoid=11&amp;poid=3500">GE Block B</a> requirements</p>', 5154, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5537, '<p>2000-level Graphic Communications courses.</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5566, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', 105, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5567, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 106, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5568, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 107, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5570, '<p>ECST New Student Registration</p>', 95, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5576, '<p><a target="_blank" href="http://www.calstatela.edu/ecst/engr1500">ENGR 1500</a>:&nbsp;ENGR 150 Sec. 03 + ENGR 154 Sec. 30 OR 31</p>', 88, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5578, '<p>Go to office hours after 1st assignment in every class</p>', 90, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5579, '<p>Keep track of your grades / progress in each course</p>', 91, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5580, '<p>Get <a target="_blank" href="http://www.calstatela.edu/tutorialcenter">tutoring</a> for any course with grade &lt; B</p>', 92, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5581, '<p>Attend <a href="http://www.calstatela.edu/ecst/fyre/si">Supplemental Instruction (S.I.)</a> or Math Academic Excellence Workshops (AEW) (i.e. ENGR 154 workshops)</p>', 93, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5582, '<p>Attend Physics SI or AEW (I.e. ENGR 154 workshops)</p>', 94, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5583, '<p>Pathways to Success Workshop Series &ndash;<em>Study Skills</em></p>', 96, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5584, '<p>Group Advising</p>', 97, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5585, '<p>Personal academic <a target="_blank" href="http://www.calstatela.edu/ecst/success/appointment-plus">advisement</a></p>', 98, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5588, '<p>Apply for <a href="http://www.calstatela.edu/financialaid"> Financial Aid</a></p>', 80, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5589, '<p>Apply for <a href="http://www.calstatela.edu/financialaid/scholarships">Scholarships</a></p>', 82, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5591, '<p>Make a list of questions to ask during orientation and ask them</p>', 79, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5593, '<p>Attend <a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">STEP</a></p>', 77, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5594, '<p>Algebra (before Yr 1)</p>', 75, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5595, '<p>Pre-calculus (before (Yr 1)</p>', 76, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (159, '<div class="accordion"><p>Assume one or more leadership roles:</p><div><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for SI or AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)<p>&nbsp;</p><ul></ul></li></ul></div></div><!--<p>Assume 1-3 leadership roles:</p><div id="accordion"><div><p>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for SI or AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement) 
</ul></div></div>

<div id="accordion"><p>Assume 1-3 leadership roles:</p><div><p></div></div>
--><!--
<p>Assume 1-3 leadership roles:</p><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Lead a community service project</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for AEW&nbsp;</li><li>Serve as a tutor at the Tutorial Center</li><li>Become a peer advisor</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Join ASI, or other student body</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li></ul>
--><p>&nbsp;</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5586, '<p>GE Golden Four</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5571, '<p>Math 206 (Calc I)</p>', 84, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5572, '<p>Math 207 (Calc II)</p>', 85, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5573, '<p>Math 208 (Calc III)</p>', 86, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5574, '<p>Phys 211 (Mechanics)</p>', 87, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5575, '<p>Phys 212 (Waves, Optics, Thermodynamics)</p>', 5152, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5577, '<p>CS 242</p>', 89, true);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5605, '<p>GE Am. Institutions</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5606, '<p>GE Natural Sciences</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5524, '<p>Re-assess how well Graphic Communications matches your interests, goals, and natural talents</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (5459, '<p>Re-assess how well Graphic Communications matches your interests, goals, and natural talents</p>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (188, '<div class="accordion"><p>Assume one or more leadership roles:</p><div><ul><li>Become a student organization / team leader</li><li>Mentor a freshman</li><li>Serve as a peer-mentor in STEP, BOOST, and/or SUCCEEd</li><li>Serve as a peer-facilitator for SI or AEW</li><li>Become a peer-advisor</li><li>Serve as a tutor at the Tutorial Center</li><li>Train others to become an officer in a student org</li><li>Serve as a student representative on a University Committee (e.g., Academic Appeals Board, Honor Convocation and Commencement)</li><li>Become a campus tour guide</li><li>Join the ECST council</li><li>Lead service learning project</li><li>Lead your senior design team</li></ul></div></div>', NULL, false);
INSERT INTO checkpoints (id, name, parent_id, deleted) VALUES (103, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p>

<script type="text/javascript">
    function goToNewPage()
    {
        var url = document.getElementById(''listMajor'').value;
        if(url != ''none'') {
            window.location = url;
        }
    }
</script>

<p>
<!--<form name="form1">-->
<select name="list" id="listMajor" accesskey="target">
    <option value=''none'' selected>Select a discipline</option>
<option value="http://www.calstatela.edu/ecst/ce">Civil Engineering</option>
<option value="http://www.calstatela.edu/ecst/cs">Computer Science</option>
<option value="http://www.calstatela.edu/ecst/ece">Electrical Engineering</option>
<option value="http://www.calstatela.edu/ecst/me">Mechanical Engineering</option>
<option value="http://www.calstatela.edu/ecst/tech">Technology</option>
<select>
<input type=button value="Go" onclick="goToNewPage()" />
</p>
', NULL, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO comments (id, comment, commentedby_id, datetime, visibletostudent, deleted) VALUES (5078, '<p><strong>Lorem Ipsum</strong>&nbsp;is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry&#39;s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 1, '2015-09-23 12:14:21.475', true, false);
INSERT INTO comments (id, comment, commentedby_id, datetime, visibletostudent, deleted) VALUES (5119, '<p>Student has completed the 200 level clases.</p>', 2, '2015-09-23 12:29:29.133', true, false);
INSERT INTO comments (id, comment, commentedby_id, datetime, visibletostudent, deleted) VALUES (5120, '<p>Student is doing well with Academic Performace.</p>', 2, '2015-09-23 12:30:47.407', true, false);


--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (2, 'Technology - Graphics Communications', NULL, true, false);
INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (1, 'Electrical Engineering', 64, true, false);
INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (5149, 'Mechanical Engineering', NULL, false, false);
INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (5150, 'Civil Engineering', NULL, false, false);


--
-- Data for Name: flightplan_runways; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 65, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 66, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 67, 2);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5161, 5300, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5161, 5301, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5161, 5302, 2);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5309, 5448, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5309, 5449, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5309, 5450, 2);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5457, 5596, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5457, 5597, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (5457, 5598, 2);


--
-- Data for Name: flightplan_stages; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 68, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 69, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 70, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 71, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 72, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 73, 5);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5161, 5303, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5161, 5304, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5161, 5305, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5161, 5306, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5161, 5307, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5161, 5308, 5);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5309, 5451, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5309, 5452, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5309, 5453, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5309, 5454, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5309, 5455, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5309, 5456, 5);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5457, 5599, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5457, 5600, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5457, 5601, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5457, 5602, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5457, 5603, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (5457, 5604, 5);


--
-- Data for Name: flightplans; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplans (id, name, department_id, published, term_name, term_year, parent_id, deleted) VALUES (64, 'MyGoldenEagle Flight Plan 2.0 - EE', 1, true, 'Fall', '2015', NULL, false);
INSERT INTO flightplans (id, name, department_id, published, term_name, term_year, parent_id, deleted) VALUES (5161, 'Copy Of MyGoldenEagle Flight Plan 2.0 - CE', 5150, true, 'Fall', '2015', 64, false);
INSERT INTO flightplans (id, name, department_id, published, term_name, term_year, parent_id, deleted) VALUES (5309, 'Copy Of MyGoldenEagle Flight Plan 2.0 - ME', 5149, true, 'Fall', '2015', 64, false);
INSERT INTO flightplans (id, name, department_id, published, term_name, term_year, parent_id, deleted) VALUES (5457, 'MyGoldenEagle Flight Plan 2.0 - Graphic Communications (TECH)', 2, true, 'Fall', '2015', 64, false);


--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: gefp
--

SELECT pg_catalog.setval('hibernate_sequence', 5608, true);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO roles (id, name) VALUES (1, 'ADMIN');
INSERT INTO roles (id, name) VALUES (2, 'ADVISOR');
INSERT INTO roles (id, name) VALUES (3, 'STUDENT');


--
-- Data for Name: runways; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO runways (id, name, parent_id, deleted) VALUES (65, 'Academic Performance', NULL, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (66, 'Career Preparation', NULL, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (67, 'Leadership & Community Engagement', NULL, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5300, 'Academic Performance', 65, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5301, 'Career Preparation', 66, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5302, 'Leadership & Community Engagement', 67, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5448, 'Academic Performance', 65, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5449, 'Career Preparation', 66, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5450, 'Leadership & Community Engagement', 67, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5596, 'Academic Performance', 65, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5597, 'Career Preparation', 66, false);
INSERT INTO runways (id, name, parent_id, deleted) VALUES (5598, 'Leadership & Community Engagement', 67, false);


--
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO stages (id, name, parent_id, deleted) VALUES (68, 'Pre-college (pre-flight checklist)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (69, 'Freshman (take-off)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (70, 'Sophomore (climbing altitude)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (71, 'Junior (cruising altitude)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (72, 'Senior (descent)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (73, 'Graduation  (Landing)', NULL, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5303, 'Pre-college (pre-flight checklist)', 68, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5304, 'Freshman (take-off)', 69, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5305, 'Sophomore (climbing altitude)', 70, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5306, 'Junior (cruising altitude)', 71, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5307, 'Senior (descent)', 72, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5308, 'Graduation  (Landing)', 73, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5451, 'Pre-college (pre-flight checklist)', 68, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5452, 'Freshman (take-off)', 69, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5453, 'Sophomore (climbing altitude)', 70, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5454, 'Junior (cruising altitude)', 71, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5455, 'Senior (descent)', 72, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5456, 'Graduation  (Landing)', 73, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5599, 'Pre-college (pre-flight checklist)', 68, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5600, 'Freshman (take-off)', 69, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5601, 'Sophomore (climbing altitude)', 70, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5602, 'Junior (cruising altitude)', 71, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5603, 'Senior (descent)', 72, false);
INSERT INTO stages (id, name, parent_id, deleted) VALUES (5604, 'Graduation  (Landing)', 73, false);


--
-- Data for Name: user_checkpoints_info; Type: TABLE DATA; Schema: public; Owner: gefp
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
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5138);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5054, 5139);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5062, 5140);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5062, 5141);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5142);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5021, 5143);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 5144);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 5145);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (3, 5146);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (5016, 5147);
INSERT INTO user_checkpoints_info (user_id, checkpoint_info_id) VALUES (4, 5151);


--
-- Data for Name: user_comments; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO user_comments (user_id, comment_id) VALUES (5054, 5078);
INSERT INTO user_comments (user_id, comment_id) VALUES (5021, 5120);


--
-- Data for Name: user_plan_history; Type: TABLE DATA; Schema: public; Owner: gefp
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
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5148, 64);
INSERT INTO user_plan_history (user_id, plan_id) VALUES (5607, 64);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: gefp
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
INSERT INTO user_roles (user_id, role_id) VALUES (5148, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (5607, 2);
INSERT INTO user_roles (user_id, role_id) VALUES (5608, 2);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gefp
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
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5001, '304367237', 'gefp', '', ' gefp@calstatela.edu', ' Harsh', 'Deepak', 'Gadhia', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5021, '304355784', 'rsaggu', '', ' rsaggu@calstatela.edu', 'Ravinder  Singh Satpal Singh', '', 'Saggu', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5054, '303222555', 'Kraghev', '', ' kraghev@calstatela.edu', ' Krishna Venugopal', '', 'Raghvan', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5063, '303555222', 'ngala', '', ' ngala@calstatela.edu', ' Nishant', '', 'Gala', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5062, '304399841', 'clnu', '', ' clnu@calstatela.edu', ' Chaitra Bhoomesh', '', 'Bhoomesh ', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5075, '123456', 'ashetty2', '', ' ashetty2@calstatela.edu', ' Akshay', '', 'Shetty', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5105, '304351494', 'knaphad', '', ' knaphad@calstatela.edu', 'Kuntal', '', 'Naphade', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5148, '304376623', 'ngosran', '', ' ngosran@calstatela.edu', ' Niket', 'Minesh', 'Gosrani', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5607, '3046765154', 'schacha2', '', ' schacha2@calstatela.edu', ' Saloni', '', 'Chacha', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5608, NULL, 'eallen3', '', ' eallen3@calstatela.edu', ' Emily', '', NULL, NULL, NULL, NULL, true, false, true);


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
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


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
-- Name: uk_2umxy8nc75gwo3e226t49xwud; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY checkpoint_info_comments
    ADD CONSTRAINT uk_2umxy8nc75gwo3e226t49xwud UNIQUE (comment_id);


--
-- Name: uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


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
-- Name: fk_1wf9r8tt6uplitq11live2dk3; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT fk_1wf9r8tt6uplitq11live2dk3 FOREIGN KEY (commentedby_id) REFERENCES users(id);


--
-- Name: fk_2umxy8nc75gwo3e226t49xwud; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY checkpoint_info_comments
    ADD CONSTRAINT fk_2umxy8nc75gwo3e226t49xwud FOREIGN KEY (comment_id) REFERENCES comments(id);


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
-- Name: fk_616coai34fffxvxpd3jld8lr5; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY user_comments
    ADD CONSTRAINT fk_616coai34fffxvxpd3jld8lr5 FOREIGN KEY (user_id) REFERENCES users(id);


--
-- Name: fk_6cqnnuwwyb86k8u38lli3cj87; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY user_plan_history
    ADD CONSTRAINT fk_6cqnnuwwyb86k8u38lli3cj87 FOREIGN KEY (plan_id) REFERENCES flightplans(id);


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
-- Name: fk_ee923ho25tpwwk7uiqpqi9j5e; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY checkpoint_info_comments
    ADD CONSTRAINT fk_ee923ho25tpwwk7uiqpqi9j5e FOREIGN KEY (checkpoint_info_id) REFERENCES checkpoint_info(id);


--
-- Name: fk_fw07m5a94adnwosnrub52aeh1; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY user_plan_history
    ADD CONSTRAINT fk_fw07m5a94adnwosnrub52aeh1 FOREIGN KEY (user_id) REFERENCES users(id);


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
-- Name: fk_kebocneql90di3fku9sfskicl; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY user_comments
    ADD CONSTRAINT fk_kebocneql90di3fku9sfskicl FOREIGN KEY (comment_id) REFERENCES comments(id);


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
-- PostgreSQL database dump complete
--

