/*
1) Obtener el nombre y el email de los jugadores que tengan el registro más reciente
considerando aquellos jugadores cuyo personaje solo tenga habilidades de defensa.
*/
SELECT j.NOMBREPERSONAJE, j.EMAIL
FROM JUGADOR j
    WHERE 
    NOT EXISTS (SELECT 1 FROM HABILIDAD_PERSONAJE hp, HABILIDAD h 
                WHERE hp.ID = h.ID
                AND hp.NOMBREPERSONAJE = j.NOMBREPERSONAJE
                AND UPPER(h.FUNCION) IN ('ATAQUE', 'MAGIA')
    ) 
    /* 
    Esto se puede considerar una 'resta' queremos 
    restar los jugadores que tengan habilidades de tipo 'Ataque' o 'Magia' 
    */
    AND EXISTS (SELECT 1 FROM HABILIDAD_PERSONAJE hp, HABILIDAD h 
                WHERE hp.ID = h.ID
                AND hp.NOMBREPERSONAJE = j.NOMBREPERSONAJE
                AND UPPER(h.FUNCION) = 'DEFENSA'
    )
    /* 
    Esta condicion obliga a solo contar jugadores 
    que tengan al menos 1 habilidad de tipo 'Defensa' 
    */
    AND j.FECHA =
        (SELECT MAX(j2.FECHA) 
        FROM JUGADOR j2)
    /*
    La subconsulta obtiene la fecha 'maxima' o la mas cerca a la actual,
    Entonces si la comparamos a la fecha del jugador, obliga a solo contar jugadores
    con esa fecha de registro
    */
;