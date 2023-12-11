1) SELECT COUNT(*) as numeroBox FROM annessi WHERE tipo = 'box';

2) SELECT * FROM immobili as I inner join annessi as A ON I.idI = A.idI where I.tipo = 'villa' and A.tipo = 'giardino';

3) SELECT SUM(I.superficie), P.cognome FROM proprietari as P INNER JOIN immobili as I on I.idP = P.idP group by P.idP;

4) SELECT * from proprietari as P INNER join immobili as I on I.idP = P.idP where I.tipo = 'villa' group by I.idP;

5) select P.nome, P.cognome from immobili as I inner join proprietari as P on I.idP = P.idP inner join annessi as A on A.idI = I.idI where A.tipo = 'box' and I.tipo = 'appartamento' group by P.idP;

6) SELECT P.nome, P.cognome from immobili as I inner join proprietari as P on I.idP = P.idP where I.anno > 1996 group by P.idP;

7) SELECT SUM(I.vani), P.nome, P.cognome from immobili as I inner join proprietari as P on I.idP = P.idP GROUP by P.idP;

8) SELECT SUM(I.superficie) as somma, P.nome, P.cognome from immobili as I inner join proprietari as P on I.idP = P.idP GROUP by P.idP having somma > 400;
