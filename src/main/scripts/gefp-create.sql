    create table roles (
        id int4 not null,
        role_name varchar(255),
        primary key (id)
    );
	
    insert into roles values(1, 'ADMIN');
	insert into roles values(2, 'ADVISOR');
	insert into roles values(3, 'STUDENT');
    
    create table departments (
        dept_id int4 not null,
        dept_name varchar(255),
        plan_id int4,
        active boolean not null,
        deleted boolean not null,
        primary key (dept_id)
    );
	
    insert into departments values(1, 'Computer Science', 1, true, false);
	insert into departments values(2, 'Electrical Engineering', 2, true, false);
    
    create table flightplan (
        id int4 not null,
        plan_name varchar(255),
        published boolean not null,
        active boolean not null,
        deleted boolean not null,
        primary key (id)
    );    
    
    insert into flightplan values (1, 'Golden Eagle Flight Plan', true, true, true);
    insert into flightplan values (2, 'Electrical Engineering Flight Plan', true, true, true);
    

    create table users (
        user_id int4 not null,
        username varchar(255),
        cin varchar(255),
        first_name varchar(255),
        middle_name varchar(255),
        last_name varchar(255),
        email varchar(255),
        password varchar(255),
        dept_id int4,
        plan_id int4,
        enabled boolean not null,
        deleted boolean not null,
        primary key (user_id)
    );
    
    insert into users (user_id, username, password, first_name, last_name, cin, email, dept_id, plan_id, enabled, deleted)
    	values (1, 'cysun','abcd', 'Chengyu', 'Sun', '304367456', 'csun@calstatela.edu', null, null, true, true ),
    			(2, 'tfox','abcd', 'Teresa', 'Fox', '354120102', 'tfox@calstatela.edu', null, null, true, true ),
    			(3, 'jdoe1','abcd', 'John', 'Doe', '310451230', 'jdoe1@email.com', 1, 1, true, true ),
    			(4, 'jdoe2','abcd', 'Jane', 'Doe', '38745120', 'jdoe2@calstatela.edu', 1, 1, true, true );

    create table user_roles (
        user_id int4 not null,
        role_id int4 not null,
        primary key (user_id, role_id)
    );
    
    insert into user_roles values(1,1);
    insert into user_roles values(2,2);
    insert into user_roles values(3,3);
    insert into user_roles values(4,3);
    
    create table runways (
        runway_id int4 not null,
        runway_name varchar(255),
        active boolean not null,
        deleted boolean not null,
        primary key (runway_id)
    );

    insert into runways values(1, 'Academics', true, true);
	insert into runways values(2, 'Career Preparation', true, true);
	insert into runways values(3, 'Leadership & Community Engagement', true, true);
    
    create table stages (
        stage_id int4 not null,
        stage_name varchar(255),
        active boolean not null,
        deleted boolean not null,
        primary key (stage_id)
    );    
    
	INSERT INTO stages VALUES (1, 'Pre-College (pre-flight checklist)', true, true);
	INSERT INTO stages VALUES (2, 'Freshman (take-off)', true, true);


    create table checkpoints (
        id int4 not null,
        name varchar(255) not null,
        chk_type varchar(255) not null,
        plan_id int4,
        runway_id int4,
        stage_id int4,
        active boolean not null,
        deleted boolean not null,
        primary key (id)
    );

	/* Checkpoints for Computer Science Plan */
    INSERT INTO checkpoints VALUES (1, 'Algebra (before Yr1)', 'TEXT', 1, 1, 1, true, true);
	INSERT INTO checkpoints VALUES (2, 'Apply for financial aid and scholarships', 'TEXT', 1, 1, 1, true, true);
	INSERT INTO checkpoints VALUES (3, 'Make a list of questions to ask during orientation and ask them!', 'TEXT', 1, 1, 1, true, true);
	INSERT INTO checkpoints VALUES (4, 'Pre-calculus (before Yr1)', 'TEXT', 1, 1, 2, true, true);
	INSERT INTO checkpoints VALUES (5, 'Algebra (before Yr1)', 'TEXT', 1, 2, 2, true, false);
	INSERT INTO checkpoints VALUES (6, 'Apply for financial aid and scholarships', 'TEXT', 1, 3, 2, true, false);
    
 	
	/* Checkpoints for Computer Science Plan */
	INSERT INTO checkpoints VALUES (7, 'Algebra (before Yr1)', 'TEXT', 2, 1, 1, true, true);
	INSERT INTO checkpoints VALUES (8, 'Apply for financial aid and scholarships', 'TEXT', 2, 2, 1, true, true);
	INSERT INTO checkpoints VALUES (9, 'Make a list of questions to ask during orientation and ask them!', 'TEXT', 2, 3, 1, true, true);
	INSERT INTO checkpoints VALUES (10, 'Pre-calculus (before Yr1)', 'TEXT', 2, 1, 2, true, true);
	INSERT INTO checkpoints VALUES (11, 'Algebra (before Yr1)', 'TEXT', 2, 2, 2, true, false);
	INSERT INTO checkpoints VALUES (12, 'Apply for financial aid and scholarships', 'TEXT', 2, 3, 2, true, false);
	
    create table flightplan_runways (
        flightplan_id int4 not null,
        runway_id int4 not null,
        order_num int4 not null,
        primary key (flightplan_id, runway_id)
    );
	
    insert into flightplan_runways values (1,1,0);
    insert into flightplan_runways values (1,2,1);
    insert into flightplan_runways values (1,3,2);
    
    insert into flightplan_runways values (2,1,0);
    insert into flightplan_runways values (2,2,1);
    insert into flightplan_runways values (2,3,2);
    
    
    create table flightplan_stages (
        flightplan_id int4 not null,
        stage_id int4 not null,
        order_num int4 not null,
        primary key (flightplan_id, stage_id)
    );
	
    
    INSERT INTO flightplan_stages VALUES (1, 1, 0);
	INSERT INTO flightplan_stages VALUES (1, 2, 1);
	
	INSERT INTO flightplan_stages VALUES (2, 1, 0);
	INSERT INTO flightplan_stages VALUES (2, 2, 1);
    
    create table department_flightplan (
        dept_id int4 not null,
        oldplan_id int4 not null
    );
    
    INSERT INTO department_flightplan(
            dept_id, oldplan_id)
    VALUES (1, 1), (2,2);

    create table flightplan_checkpoints (
        flightplan_id int4 not null,
        checkpoint_id int4 not null,
        order_num int4 not null,
        primary key (flightplan_id, order_num)
    );

    
    INSERT INTO flightplan_checkpoints VALUES (1,1,0), (1,2,1), (1,3,2), (1,4,3), (1,5,4), (1,6,5);
    INSERT INTO flightplan_checkpoints VALUES (2,7,0), (2,8,1), (2,9,2), (2,10,3), (2,11,4), (2,12,5);
    

    create table user_checkpoints (
        user_id int4 not null,
        checkpoint_id int4 not null
    );
    
    INSERT INTO user_checkpoints VALUES (3, 1), (3, 5);
    

    alter table department_flightplan 
        add constraint UK_jar678wayct9h6ld11pggygmn unique (oldplan_id);

