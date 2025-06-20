ALTER SESSION SET NLS_DATE_FORMAT = 'DD/MM/YYYY';

DROP TABLE logro;
DROP TABLE mision_jugador;
DROP TABLE mision;
DROP TABLE habilidad_personaje;
DROP TABLE habilidad;
DROP TABLE jugador;
DROP TABLE personaje;

CREATE TABLE personaje (
    nombrePersonaje VARCHAR2(30) NOT NULL CONSTRAINT personaje_pk PRIMARY KEY,
    fuerza NUMBER(5),
    agilidad NUMBER(5),
    inteligencia NUMBER(5),
    experiencia NUMBER(5),
    horas NUMBER(5)
);

CREATE TABLE jugador (
    email VARCHAR2(50) NOT NULL CONSTRAINT jugador_pk PRIMARY KEY,
    nombre VARCHAR2(50),
    fecha DATE,
    pais VARCHAR2(30),
    nombrePersonaje VARCHAR2(30),
    CONSTRAINT jugador_to_personaje_fk FOREIGN KEY (nombrePersonaje)
        REFERENCES personaje (nombrePersonaje)
);

CREATE TABLE habilidad (
    id NUMBER(5) NOT NULL CONSTRAINT habilidad_pk PRIMARY KEY,
    nombre VARCHAR2(50),
    minimo NUMBER(5),
    funcion VARCHAR2(10)
        CONSTRAINT habilidad_funcion_ck CHECK (funcion IN ('ataque', 'defensa', 'magia'))
);

CREATE TABLE habilidad_personaje (
    nombrePersonaje VARCHAR2(30),
    id NUMBER(5),
    CONSTRAINT habilidad_personaje_pk PRIMARY KEY (nombrePersonaje, id),
    CONSTRAINT habilidad_personaje_to_personaje_fk FOREIGN KEY (nombrePersonaje)
        REFERENCES personaje (nombrePersonaje),
    CONSTRAINT habilidad_personaje_to_habilidad_fk FOREIGN KEY (id)
        REFERENCES habilidad (id)
);

CREATE TABLE mision (
    codigo NUMBER(8) NOT NULL CONSTRAINT mision_pk PRIMARY KEY,
    nombre VARCHAR2(50),
    descripcion VARCHAR2(200),
    tipo VARCHAR2(15)
        CONSTRAINT mision_tipo_ck CHECK (tipo IN ('principal', 'secundaria', 'especial')),
    recompensa NUMBER(8)
);

CREATE TABLE mision_jugador (
    codigo NUMBER(8),
    email VARCHAR2(50),
    fechaFin DATE,
    estado VARCHAR2(15)
        CONSTRAINT mision_jugador_estado_ck CHECK (estado IN ('no iniciada', 'en progreso', 'completada')),
    CONSTRAINT mision_jugador_pk PRIMARY KEY (codigo, email),
    CONSTRAINT mision_jugador_to_mision_fk FOREIGN KEY (codigo)
        REFERENCES mision (codigo),
    CONSTRAINT mision_jugador_to_jugador_fk FOREIGN KEY (email)
        REFERENCES jugador (email)
);

CREATE TABLE logro (
    nombre VARCHAR2(50) NOT NULL CONSTRAINT logro_pk PRIMARY KEY,
    descripcion VARCHAR2(200),
    codigo NUMBER(8),
    email VARCHAR2(50),
    puntos NUMBER(5),
    fecha DATE,
    CONSTRAINT logro_to_mision_jugador_fk FOREIGN KEY (codigo, email)
        REFERENCES mision_jugador (codigo, email)
);

COMMIT;
