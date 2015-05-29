insert into roles values(1, 'ADMIN');
insert into roles values(2, 'ADVISOR');
insert into roles values(3, 'STUDENT');

insert into flightplans values (1, 'Golden Eagle Flight Plan','', 1, true);
insert into flightplans values (2, 'Electrical Engineering Flight Plan','', 2, true);

insert into departments values(1, 'Computer Science', 1, true, false);
insert into departments values(2, 'Electrical Engineering', 2, true, false);

insert into department_plans values (1,1), (2,2);

insert into users(id, username, password, first_name, last_name, cin, email, department_id, plan_id, enabled, deleted) values (1, 'cysun','abcd', 'Chengyu', 'Sun', '304367456', 'csun@calstatela.edu', null, null, true, false );
insert into users(id, username, password, first_name, last_name, cin, email, department_id, plan_id, enabled, deleted) values (2, 'tfox','abcd', 'Teresa', 'Fox', '354120102', 'tfox@calstatela.edu', null, null, true, false );
insert into users(id, username, password, first_name, last_name, cin, email, department_id, plan_id, enabled, deleted) values (3, 'jdoe1','abcd', 'John', 'Doe', '310451230', 'jdoe1@email.com', 1, 1, true, false );
insert into users(id, username, password, first_name, last_name, cin, email, department_id, plan_id, enabled, deleted) values (4, 'jdoe2','abcd', 'Jane', 'Doe', '38745120', 'jdoe2@calstatela.edu', 1, 1, true, false );
   
insert into user_roles values(1,1);
insert into user_roles values(2,2);
insert into user_roles values(3,3);
insert into user_roles values(4,3);