--    alter table flightplan_checkpoints 
--        add constraint UK_iowwhcjos714ukxeyhgvs7il3 unique (checkpoint_id);

--    alter table flightplan_runways 
--        add constraint UK_5x68i3ebnpvt9pruu997sr8kq unique (runway_id);

--    alter table flightplan_stages 
--        add constraint UK_nl5di8iji0s70qxdv6h5md8wn unique (stage_id);

    alter table users 
        add constraint UK_r43af9ap4edm43mmtq01oddj6 unique (username);

--    alter table user_checkpoints 
--        add constraint UK_o9v83tlotmys5ftkny0umger1 unique (checkpoint_id);


    alter table checkpoints 
        add constraint FK_knj4hpwyv8pbaucfmo0fmg7f4 
        foreign key (plan_id) 
        references flightplan;

    alter table checkpoints 
        add constraint FK_1aryy2s8x1bfli1cyr4yckqqk 
        foreign key (runway_id) 
        references runways;

    alter table checkpoints 
        add constraint FK_rn5vmwbgl6saxmo9r0voqf49k 
        foreign key (stage_id) 
        references stages;

    alter table departments 
        add constraint FK_teos0btacmvhp1xyob6dx4m16 
        foreign key (plan_id) 
        references flightplan;

    alter table department_flightplan 
        add constraint FK_jar678wayct9h6ld11pggygmn 
        foreign key (oldplan_id) 
        references flightplan;

    alter table department_flightplan 
        add constraint FK_hgbw03i1ogik61guems7tcgdp 
        foreign key (dept_id) 
        references departments;

    alter table flightplan_checkpoints 
        add constraint FK_iowwhcjos714ukxeyhgvs7il3 
        foreign key (checkpoint_id) 
        references checkpoints;

    alter table flightplan_checkpoints 
        add constraint FK_g2hbto2pn1odiice7onagfifs 
        foreign key (flightplan_id) 
        references flightplan;

    alter table flightplan_runways 
        add constraint FK_5x68i3ebnpvt9pruu997sr8kq 
        foreign key (runway_id) 
        references runways;

    alter table flightplan_runways 
        add constraint FK_3gx84bsex3s6euk16si98b4bn 
        foreign key (flightplan_id) 
        references flightplan;

    alter table flightplan_stages 
        add constraint FK_nl5di8iji0s70qxdv6h5md8wn 
        foreign key (stage_id) 
        references stages;

    alter table flightplan_stages 
        add constraint FK_8a20talpum1ntge7ig51igoms 
        foreign key (flightplan_id) 
        references flightplan;

    alter table users 
        add constraint FK_qapsr64600sbyhd05spxcakau 
        foreign key (dept_id) 
        references departments;

    alter table users 
        add constraint FK_62tqjtccn45o2e4io8pld0civ 
        foreign key (plan_id) 
        references flightplan;

    alter table user_checkpoints 
        add constraint FK_o9v83tlotmys5ftkny0umger1 
        foreign key (checkpoint_id) 
        references checkpoints;

    alter table user_checkpoints 
        add constraint FK_f69ft5686qlhvuwyblxc1ri7p 
        foreign key (user_id) 
        references users;

    alter table user_roles 
        add constraint FK_60loxav507l5mreo05v0im1lq 
        foreign key (role_id) 
        references roles;

    alter table user_roles 
        add constraint FK_9tm2g7h6pihegkj5cp04hc594 
        foreign key (user_id) 
        references users;

    create sequence hibernate_sequence START with 1000;
