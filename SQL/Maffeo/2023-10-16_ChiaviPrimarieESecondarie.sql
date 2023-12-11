CREATE DATABASE Ferrovia
CREATE TABLE treni(
    numero int NOT NULL,
    giorno varchar(255) NOT NULL,
    ora float NOT NULL,
    destinazione varchar(255) NOT NULL,
    categoria varchar(255) NOT NULL,
    PRIMARY KEY (numero)
);


CREATE TABLE fermate(
    id_stazione int NOT NULL,
    num_treno int NOT NULL,
    ora float NOT NULL,
    PRIMARY KEY (id_stazione),
    FOREIGN KEY (num_treno) references treni (numero)
);


CREATE TABLE stazioni(
    ID_stazione int NOT NULL,
    nome_stazione varchar(255) NOT NULL,
    PRIMARY KEY (nome_stazione),
    FOREIGN KEY (ID_stazione) references fermate (id_stazione)
);


ALTER TABLE treni
ADD CONSTRAINT treno_unico
UNIQUE (ora, destinazione, categoria);


INSERT INTO treni
VALUES
    (1, 'Lunedì', 12.30, 'Roma', 'Intercity'),
    (2, 'Martedì', 13.30, 'Torino', 'Locale'),
    (3, 'Mercoledì', 14.30, 'Firenze', 'Diretto'),
    (1, 'Giovedì', 15.30, 'Roma', 'Locale'),
    (5, 'Lunedì', 12.30, 'Napoli', 'Diretto'),
    (6, 'Mercoledì', 17.30, 'Bari', 'Intercity');


INSERT INTO fermate
VALUES
    (1, 1, 12.30),
    (2, 2, 13.30),
    (3, 3, 14.30),
    (4, 4, 15.30),
    (5, 5, 16.30),
    (6, 6, 17.30);


INSERT INTO stazioni
VALUES
    (1, 'Firenze'),
    (2, 'Torino'),
    (3, 'Milano'),
    (4, 'Napoli'),
    (5, 'Roma'),
    (6, 'Bari');
   
UPDATE treni
SET ora = ora - 1;


UPDATE fermate
SET ora = ora - 1;