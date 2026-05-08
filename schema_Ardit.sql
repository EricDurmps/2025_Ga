DROP TABLE IF EXISTS historie CASCADE;
DROP TABLE IF EXISTS hardware CASCADE;
DROP TABLE IF EXISTS mitarbeiter CASCADE;
DROP TABLE IF EXISTS raum CASCADE;


CREATE TABLE raum (
    raum_id SERIAL PRIMARY KEY,
    bezeichnung VARCHAR(100) NOT null,
    Raum_NR     VARCHAR(100) not null,
    Etage       VARCHAR(100) not null
);
CREATE TABLE mitarbeiter (
    mitarbeiter_id SERIAL PRIMARY KEY,
    vorname VARCHAR(100) nOT null,
    nachname VARCHAR(100) not null,
    personal_nr VARCHAR(100) not null 
    
    );
CREATE TABLE hardware (
    hardware_id SERIAL PRIMARY KEY,
    Raum_nr VARCHAR(100) NOT NULL,
    inventar_id VARCHAR(100) not null,
    kaufdatum   VARCHAR(100) not null,
    status_bitmaske VARCHAR(100) not null,
    raum_id INT REFERENCES raum(raum_id)
);
CREATE TABLE historie (
    historie_id SERIAL PRIMARY KEY,
    hardware_id INT REFERENCES hardware(hardware_id),
    mitarbeiter_id INT REFERENCES mitarbeiter(mitarbeiter_id),
    datum DATE NOT NULL
);