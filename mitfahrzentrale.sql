SELECT current_user, current_schema();

create table raum (
	id serial primary key,
	raum smallint,
	etage smallint
);

alter table raum
add opt_bezeichnung varchar(16);

alter table raum 
rename column raum to raum_nr;

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



insert into raum (
	raum_nr,
	etage,
	opt_bezeichnung
)
values (
	6,
	0,
	'Lager'
);

insert into raum (
	raum_nr,
	etage
)
values (
	floor(random() * (0-25) + 0)::int,
	floor(random() * (0-10) + 0)::int
);

select * from raum;

insert into mitarbeiter (
	vorname,
	nachname)
values (
	'Günter',
	'Fünter'
);
insert into mitarbeiter (
	vorname,
	nachname)
values (
	'Tester',
	'Fester'
);
insert into mitarbeiter (
	vorname,
	nachname)
values (
	'Max',
	'Mustermann'
);

select * from mitarbeiter;