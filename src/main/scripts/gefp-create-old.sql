-- Create Scripts

	create table roles (
        id int4 not null,
        role_name varchar(255),
        primary key (id)
    );
    
    create table departments (
        dept_id int4 not null,
        dept_name varchar(255),
        primary key (dept_id)
    );

    create table users (
        user_id int4 not null,
        name varchar(255),
        username varchar(255) unique not null,
        password varchar(255),
        role_id int4,
        active boolean not null,
        deleted boolean not null,
        primary key (user_id)
    );

    create table departments_users (
        department_dept_id int4 not null,
        users_user_id int4 not null
    );
    
    create table flightplan (
        id int4 not null,
        plan_name varchar(255),
        dept_id int4,
        active boolean not null,
        deleted boolean not null,
        primary key (id)
    );
    
    create table runways (
        runway_id int4 not null,
        runway_name varchar(255),
        plan_id int4,
        order_num int4 Default 1 not null,
        active boolean not null,
        deleted boolean not null,
        primary key (runway_id)
    );

    create table stages (
        stage_id int4 not null,
        stage_name varchar(255),
        plan_id int4,
        order_num int4 Default 1 not null,
        active boolean not null,
        deleted boolean not null,
        primary key (stage_id)
    );

    create table checkpoints (
        id int4 not null,
        name varchar(255) not null,
        chk_type varchar(255) not null,
        runway_id int4,
        stage_id int4,
        plan_id int4,
        active boolean not null,
        deleted boolean not null,
        primary key (id)
    );

    create table flightplan_checkpoints (
        flightplan_id int4 not null,
        checkpoints_id int4 not null
    );

    create table checkpoints_users (
        checkpoints_id int4 not null,
        users_user_id int4 not null
    );

    
    alter table flightplan_checkpoints 
        add constraint UK_iowwhcjos714ukxeyhgvs7il3 unique (checkpoints_id);

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

    alter table checkpoints_users 
        add constraint FK_cxiwlv2tt3illll8kt2myip8u 
        foreign key (users_user_id) 
        references users;

    alter table checkpoints_users 
        add constraint FK_ht0058ttmr5ic57fgk2yn1kc4 
        foreign key (checkpoints_id) 
        references checkpoints;

    alter table departments_users 
        add constraint FK_2mfnfbfd90i86eo3t8vy6hky1 
        foreign key (users_user_id) 
        references users;

    alter table departments_users 
        add constraint FK_q03v5jmyegxajnvvltkyld8lo 
        foreign key (department_dept_id) 
        references departments;

    alter table flightplan 
        add constraint FK_c75r1m2iwr6f5qy04n9xccege 
        foreign key (dept_id) 
        references departments;

    alter table flightplan_checkpoints 
        add constraint FK_iowwhcjos714ukxeyhgvs7il3 
        foreign key (checkpoints_id) 
        references checkpoints;

    alter table flightplan_checkpoints 
        add constraint FK_g2hbto2pn1odiice7onagfifs 
        foreign key (flightplan_id) 
        references flightplan;

    alter table runways 
        add constraint FK_q60k75ar7b235heurk8knuu9 
        foreign key (plan_id) 
        references flightplan;

    alter table stages 
        add constraint FK_cufcysn96nfomawq58s2wraul 
        foreign key (plan_id) 
        references flightplan;

    alter table users 
        add constraint FK_krvotbtiqhudlkamvlpaqus0t 
        foreign key (role_id) 
        references roles;

    create sequence hibernate_sequence;
    
    
-- Insert Scripts   

insert into roles values(1, 'ADMIN');
insert into roles values(2, 'ADVISOR');
insert into roles values(3, 'STUDENT');

insert into users values(1, 'CSUN', 'cysun','abcd', 1, true, true );
insert into users values(2, 'TFOX', 'tfox','abcd', 2, true, true );
insert into users values(3, 'J DOE1', 'jdoe1','abcd', 3, true, true );
insert into users values(4, 'J DOE2', 'jdoe2','abcd', 3, true, true );

insert into departments values(1, 'Computer Science');
insert into departments values(2, 'Electrical Engineering');

insert into departments_users values(1, 3);
insert into departments_users values(1, 4);

insert into flightplan values(1, 'Golden Eagle Flight Plan - CS', 1, true, true);
insert into flightplan values(2, 'Golden Eagle Flight Plan - EE', 2, true, true);


insert into runways values(1, 'Academics', 1, 1, true, true);
insert into runways values(2, 'Career Preparation', 1, 2, true, true);
insert into runways values(3, 'Leadership & Community Engagement', 1, 3, true, true);

insert into runways values(4, 'Academics - EE', 2, 1, true, true);
insert into runways values(5, 'Career Preparation - EE', 2, 2, true, true);
insert into runways values(6, 'Leadership & Community Engagement - EE', 2, 3, true, true);


insert into stages values(1, 'Pre-College (pre-flight checklist)', 1, 1, true, true);
insert into stages values(2, 'Freshman (take-off)', 1, 2, true, true);

insert into stages values(3, 'Pre-College (pre-flight checklist) - EE', 2, 1, true, true);
insert into stages values(4, 'Freshman (take-off) - EE', 2, 2, true, true);

insert into checkpoints values(1, 'Algebra (before Yr1)','TEXT', 1, 1, 1, true, true);
insert into checkpoints values(2, 'Apply for financial aid and scholarships','TEXT', 2, 1, 1, true, true);
insert into checkpoints values(3, 'Make a list of questions to ask during orientation and ask them!','TEXT', 3, 1, 1, true, true);
insert into checkpoints values(4, 'Pre-calculus (before Yr1)','TEXT', 1, 1, 1, true, true);

insert into checkpoints values(5, 'Algebra (before Yr1) - EE','TEXT', 4, 2, 2, true, true);
insert into checkpoints values(6, 'Apply for financial aid and scholarships - EE','TEXT', 5, 2, 2, true, true);
insert into checkpoints values(7, 'Make a list of questions to ask during orientation and ask them! - EE','TEXT', 6, 2, 2, true, true);
insert into checkpoints values(8, 'Pre-calculus (before Yr1) - EE','TEXT', 4, 2, 2, true, true);

insert into checkpoints_users values(1,3);
insert into checkpoints_users values(1,4);
insert into checkpoints_users values(2,4);
insert into checkpoints_users values(3,4);
insert into checkpoints_users values(4,4);

    