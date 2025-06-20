/*
5) Obtener el nombre de los personajes que tienen la menor cantidad de horas de juego.
Considerar los personajes que tienen la habilidad de defensa y que hayan tenido logros
durante Marzo de 2025 en misiones completadas. 
*/
/* Esta consulta no introduce nada nuevo que no hayamos hecho en otro ejercicio*/
SELECT NOMBREPERSONAJE FROM PERSONAJE p
WHERE 
    EXISTS (SELECT 1 FROM HABILIDAD_PERSONAJE hp, HABILIDAD h 
                WHERE hp.ID = h.ID
                AND hp.NOMBREPERSONAJE = p.NOMBREPERSONAJE
                AND UPPER(h.FUNCION) = 'DEFENSA'
    ) -- Consideramos personajes que tienen al menos una habilidad de defensa
    AND
    p.HORAS = (SELECT MIN(p2.HORAS) FROM PERSONAJE p2)
    -- Para considerar el personaje en el resultado, debe de tener las 
    -- horas iguales al menor valor de horas en la tabla personaje
    AND 
    EXISTS (SELECT 1 FROM  JUGADOR j, MISION_JUGADOR mj, MISION m, LOGRO l 
                WHERE p.NOMBREPERSONAJE = j.NOMBREPERSONAJE
                AND j.EMAIL = mj.EMAIL
                AND mj.CODIGO = m.CODIGO
                AND LOWER(mj.ESTADO) = 'completada'
                AND l.CODIGO = mj.CODIGO
                AND l.EMAIL = j.EMAIL
                AND l.fecha BETWEEN TO_DATE('01/03/2025', 'DD/MM/YYYY') 
                                     AND TO_DATE('31/03/2025', 'DD/MM/YYYY'));
                
     -- Solo consideramos personajes que obtuvieron logros de misiones completadas
     -- en marzo