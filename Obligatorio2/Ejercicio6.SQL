/*  
6) Listar el nombre de los personajes que hayan participado en al menos una misión de tipo
‘secundaria’ que obtuvieron una recompensa mayor al promedio de este tipo. Considerar
solamente los personajes con inteligencia superior a su fuerza y su agilidad.
*/
SELECT p.NOMBREPERSONAJE FROM PERSONAJE p 
WHERE EXISTS ( SELECT 1
								FROM JUGADOR j, MISION_JUGADOR mj, MISION m 
								WHERE
										j.EMAIL = mj.EMAIL
										AND mj.CODIGO = m.CODIGO
										and j.NOMBREPERSONAJE = p.NOMBREPERSONAJE
										AND UPPER(m.TIPO) = 'SECUNDARIA'
										/* 
										Esta subconsulta hace que solo se tomen en cuenta misiones
										con recompensa igual al promedio de recompensa de mision 
										de tipo secundaria, ADEMAS, la condición anterior solo permite
										misiones de tipo secundaria, resolviendo esa parte del 
										requisito
										*/
										AND m.RECOMPENSA > (SELECT AVG(m.RECOMPENSA) 
																					FROM MISION m 
																					WHERE UPPER(m.TIPO) = 'SECUNDARIA'))
			/*
			Solo considera personajes que su inteligencia sea mayor a su fuerza y
			su inteligencia sea mayor a su agilidad, al menos de esta manera lo 
			interpretamos, tambien puede significar que su inteligencia debe ser 
			mayor a la suma de su fuerza y agilidad entonces la condicion deberia ser 
			algo como:
			and p.INTELIGENCIA > p.FUERZA + p.AGILIDAD
			*/
			AND p.INTELIGENCIA > p.FUERZA 
			AND p.INTELIGENCIA > p.AGILIDAD