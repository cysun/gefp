    create table roles (
        id int4 not null,
        name varchar(255),
        primary key (id)
    );

    create table users (
        id int8 not null,
        cin varchar(255),
        username varchar(255),
        password varchar(255),
        email varchar(255),
        first_name varchar(255),
        middle_name varchar(255),
        last_name varchar(255),
        department_id int4,
        plan_id int8,
        major_id int4,
        newAccount boolean default false,
        enabled boolean not null,
        deleted boolean not null,
        primary key (id)
    );    

    create table flightplans (
        id int8 not null,
        name varchar(255),
        quarter_name varchar(255),
        department_id int8,
        published boolean not null,
        primary key (id)
    );    

    create table departments (
        id int4 not null,
        name varchar(255),
        plan_id int8,
        active boolean not null,
        deleted boolean not null,
        primary key (id)
    );

    create table runways (
        id int8 not null,
        name varchar(255),
        primary key (id)
    );

    create table stages (
        id int8 not null,
        name varchar(255),
        primary key (id)
    );    
    
    create table checkpoints (
        id int8 not null,
        name varchar(255) not null,
        primary key (id)
    );

    create table cells (
        id int8 not null,
        flightPlan_id int8,
        runway_id int8,
        stage_id int8,
        primary key (id)
    );    
    
    create table cell_checkpoints (
        cell_id int8 not null,
        checkpoint_id int8 not null,
        order_num int4 not null,
        primary key (cell_id, order_num)
    );
    
    create table department_plans (
        department_id int4 not null,
        plan_id int8 not null
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

    create table flightplans_cells (
        flightplans_id int8 not null,
        cells_id int8 not null
    );

    create table checkpoint_info (
        id int8 not null,
        message varchar(255),
        checkpoint_id int8,
        primary key (id)
    );
    
        create table user_checkpoints_info (
        user_id int8 not null,
        checkpoint_info_id int8 not null,
        primary key (user_id, checkpoint_info_id)
    );

    create table user_roles (
        user_id int8 not null,
        role_id int4 not null,
        primary key (user_id, role_id)
    );

    alter table cell_checkpoints 
        add constraint UK_1bq0aejed37fc3yhyfoca8qqu unique (checkpoint_id);

    alter table department_plans 
        add constraint UK_huvk9td7lxurmvpn2a3bji8a3 unique (plan_id);

    alter table flightplan_runways 
        add constraint UK_50kuq1dpt3aqxcs4fbq3g6rub unique (runway_id);

    alter table flightplan_stages 
        add constraint UK_hns371mipbxro6xxw1v3yeosi unique (stage_id);

    alter table flightplans_cells 
        add constraint UK_aueh9sf2st922gmaww4573yco unique (cells_id);

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
        add constraint FK_8dw4ib1a0lhu8xdh7s4s4tha 
        foreign key (runway_id) 
        references runways;

    alter table cells 
        add constraint FK_4l75xv25nciaskmgvbxdcd424 
        foreign key (stage_id) 
        references stages;

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

    alter table flightplans_cells 
        add constraint FK_aueh9sf2st922gmaww4573yco 
        foreign key (cells_id) 
        references cells;

    alter table flightplans_cells 
        add constraint FK_c30fl82i7uq9iu7qsj64ympvt 
        foreign key (flightplans_id) 
        references flightplans;

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

    alter table checkpoint_info 
        add constraint FK_9yc90uxhxcs0p3y3mex1ah62b 
        foreign key (checkpoint_id) 
        references checkpoints;        

    alter table user_checkpoints_info 
        add constraint FK_s9garnqrhi1ayd9ls9txkx20p 
        foreign key (checkpoint_info_id) 
        references checkpoint_info;

    alter table user_checkpoints_info 
        add constraint FK_o7g61i4bgr3mnxyukfi78dsb2 
        foreign key (user_id) 
        references users;        
        
    alter table users 
        add constraint FK_q37jte7r1ptl16arimkk23y1h 
        foreign key (major_id) 
        references departments;

    create sequence hibernate_sequence;
