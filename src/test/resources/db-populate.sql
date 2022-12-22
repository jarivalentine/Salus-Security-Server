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
values ('Robbery', '85.062237629', '-65.5531745024', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '-17.0493829169', '88.1304317496', 'DECLINED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '-67.3746955112', '-44.777439037', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '-89.9516186999', '157.951458161', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '35.8288027812', '3.9315206479', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '-75.2118199106', '15.6759300177', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '8.5271916378', '-136.2893874081', 'DECLINED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-37.2005366721', '-127.556585992', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-34.4601951514', '-138.7933260777', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-33.5330165428', '-28.6701600454', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '15.0963783758', '2.1424878025', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '35.7288871792', '114.4218052814', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-68.9076034616', '167.4226722364', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '24.6253220177', '-148.9451102291', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '-25.3404576709', '-12.6427623591', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '85.9264494354', '156.1063512834', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '-41.1586097174', '-34.1067603982', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '15.5227795161', '20.9863833085', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '73.8699337502', '-170.4308361068', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '-44.3490809984', '38.5348769202', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '38.7181682462', '110.4542539351', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '88.4767744114', '39.2190678451', 'DECLINED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Arson', '75.467404698', '98.1128365498', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Rape', '16.5524923442', '97.2887244366', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '82.9181164884', '156.7395592107', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Rape', '60.0002474891', '-143.5725659571', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '-79.7050715628', '107.1665179323', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '21.3333064779', '49.0498009286', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '42.7884068696', '159.3115668067', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '54.1781195784', '62.7820856734', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '-89.4867364359', '133.0793266938', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '-19.985367746', '159.252873479', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '19.3143146734', '-128.7176271841', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '43.6567475356', '12.5146257973', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '-8.0155551891', '-63.0965387713', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '69.4005514951', '-48.6343061376', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '85.7521328516', '-155.6252667312', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Arson', '-29.1859604914', '-107.5581203285', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-20.2959276421', '-129.4390521447', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '60.8967967155', '103.8369269153', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-74.8282962232', '-135.9770122596', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-47.5266971974', '-103.2660461549', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-50.386867724', '49.4658575815', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '-9.9514741266', '51.6058930206', 'DECLINED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '56.7190908138', '-17.1986043453', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assault', '-7.438285697', '127.1001721663', 'DECLINED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1992-02-04_SH', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '20.600542986', '-67.9673879683', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Robbery', '-84.2273174346', '30.0132978052', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-57.6005477106', '-16.635185023', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '72.0687564048', '-54.352871067', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '81.8471327299', '175.3794947682', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '73.0201133723', '111.0311364988', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '34.5618225112', '-73.5496407973', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-38.787317799', '-12.0432226923', 'CONFIRMED', '1997-04-18_CB2');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '17.8546380805', '-93.2756311022', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Rape', '-79.7914317141', '-149.794190926', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-5.8042165086', '-33.8588454179', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '47.8158273139', '37.9794950746', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '2.0243447168', '10.4838703435', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '-14.5452038382', '-43.6837034722', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '19.3112547676', '-64.8763998043', 'DECLINED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '0.7479747374', '150.3733761765', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '80.9427713588', '-5.4746743221', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('First-Degree-Murder', '59.2576974902', '-146.2927884539', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '-41.6591271372', '-35.4238157647', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-34.5057275385', '126.4336378432', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '38.1372773221', '2.6169947524', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '-38.2799236555', '-0.4551184618', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '40.4353748733', '-110.447446846', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '13.039337057', '-159.2965488386', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '61.5830880178', '-105.6428189862', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '34.6470207859', '-49.5933432153', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '24.3985365869', '-171.3432095271', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('First-Degree-Murder', '42.9581674645', '-166.9212703218', 'DECLINED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '-81.1988629202', '102.292790724', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '-80.8729627751', '-27.9298721733', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Drug-Smuggling', '-67.8393839719', '130.7908232467', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Vandalism', '-42.9718522732', '-157.5991799668', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Arson', '-5.1972801972', '-160.9070921447', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Stalking', '38.1513122799', '139.2319689266', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '30.6783636907', '70.122062136', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '4.7124936517', '63.5358654751', 'DECLINED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '-48.2840497887', '167.7692566039', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '-27.0689038491', '-158.9788021434', 'CONFIRMED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Torturer', '36.669393753', '163.0230912669', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '-68.1350339906', '162.5159972617', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2003-06-30_CM', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Bomber', '44.2744465271', '-123.4796345703', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1989-01-28_AL', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Assassination', '31.7279214789', '87.0053846533', 'DECLINED', '1989-01-28_AL');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB2', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '52.5776550284', '-164.9009923741', 'CONFIRMED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '87.8607713776', '-93.3167573906', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '29.3639962448', '-178.5937526296', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-08-12_DJ', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Abusive-sexual-Contact', '9.7132605699', '128.781110847', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Blackmail', '-88.182628938', '121.6053619333', 'CONFIRMED', '1997-04-18_CB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Theft', '58.4647965056', '-161.6446410219', 'DECLINED', '2000-10-31_LS');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Armed-Robbery', '-19.0746621992', '-139.9867632338', 'CONFIRMED', '2004-08-01_BB');
insert into incidents_labels (label, incidentId)
values ('Under Control', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1997-04-18_CB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Pirating', '79.4945283606', '139.1614376863', 'CONFIRMED', '1978-12-22_JVD');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1976-11-09_MA', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Arson', '-35.1412576433', '-55.5708694297', 'CONFIRMED', '1976-11-09_MA');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Murder', '59.7547684316', '-87.365132124', 'CONFIRMED', '2000-08-12_DJ');
insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('1978-12-22_JVD', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Arson', '-7.2658016114', '-105.083454645', 'CONFIRMED', '1992-02-04_SH');
insert into incidents_labels (label, incidentId)
values ('Child Danger', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2004-08-01_BB', (select max(id) from incidents));
insert into incidents (type, latitude, longitude, state, reporterId)
values ('Manslaughter', '-70.6144465154', '-75.0211900154', 'CONFIRMED', '2003-06-30_CM');
insert into incidents_labels (label, incidentId)
values ('Critical Condition', (select max(id) from incidents));
insert into aggressor_incidents(userId, incidentId)
values ('2000-10-31_LS', (select max(id) from incidents));
