/*
4) Obtener el nombre del personaje, la experiencia y las horas de juego para aquellos jugadores
cuyo personaje tenga todas las habilidades de función ‘ataque’. Considerar solamente los
jugadores que tengan misiones ‘en progreso’
*/
SELECT p.NOMBREPERSONAJE, p.EXPERIENCIA, p.HORAS 
    FROM PERSONAJE p
    WHERE 
        EXISTS (
            SELECT 1 
            FROM JUGADOR j, MISION_JUGADOR mj 
            WHERE j.EMAIL = mj.EMAIL 
            AND j.NOMBREPERSONAJE = p.NOMBREPERSONAJE
            AND UPPER(mj.estado) = 'EN PROGRESO'
            )
		 AND EXISTS ( 
				        SELECT 1 
				        FROM HABILIDAD h
				        WHERE UPPER(h.FUNCION) = 'ATAQUE'
				        ); 
        AND NOT EXISTS (
				            SELECT 1 
				            FROM HABILIDAD h
				            WHERE UPPER(h.FUNCION) = 'ATAQUE'
				            AND NOT EXISTS(
				                SELECT 1 
				                FROM HABILIDAD_PERSONAJE hp
				                WHERE h.ID = hp.ID
				                AND hp.NOMBREPERSONAJE = p.NOMBREPERSONAJE 
				            ) 
        );