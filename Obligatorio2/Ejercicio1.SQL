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
    AND EXISTS (SELECT 1 FROM HABILIDAD_PERSONAJE hp, HABILIDAD h 
                WHERE hp.ID = h.ID
                AND hp.NOMBREPERSONAJE = j.NOMBREPERSONAJE
                AND UPPER(h.FUNCION) = 'DEFENSA'
    )
    AND j.FECHA =
        (SELECT MAX(j2.FECHA) 
        FROM JUGADOR j2);