-- creazione DATABASE
CREATE DATABASE Buzzi;

-- creazione TABLE Studenti
CREATE TABLE Studenti (
	CodFisc CHAR(16) NOT NULL PRIMARY KEY,
	Nome VARCHAR(32) NOT NULL,
	Cognome VARCHAR(32) NOT NULL,
	Data_Nascita DATE NOT NULL,
	Indirizzo VARCHAR(32) NOT NULL
);

-- inserimento dati in TABLE Studenti
INSERT INTO Studenti
VALUES 
('MCHMRC05T05D612M', 'Marco', 'Macherelli', '2005-12-05', 'Via Palermo 2 Prato'),
('RSSLCA06T05D612R', 'Luca', 'Rossi', '2006-12-05', 'Via Milano 18 Prato'),
('MURFBO07T18D612U', 'Fabio', 'Mauri', '2007-12-18', 'Via Mozart 88 Prato'),
('ATNNIO07T20D612M', 'Ninno', 'Antonio', '2007-12-20', 'Viale Santi 111 Prato');

-- modifica della TABLE
ALTER TABLE Studenti
ADD COLUMN Classe CHAR(2) NOT NULL;

-- inserimento dati in TABLE Studenti
INSERT INTO Studenti
VALUES 
('MURFLP05T05D612M', 'Mauro', 'Filippi', '2005-12-05', 'Piazza San Bartolomeo 50 Prato', '5A'),
('PTRSMN05T05D612R', 'Pietro', 'Simone', '2005-12-05', 'Via Cancelli neri 87 Prato', '3F'),

-- modifica della TABLE
ALTER TABLE Studenti
MODIFY COLUMN Classe CHAR(2) DEFAULT '5Q';

-- inserimento dati in TABLE Studenti
INSERT INTO Studenti
VALUES 
('CPRGIN05T05D612M', 'Gianni', 'Capri', '2005-12-05', 'Piazza San Lorenzo 41 Prato', '4T');

INSERT INTO Studenti (CodFisc, Nome, Cognome, Data_Nascita, Indirizzo)
VALUES
('NRNLRN05T05D612R', 'Lorenzo', 'Nerin', '2005-12-05', 'Via Maria 87 Prato'),
('CLEMSO05T18D612U', 'Massimo', 'Colle', '2005-12-18',  'Viale Giannozzi 10 Prato');
