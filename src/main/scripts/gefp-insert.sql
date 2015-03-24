
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