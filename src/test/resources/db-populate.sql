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
values ('Pirating', '51.29162', '3.314377', 'ACTIVE', '1989-01-28_AL');

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
values ('Manslaughter', '51.26162', '3.274377', 'DECLINED', '2003-06-30_CM');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '51.22162', '3.234377', 'CONFIRMED', '2003-06-30_CM');

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
values ('Bomber', '51.21162', '3.234377', 'CONFIRMED', '1978-12-22_JVD');

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
values ('Assassination', '51.174812', '3.176589', 'CONFIRMED', '2004-08-01_BB');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents)),
        ('1989-01-28_AL', (select max(id) from incidents));


insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '51.974125', '3.147586', 'CONFIRMED', '2004-08-01_BB');

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
values ('Assassination', '51.958594', '3.958594', 'CONFIRMED', '2000-10-31_LS');

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
values ('Abusive-sexual-Contact', '51.974125', '3.147586', 'DECLINED', '2004-08-01_BB');

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
values ('Murder', '51.236485', '3.236485', 'DECLINED', '1997-04-18_CB2');

insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents)),
        ('2000-10-31_LS', (select max(id) from incidents));


insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '51.123456', '3.123456', 'CONFIRMED', '1997-04-18_CB2');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents));

insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));

insert into aggressor_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents)),
        ('1997-04-18_CB', (select max(id) from incidents));

-- END INCIDENTS WHERE REPORTERID = 1997-04-18_CB2
-- ################################################
-- BEGIN MOCK DATA GEOAID

insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '65.0821283155', '86.2245663425', 'DECLINED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '-0.8489568524', '42.1898702827', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '63.4426917787', '-161.405828151', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-18.8679402971', '-119.6658221685', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2003-06-30_CM', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '3.0369556868', '104.6260571895', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Rape', '-27.7242562298', '95.4690827253', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '55.9719339538', '-60.9720156447', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '23.2289547976', '-104.0654669796', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '-67.4866790302', '56.3948795029', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '-24.8182856247', '172.1251053281', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '-63.7558164317', '116.0567537841', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-5.2976294148', '-125.6847343209', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '-17.8857742594', '77.8556070978', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '62.3976005072', '159.7073446252', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-1.644212036', '-57.0909463006', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '-68.9655367416', '7.9147800451', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '-79.7743847578', '91.9928808398', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '-12.2797824972', '-151.0190425672', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '-64.2978755113', '72.5149408914', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '-22.0337473333', '48.6811640349', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('First-Degree-Murder', '-85.1748371583', '58.014737548', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '-25.4803258803', '-158.894388008', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '-78.3533750433', '6.1708830359', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2003-06-30_CM', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '82.1342403758', '127.6780464022', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '82.2000109139', '165.5376725284', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '73.885618933', '5.2668504222', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '-27.6750394386', '-66.482501989', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '-17.9736675335', '149.6444734279', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '87.1946365588', '30.4638311048', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '71.8763327988', '-98.5221982653', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '43.0527880256', '117.300621502', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1992-02-04_SH', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-20.6052364615', '65.2667208016', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '-70.5142241753', '56.940455513', 'DECLINED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-33.4043225907', '-43.6769132231', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '76.3470524845', '-140.1583605654', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '-36.9630303209', '-36.0223187409', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '-83.947776062', '-160.8228878709', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '81.3967877839', '-156.7876941518', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '-80.9968179523', '-85.5749776478', 'DECLINED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Arson', '-17.2097647373', '-64.5709133854', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-8.656653758', '102.5951391813', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '-82.8568953204', '-46.6776624946', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '-85.9448335194', '-86.8795043966', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '72.1886833315', '102.4166624573', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '70.22500892', '68.1209463117', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2003-06-30_CM', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '13.8024242792', '138.735895146', 'DECLINED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '73.9341061167', '-13.0781054778', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '-67.9923937469', '-113.5748475038', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '-81.0783136844', '4.5271939905', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '5.0934939326', '-148.3278889147', 'DECLINED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2003-06-30_CM', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Rape', '76.2285286245', '-89.2219647717', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '-78.7658617308', '-173.0858091695', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '17.6797103039', '21.5344760015', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '0.4379294508', '-33.1377909309', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '-63.3807338865', '92.1628063286', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '-68.3394875237', '-53.7738606192', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '-68.5785138304', '-94.2632710123', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1992-02-04_SH', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '55.2710312058', '-51.7126175738', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '5.8739230006', '69.603835801', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '-20.9346095669', '56.958501319', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-25.8569124421', '-115.430746667', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '54.0566886348', '133.4185444372', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '43.902447547', '74.7345549592', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('First-Degree-Murder', '-30.479131725', '-43.1562263575', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '36.696694408', '-54.884041499', 'DECLINED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-85.9526100241', '126.6667279351', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '-79.4191438778', '-75.398135127', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Arson', '50.7528906739', '81.0476307491', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-58.41892457', '169.6933293668', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '-77.711257031', '-42.4383859128', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2003-06-30_CM', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '37.5018564182', '-16.6063644818', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1976-11-09_MA', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '-38.0838676414', '140.490966521', 'DECLINED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '8.7257024609', '-104.7940947059', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '-45.9658311155', '-161.4973603412', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '36.930758045', '27.4926778926', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '41.5279212692', '109.9599613375', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '-89.3754401595', '83.6277702756', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '79.2650083171', '-35.3075278058', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2003-06-30_CM', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '-21.4735675368', '36.5917648171', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Rape', '2.676127564', '-46.1270865151', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-66.1549060666', '53.9680810755', 'DECLINED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('First-Degree-Murder', '-68.2058157886', '34.7600273479', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1992-02-04_SH', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '84.2009588865', '138.6076629099', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '-74.1860510449', '-97.3801819993', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '-7.9705697139', '-76.5310180499', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-0.1248257012', '11.8348682085', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1989-01-28_AL', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-18.07335429', '179.1429165916', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '-44.6919983101', '156.9737362206', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-08-12_DJ', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('First-Degree-Murder', '-84.5469613433', '-89.4525260367', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-68.7975125941', '145.7022288549', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '38.7192258105', '-6.1242517426', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2003-06-30_CM', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '16.7113547895', '111.3381789909', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '58.2822687849', '-170.9747998361', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2000-10-31_LS', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('First-Degree-Murder', '1.7175791551', '164.7132709921', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '-37.9607826695', '83.4328423434', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '-47.4651430944', '-146.0403570259', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2004-08-01_BB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '72.0363901431', '-7.6241967522', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('2003-06-30_CM', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-73.7778699503', '-77.1452167667', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-39.2631175663', '-54.1141154567', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1997-04-18_CB2', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '11.1606233495', '128.8337234146', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into bystander_incidents(userId, incidentId)
values  ('1978-12-22_JVD', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
