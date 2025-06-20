/*
7) Obtener el nombre y descripción de las misiones especiales que tengan la mayor cantidad de
puntos obtenidos en sus logros. Considerar solamente las misiones y los logros de jugadores
de Uruguay, Argentina y Brasil.
*/
SELECT m.NOMBRE, m.DESCRIPCION FROM MISION m 
WHERE EXISTS (
    SELECT 1 
    FROM LOGRO l, MISION_JUGADOR mj, MISION m, JUGADOR j
    WHERE l.CODIGO = mj.CODIGO
      AND l.EMAIL = mj.EMAIL
      AND mj.CODIGO = m.CODIGO
      AND mj.EMAIL = j.EMAIL
      AND LOWER(m.TIPO) = 'especial'
      AND UPPER(j.PAIS) IN ('URUGUAY', 'ARGENTINA', 'BRASIL')
    GROUP BY m.CODIGO
    HAVING SUM(l.PUNTOS) = (
        SELECT MAX(SUM(l.PUNTOS)) 
        FROM LOGRO l, MISION_JUGADOR mj, MISION m, JUGADOR j
        WHERE l.CODIGO = mj.CODIGO
          AND l.EMAIL = mj.EMAIL
          AND mj.CODIGO = m.CODIGO
          AND mj.EMAIL = j.EMAIL
          AND LOWER(m.TIPO) = 'especial' 
          AND UPPER(j.PAIS) IN ('URUGUAY', 'ARGENTINA', 'BRASIL')
        GROUP BY mj.CODIGO
    )
)

