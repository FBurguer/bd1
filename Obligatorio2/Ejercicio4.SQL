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
            ) -- Queremos contar solo personajes con misiones en progreso
		 AND EXISTS ( 
				        SELECT 1 
				        FROM HABILIDAD h
				        WHERE UPPER(h.FUNCION) = 'ATAQUE'
				        ); 
        /*
	        Esto valida que al menos exista una habilidad de tipo ataque, 
	        para que no devuelva todos los personajes en caso contrario.
        */
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
        )
        /* 
		        Este doble NOT EXISTS, cumple la funcion del cociente,
		        o sea, Personajes que tienen todas las habilidad de 'ataque'
        */
       
        
/*e
Analogamente al anterior, ambas condiciones estan en el mismo whre conectados
por and, entonces, el resultado cumplira a ambas condiciones.
*/