/*
9) Para cada jugador que tenga un personaje sin habilidades de tipo ‘magia’, 
mostrar la cantidad total de logros obtenidos por mes durante 2025, el puntaje 
total acumulado, y la cantidad de misiones distintas en las que participó, 
incluyendo el país del jugador. Además, categorizar el nivel del jugador en ese 
mes como “nivel alto” (más de 200 puntos), “nivel medio” (entre 100 y 200 puntos)
o “nivel bajo” (menos de 100 puntos) usando la sentencia case. Ordenar los
resultados por cantidad de logros de forma descendente.
*/

SELECT 
	j.email, 
	j.pais,
	logXjug.mes as mes, 
	logXjug.cant as cantidad_logro, 
	jugPuntos.suma as total_puntos, 
	misXjug.cant as cantidad_misiones,
CASE 
		WHEN jugPuntos.suma > 200 THEN 'nivel alto'
		WHEN jugPuntos.suma BETWEEN 100 AND 200 THEN 'nivel medio'
		ELSE 'nivel bajo'
END as clasificacion
FROM JUGADOR j, (
	SELECT 
		l.email, 
		COUNT(*) cant, 
		TO_CHAR(fecha, 'YYYY-MM') AS mes
	FROM LOGRO l
	WHERE l.fecha BETWEEN TO_DATE('01/01/2025', 'DD/MM/YYYY') 
			  AND TO_DATE('31/12/2025', 'DD/MM/YYYY')
	GROUP BY EMAIL, TO_CHAR(fecha, 'YYYY-MM')
) logXjug,
(
	SELECT 
		l2.email,
		SUM(l2.puntos) suma
	FROM LOGRO l2
	GROUP BY l2.email
) jugPuntos,
(
	SELECT mj.email, COUNT(*) cant
	FROM MISION_JUGADOR mj
	GROUP BY mj.email
) misXjug

WHERE j.email = logXjug.email
AND j.email = jugPuntos.email
AND j.email = misXjug.email
AND NOT EXISTS(
		SELECT 1 FROM HABILIDAD_PERSONAJE hp, HABILIDAD h 
                WHERE hp.ID = h.ID
                AND hp.NOMBREPERSONAJE = j.NOMBREPERSONAJE
                AND UPPER(h.FUNCION) IN ('MAGIA')
	)
ORDER BY logXjug.cant desc