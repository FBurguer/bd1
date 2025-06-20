-- PERSONAJES
INSERT INTO personaje VALUES ('Joker', 80, 90, 95, 1000, 200);
INSERT INTO personaje VALUES ('Morgana', 60, 95, 85, 850, 180);
INSERT INTO personaje VALUES ('Skull', 95, 70, 60, 750, 160);
INSERT INTO personaje VALUES ('Panther', 55, 80, 90, 700, 140);
INSERT INTO personaje VALUES ('Fox', 85, 85, 70, 800, 170);
INSERT INTO personaje VALUES ('Queen', 75, 80, 88, 900, 190);
INSERT INTO personaje VALUES ('Oracle', 40, 70, 99, 600, 70);
INSERT INTO personaje VALUES ('Noir', 70, 75, 85, 820, 70);

-- HABILIDADES
INSERT INTO habilidad VALUES (1, 'Cuchilla Fantasma', 50, 'ataque');
INSERT INTO habilidad VALUES (2, 'Curación', 40, 'magia');
INSERT INTO habilidad VALUES (3, 'Cañón Pesado', 60, 'ataque');
INSERT INTO habilidad VALUES (4, 'Barrera Psíquica', 30, 'defensa');
INSERT INTO habilidad VALUES (5, 'Hackeo Mental', 35, 'magia');
INSERT INTO habilidad VALUES (6, 'Escudo Luz', 45, 'defensa');

-- HABILIDAD_PERSONAJE
INSERT INTO habilidad_personaje VALUES ('Joker', 1);
INSERT INTO habilidad_personaje VALUES ('Morgana', 2);
INSERT INTO habilidad_personaje VALUES ('Skull', 3);
INSERT INTO habilidad_personaje VALUES ('Panther', 2);
INSERT INTO habilidad_personaje VALUES ('Fox', 1);
INSERT INTO habilidad_personaje VALUES ('Fox', 3);
INSERT INTO habilidad_personaje VALUES ('Queen', 4);
INSERT INTO habilidad_personaje VALUES ('Oracle', 5);
INSERT INTO habilidad_personaje VALUES ('Noir', 6);
INSERT INTO habilidad_personaje VALUES ('Joker', 4);
INSERT INTO habilidad_personaje VALUES ('Queen', 6);
INSERT INTO habilidad_personaje VALUES ('Oracle', 1);
INSERT INTO habilidad_personaje VALUES ('Panther', 1);
INSERT INTO habilidad_personaje VALUES ('Noir', 1);
INSERT INTO habilidad_personaje VALUES ('Oracle', 6);


-- JUGADORES
INSERT INTO jugador VALUES ('joker@p5.jp', 'Ren Amamiya', TO_DATE('01/01/2023', 'DD/MM/YYYY'), 'Japón', 'Joker');
INSERT INTO jugador VALUES ('morgana@p5.jp', 'Morgana', TO_DATE('02/01/2023', 'DD/MM/YYYY'), 'Japón', 'Morgana');
INSERT INTO jugador VALUES ('ryuji@p5.jp', 'Ryuji Sakamoto', TO_DATE('03/01/2023', 'DD/MM/YYYY'), 'Japón', 'Skull');
INSERT INTO jugador VALUES ('ann@p5.jp', 'Ann Takamaki', TO_DATE('04/01/2023', 'DD/MM/YYYY'), 'Japón', 'Panther');
INSERT INTO jugador VALUES ('yusuke@p5.jp', 'Yusuke Kitagawa', TO_DATE('05/01/2023', 'DD/MM/YYYY'), 'Japón', 'Fox');
INSERT INTO jugador VALUES ('makoto@p5.jp', 'Makoto Niijima', TO_DATE('06/01/2024', 'DD/MM/YYYY'), 'Japón', 'Queen');
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
INSERT INTO mision VALUES (1009, 'Entrega Rápida', 'Llevar un objeto antes de que anochezca', 'secundaria', 150);
INSERT INTO mision VALUES (1010, 'Mensaje Criptografiado', 'Descifrar un mensaje secreto', 'secundaria', 180);
INSERT INTO mision VALUES (1011, 'Guardia del Portal', 'Evitar que enemigos entren por 3 turnos', 'secundaria', 200);
INSERT INTO mision VALUES (1012, 'Búsqueda del Tesoro', 'Encontrar el objeto oculto en el mapa', 'secundaria', 170);
INSERT INTO mision VALUES (1013, 'Prueba de Coraje', 'Superar una emboscada sin ayuda', 'secundaria', 190);


