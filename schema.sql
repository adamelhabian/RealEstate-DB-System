create database RealEstate 
go

create table builders
(
builderid int identity primary key ,
buildername varchar(30) not null
);

create table houses 
(
houseid int primary key ,
builderid int ,
ownerid int ,
divisionid int ,
);


create table owners 
(
ownerid int primary key ,
ownername varchar(30) not null,
owneraddress varchar(50) not null,
ownerssd varchar(50) unique 
);

alter table houses 
add constraint fk_builders_houses foreign key(builderid)
references builders(builderid) ,
constraint  fk_owners_houses foreign key (ownerid)
 references owners (ownerid) ;

create table divisions
(
divisionname varchar(50) not null,
divisionid int primary key 
);


 alter table houses
 add constraint fk_divisions_houses foreign key (divisionid) 
 references divisions (divisionid);

create table rooms 
(
roomid int primary key ,
houseid int ,
roomtype varchar(50) not null
)

alter table rooms 
add constraint fk_houses_rooms foreign key (houseid)
references houses (houseid);

create table features
(
featureid int primary key ,
featurename varchar(30) not null
);

create table roomFeatures 
(
roomid int  ,
featureid int ,

constraint pk_room_feature primary key (roomid,featureid)
);


 

alter table roomFeatures 
add constraint fk_rooms foreign key (roomid)
references rooms (roomid) ,
constraint fk_features foreign key (featureid)
references features (featureid);


