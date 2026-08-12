USE futbol;

-- ej 1 
SELECT * FROM futbol.jugador;

-- ej 2
SELECT nombre, puesto FROM futbol.jugador;

-- ej 3
SELECT nombre FROM futbol.club
WHERE socios > 30000;

-- ej 4
SELECT nombre FROM futbol.club
WHERE socios >= 30000;

-- ej 5
SELECT nombre, edad FROM futbol.jugador
WHERE camiseta = 8;

-- ej 6
SELECT nombre, puesto FROM futbol.jugador
WHERE puesto = 'Arquero' or puesto = 'Defensor';

-- ej 7
SELECT * FROM futbol.jugador
WHERE nombre LIKE '%Juan%';

-- ej 8
SELECT nombre, edad, puesto FROM futbol.jugador
ORDER BY edad ASC, camiseta DESC;

-- ej9
INSERT INTO futbol.club
VALUES (6, 'Rosario Central', 2500);

-- ej10
INSERT INTO futbol.jugador
VALUES (14, 'Ramiro Fassi', 26, 2, 'Defensor', 6);

SELECT * FROM futbol.jugador;

-- ej 11
INSERT INTO futbol.jugador
VALUES (15, 'Martin Palermo', 28, 9, 'Delantero', 23);

-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`futbol`.`jugador`, CONSTRAINT `idclub` FOREIGN KEY (`idclub`) REFERENCES `club` (`idclub`))
-- Se esta seleccionando una FK inexistente. 

-- ej 12
UPDATE futbol.jugador 
SET camiseta = 10 
WHERE idjugador = 1;

SELECT * FROM futbol.jugador;

-- ej 13
UPDATE futbol.jugador 
SET camiseta = 12
WHERE puesto = 'Arquero';

SELECT * FROM futbol.jugador;

-- ej 14

UPDATE futbol.jugador
SET edad = edad + 1;

SELECT * FROM futbol.jugador;

-- ej 15

DELETE FROM futbol.jugador
WHERE puesto = 'Volante';

SELECT * FROM futbol.jugador;