-- MISION_JUGADOR
INSERT INTO mision_jugador VALUES (1001, 'joker@p5.jp', TO_DATE('10/02/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1001, 'morgana@p5.jp', TO_DATE('22/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1009, 'haru@p5.jp', TO_DATE('18/06/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1003, 'futaba@p5.jp', TO_DATE('18/06/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1002, 'makoto@p5.jp', TO_DATE('15/03/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1002, 'ryuji@p5.jp', TO_DATE('15/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1003, 'ryuji@p5.jp', TO_DATE('05/01/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1003, 'makoto@p5.jp', TO_DATE('20/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1004, 'yusuke@p5.jp', TO_DATE('25/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1004, 'ryuji@p5.jp', TO_DATE('15/01/2025','DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1004, 'haru@p5.jp', TO_DATE('18/06/2025', 'DD/MM/YYYY'), 'completada');
INSERT INTO mision_jugador VALUES (1002, 'ann@p5.jp', TO_DATE('18/06/2025', 'DD/MM/YYYY'), 'completada');

INSERT INTO mision_jugador VALUES (1007, 'futaba@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1008, 'futaba@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1007, 'ryuji@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1008, 'ryuji@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1007, 'makoto@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1008, 'makoto@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1006, 'makoto@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1002, 'makoto@p5.jp', NULL, 'en progreso');

INSERT INTO mision_jugador VALUES (1001, 'yusuke@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1008, 'yusuke@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1006, 'yusuke@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1007, 'yusuke@p5.jp', NULL, 'en progreso');


INSERT INTO mision_jugador VALUES (1001, 'futaba@p5.jp', NULL, 'no iniciada');
INSERT INTO mision_jugador VALUES (1001, 'haru@p5.jp', NULL, 'no iniciada');


-- LOGROS
INSERT INTO logro VALUES ('Sigilo Supremo', 'Finalizar sin ser detectado', 1001, 'joker@p5.jp', 150, TO_DATE('10/06/2025', 'DD/MM/YYYY'));
INSERT INTO logro VALUES ('Apoyo Vital', 'Curar a 3 aliados', 1002, 'makoto@p5.jp', 120, TO_DATE('15/06/2025', 'DD/MM/YYYY'));
INSERT INTO logro VALUES ('Destructor', 'Eliminar 5 enemigos', 1003, 'ryuji@p5.jp', 100, TO_DATE('05/04/2025', 'DD/MM/YYYY'));
INSERT INTO logro VALUES ('Impacto Floral', 'Ataque final con estilo', 1004, 'haru@p5.jp', 90, TO_DATE('18/03/2025', 'DD/MM/YYYY'));
INSERT INTO logro VALUES ('Estratega', 'Derrotar sin recibir daño', 1002, 'ann@p5.jp', 95, TO_DATE('18/06/2025', 'DD/MM/YYYY'));
INSERT INTO logro VALUES ('Sigilo Supremo+', 'Finalizar sin ser detectado otra vez', 1004, 'yusuke@p5.jp', 100, TO_DATE('18/05/2025', 'DD/MM/YYYY'));
INSERT INTO logro VALUES ('Maestro del Arte', 'Derrotar al jefe', 1002, 'yusuke@p5.jp', 110, TO_DATE('18/06/2025', 'DD/MM/YYYY'));
INSERT INTO logro VALUES ('Imparable', 'Derrotar al jefe sin morir', 1008, 'makoto@p5.jp', 55, TO_DATE('18/06/2025', 'DD/MM/YYYY'));
INSERT INTO logro VALUES ('Maestro del Sigilo', 'No ser detectado en toda la misión', 1001, 'yusuke@p5.jp', 110, SYSDATE - 5);
