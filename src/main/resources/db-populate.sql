insert into users (id, firstname, lastname)
values ('1989-01-28_AL', 'Adison', 'Lopez'),
       ('1992-02-04_SH', 'Sandra', 'Haney'),
       ('1997-04-18_CB', 'Connor', 'Brooks'),
       ('1997-04-18_CB2', 'Charlotte', 'Badger'),
       ('2003-06-30_CM', 'Cristofer', 'Mcdonald'),
       ('2004-08-01_BB', 'Briley', 'Bishop'),
       ('2000-08-12_DJ', 'Dahlia', 'Johns'),
       ('2000-10-31_LS', 'Laura', 'Schneider'),
       ('1976-11-09_MA', 'Makai', 'Armstrong'),
       ('1978-12-22_JVD', 'Johanna', 'Van Dyke');

insert into labels (label)
values  ('Armed'),
        ('Child Danger'),
        ('Critical Condition'),
        ('Under Control');


-- ################################################
-- BEGIN INCIDENTS WHERE REPORTERID = 1989-01-28_AL

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '51.19162', '3.214377', 'CONFIRMED', '1989-01-28_AL');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
        ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents)),
        ('2003-06-30_CM', (select max(id) from incidents)),
        ('1978-12-22_JVD', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents));

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '51.29162', '3.314377', 'ACTIVE', '1989-01-28_AL');

insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents)),
       ('Armed', (select max(id) from incidents)),
       ('Under Control', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents)),
        ('2000-10-31_LS', (select max(id) from incidents)),
        ('1992-02-04_SH', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '51.21162', '3.214377', 'CONFIRMED', '1989-01-28_AL');

insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '51.23162', '3.214377', 'CONFIRMED', '1989-01-28_AL');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents)),
       ('Under Control', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

-- END INCIDENTS WHERE REPORTERID = 1989-01-28_AL
-- ################################################
-- BEGIN INCIDENTS WHERE REPORTERID = 2003-06-30_CM

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '51.26162', '3.274377', 'DECLINED', '2003-06-30_CM');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '51.22162', '3.234377', 'ACTIVE', '2003-06-30_CM');

insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents)),
        ('1978-12-22_JVD', (select max(id) from incidents));

-- END INCIDENTS WHERE REPORTERID = 2003-06-30_CM
-- ################################################
-- BEGIN INCIDENTS WHERE REPORTERID = 1978-12-22_JVD

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '51.21162', '3.234377', 'CONFIRMED', '1978-12-22_JVD');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents)),
        ('1997-04-18_CB', (select max(id) from incidents));


-- END INCIDENTS WHERE REPORTERID = 1978-12-22_JVD
-- ################################################
-- BEGIN INCIDENTS WHERE REPORTERID = 2004-08-01_BB

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '51.174812', '3.176589', 'CONFIRMED', '2004-08-01_BB');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents)),
        ('1989-01-28_AL', (select max(id) from incidents));


insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '51.974125', '3.147586', 'ACTIVE', '2004-08-01_BB');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents)),
        ('1997-04-18_CB', (select max(id) from incidents));

-- END INCIDENTS WHERE REPORTERID = 2004-08-01_BB
-- ################################################
-- BEGIN INCIDENTS WHERE REPORTERID = 2000-10-31_LS

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '51.236485', '3.236485', 'DECLINED', '2000-10-31_LS');

insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents)),
        ('1989-01-28_AL', (select max(id) from incidents));


insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '51.958594', '3.958594', 'CONFIRMED', '2000-10-31_LS');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents)),
        ('1997-04-18_CB', (select max(id) from incidents));

-- END INCIDENTS WHERE REPORTERID = 2000-10-31_LS
-- ################################################
-- BEGIN INCIDENTS WHERE REPORTERID = 1997-04-18_CB2

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '51.174812', '3.176589', 'CONFIRMED', '2004-08-01_BB');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents)),
        ('1989-01-28_AL', (select max(id) from incidents));


insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '51.974125', '3.147586', 'ACTIVE', '2004-08-01_BB');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents)),
        ('1997-04-18_CB', (select max(id) from incidents));

-- END INCIDENTS WHERE REPORTERID = 2004-08-01_BB
-- ################################################
-- BEGIN INCIDENTS WHERE REPORTERID = 2000-10-31_LS

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '51.236485', '3.236485', 'ACTIVE', '1997-04-18_CB2');

insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents)),
        ('2000-10-31_LS', (select max(id) from incidents));


insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '51.123456', '3.123456', 'CONFIRMED', '1997-04-18_CB2');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents)),
        ('1997-04-18_CB', (select max(id) from incidents));