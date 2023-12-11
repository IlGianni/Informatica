CREATE DATABASE Stazione;

USE Stazione;

CREATE TABLE Treni(
    numero INT NOT NULL,
    giorno INT NOT null,
    ora TIME NOT null,
    destinazione VARCHAR(255) NOT null,
    categoria VARCHAR(255) NOT null,
    PRIMARY KEY(numero)
    );
    
CREATE TABLE Stazioni(
    id_stazione INT PRIMARY KEY,
    nome_stazione VARCHAR(255) not null
    );
    
CREATE TABLE Fermate(
    id_stazione INT not NULL,
    num_treno INT not null,
    ora TIME not null,
    PRIMARY KEY (num_treno,id_stazione, ora),
    foreign key (id_stazione) references Stazioni(id_stazione),
    foreign key (num_treno) references Treni(numero)
    );


INSERT INTO Treni (numero, giorno, ora, destinazione, categoria)
VALUES
    (101, 1, '08:00:00', 'Roma', 'Alta Velocità'),
    (102, 2, '09:15:00', 'Milano', 'Regionale'),
    (103, 3, '11:30:00', 'Napoli', 'Intercity'),
    (104, 4, '14:45:00', 'Firenze', 'Alta Velocità'),
    (105, 5, '16:20:00', 'Bologna', 'Regionale'),
    (106, 6, '18:40:00', 'Venezia', 'Alta Velocità'),
    (107, 7, '20:10:00', 'Torino', 'Intercity'),
    (108, 1, '07:30:00', 'Genova', 'Regionale'),
    (109, 2, '10:00:00', 'Palermo', 'Alta Velocità'),
    (110, 3, '13:15:00', 'Catania', 'Regionale');


INSERT INTO Stazioni (id_stazione, nome_stazione) VALUES
(1, 'Roma'),
(2, 'Firenze'),
(3, 'Bologna'),
(4, 'Venezia'),
(5, 'Torino'),
(6, 'Genova'),
(7, 'Palermo'),
(8, 'Catania'),
(9, 'Napoli'),
(10, 'Milano');

-- Inserisci 10 fermate con dati casuali
INSERT INTO Fermate (id_stazione, num_treno, ora)
VALUES
    (1, 102, '08:00:00'),
    (2, 103, '08:45:00'),
    (3, 101, '09:30:00'),
    (4, 106, '10:15:00'),
    (5, 101, '11:00:00'),
    (1, 109, '11:45:00'),
    (7, 101, '12:30:00'),
    (8, 101, '13:15:00'),
    (9, 102, '14:00:00'),
    (10, 101, '14:45:00');

--q1: Trova tutti i treni diretti a Milano
SELECT numero, categoria FROM Treni WHERE destinazione = 'Milano';

--q2: Trova tutti i treni diretti a Milano che sono Alta Velocità
SELECT numero, categoria FROM Treni WHERE destinazione = 'Milano' AND categoria = 'Alta Velocità';

--q3: Trova tutti i treni che si fermano a Firenze
SELECT num_treno, nome_stazione FROM Stazioni INNER JOIN Fermate ON fermate.id_stazione = Stazioni.id_stazione AND Stazioni.nome_stazione = 'Firenze';
SELECT num_treno, nome_stazione FROM Stazioni WHERE fermate.id_stazione = Stazioni.id_stazione AND nome_stazione = 'Firenze';

--q4: Trova tutte le fermate di un treno specifico, ordinate per ora
SELECT nome_stazione, ora FROM Stazioni INNER JOIN Fermate ON fermate.id_stazione = Stazioni.id_stazione AND num_treno = 101 ORDER BY ora;

--q5: Trova tutti i treni che fermano in una stazione specifica e partono dopo un'ora specifica
SELECT num_treno, ora FROM Fermate WHERE id_stazione = 1 AND ora > '10:00:00';

--q6: Trova tutti i treni che partono da una stazione e arrivano a una destinazione
SELECT num_treno, destinazione FROM Treni WHERE destinazione = 'Milano' AND num_treno IN (SELECT num_treno FROM Fermate WHERE id_stazione = 1);