SELECT current_user, current_schema();

create table raum (
	id serial primary key,
	raum smallint,
	etage smallint
);

select * from raum;

create table mitarbeiter (
	id serial primary key,
	vorname varchar(32),
	nachname varchar(32)
);

select * from mitarbeiter;

create table hardware (
	id serial primary key,
	kaufdatum date,
	
	raum_id integer references raum(id)
);

alter table hardware
add ist_verliehen bool;
alter table hardware
add ist_defekt bool;
alter table hardware
add muss_gewarted_werden bool;
alter table hardware
add ist_abgeschrieben bool;

select * from hardware;

create table historie (
	id serial primary key,
	leihdatum timestamp,
	
	mitarbeiter_id int references mitarbeiter(id),
	raum_id int references raum(id)
);

select * from historie;