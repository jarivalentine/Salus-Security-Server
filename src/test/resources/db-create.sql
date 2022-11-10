drop table if exists quotes;
create table quotes
(
    id    int auto_increment,
    quote varchar(255)
);


drop table if exists bystander_incidents;
drop table if exists aggressor_incidents;
drop table if exists incidents_labels;
drop table if exists incidents;
drop table if exists labels;
drop table if exists users;

create table users
(
    id          varchar(16) not null,
    firstname   varchar(255),
    lastname    varchar(255),
    subscribed  boolean default false,
    primary key (id)
);

create table incidents
(
    id          int auto_increment,
    type        varchar(255),
    longitude   varchar(255),
    latitude    varchar(255),
    datetime    datetime default current_timestamp,
    validated   boolean,
    reporterId  varchar(16) not null,
    primary key (id),
    foreign key (reporterId) references users(id)
);

create table labels (
                        label       varchar(255) not null,
                        primary key (label)
);

create table incidents_labels (
                                  label       varchar(255) not null,
                                  incidentId  int not null,
                                  primary key (label, incidentId),
                                  foreign key (label) references labels(label),
                                  foreign key (incidentId) references incidents(id)
);

create table bystander_incidents (
                                     userId  varchar(16) not null,
                                     incidentId  int not null,
                                     primary key (userId, incidentId),
                                     foreign key (userId) references users(id),
                                     foreign key (incidentId) references incidents(id)
);

create table aggressor_incidents (
                                     userId  varchar(16) not null,
                                     incidentId  int not null,
                                     primary key (userId, incidentId),
                                     foreign key (userId) references users(id),
                                     foreign key (incidentId) references incidents(id)
);
