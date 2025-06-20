/*
3) Obtener el nombre y país de los jugadores que no hayan tenido logros en misiones
secundarias en el mes de Abril del 2025 considerando solamente jugadores cuyo personaje
no tenga habilidades de magia.
*/
SELECT j.NOMBRE, j.PAIS 
FROM JUGADOR j
WHERE 
NOT EXISTS (SELECT 1 FROM HABILIDAD_PERSONAJE hp, HABILIDAD h 
                WHERE j.NOMBREPERSONAJE = hp.NOMBREPERSONAJE
                AND hp.ID = h.ID
                AND UPPER(h.FUNCION) = 'MAGIA')
                /*
                Queremos restar los jugadores que tengan habilidades de tipo 'Magia'
                */
AND NOT EXISTS (SELECT 1 FROM  MISION_JUGADOR mj, MISION m, LOGRO l 
                WHERE j.EMAIL = mj.EMAIL
                AND mj.CODIGO = m.CODIGO
                AND UPPER(m.TIPO) = 'SECUNDARIA'
                AND l.CODIGO = mj.CODIGO
                AND l.EMAIL = j.EMAIL
                AND l.fecha BETWEEN TO_DATE('01/04/2025', 'DD/MM/YYYY') 
                                     AND TO_DATE('30/04/2025', 'DD/MM/YYYY'));
                /*
                Queremos restar jugadores con logros obtenidos de misiones de tipo 'Secundaria'
                y que fueron obtenidos en abril 2025, o sea, 
                obtenidos entre '01/04/2025' y '30/04/2025'
                */
/*
Como ambas condiciones son en el mismo where y hay un and, significa que la 
cconsulta deberia devolver los jugadores que cumplen ambas condiciones simultaneamente,
no una o la otra
*/