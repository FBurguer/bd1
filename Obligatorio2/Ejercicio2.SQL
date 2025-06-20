/*
2) Obtener el nombre, la fuerza y agilidad de los personajes de aquellos jugadores que hayan
tenido logros en misiones principales o especiales pero no ambas. Considerar los logros
alcanzados en los últimos 15 días y que hayan otorgado más de 50 puntos.
*/
SELECT p.NOMBREPERSONAJE, p.FUERZA, p.AGILIDAD 
    FROM JUGADOR j, PERSONAJE p, MISION_JUGADOR mj, LOGRO l, MISION m
    WHERE p.NOMBREPERSONAJE = j.NOMBREPERSONAJE --Join de Personaje con Jugador 
    AND mj.EMAIL = j.EMAIL -- Join de Jugador con Mision_Jugador  
    AND l.CODIGO = mj.CODIGO  -- Join de Mision_Jugador con Logro
    AND l.EMAIL = j.EMAIL -- Join de Jugador con Logro
    AND mj.CODIGO = m.CODIGO -- Join de Mision_Jugador con Mision
    AND (UPPER(m.TIPO) = 'PRINCIPAL' or UPPER(m.TIPO) = 'ESPECIAL') -- Misiones que son Principales o Especiales
    AND l.puntos > 50 -- Logros que dan mas de 50 puntos
    AND TRUNC(l.FECHA) > TRUNC(SYSDATE) - 15 -- Logros que se obtuvieron en los ultimos 15 dias
MINUS 
-- Este minus deberia eliminar la interseccion, o sea, 
-- cuando Jugadores con logros de misiones principales Y misiones especiales
(
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
    -- Jugadores con logros en misiones principales
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
    -- Jugadores con logros en misiones especiales
);
/* 
El intersect deberia devolver Jugadores con logros en misiones de tipo 'Principal' 
            Y (ENFASIS EN EL Y) 
en misiones de tipo'Especial'
*/


