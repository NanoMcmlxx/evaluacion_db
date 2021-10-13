CREATE DATABASE adminotas_db character set utf8;

USE adminotas_db;

CREATE TABLE categorias (
    id INT(10) UNSIGNED NOT NULL AUTO_INCREMENT,
    categoria VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=10;


LOCK TABLES categorias WRITE;

INSERT INTO categorias VALUES
(1,'politica'),
(2,'musica'),
(3,'cine'),
(4,'policiales'),
(5,'deportes'),
(6,'economia'),
(7,'del_mundo'),
(8,'nacional'),
(9,'ultimo momento');

UNLOCK TABLES;

CREATE TABLE gestiones (
    id INT(10) UNSIGNED AUTO_INCREMENT NOT NULL,
    gestion VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=4;


LOCK TABLES gestiones WRITE;

INSERT INTO gestiones VALUES
(1,'creada'),
(2,'modificada'),
(3,'eliminada');


UNLOCK TABLES;

CREATE TABLE usuarios (
    id INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
    apellido VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    PRIMARY KEY (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=7;


LOCK TABLES usuarios WRITE;

INSERT INTO usuarios VALUES
(1,'jose','cerda','jc@eldiario.com'),
(2,'oscar','perez','os@eldiario.com'),
(3,'nelda','suarez','ns@eldiario.com'),
(4,'santiago','cerda','sc@eldiario.com'),
(5,'paula','gonzalez','pk@eldiario.com'),
(6,'federico','suarez','fs@eldiario.com');

UNLOCK TABLES;

CREATE TABLE notas (
    id int(10) unsigned NOT NULL AUTO_INCREMENT, 
    titulo varchar(100) NOT NULL,
    fecha_creacion DATETIME,
    fecha_modificacion DATETIME NULL,
    gestion_id int(10) unsigned,
    descripcion TEXT NOT NULL,
    permite_eliminar int(1),
    usuario_id int(10) unsigned,
    PRIMARY KEY (id),
    CONSTRAINT notas_gestion_id_foreign FOREIGN KEY (gestion_id) REFERENCES gestiones (id),
    CONSTRAINT notas_usuario_id_foreign FOREIGN KEY (usuario_id) REFERENCES usuarios (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=11;


LOCK TABLES notas WRITE;

INSERT INTO notas VALUES
(1,'Elecciones PASO','2021-10-12 10:00:01',NULL,1,'sarasa sarasa sarasa',0,1),
(2,'Cumpleaños Charly Garcia','2021-10-12 10:10:01','2021-10-12 10:00:01',2,' sarasa sarasa sarasa sarasa',0,2),
(3,'Ultimos estrenos','2021-10-12 11:00:01',NULL,1,'sarasa sarasa sarasa sarasa',1,3),
(4,'Es un asalto','2021-10-12 10:00:01','2021-10-12 10:00:01',2,'sarasa sarasa sarasa',0,4),
(5,'Argentina CAMPEON','2021-10-12 10:10:01',NULL,1,' sarasa sarasa sarasa sarasa',0,5),
(6,'El dolar no tiene techo','2021-10-12 11:00:01',NULL,1,'sarasa sarasa sarasa sarasa',1,6),
(7,'De Rusia con amor','2021-10-12 10:00:01',NULL,1,'sarasa sarasa sarasa',0,1),
(8,'No sos vos, es ella','2021-10-12 10:10:01',NULL,1,' sarasa sarasa sarasa sarasa',0,2),
(9,'otra vez sopa','2021-10-12 11:00:01','2021-10-12 10:00:01',3,'sarasa sarasa sarasa sarasa',1,3),
(10,'El que apuesta al dolar pierde','2021-10-12 11:00:01','2021-10-12 10:00:01',3,'sarasa sarasa sarasa sarasa',1,3);



UNLOCK TABLES;

CREATE TABLE notas_por_categoria (
    id INT(10) UNSIGNED  NOT NULL AUTO_INCREMENT,
    nota_id INT(10) UNSIGNED NOT NULL,
    categoria_id INT(10) UNSIGNED NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT notas_por_categoria_nota_id_foreign FOREIGN KEY (nota_id) REFERENCES notas (id),
    CONSTRAINT notas_por_categoria_categoria_id_foreign FOREIGN KEY (categoria_id) REFERENCES categorias (id)
    ) ENGINE=InnoDB AUTO_INCREMENT=17;


LOCK TABLES notas_por_categoria WRITE;

INSERT INTO notas_por_categoria VALUES
(1,1,1),
(2,2,2),
(3,3,3),
(4,4,4),
(5,5,5),
(6,6,6),
(7,7,1),
(8,7,7),
(9,8,2),
(10,8,7),
(11,8,9),
(12,9,4),
(13,10,6),
(14,5,8),
(15,3,9);

UNLOCK TABLES;
