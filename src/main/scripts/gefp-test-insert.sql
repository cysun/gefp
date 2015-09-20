--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO roles (id, name) VALUES (1, 'ADMIN');
INSERT INTO roles (id, name) VALUES (2, 'ADVISOR');
INSERT INTO roles (id, name) VALUES (3, 'STUDENT');

--
-- Data for Name: departments; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (1, 'Electrical Engineering', NULL, true, false);
INSERT INTO departments (id, name, plan_id, active, deleted) VALUES (2, 'Technology', NULL, true, false);

--
-- Data for Name: flightplans; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplans (id, name, department_id, published, term_name, term_year, parent_id, deleted) VALUES (64, 'MyGoldenEagle Flight Plan 2.0', 1, true, 'Spring', '2015', NULL, false);

--
-- Data for Name: runways; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO runways (id, name, parent_id) VALUES (65, 'Academic Performance', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (66, 'Career Preparation', NULL);
INSERT INTO runways (id, name, parent_id) VALUES (67, 'Leadership & Community Engagement', NULL);


--
-- Data for Name: stages; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO stages (id, name, parent_id) VALUES (68, 'Pre-college (pre-flight checklist)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (69, 'Freshman (take-off)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (70, 'Sophomore (climbing altitude)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (71, 'Junior (cruising altitude)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (72, 'Senior (descent)', NULL);
INSERT INTO stages (id, name, parent_id) VALUES (73, 'Graduation  (Landing)', NULL);

--
-- Data for Name: department_plans; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO department_plans (department_id, plan_id) VALUES (1, 64);


--
-- Data for Name: flightplan_runways; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 65, 0);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 66, 1);
INSERT INTO flightplan_runways (flightplan_id, runway_id, order_num) VALUES (64, 67, 2);


--
-- Data for Name: flightplan_stages; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 68, 0);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 69, 1);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 70, 2);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 71, 3);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 72, 4);
INSERT INTO flightplan_stages (flightplan_id, stage_id, order_num) VALUES (64, 73, 5);

--
-- Data for Name: checkpoints; Type: TABLE DATA; Schema: public; Owner: gefp
--

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
INSERT INTO checkpoints (id, name, parent_id) VALUES (93, '<p>Attend Math Academic Excellence Workshops (AEW) (i.e. ENGR 154 workshops)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (89, '<p>CS 101</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (88, 'ENGR 150', NULL);
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
INSERT INTO checkpoints (id, name, parent_id) VALUES (202, '<p>Internship in following summer</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (203, '<p>Pathways to Success Workshop Series &ndash; <em>Career Development</em></p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (204, '<p>ECST Career Fair</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (205, '<p>Apply for Financial Aid (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid">http://www.calstatela.edu/financialaid</a>&nbsp;)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (206, '<p>Apply for Scholarships (&nbsp;<a target="_blank" href="http://www.calstatela.edu/financialaid/scholarships">http://www.calstatela.edu/financialaid/scholarships</a>&nbsp;)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (77, '<p>Attend STEP (<a target="_blank" href="http://www.calstatela.edu/ecst/success/summer-transition-ecst-program-step">Link Here</a>)</p>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (103, '<p>ENGR 150 &ndash; Identify up to 3 areas with in Engineering, Computer Science, and Technology that you might want to pursue a career in</p><ul><li>Civil Engineering (<a href="http://www.calstatela.edu/ecst/ce" target="_blank">http://www.calstatela.edu/ecst/ce</a>)</li><li>Electrical and Computer Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/</a><a href="http://www.calstatela.edu/ecst/ece" target="_blank">ece</a>)</li><li>Mechanical Engineering (<a href="http://www.calstatela.edu/ecst/tech">http://www.calstatela.edu/ecst/m</a><a href="http://www.calstatela.edu/ecst/me" target="_blank">e</a>)</li><li>Computer Science Technology (<a href="http://www.calstatela.edu/ecst/tech" target="_blank">http://www.calstatela.edu/ecst/tech</a>)</li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (201, '<p>Investigate sites and apply for <em>Research Experience for Undergraduates (REU) programs</em></p><ul><li><a href="http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006" target="_blank">http://www.nsf.gov/crssprgm/reu/list_result.jsp?unitid=10006</a></li></ul>', NULL);
INSERT INTO checkpoints (id, name, parent_id) VALUES (100, '<p>Take online assessment test.</p><div class="clearfix">&nbsp;</div><div class="accordion"><p>Keirsey</p><div><p><a target="_blank" href="http://www.keirsey.com/">http://www.keirsey.com/</a></p></div><p>Rileyguide</p><div><p><a target="_blank" href="http://www.rileyguide.com/assess.html">http://www.rileyguide.com/assess.html</a></p></div></div><div class="clearfix">&nbsp;</div>', NULL);


--
-- Data for Name: cells; Type: TABLE DATA; Schema: public; Owner: gefp
--

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


--
-- Data for Name: cell_checkpoints; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 75, 0);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 76, 1);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (74, 77, 2);
INSERT INTO cell_checkpoints (cell_id, checkpoint_id, order_num) VALUES (78, 79, 0);
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


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (4, '38745120', 'jdoe2', 'abcd', 'jdoe2@calstatela.edu', 'John', '', 'Doe', 1, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (1, '304367456', 'cysun', 'abcd', 'csun@calstatela.edu', 'Chengyu', NULL, 'Sun', 1, NULL, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (2, '354120102', 'tfox', 'abcd', 'tfox@calstatela.edu', 'T.', NULL, 'Fox', 1, NULL, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (3, '310451230', 'jdoe1', 'abcd', 'jdoe1@email.com', 'Joe', '', 'Doe', 2, 64, 1, true, false, false);

-- Real Users
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (5, '', 'cmarsh', '', 'cmarsh@calstatela.edu', 'Candi', '', 'Marsh', 2, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (6, '', 'rramir74', '', 'Rodolfo.Ramirez74@calstatela.edu', 'Rodolfo', '', '', 2, 64, 1, true, false, false);
INSERT INTO users (id, cin, username, password, email, first_name, middle_name, last_name, department_id, plan_id, major_id, enabled, deleted, newaccount) VALUES (7, '', 'dwon', '', 'dwon@calstatela.edu', 'Deborah', '', 'Won', 2, 64, 1, true, false, false);


--
-- Data for Name: user_roles; Type: TABLE DATA; Schema: public; Owner: gefp
--

INSERT INTO user_roles (user_id, role_id) VALUES (1, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (2, 2);
INSERT INTO user_roles (user_id, role_id) VALUES (3, 3);
INSERT INTO user_roles (user_id, role_id) VALUES (4, 3);

--
INSERT INTO user_roles (user_id, role_id) VALUES (5, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (6, 1);
INSERT INTO user_roles (user_id, role_id) VALUES (7, 1);

--
-- Name: hibernate_sequence; Type: SEQUENCE SET; Schema: public; Owner: gefp
--

SELECT pg_catalog.setval('hibernate_sequence', 5000, true);