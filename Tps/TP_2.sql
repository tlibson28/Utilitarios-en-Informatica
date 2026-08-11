USE clinica;


-- -------------------
-- CONSULTAS SIMPLES
-- -------------------

-- TABLA PACIENTES --

-- a)

CREATE VIEW pac1 AS
SELECT codpac, apellido, nombre, codoso, fecnac FROM pacientes
WHERE YEAR(fecnac) < 1960;

-- b)

CREATE VIEW pac2 AS
SELECT codpac, apellido, nombre, codoso, fecnac FROM pacientes
WHERE apellido LIKE 'V%' AND TIMESTAMPDIFF(YEAR, fecnac, CURDATE()) > 50;

-- c)

CREATE VIEW pac3a AS
SELECT codpac, apellido, nombre, codoso, fecnac FROM pacientes
WHERE (codoso >3 AND sexo = 'M') OR localidad = 'Capital Federal' ;


CREATE VIEW pac3b AS
SELECT codpac, apellido, nombre, codoso, fecnac FROM pacientes
WHERE codoso >3 AND (sexo = 'M' OR localidad = 'Capital Federal' );

-- d)

CREATE VIEW pacxos AS
SELECT codoso, COUNT(*) AS cantidad FROM pacientes
GROUP BY codoso;

-- e)

CREATE VIEW promXos AS
SELECT codoso, 
	COUNT(*) AS cantidad, 
	AVG(TIMESTAMPDIFF(YEAR, fecnac, CURDATE())) AS PROMEDIO_DIRECTO ,
    SUM(TIMESTAMPDIFF(YEAR, fecnac, CURDATE())) / COUNT(*) AS PROMEDIO_CALCULADO
FROM pacientes
GROUP BY codoso;


-- TABLA PRECIOS --

-- f)

CREATE VIEW mod_pre AS
SELECT * FROM precios;

UPDATE mod_pre 
SET precio = precio * 1.05 
WHERE claseh = 'A' OR claseh = 'B';


-- TABLA INTERNACION --

-- g)                           ----REVISAR________

CREATE VIEW prom_mes AS
SELECT MONTH(fecint) as mes_int,
		AVG(DATEDIFF(curdate(), fecint)) AS prom_int
FROM internacion
WHERE (claseh = 'A' OR claseh = 'B') 
GROUP BY mes_int
HAVING prom_int > 15;

-- h) 

CREATE VIEW est_alta AS
SELECT numint, codpac, est_alta, fecalt, 
		ABS(DATEDIFF(fecalt, est_alta)) AS diferencia,
			IF(fecalt > est_alta, 'REVISAR', 'OK') AS observaciones
FROM internacion
WHERE fecalt IS NOT NULL;

-- --------------------------------
-- CONSULTAS EN TABLAS REALCIONADAS
-- --------------------------------

-- a) 

CREATE VIEW int_pac1 AS
SELECT 
    i.NUMINT,
    i.CODPAC AS INTERNACION_CODPAC,
    p.CODPAC AS PACIENTES_CODPAC,
    p.APELLIDO,
    p.NOMBRE,
    p.LOCALIDAD,
    p.SEXO
FROM INTERNACION i
INNER JOIN PACIENTES p ON i.CODPAC = p.CODPAC
WHERE p.SEXO = 'M' 
  AND p.CODPAC % 2 = 0;


-- b)

CREATE VIEW act_int AS
SELECt * FROM pacientes;

-- queda muy a trasmano alterar la view pero es lo mismo

UPDATE act_int a
INNER JOIN internacion i ON a.codpac = i.codpac
SET a.internado = IF(i.fecalt IS NULL, 1, 0);alter

-- c)

























