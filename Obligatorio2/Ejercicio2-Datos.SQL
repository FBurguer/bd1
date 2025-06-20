-- PERSONAJES
INSERT INTO personaje VALUES ('Joker', 80, 90, 95, 1000, 200);
INSERT INTO personaje VALUES ('Morgana', 60, 95, 85, 850, 180);
INSERT INTO personaje VALUES ('Skull', 95, 70, 60, 750, 160);
INSERT INTO personaje VALUES ('Panther', 55, 80, 90, 700, 140);
INSERT INTO personaje VALUES ('Fox', 85, 85, 70, 800, 170);
INSERT INTO personaje VALUES ('Queen', 75, 80, 88, 900, 190);
INSERT INTO personaje VALUES ('Oracle', 40, 70, 99, 600, 120);
INSERT INTO personaje VALUES ('Noir', 70, 75, 85, 820, 150);

-- JUGADORES
INSERT INTO jugador VALUES ('joker@p5.jp', 'Ren Amamiya', TO_DATE('01/01/2023', 'DD/MM/YYYY'), 'Japón', 'Joker');
INSERT INTO jugador VALUES ('morgana@p5.jp', 'Morgana', TO_DATE('02/01/2023', 'DD/MM/YYYY'), 'Japón', 'Morgana');
INSERT INTO jugador VALUES ('ryuji@p5.jp', 'Ryuji Sakamoto', TO_DATE('03/01/2023', 'DD/MM/YYYY'), 'Japón', 'Skull');
INSERT INTO jugador VALUES ('ann@p5.jp', 'Ann Takamaki', TO_DATE('04/01/2023', 'DD/MM/YYYY'), 'Japón', 'Panther');
INSERT INTO jugador VALUES ('yusuke@p5.jp', 'Yusuke Kitagawa', TO_DATE('05/01/2023', 'DD/MM/YYYY'), 'Japón', 'Fox');
INSERT INTO jugador VALUES ('makoto@p5.jp', 'Makoto Niijima', TO_DATE('06/01/2023', 'DD/MM/YYYY'), 'Japón', 'Queen');
INSERT INTO jugador VALUES ('futaba@p5.jp', 'Futaba Sakura', TO_DATE('07/01/2023', 'DD/MM/YYYY'), 'Japón', 'Oracle');
INSERT INTO jugador VALUES ('haru@p5.jp', 'Haru Okumura', TO_DATE('08/01/2023', 'DD/MM/YYYY'), 'Japón', 'Noir');

-- MISIONES
INSERT INTO mision VALUES (1001, 'Asalto al Palacio', 'Infiltración completa', 'especial', 500);
INSERT INTO mision VALUES (1002, 'Infiltrar Mementos', 'Recolección de info', 'principal', 400);
INSERT INTO mision VALUES (1003, 'Protección de Aliado', 'Defensa en batalla', 'secundaria', 300);
INSERT INTO mision VALUES (1004, 'Mision super especial', 'Esta mision es especial', 'especial', 100);
INSERT INTO mision VALUES (1005, 'Mision secreta', 'Esta mision es secreta shhh', 'especial', 100);
INSERT INTO mision VALUES (1006, 'Investigación Nocturna', 'Recolectar evidencia sin ser visto', 'principal', 450);
INSERT INTO mision VALUES (1007, 'Operación Amanecer', 'Ataque coordinado al amanecer', 'principal', 470);
INSERT INTO mision VALUES (1008, 'Rescate de Emergencia', 'Salvar a un rehén en tiempo límite', 'principal', 420);

