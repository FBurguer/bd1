/*
10) Obtener para cada habilidad (identificada por su nombre y función), la cantidad total de
personajes que poseen dicha habilidad, junto con el total de misiones completadas por esos
personajes y el promedio de experiencia de los mismos. Incluir la fecha de fin de la misión
más antigua completada por los personajes que tienen esa habilidad. Además, listar el
nombre del personaje que haya alcanzado la recompensa más alta en misiones especiales.
Finalmente, categorizar cada habilidad como “popular” si la poseen más de cinco personajes,
o como “no popular” en caso contrario. En situación de empate, mostrarse todos los
resultados correspondientes.
*/
SELECT 
    h.nombre,
    h.funcion,
    cantPjsPorHab.cant AS cantidad_personajes,
    SUM(cantMisCompPorJugador.cant) AS cantidad_misiones_completadas,
    ROUND(AVG(p.EXPERIENCIA),2) AS promedio_experiencia,
    MIN(fechaFinPorJugador.fechaFin) AS fecha_fin_primera_mision,
    maxRecompensaPjXHab.NOMBREPERSONAJE AS personaje_maxima_recompensa,
    CASE 
        WHEN cantPjsPorHab.cant > 5 THEN 'popular'
        ELSE 'no popular'
    END AS categorizacion
FROM 
    HABILIDAD h,
    HABILIDAD_PERSONAJE hp,
    PERSONAJE p,
    JUGADOR j,
    (
        SELECT hp2.ID, COUNT(*) AS cant
        FROM HABILIDAD_PERSONAJE hp2
        GROUP BY hp2.ID
    ) cantPjsPorHab,
    (
        SELECT p2.NOMBREPERSONAJE, COUNT(*) AS cant
        FROM MISION_JUGADOR mj2, PERSONAJE p2, JUGADOR j2
        WHERE mj2.estado = 'completada'
          AND j2.NOMBREPERSONAJE = p2.NOMBREPERSONAJE
          AND j2.email = mj2.email
        GROUP BY p2.NOMBREPERSONAJE
        UNION
        SELECT p3.NOMBREPERSONAJE, 0 AS cant
        FROM PERSONAJE p3
        WHERE NOT EXISTS (
            SELECT 1 
            FROM JUGADOR j3, MISION_JUGADOR mj3
            WHERE j3.NOMBREPERSONAJE = p3.NOMBREPERSONAJE
              AND mj3.EMAIL = j3.EMAIL
              AND mj3.ESTADO = 'completada'
        )
    ) cantMisCompPorJugador,
    (
        SELECT p4.NOMBREPERSONAJE, MIN(mj4.FECHAFIN) AS fechaFin
        FROM MISION_JUGADOR mj4, PERSONAJE p4, JUGADOR j4
        WHERE j4.NOMBREPERSONAJE = p4.NOMBREPERSONAJE
          AND j4.email = mj4.email
        GROUP BY p4.NOMBREPERSONAJE
        UNION
        SELECT p5.NOMBREPERSONAJE, NULL AS fechaFin
        FROM PERSONAJE p5
        WHERE NOT EXISTS (
            SELECT 1 
            FROM JUGADOR j5, MISION_JUGADOR mj5
            WHERE j5.NOMBREPERSONAJE = p5.NOMBREPERSONAJE
              AND mj5.EMAIL = j5.EMAIL
              AND mj5.FECHAFIN IS NOT NULL
        )
    ) fechaFinPorJugador,
    (
        SELECT hp.id AS id, p.NOMBREPERSONAJE AS nombrepersonaje, MAX(m.recompensa) AS max_recompensa
        FROM HABILIDAD_PERSONAJE hp,
             PERSONAJE p,
             MISION_JUGADOR mj,
             JUGADOR j,
             MISION m
        WHERE m.tipo = 'especial'
          AND hp.NOMBREPERSONAJE = p.NOMBREPERSONAJE
          AND j.NOMBREPERSONAJE = p.NOMBREPERSONAJE
          AND mj.EMAIL = j.EMAIL
          AND mj.CODIGO = m.CODIGO
          AND (hp.id, p.NOMBREPERSONAJE) IN (
              SELECT hp2.id, p2.NOMBREPERSONAJE
              FROM HABILIDAD_PERSONAJE hp2,
                   PERSONAJE p2,
                   JUGADOR j2,
                   MISION_JUGADOR mj2,
                   MISION m2
              WHERE m2.tipo = 'especial'
                AND hp2.NOMBREPERSONAJE = p2.NOMBREPERSONAJE
                AND j2.NOMBREPERSONAJE = p2.NOMBREPERSONAJE
                AND mj2.EMAIL = j2.EMAIL
                AND mj2.CODIGO = m2.CODIGO
                AND m2.RECOMPENSA = (
                    SELECT MAX(m3.RECOMPENSA)
                    FROM HABILIDAD_PERSONAJE hp3,
                         PERSONAJE p3,
                         JUGADOR j3,
                         MISION_JUGADOR mj3,
                         MISION m3
                    WHERE hp3.ID = hp2.ID
                      AND hp3.NOMBREPERSONAJE = p3.NOMBREPERSONAJE
                      AND j3.NOMBREPERSONAJE = p3.NOMBREPERSONAJE
                      AND mj3.EMAIL = j3.EMAIL
                      AND mj3.CODIGO = m3.CODIGO
                      AND m3.TIPO = 'especial'
                )
          )
        GROUP BY hp.id, p.NOMBREPERSONAJE
        UNION
        SELECT h.id AS id, NULL AS nombrepersonaje, NULL AS max_recompensa
        FROM HABILIDAD h
        WHERE NOT EXISTS (
            SELECT 1
            FROM HABILIDAD_PERSONAJE hp,
                 PERSONAJE p,
                 JUGADOR j,
                 MISION_JUGADOR mj,
                 MISION m
            WHERE hp.id = h.id
              AND hp.NOMBREPERSONAJE = p.NOMBREPERSONAJE
              AND j.NOMBREPERSONAJE = p.NOMBREPERSONAJE
              AND mj.EMAIL = j.EMAIL
              AND mj.CODIGO = m.CODIGO
              AND m.tipo = 'especial'
        )
    ) maxRecompensaPjXHab
WHERE 
    h.id = hp.id
    AND hp.NOMBREPERSONAJE = p.NOMBREPERSONAJE
    AND j.NOMBREPERSONAJE = p.NOMBREPERSONAJE
    AND cantPjsPorHab.ID = hp.ID
    AND cantMisCompPorJugador.NOMBREPERSONAJE = p.NOMBREPERSONAJE
    AND fechaFinPorJugador.NOMBREPERSONAJE = p.NOMBREPERSONAJE
    AND maxRecompensaPjXHab.id = h.id
GROUP BY 
    h.nombre, 
    h.funcion, 
    cantPjsPorHab.cant, 
    maxRecompensaPjXHab.NOMBREPERSONAJE;