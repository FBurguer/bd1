## Ejercicio1.SQL

**Primera condición del WHERE:**
Esto se puede considerar una 'resta' queremos 
restar los jugadores que tengan habilidades de tipo 'Ataque' o 'Magia' 

**Segunda condición del WHERE:**
Esta condicion obliga a solo contar jugadores 
que tengan al menos 1 habilidad de tipo 'Defensa' 

**Tercera condición del WHERE:**
La subconsulta obtiene la fecha 'maxima' o la mas cerca a la actual,
Entonces si la comparamos a la fecha del jugador, obliga a solo contar jugadores con esa fecha de registro

Al tener las tres condiciones vinculadas por AND, la consulta lista los jugadores que cumplen todas las condiciones.

## Ejercicio2.SQL
**Primer subconsulta:**
La primer subconsulta devuelve los personajes (con su agilidad y fuerza) con logros de misiones principales o de misiones especiales. 
Este ultimo 'o' es no escluyente, osea, devuelve los personajes que tengan algun logro en mision principal, alguno en mision especial o que tengan logros en ambos tipos de mision simultaneamente.

**Segunda subconsulta:**
La segunda subconsulta devuelve los personajes (con su agilidad y fuerza) con logros de misiones principales.

**Tercera subconsulta:**
La tercera subconsulta devuelve los personajes (con su agilidad y fuerza) con logros de misiones especiales.

**Intersección:**
La intersección de las dos subconsultas devuelve los personajes (con su agilidad y fuerza) con logros de misiones principales y de misiones especiales.

**Nota:**
Para calcular que los logros fueron obtenidos en los ultimos 15 días utilizamos ```TRUNC(SYSDATE) - 15```, en ORACLE ```SYSDATE``` es la fecha actual del sistema y ```TRUNC``` 'redondea' la fecha para no incluir la hora, que que no es necesaria, y al restar 15, resta 15 dias a esa fecha.

La consulta final devuelve los personajes (con su agilidad y fuerza) con logros de misiones principales o de misiones especiales, pero no ambas.

## Ejercicio3.SQL
**Primera condición del WHERE:**
La primera condicion del WHERE exije que los jugadores no tengan habilidades de tipo 'Magia'.

**Segunda condición del WHERE:**
La segunda condicion del WHERE exije que los jugadores no tengan logros de tipo 'Secundaria' en abril 2025.

Como ambas condiciones son en el mismo where y hay un and, significa que la consulta deberia devolver los jugadores que cumplen ambas condiciones simultaneamente, no una o la otra.

## Ejercicio4.SQL
**Primera condición del WHERE:**
Exije contar solo personajes con misiones en progreso


**Segunda condición del WHERE:**
Esto valida que al menos exista una habilidad de tipo ataque, para que no devuelva todos los personajes en caso contrario.

**Tercera condición del WHERE:**
Este doble NOT EXISTS, cumple la funcion del cociente, o sea, Personajes que tienen todas las habilidad de 'ataque'

Analogamente al anterior, todas las condiciones estan en el mismo WHERE conectados por AND, entonces, el resultado cumplira todas las condiciones.

## Ejercicio5.SQL
**Primera condición del WHERE:**
Consideramos personajes que tienen al menos una habilidad de defensa

**Segunda condición del WHERE:**
Para considerar el personaje en el resultado, debe de tener las horas iguales al menor valor de horas en la tabla personaje, esto se obtiene mediante una subconsulta usando la funcion de agregacion MIN.

**Tercera condición del WHERE:**
Solo consideramos personajes que obtuvieron logros de misiones completadas en marzo

Analogamente al anterior, todas las condiciones estan en el mismo WHERE conectados por AND, entonces, el resultado cumplira todas las condiciones.


## Ejercicio6.SQL
**Primera condición del WHERE:**
Esta condicion esta construida para tomar en cuenta solo misiones que son parte de una subconsulta, el objetivo de la subconsulta es que se tomen en cuenta misiones con recompensa igual al promedio de recompensa de mision de tipo secundaria, ADEMAS, la condición anterior solo permite misiones de tipo secundaria, resolviendo esa parte del requisito

**Segunda y tercer condición del WHERE:**
Considera personajes que su inteligencia sea mayor a su fuerza y su inteligencia sea mayor a su agilidad, al menos de esta manera lo interpretamos, tambien puede significar que su inteligencia debe ser  mayor a la suma de su fuerza y agilidad entonces la condicion deberia ser algo como: ```AND p.INTELIGENCIA > p.FUERZA + p.AGILIDAD```

