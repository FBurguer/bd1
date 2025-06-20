/*
8) Mostrar el nombre y la función de las habilidades que poseen los personajes con la mayor
cantidad de misiones principales en progreso. Considerar las habilidades para aquellos
personajes que no han tenido logros aún en dichas misiones. En el caso que exista más de
una habilidad que cumpla con condiciones, devolverlas a todas.
*/
SELECT h.NOMBRE, h.FUNCION FROM HABILIDAD h, HABILIDAD_PERSONAJE hp 
WHERE h.ID = hp.ID
AND hp.NOMBREPERSONAJE IN (
    SELECT j.NOMBREPERSONAJE FROM MISION_JUGADOR mj, MISION m, JUGADOR j
    WHERE mj.CODIGO = m.CODIGO
    AND mj.EMAIL = j.EMAIL
    AND UPPER(mj.ESTADO) = 'EN PROGRESO'
    AND UPPER(m.TIPO) = 'PRINCIPAL'
    AND NOT EXISTS(
            SELECT 1 FROM LOGRO l
            WHERE l.EMAIL = mj.EMAIL
            and l.CODIGO = mj.CODIGO
        )
    GROUP BY j.NOMBREPERSONAJE
    HAVING COUNT(*) = (
        SELECT MAX(COUNT(*))
        FROM MISION_JUGADOR mj, MISION m, JUGADOR j
        WHERE mj.CODIGO = m.CODIGO
        AND mj.EMAIL = j.EMAIL
        AND UPPER(mj.ESTADO) = 'EN PROGRESO'
        AND UPPER(m.TIPO) = 'PRINCIPAL'
        AND NOT EXISTS(
            SELECT 1 FROM LOGRO l
            WHERE l.EMAIL = mj.EMAIL
            and l.CODIGO = mj.CODIGO
        )
        GROUP BY j.NOMBREPERSONAJE
    )
)
