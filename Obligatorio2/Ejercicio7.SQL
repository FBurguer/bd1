/*
7) Obtener el nombre y descripción de las misiones especiales que tengan la mayor cantidad de
puntos obtenidos en sus logros. Considerar solamente las misiones y los logros de jugadores
de Uruguay, Argentina y Brasil.
*/

/*
Se obtienen el nombre y la descripción de las misiones cuyo código esté incluido 
en el resultado de la siguiente subconsulta.
*/
SELECT m.NOMBRE, m.DESCRIPCION FROM MISION m 
WHERE EXISTS (
    /*
    Esta subconsulta obtiene los códigos de las misiones de tipo 'especial' 
    cuya sumatoria de puntos obtenidos por jugadores de Uruguay, Argentina y Brasil 
    sea igual al máximo entre todas las misiones especiales realizadas por jugadores 
    de esos países.
    */
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
        /*
        Esta subconsulta devuelve la mayor suma de puntos obtenidos en misiones 
        de tipo 'especial' por jugadores de Uruguay, Argentina y Brasil.
        */
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