Analogamente al anterior, todas las condiciones estan en el mismo WHERE conectados por AND, entonces, el resultado cumplira todas las condiciones.

## Ejercicio7.SQL
Se obtienen el nombre y la descripción de las misiones cuyo código esté incluido en el resultado de la siguiente subconsulta.
Esta subconsulta obtiene los códigos de las misiones de tipo 'especial'  cuya sumatoria de puntos obtenidos por jugadores de Uruguay, Argentina y Brasil  sea igual al máximo entre todas las misiones especiales realizadas por jugadores de esos países, esto se calcula con otra subconsulta, y se compara usando HAVING.


## Ejercicio8.SQL
Obtenmos las habilidades que esten asociadas a los personajes que cumplen las condiciones de una subconsulta mediante IN

La subconsulta dentro del IN exije que los personajes cumplan las siguientes condiciones:
- Que tenga misiones de tipo principal en progreso 
- Que las misiones nombradas no tengan logros asociados
- y la cantidad de misiones asociadas al jugadr es igual al maximo existente de misiones asiociadas a un jugador con esas condiciones.

La ultima condicion se exije mediante HAVING con otra subconsulta que devulve el maximo de misiones asociadas a un mismo jugado que cumplen las primeras dos condiciones.

## Ejercicio9.SQL
Esta consulta se establece utilizando 3 subconsultas en el form, estableciendo 3 tablas temporales y luego se hace el join de las mismas con la tabla JUGADOR y el personaje de los jugadores no tengan habilidades de tipo 'magia', a traves de resta con el NOT EXISTS.
Ademas de clasificar el jugador con CASE, dependiendo de cual es el valor total de puntos obtenido por el jugador.

**Primer subconsulta (logXJug):**
Esta consulta devuelve la cantidad de logros obtenidos por mes en 2025 para jugadores con logros en esos meses
Ejemplo:
Si Joker tiene 1 logro en abril 2025, la subconsulta devolvera:
```Joker - 1 - 04/2025```

**Segunda subconsulta (jugPuntos):**
Esta subconsulta devuelve la suma de los puntos obtenidos por jugador en su totalidad (los logros no deben ser obtenidos necesariamente en 2025 para contar).

**Tercera subconsulta (misXjug):**
Esta subconsulta devuelve la cantidad de misiones que cada jugador participo.

Y finalmente esta ordenado por cantidad de logros obtenidos por jugador.

## Ejercicio10.SQL
Similarmente al ejercicio anterior, este ejercicio necesitaba tambien subconsultas en la seccion de FROM y funciones sobre datos obtenidos de estas subconsultas:

- cantidad_personajes: Cantidad de personajes que tienen la habilidad
- cantidad_misiones_completadas: Devuelve la sumatoria de misiones completas por personajes, por ejemplo:
Si Joker completo la mision 1001 y 1002 y Morgana completo la mision 1001 y ambos tienen la habilidad 1, la habilidad 1 tiene cantidad_misiones_completadas = 3.
- promedio_experiencia: Promedio de experiencia de todos los personajes que tienen la habilidad
- fecha_fin_primera_mision: Fecha mas antigua de completitud de una mision hecha por personajes con la habilidad
- personaje_maxima_recompensa: Es el nombre del personaje con mayor recompensa obtenida en misiones especiales.
- categorizacion: Este CASE es para categorizar dependiendo la cantidad de personajes por habilidad

**Primer subconsulta (cantPjsPorHab):**
Devuelve la cantidad de habilidaes por personaje.

**Segunda subconsulta (cantMisCompPorJugador):**
Esta subconsulta devuelve la cantidad misiones completas por personaje ademas se le hace un union para los casos de personajes sin misiones completadas para un join exitoso luego

**Tercer subconsulta (fechaFinPorJugador):**
Esta subconsulta devuelve el nombre personaje con la menor fecha fin de sus misiones, ademas se le hace un union para personajes sin misiones con fechafin. 

**Cuarta subconsulta (maxRecompensaPjXHab):**
El objetivo de esta subconsulta es devolver las habilidad y nombrepersonajes con la maxima recompensa de mision especial
o sea, que devuelve un registro para cada habilidad y LOS personaje con  maxima recompensa obtenida en misiones especiales, para luego hacer un join con habilidad personje.
Analagamente a la anterior subconsulta, se hace UNION para cuando la habilidad no tiene personajes con misiones especiales

Finalmente se hace JOIN con las tablas temporales obtenidas en la seccion de FROM con la tabla HABILIDAD, HABILIDAD_PERSOANJE, JUGADOR y PERSONAJE.
