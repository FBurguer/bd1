/*
1) Obtener el nombre y el email de los jugadores que tengan el registro más reciente
considerando aquellos jugadores cuyo personaje solo tenga habilidades de defensa.
*/
Fecha_Mas_Reciente ← (Fmax(Fecha)(JUGADOR))

Jugadores_Mas_Recientes ← 
	πNOMBREPERSONAJE(σ
	Fecha = Fecha_Mas_Reciente
	∧ 
	Funcion = 'Defensa'
	(HABILIDAD_PERSONAJE⨝HABILIDAD))
	
Jugadores_Con_MagiaAtaque ←	
  πNOMBREPERSONAJE(σ
  Funcion = 'Magia' ∨ Funcion = 'Ataque'
  (HABILIDAD_PERSONAJE⨝HABILIDAD))
	
R ← πNOMBREPERSONAJE,EMAIL
((Jugadores_Mas_Recientes - Jugadores_Con_MagiaAtaque)⨝JUGADOR)

/*
2) Obtener el nombre, la fuerza y agilidad de los personajes de aquellos jugadores que hayan
tenido logros en misiones principales o especiales pero no ambas. Considerar los logros
alcanzados en los últimos 15 días y que hayan otorgado más de 50 puntos.
*/
Personajes_1 ←
πNOMBREPERSONAJE
(σ(TIPO = 'PRINCIPAL' ∨ TIPO = 'Especial')
∧ PUNTOS > 50
∧ EN_DIAS(FECHA_LOGRO) >= EN_DIAS(Fecha de hoy) - 15)
(MISION_JUGADOR⨝MISION⨝LOGRO(FECHA_LOGRO←FECHA)⨝JUGADOR)

Personajes_2 ←
πNOMBREPERSONAJE
(σ(TIPO = 'PRINCIPAL')
∧ PUNTOS > 50
∧ EN_DIAS(FECHA_LOGRO) >= EN_DIAS(Fecha de hoy) - 15)
(MISION_JUGADOR⨝MISION⨝LOGRO(FECHA_LOGRO←FECHA)⨝JUGADOR)

Personajes_3 ←
πNOMBREPERSONAJE
(σ(TIPO = 'Especial')
∧ PUNTOS > 50
∧ EN_DIAS(FECHA_LOGRO) >= EN_DIAS(Fecha de hoy) - 15)
(MISION_JUGADOR⨝MISION⨝LOGRO(FECHA_LOGRO←FECHA)⨝JUGADOR)

R ← πNOMBREPERSONAJE, FUERZA, AGILIDAD (
	(PERSONAJES_1 - (PERSONAJES_2 ∩ PERSONAJES_3))⨝PERSONAJE)

/*
3) Obtener el nombre y país de los jugadores que no hayan tenido logros en misiones
secundarias en el mes de Abril del 2025 considerando solamente jugadores cuyo personaje
no tenga habilidades de magia.
*/

Jugs_Con_Log_Sec ← 
πNOMBRE(
	σTIPO = 'Secundaria' 
	∧ 
	FECHA_LOGRO >= '01/04/2025' 
	∧
	FECHA_LOGRO =< '30/04/2025'
	(LOGRO(FECHA_LOGRO ← FECHA)⨝MISION_JUGADOR⨝JUGADOR⨝MISION
	)
)

Jugs_Con_Magia ← 
πNOMBRE(
	σFuncion = 'Magia'
	(HABILIDAD_PERSONAJE⨝JUGADOR⨝HABILIDAD)
)

R ← πNOMBRE,PAIS(
	(πNOMBRE(JUGADOR) - (Jugs_Con_Log_Sec ∩ Jugs_Con_Magia))⨝JUGADOR)


/*
4) Obtener el nombre del personaje, la experiencia y las horas de juego para aquellos jugadores
cuyo personaje tenga todas las habilidades de función ‘ataque’. Considerar solamente los
jugadores que tengan misiones ‘en progreso’.
*/
Pjs_Con_TAtq ←
πNOMBREPERSONAJE, ID(HABILIDAD_PERSONAJE)
÷
πID(σFUNCION = 'Ataque'(HABILIDAD))

Pjs_Con_MisProg ← 
πNOMBREPERSONAJE(
σESTADO = 'en progreso'(MISION_JUGADOR⨝JUGADOR)
)
R ← πNOMBREPERSONAJE, EXPERIENCIA, HORAS(
	(Pjs_Con_TAtq ∩ Pjs_Con_MisProg)⨝(PERSONAJE)
)

/*
5) Obtener el nombre de los personajes que tienen la menor cantidad de horas de juego.
Considerar los personajes que tienen la habilidad de defensa y que hayan tenido logros
durante Marzo de 2025 en misiones completadas. 
*/
Personajes_Con_Defensa ← 
πNOMBREPERSONAJE(σFuncion = 'Defensa'
	(HABILIDAD_PERSONAJE⨝HABILIDAD))
	
Horas_Minimo ← Fmin(Horas)(PERSONAJE)

Pjs_MisComp_LogEnMar ← 
πNOMBREPERSONAJE(
	σEstado = 'Completada' 
	∧ 
	FECHA_LOGRO >= '01/03/2025' 
	∧
	FECHA_LOGRO =< '31/03/2025'
	(LOGRO(FECHA_LOGRO ← FECHA)⨝MISION_JUGADOR⨝JUGADOR⨝MISION
	)
)

πNOMBREPERSONAJE(σHoras = Horas_Minimo
((Personajes_Con_Defensa ∩ Pjs_MisComp_LogEnMar)⨝PERSONAJE))