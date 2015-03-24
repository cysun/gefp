
    create table checkpoints (
        id int4 not null,
        active boolean not null,
        deleted boolean not null,
        name varchar(255) not null,
        order_num int4 Default 1 not null,
        chk_type varchar(255) not null,
        plan_id int4,
        runway_id int4,
        stage_id int4,
        primary key (id)
    );

    create table department_flightplan (
        dept_id int4 not null,
        oldplan_id int4 not null
    );

    create table departments (
        dept_id int4 not null,
        active boolean not null,
        deleted boolean not null,
        dept_name varchar(255),
        plan_id int4,
        primary key (dept_id)
    );

    create table flightplan (
        id int4 not null,
        active boolean not null,
        deleted boolean not null,
        plan_name varchar(255),
        published boolean not null,
        primary key (id)
    );

    create table flightplan_checkpoints (
        flightplan_id int4 not null,
        checkpoint_id int4 not null,
        order_num int4 not null,
        primary key (flightplan_id, order_num)
    );

    create table flightplan_runways (
        flightplan_id int4 not null,
        runway_id int4 not null,
        order_num int4 not null,
        primary key (flightplan_id, order_num)
    );

    create table flightplan_stages (
        flightplan_id int4 not null,
        stage_id int4 not null,
        order_num int4 not null,
        primary key (flightplan_id, order_num)
    );

    create table roles (
        id int4 not null,
        role_name varchar(255),
        primary key (id)
    );

    create table runways (
        runway_id int4 not null,
        active boolean not null,
        deleted boolean not null,
        runway_name varchar(255),
        order_num int4 Default 1 not null,
        primary key (runway_id)
    );

    create table stages (
        stage_id int4 not null,
        active boolean not null,
        deleted boolean not null,
        stage_name varchar(255),
        order_num int4 Default 1 not null,
        primary key (stage_id)
    );

    create table user_checkpoints (
        user_id int4 not null,
        checkpoint_id int4 not null
    );

    create table user_roles (
        user_id int4 not null,
        role_id int4 not null,
        primary key (user_id, role_id)
    );

    create table users (
        user_id int4 not null,
        cin varchar(255),
        deleted boolean not null,
        email varchar(255),
        enabled boolean not null,
        first_name varchar(255),
        last_name varchar(255),
        middle_name varchar(255),
        password varchar(255),
        username varchar(255),
        dept_id int4,
        plan_id int4,
        primary key (user_id)
    );

    alter table department_flightplan 
        add constraint UK_48ptmn96v9d1sa5n1ypanbtpb unique (oldplan_id);

    alter table flightplan_checkpoints 
        add constraint UK_hig0n3hwkang0hmea9l7bbp39 unique (checkpoint_id);

    alter table flightplan_runways 
        add constraint UK_50kuq1dpt3aqxcs4fbq3g6rub unique (runway_id);

    alter table flightplan_stages 
        add constraint UK_hns371mipbxro6xxw1v3yeosi unique (stage_id);

    alter table user_roles 
        add constraint UK_5q4rc4fh1on6567qk69uesvyf unique (role_id);

    alter table users 
        add constraint UK_r43af9ap4edm43mmtq01oddj6 unique (username);

    alter table checkpoints 
        add constraint FK_fvhyj260cj6sk9e7kch3u35hn 
        foreign key (plan_id) 
        references flightplan;

    alter table checkpoints 
        add constraint FK_tm5aivoudq5tppp39yniu1yhq 
        foreign key (runway_id) 
        references runways;

    alter table checkpoints 
        add constraint FK_84dli9r4pm107guh9gqf8om48 
        foreign key (stage_id) 
        references stages;

    alter table department_flightplan 
        add constraint FK_48ptmn96v9d1sa5n1ypanbtpb 
        foreign key (oldplan_id) 
        references flightplan;

    alter table department_flightplan 
        add constraint FK_jowu08wcma4uuhf7ohd06u2l4 
        foreign key (dept_id) 
        references departments;

    alter table departments 
        add constraint FK_teos0btacmvhp1xyob6dx4m16 
        foreign key (plan_id) 
        references flightplan;

    alter table flightplan_checkpoints 
        add constraint FK_hig0n3hwkang0hmea9l7bbp39 
        foreign key (checkpoint_id) 
        references checkpoints;

    alter table flightplan_checkpoints 
        add constraint FK_g2hbto2pn1odiice7onagfifs 
        foreign key (flightplan_id) 
        references flightplan;

    alter table flightplan_runways 
        add constraint FK_50kuq1dpt3aqxcs4fbq3g6rub 
        foreign key (runway_id) 
        references runways;

    alter table flightplan_runways 
        add constraint FK_3gx84bsex3s6euk16si98b4bn 
        foreign key (flightplan_id) 
        references flightplan;

    alter table flightplan_stages 
        add constraint FK_hns371mipbxro6xxw1v3yeosi 
        foreign key (stage_id) 
        references stages;

    alter table flightplan_stages 
        add constraint FK_8a20talpum1ntge7ig51igoms 
        foreign key (flightplan_id) 
        references flightplan;

    alter table user_checkpoints 
        add constraint FK_to4y5oilg0c79s52l5dh3u9tk 
        foreign key (checkpoint_id) 
        references checkpoints;

    alter table user_checkpoints 
        add constraint FK_t1q6bdp8kteiy9pt35cy7pug5 
        foreign key (user_id) 
        references users;

    alter table user_roles 
        add constraint FK_5q4rc4fh1on6567qk69uesvyf 
        foreign key (role_id) 
        references roles;

    alter table user_roles 
        add constraint FK_g1uebn6mqk9qiaw45vnacmyo2 
        foreign key (user_id) 
        references users;

    alter table users 
        add constraint FK_qapsr64600sbyhd05spxcakau 
        foreign key (dept_id) 
        references departments;

    alter table users 
        add constraint FK_km7rd8sgwa1qls24gkxoh2b2i 
        foreign key (plan_id) 
        references flightplan;

    create sequence hibernate_sequence;
