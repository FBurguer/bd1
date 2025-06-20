/*  
6) Listar el nombre de los personajes que hayan participado en al menos una misión de tipo
‘secundaria’ que obtuvieron una recompensa mayor al promedio de este tipo. Considerar
solamente los personajes con inteligencia superior a su fuerza y su agilidad.
*/
SELECT p.NOMBREPERSONAJE FROM PERSONAJE p 
WHERE EXISTS ( 
			SELECT 1
			FROM JUGADOR j, MISION_JUGADOR mj, MISION m 
			WHERE
				j.EMAIL = mj.EMAIL
				AND mj.CODIGO = m.CODIGO
				AND j.NOMBREPERSONAJE = p.NOMBREPERSONAJE
				AND UPPER(m.TIPO) = 'SECUNDARIA'
				AND m.RECOMPENSA > (
					SELECT AVG(m.RECOMPENSA) 
					FROM MISION m 
					WHERE UPPER(m.TIPO) = 'SECUNDARIA'
					)
			)
			AND p.INTELIGENCIA > p.FUERZA 
			AND p.INTELIGENCIA > p.AGILIDAD