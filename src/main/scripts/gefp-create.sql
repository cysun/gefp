--
-- PostgreSQL database dump
--

--
-- Name: cell_checkpoints; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE cell_checkpoints (
    cell_id bigint NOT NULL,
    checkpoint_id bigint NOT NULL,
    order_num integer NOT NULL,
    PRIMARY KEY (cell_id, order_num)
);

--
-- Name: cells; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE cells (
    id bigint NOT NULL,
    flightplan_id bigint,
    runway_id bigint,
    stage_id bigint,
    parent_id bigint,
    deleted boolean default false,
    PRIMARY KEY (id)
);

--
-- Name: checkpoint_info; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE checkpoint_info (
    id bigint NOT NULL,
    message character varying(255),
    checkpoint_id bigint,
    PRIMARY KEY (id)
);

--
-- Name: checkpoint_info_comments; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE checkpoint_info_comments (
    checkpoint_info_id bigint NOT NULL,
    comment_id bigint NOT NULL
);

--
-- Name: checkpoints; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE checkpoints (
    id bigint NOT NULL,
    name text NOT NULL,
    parent_id bigint,
    deleted boolean default false,
    PRIMARY KEY (id)
);

--
-- Name: comments; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE comments (
    id bigint NOT NULL,
    comment text,
    commentedBy_id bigint,
    datetime timestamp,
    visibleToStudent boolean DEFAULT TRUE,
    deleted boolean DEFAULT FALSE,
    PRIMARY KEY (id)
);


--
-- Name: department_plans; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

--CREATE TABLE department_plans (
--    department_id integer NOT NULL,
--    plan_id bigint NOT NULL
--);

--
-- Name: departments; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE departments (
    id integer NOT NULL,
    name character varying(255),
    plan_id bigint,
    active boolean NOT NULL,
    deleted boolean DEFAULT FALSE,
    PRIMARY KEY (id)
);

--
-- Name: flightplan_runways; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE flightplan_runways (
    flightplan_id bigint NOT NULL,
    runway_id bigint NOT NULL,
    order_num integer NOT NULL,
    PRIMARY KEY (flightplan_id, order_num)
);

--
-- Name: flightplan_stages; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE flightplan_stages (
    flightplan_id bigint NOT NULL,
    stage_id bigint NOT NULL,
    order_num integer NOT NULL,
    PRIMARY KEY (flightplan_id, order_num)
);

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
    deleted boolean DEFAULT FALSE,
    PRIMARY KEY (id)
);

--
-- Name: hibernate_sequence; Type: SEQUENCE; Schema: public; Owner: gefp
--

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

--
-- Name: roles; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE roles (
    id integer NOT NULL,
    name character varying(255),
    PRIMARY KEY (id)
);

--
-- Name: runways; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE runways (
    id bigint NOT NULL,
    name character varying(255),
    parent_id bigint,
    deleted boolean DEFAULT FALSE,
    PRIMARY KEY (id)
);

--
-- Name: stages; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE stages (
    id bigint NOT NULL,
    name character varying(255),
    parent_id bigint,
    deleted boolean DEFAULT FALSE,
    PRIMARY KEY (id)
);

--
-- Name: user_checkpoints_info; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE user_checkpoints_info (
    user_id bigint NOT NULL,
    checkpoint_info_id bigint NOT NULL
);


--
-- Name: user_plan_history; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE user_plan_history (
    user_id bigint NOT NULL,
    plan_id bigint NOT NULL
);

--
-- Name: user_roles; Type: TABLE; Schema: public; Owner: gefp; Tablespace: 
--

CREATE TABLE user_roles (
    user_id bigint NOT NULL,
    role_id integer NOT NULL,
    PRIMARY KEY (user_id, role_id)
);

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
    deleted boolean DEFAULT FALSE,
    newaccount boolean DEFAULT FALSE,
    PRIMARY KEY (id)
);


CREATE TABLE user_comments (
    user_id bigint not null,
    comment_id bigint not null
);


--
-- Name: uk_1bq0aejed37fc3yhyfoca8qqu; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

--ALTER TABLE ONLY cell_checkpoints
--    ADD CONSTRAINT uk_1bq0aejed37fc3yhyfoca8qqu UNIQUE (checkpoint_id);

--
-- Name: uk_50kuq1dpt3aqxcs4fbq3g6rub; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

--ALTER TABLE ONLY flightplan_runways
--    ADD CONSTRAINT uk_50kuq1dpt3aqxcs4fbq3g6rub UNIQUE (runway_id);

--
-- Name: uk_hns371mipbxro6xxw1v3yeosi; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

--ALTER TABLE ONLY flightplan_stages
--    ADD CONSTRAINT uk_hns371mipbxro6xxw1v3yeosi UNIQUE (stage_id);

--
-- Name: uk_huvk9td7lxurmvpn2a3bji8a3; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

--ALTER TABLE ONLY department_plans
--    ADD CONSTRAINT uk_huvk9td7lxurmvpn2a3bji8a3 UNIQUE (plan_id);

--
-- Name: uk_r43af9ap4edm43mmtq01oddj6; Type: CONSTRAINT; Schema: public; Owner: gefp; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT uk_r43af9ap4edm43mmtq01oddj6 UNIQUE (username);


--
-- Name: fk_1bq0aejed37fc3yhyfoca8qqu; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

ALTER TABLE ONLY cell_checkpoints
    ADD CONSTRAINT fk_1bq0aejed37fc3yhyfoca8qqu FOREIGN KEY (checkpoint_id) REFERENCES checkpoints(id);

--
-- Name: fk_1ua4dr9e77minpmjjwcbhgsk6; Type: FK CONSTRAINT; Schema: public; Owner: gefp
--

--ALTER TABLE ONLY department_plans
--    ADD CONSTRAINT fk_1ua4dr9e77minpmjjwcbhgsk6 FOREIGN KEY (department_id) REFERENCES departments(id);

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

--ALTER TABLE ONLY department_plans
--    ADD CONSTRAINT fk_huvk9td7lxurmvpn2a3bji8a3 FOREIGN KEY (plan_id) REFERENCES flightplans(id);

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

    
alter table checkpoint_info_comments 
    add constraint UK_2umxy8nc75gwo3e226t49xwud unique (comment_id);    

alter table checkpoint_info_comments 
    add constraint FK_2umxy8nc75gwo3e226t49xwud 
    foreign key (comment_id) 
    references comments;

alter table checkpoint_info_comments 
    add constraint FK_ee923ho25tpwwk7uiqpqi9j5e 
    foreign key (checkpoint_info_id) 
    references checkpoint_info;    

alter table comments 
    add constraint FK_1wf9r8tt6uplitq11live2dk3 
    foreign key (commentedBy_id) 
    references users;    

    
alter table user_plan_history 
    add constraint FK_6cqnnuwwyb86k8u38lli3cj87 
    foreign key (plan_id) 
    references flightplans;

alter table user_plan_history 
    add constraint FK_fw07m5a94adnwosnrub52aeh1 
    foreign key (user_id) 
    references users;
    
alter table user_comments 
    add constraint FK_kebocneql90di3fku9sfskicl 
    foreign key (comment_id) 
    references comments;

alter table user_comments 
    add constraint FK_616coai34fffxvxpd3jld8lr5 
    foreign key (user_id) 
    references users;    
--
-- PostgreSQL database dump complete
--