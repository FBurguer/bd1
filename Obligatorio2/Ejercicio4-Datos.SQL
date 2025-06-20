-- PERSONAJES
INSERT INTO personaje VALUES ('Joker', 80, 90, 95, 1000, 200);
INSERT INTO personaje VALUES ('Morgana', 60, 95, 85, 850, 180);
INSERT INTO personaje VALUES ('Skull', 95, 70, 60, 750, 160);
INSERT INTO personaje VALUES ('Panther', 55, 80, 90, 700, 140);
INSERT INTO personaje VALUES ('Fox', 85, 85, 70, 800, 170);
INSERT INTO personaje VALUES ('Queen', 75, 80, 88, 900, 190);
INSERT INTO personaje VALUES ('Oracle', 40, 70, 99, 600, 120);
INSERT INTO personaje VALUES ('Noir', 70, 75, 85, 820, 150);

-- HABILIDADES
INSERT INTO habilidad VALUES (1, 'Cuchilla Fantasma', 50, 'ataque');
INSERT INTO habilidad VALUES (2, 'Curación', 40, 'magia');
INSERT INTO habilidad VALUES (3, 'Cañón Pesado', 60, 'ataque');
INSERT INTO habilidad VALUES (4, 'Barrera Psíquica', 30, 'defensa');
INSERT INTO habilidad VALUES (5, 'Hackeo Mental', 35, 'magia');
INSERT INTO habilidad VALUES (6, 'Escudo Luz', 45, 'defensa');

-- HABILIDAD_PERSONAJE
INSERT INTO habilidad_personaje VALUES ('Joker', 1);
INSERT INTO habilidad_personaje VALUES ('Joker', 3);
INSERT INTO habilidad_personaje VALUES ('Morgana', 1);
INSERT INTO habilidad_personaje VALUES ('Skull', 3);
INSERT INTO habilidad_personaje VALUES ('Panther', 1);
INSERT INTO habilidad_personaje VALUES ('Panther', 3);

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

-- MISION_JUGADOR
INSERT INTO mision_jugador VALUES (1007, 'joker@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1008, 'morgana@p5.jp', NULL, 'en progreso');
INSERT INTO mision_jugador VALUES (1007, 'ryuji@p5.jp', NULL, 'en progreso');


--Solo Joker y Panther tienen todas las habilidades de ataque, Morgana y Skull tambien tienen habilidades de ataque pero no todas
-- y de los 4, Panther no tiene misiones en progreso
-- Entonces solo debe listar a Joker