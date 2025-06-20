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
AND NOT EXISTS (SELECT 1 FROM  MISION_JUGADOR mj, MISION m, LOGRO l 
                WHERE j.EMAIL = mj.EMAIL
                AND mj.CODIGO = m.CODIGO
                AND UPPER(m.TIPO) = 'SECUNDARIA'
                AND l.CODIGO = mj.CODIGO
                AND l.EMAIL = j.EMAIL
                AND l.fecha BETWEEN TO_DATE('01/04/2025', 'DD/MM/YYYY') 
                                     AND TO_DATE('30/04/2025', 'DD/MM/YYYY'));