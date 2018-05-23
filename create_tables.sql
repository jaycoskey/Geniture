
create table ged_dataset (
    uid char(40) primary key,

    version varchar(20),
    file_format varchar(20),
    encoding varchar(20),
    language varchar(1024),
    source_name varchar(1024),
    source_version varchar(1024),
    source_direction char(3),
    source_corporation varchar(1024),
    -- submitter_ind_id
    destination varchar(1024),
    gdatetime timestamp, -- gedcom_datetime
    -- rins varchar -- See Submitter table

    description_aware boolean not null default true,

    publish_username varchar(1024),
    publish_is_disabled boolean not null,

    submitter_rin varchar(20),
    submitter_name varchar(1024),
    submitter_www varchar(1024),
    submitter_email varchar(1024),
    submitter_addr varchar(1024)
);

create table submitter (
    dataset_uid char(40) not null references ged_dataset(uid) on delete cascade,
    submitter_uid char(40) not null, -- references individual(uid)
    rin varchar(20) not null
);

create table individual (
    uid char(40) primary key,
    id int not null,
    rin varchar(20) not null,
    last_updated timestamp,
    name_given varchar(1024),
    name_surname varchar(1024),
    sex char,
    note varchar
);

create table family (
    uid char(40) primary key,
    id int not null,
    rin varchar(20) not null,
    place varchar(1024),
    note varchar
);

create table family_child (
    fam_uid char(40) not null references family(uid) on delete cascade,
    ind_uid char(40) not null references individual(uid) on delete cascade,
    child_ord int,
    note varchar
);

create table spouse_family (
    ind_id char(40) not null references individual(uid) on delete cascade,
    fam_id char(40) not null references family(uid) on delete cascade,
    fam_ord int,
    note varchar
);

create table enum_event_type (
    id int primary key,
    event_name varchar(20) not null,
    tag_name varchar(20) not null
);

create table event (
    uid varchar(40) primary key,
    etype int not null references enum_event_type(id) on delete cascade,
    rin varchar(20) not null,
    gdate timestamp, -- gedcom_timestamp,
    place varchar,
    note varchar
);

insert into enum_event_type (id, event_name, tag_name)
values
    (0, 'birth', 'BIRT')
    , (1, 'death', 'DEAT')
    , (2, 'marriage', 'MARR')
    , (3, 'divorce', 'DIV')
;

