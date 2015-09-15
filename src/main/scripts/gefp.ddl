
    create table cell_checkpoints (
        cell_id int8 not null,
        checkpoint_id int8 not null,
        order_num int4 not null,
        primary key (cell_id, order_num)
    );

    create table cells (
        id int8 not null,
        deleted boolean not null,
        flightPlan_id int8,
        parent_id int8,
        runway_id int8,
        stage_id int8,
        primary key (id)
    );

    create table checkpoint_info (
        id int8 not null,
        message varchar(255),
        checkpoint_id int8,
        primary key (id)
    );

    create table checkpoint_info_comments (
        checkpoint_info_id int8 not null,
        comment_id int8 not null
    );

    create table checkpoints (
        id int8 not null,
        deleted boolean not null,
        name varchar(255) not null,
        parent_id int8,
        primary key (id)
    );

    create table comments (
        id int8 not null,
        comment varchar(255),
        datetime timestamp,
        deleted boolean not null,
        visibleToStudent boolean not null,
        commentedBy_id int8,
        primary key (id)
    );

    create table department_plans (
        department_id int4 not null,
        plan_id int8 not null
    );

    create table departments (
        id int4 not null,
        active boolean not null,
        deleted boolean not null,
        name varchar(255),
        plan_id int8,
        primary key (id)
    );

    create table flightplan_runways (
        flightplan_id int8 not null,
        runway_id int8 not null,
        order_num int4 not null,
        primary key (flightplan_id, order_num)
    );

    create table flightplan_stages (
        flightplan_id int8 not null,
        stage_id int8 not null,
        order_num int4 not null,
        primary key (flightplan_id, order_num)
    );

    create table flightplans (
        id int8 not null,
        deleted boolean not null,
        name varchar(255),
        published boolean not null,
        term_name varchar(255),
        term_year varchar(255),
        department_id int4,
        parent_id int8,
        primary key (id)
    );

    create table roles (
        id int4 not null,
        name varchar(255),
        primary key (id)
    );

    create table runways (
        id int8 not null,
        deleted boolean not null,
        name varchar(255),
        parent_id int8,
        primary key (id)
    );

    create table stages (
        id int8 not null,
        deleted boolean not null,
        name varchar(255),
        parent_id int8,
        primary key (id)
    );

    create table user_checkpoints_info (
        user_id int8 not null,
        checkpoint_info_id int8 not null,
        primary key (user_id, checkpoint_info_id)
    );

    create table user_comments (
        user_id int8 not null,
        comment_id int8 not null
    );

    create table user_plan_history (
        user_id int8 not null,
        plan_id int8 not null
    );

    create table user_roles (
        user_id int8 not null,
        role_id int4 not null,
        primary key (user_id, role_id)
    );

    create table users (
        id int8 not null,
        cin varchar(255),
        deleted boolean not null,
        email varchar(255),
        enabled boolean not null,
        first_name varchar(255),
        last_name varchar(255),
        middle_name varchar(255),
        newAccount boolean not null,
        password varchar(255),
        username varchar(255),
        department_id int4,
        plan_id int8,
        major_id int4,
        primary key (id)
    );

    alter table cell_checkpoints 
        add constraint UK_1bq0aejed37fc3yhyfoca8qqu unique (checkpoint_id);

    alter table checkpoint_info_comments 
        add constraint UK_2umxy8nc75gwo3e226t49xwud unique (comment_id);

    alter table department_plans 
        add constraint UK_huvk9td7lxurmvpn2a3bji8a3 unique (plan_id);

    alter table flightplan_runways 
        add constraint UK_50kuq1dpt3aqxcs4fbq3g6rub unique (runway_id);

    alter table flightplan_stages 
        add constraint UK_hns371mipbxro6xxw1v3yeosi unique (stage_id);

    alter table users 
        add constraint UK_r43af9ap4edm43mmtq01oddj6 unique (username);

    alter table cell_checkpoints 
        add constraint FK_1bq0aejed37fc3yhyfoca8qqu 
        foreign key (checkpoint_id) 
        references checkpoints;

    alter table cell_checkpoints 
        add constraint FK_ppgeqpgh9b3dyqdofg4h00bm8 
        foreign key (cell_id) 
        references cells;

    alter table cells 
        add constraint FK_3eqlt264c3rc8n84quloojtyk 
        foreign key (flightPlan_id) 
        references flightplans;

    alter table cells 
        add constraint FK_csjjwuuo86su75selrb9w1xha 
        foreign key (parent_id) 
        references cells;

    alter table cells 
        add constraint FK_8dw4ib1a0lhu8xdh7s4s4tha 
        foreign key (runway_id) 
        references runways;

    alter table cells 
        add constraint FK_4l75xv25nciaskmgvbxdcd424 
        foreign key (stage_id) 
        references stages;

    alter table checkpoint_info 
        add constraint FK_9yc90uxhxcs0p3y3mex1ah62b 
        foreign key (checkpoint_id) 
        references checkpoints;

    alter table checkpoint_info_comments 
        add constraint FK_2umxy8nc75gwo3e226t49xwud 
        foreign key (comment_id) 
        references comments;

    alter table checkpoint_info_comments 
        add constraint FK_ee923ho25tpwwk7uiqpqi9j5e 
        foreign key (checkpoint_info_id) 
        references checkpoint_info;

    alter table checkpoints 
        add constraint FK_5260pjsgaihtslxa4kd91t4is 
        foreign key (parent_id) 
        references checkpoints;

    alter table comments 
        add constraint FK_1wf9r8tt6uplitq11live2dk3 
        foreign key (commentedBy_id) 
        references users;

    alter table department_plans 
        add constraint FK_huvk9td7lxurmvpn2a3bji8a3 
        foreign key (plan_id) 
        references flightplans;

    alter table department_plans 
        add constraint FK_1ua4dr9e77minpmjjwcbhgsk6 
        foreign key (department_id) 
        references departments;

    alter table departments 
        add constraint FK_teos0btacmvhp1xyob6dx4m16 
        foreign key (plan_id) 
        references flightplans;

    alter table flightplan_runways 
        add constraint FK_50kuq1dpt3aqxcs4fbq3g6rub 
        foreign key (runway_id) 
        references runways;

    alter table flightplan_runways 
        add constraint FK_3gx84bsex3s6euk16si98b4bn 
        foreign key (flightplan_id) 
        references flightplans;

    alter table flightplan_stages 
        add constraint FK_hns371mipbxro6xxw1v3yeosi 
        foreign key (stage_id) 
        references stages;

    alter table flightplan_stages 
        add constraint FK_8a20talpum1ntge7ig51igoms 
        foreign key (flightplan_id) 
        references flightplans;

    alter table flightplans 
        add constraint FK_29kek3b2jbux5p832kvqo9be6 
        foreign key (department_id) 
        references departments;

    alter table flightplans 
        add constraint FK_5w8nccclg9cofccdvr0wb6kho 
        foreign key (parent_id) 
        references flightplans;

    alter table runways 
        add constraint FK_3ete1n5lk8i8t9xix17u3fqk4 
        foreign key (parent_id) 
        references runways;

    alter table stages 
        add constraint FK_kgqll7bxd4rt6uvcmcxmci127 
        foreign key (parent_id) 
        references stages;

    alter table user_checkpoints_info 
        add constraint FK_s9garnqrhi1ayd9ls9txkx20p 
        foreign key (checkpoint_info_id) 
        references checkpoint_info;

    alter table user_checkpoints_info 
        add constraint FK_o7g61i4bgr3mnxyukfi78dsb2 
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

    alter table user_plan_history 
        add constraint FK_6cqnnuwwyb86k8u38lli3cj87 
        foreign key (plan_id) 
        references flightplans;

    alter table user_plan_history 
        add constraint FK_fw07m5a94adnwosnrub52aeh1 
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
        add constraint FK_7phkg3qghukhuw9kj3ahkmw 
        foreign key (department_id) 
        references departments;

    alter table users 
        add constraint FK_km7rd8sgwa1qls24gkxoh2b2i 
        foreign key (plan_id) 
        references flightplans;

    alter table users 
        add constraint FK_q37jte7r1ptl16arimkk23y1h 
        foreign key (major_id) 
        references departments;

    create sequence hibernate_sequence;
