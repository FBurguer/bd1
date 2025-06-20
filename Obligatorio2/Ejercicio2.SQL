/*
2) Obtener el nombre, la fuerza y agilidad de los personajes de aquellos jugadores que hayan
tenido logros en misiones principales o especiales pero no ambas. Considerar los logros
alcanzados en los últimos 15 días y que hayan otorgado más de 50 puntos.
*/
SELECT p.NOMBREPERSONAJE, p.FUERZA, p.AGILIDAD 
    FROM JUGADOR j, PERSONAJE p, MISION_JUGADOR mj, LOGRO l, MISION m
    WHERE p.NOMBREPERSONAJE = j.NOMBREPERSONAJE
    AND mj.EMAIL = j.EMAIL 
    AND l.CODIGO = mj.CODIGO
    AND l.EMAIL = j.EMAIL
    AND mj.CODIGO = m.CODIGO
    AND (UPPER(m.TIPO) = 'PRINCIPAL' or UPPER(m.TIPO) = 'ESPECIAL')
    AND l.puntos > 50
    AND TRUNC(l.FECHA) > TRUNC(SYSDATE) - 15
MINUS 
SELECT p.NOMBREPERSONAJE, p.FUERZA, p.AGILIDAD 
    FROM JUGADOR j, PERSONAJE p, MISION_JUGADOR mj, LOGRO l, MISION m
    WHERE p.NOMBREPERSONAJE = j.NOMBREPERSONAJE
    AND mj.EMAIL = j.EMAIL
    AND l.CODIGO = mj.CODIGO
    AND l.EMAIL = j.EMAIL
    AND mj.CODIGO = m.CODIGO
    AND UPPER(m.TIPO) = 'PRINCIPAL' 
    AND l.puntos > 50
    AND TRUNC(l.FECHA) > TRUNC(SYSDATE) - 15
INTERSECT
SELECT p.NOMBREPERSONAJE, p.FUERZA, p.AGILIDAD 
    FROM JUGADOR j, PERSONAJE p, MISION_JUGADOR mj, LOGRO l, MISION m
    WHERE p.NOMBREPERSONAJE = j.NOMBREPERSONAJE
    AND mj.EMAIL = j.EMAIL
    AND l.CODIGO = mj.CODIGO
    AND l.EMAIL = j.EMAIL
    AND mj.CODIGO = m.CODIGO
    AND UPPER(m.TIPO) = 'ESPECIAL' 
    AND l.puntos > 50
    AND TRUNC(l.FECHA) > TRUNC(SYSDATE) - 15
);