-- MISIONES JUGADOR
INSERT INTO mision_jugador VALUES (1002, 'joker@p5.jp', TO_DATE('10/02/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1001, 'morgana@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1002, 'ryuji@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1002, 'ann@p5.jp', TO_DATE('10/02/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1001, 'ann@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');

INSERT INTO mision_jugador VALUES (1002, 'makoto@p5.jp', TO_DATE('10/02/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1001, 'makoto@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1005, 'makoto@p5.jp', TO_DATE('10/02/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1006, 'makoto@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');

INSERT INTO mision_jugador VALUES (1001, 'yusuke@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1002, 'yusuke@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1006, 'yusuke@p5.jp', TO_DATE('10/02/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1007, 'yusuke@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1008, 'yusuke@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');


--LOGROS

--Joker tiene un logro en mision principal pero es anterior a los 15 dias, por lo tanto Joker no debe ser listado
INSERT INTO logro VALUES ('Sigilo Supremo', 'Finalizar sin ser detectado', 1002, 'joker@p5.jp', 150, SYSDATE - 15);

--Morgana tiene un logro en mision especial pero es anterior a los 15 dias, por lo tanto Morgana no debe ser listado
INSERT INTO logro VALUES ('Apoyo Vital', 'Curar a 3 aliados', 1001, 'makoto@p5.jp', 120, SYSDATE - 15);

--Skull tiene un logro de mision principal pero da menos de 50 puntos, por lo tanto Skull no debe ser listado
INSERT INTO logro VALUES ('Destructor', 'Eliminar 5 enemigos', 1002, 'ryuji@p5.jp', 49, SYSDATE - 3);

--Panther tiene un logro dentro de los 15 dias en mision principal que da mas de 50 puntos y otro de mision especial que da menos de 50 puntos
--Como el logro en mision principal no dio mas de 50 puntos, significa que Panther no tiene un logro pincipal y un logro de mision especial
-- que cumplan las condiciones simultaneamente, por lo tanto, Panther debe ser listada
INSERT INTO logro VALUES ('Impacto Floral', 'Ataque final con estilo', 1001, 'ann@p5.jp', 120, SYSDATE - 3);
INSERT INTO logro VALUES ('Estratega', 'Derrotar sin recibir daño', 1002, 'ann@p5.jp', 50, SYSDATE - 3);

--Queen tiene 4 logros, 2 de misiones especiales y 2 de misiones principales, 
--Sigilo Supremo+ es anterior a 15 dias y Maestro del Arte da menos de 40 puntos, por lo tanto no son considerados
-- Imparable y Técnica Precisa cumplen las condiciones de ser de mision principal y especial, dan mas de 50 puntos y fueron obtenidos en menos de 15 dias
-- pero como Queen tiene esos dos logros simultaneamente, no es listada
INSERT INTO logro VALUES ('Sigilo Supremo+', 'Finalizar sin ser detectado otra vez', 1005, 'makoto@p5.jp', 100, SYSDATE - 15);
INSERT INTO logro VALUES ('Maestro del Arte', 'Derrotar al jefe', 1006, 'makoto@p5.jp', 40, SYSDATE - 14);
INSERT INTO logro VALUES ('Imparable', 'Derrotar al jefe sin morir', 1001, 'makoto@p5.jp', 55, SYSDATE - 5);
INSERT INTO logro VALUES ('Técnica Precisa', 'No fallar ni un ataque',1002, 'makoto@p5.jp', 100, SYSDATE - 10);

--Fox tiene un logro de mision especial que cumple las condiciones y 4 de misiones principales que no
-- Por lo tanto, debe ser listado
INSERT INTO logro VALUES ('Maestro del Sigilo', 'No ser detectado en toda la misión', 1001, 'yusuke@p5.jp', 110, SYSDATE - 5);
INSERT INTO logro VALUES ('Despertar de la Magia', 'Curar a 5 aliados en una batalla', 1002, 'yusuke@p5.jp', 50, SYSDATE - 5);
INSERT INTO logro VALUES ('Tiempo Perfecto', 'Completar la misión en tiempo récord', 1006, 'yusuke@p5.jp', 120, SYSDATE - 15);
INSERT INTO logro VALUES ('Asesino Fantasma', 'Eliminar sin ser visto', 1007, 'yusuke@p5.jp', 50, SYSDATE - 15);
INSERT INTO logro VALUES ('Analista Estratégico', 'Planear ruta perfecta',1008, 'yusuke@p5.jp', 40, SYSDATE - 20);