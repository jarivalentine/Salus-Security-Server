INSERT INTO quotes VALUES (0, 'You must accept that you might fail.');
INSERT INTO quotes VALUES (1, 'Everyone enjoys doing the kind of work for which he is best suited.');


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

-- new incident

insert into incidents (type, longitude, latitude, validated, reporterId)
values ('Murder', '51.19162', '3.214377', true, '1989-01-28_AL');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
        ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

-- new incident

insert into incidents (type, longitude, latitude, validated, reporterId)
values ('Assault', '51.19162', '3.214377', true, '2003-06-30_CM');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents));

-- new incident

insert into incidents (type, longitude, latitude, validated, reporterId)
values ('Theft', '51.19162', '3.214377', true, '1978-12-22_JVD');

insert into incidents_labels (label, incidentId)
values ('Armed', (select max(id) from incidents)),
       ('Child Danger', (select max(id) from incidents)),
       ('Critical Condition', (select max(id) from incidents));

