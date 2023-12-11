-- PRIMARY KEYs: numero, ID_stazione
-- FOREIGN KEYs: id_stazione, num_treno

-- Creazione DATABASE
CREATE DATABASE Trenitalia;

-- Creazione TABLEs
CREATE TABLE treni (
	numero INTEGER PRIMARY KEY,
	giorno DATE NOT NULL,
	ora TIME NOT NULL,
	destinazione VARCHAR(255) NOT NULL,
	categoria VARCHAR(10) NOT NULL
	CHECK (categoria IN ('Intercity', 'Locale', 'Diretto'))
);

CREATE TABLE stazioni (
	ID_stazione INTEGER PRIMARY KEY,
	nome_stazione VARCHAR(255) NOT NULL
);

CREATE TABLE fermate (
	id_stazione INTEGER NOT NULL,
	num_treno INTEGER NOT NULL,
	ora TIME* NOT NULL,
	FOREIGN KEY (ID_stazione) REFERENCES stazioni(ID_stazione),
	FOREIGN KEY (num_treno) REFERENCES treni(numero)
);

-- INSERT Dati nelle TABLE
INSERT INTO treni ()
VALUES	
	('1', '2023-10-16', '08:34:00', 'Stazione 6', 'Intercity'),
	('2', '2023-10-16', '13:28:00', 'Stazione 5', 'Diretto'),
	('3', '2023-10-16', '15:11:00', 'Stazione 6', 'Locale');
	
INSERT INTO stazioni ()
VALUES
	('1', 'Stazione 1'),
	('2', 'Stazione 2'),
	('3', 'Stazione 3'),
	('4', 'Stazione 4'),
	('5', 'Stazione 5'),	
	('6', 'Stazione 6');
	
INSERT INTO fermate ()
VALUE
	('1', '1', '08:34:00'),
	('4', '1', '12:11:00'),
	('6', '1', '16:52:00'),
	('1', '2', '13:28:00'),
	('3', '2', '15:22:00'),
	('5', '2', '17:45:00'),
	('1', '3', '15:11:00'),
	('1', '3', '16:25:00'),
	('1', '3', '17:31:00'),
	('1', '3', '18:58:00'),
	('1', '3', '20:24:00'),
	('1', '3', '21:18:00');

-- UPDATE ora treni e fermate
UPDATE treni SET ora = DATE_ADD(ora, INTERVAL 1 HOUR)
WHERE categoria <> 'intercity';

UPDATE fermate SET ora = DATE_ADD(ora, INTERVAL 1 HOUR)
WHERE num_treno <> '1';
