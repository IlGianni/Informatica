-- q4: Trova tutte le fermate di un treno specifico, ordinate per ora
SELECT nome_stazione FROM stazioni INNER JOIN fermate
    ON fermate.id_stazione = stazioni.id_stazione
        and num_treno = "102" ORDER BY ora ASC

-- q5: Trova tutti i treni che fermano in una stazione specifica e partono dopo un'ora specifica
SELECT DISTINCT num_treno FROM treni INNER JOIN fermate
    ON fermate.id_stazione = "1"
        and fermate.ora > "09:00:00"

-- q6: Trova tutti i treni che partono da una stazione e arrivano a una destinazione
SELECT DISTINCT num_treno FROM treni INNER JOIN fermate
    ON fermate.id_stazione = "1"
        and treni.destinazione = "Milano"
