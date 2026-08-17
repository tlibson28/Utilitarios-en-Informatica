USE tecnocenter;

CREATE TABLE ComprasOrdenadas 
AS SELECT * FROM Compras
ORDER BY NumFactura, CodiProveedor;

-- CREATE VIEW CC_01 AS

-- DROP VIEW 

-- 1)

CREATE VIEW CC_01 AS
SELECT 
	COUNT(*),
    p.descripcion
FROM productos p 
INNER JOIN compras c 
ON p.codiproductos = c.codiproducto
GROUP BY p.descripcion; 

-- 2) 

SELECT tipofactura,
       SUM(importe) AS suma_importes
FROM compras
GROUP BY tipofactura
HAVING SUM(importe) > 10000;

-- 3) 

SELECT codiproducto,
       SUM(cantidad) AS suma_cantidad
FROM compras
GROUP BY codiproducto
ORDER BY codiproducto; 


-- 4) 

SELECT codiproveedor,
       AVG(importe) AS promedio_importe
FROM compras
GROUP BY codiproveedor
ORDER BY codiproveedor; 

-- 5) 

SELECT codiproveedor,
       SUM(cantidad) AS ventas
FROM compras
GROUP BY codiproveedor
ORDER BY ventas DESC LIMIT 1;

-- 6) 

SELECT COUNT(*),
	tipofactura
FROM compras
GROUP BY tipofactura
ORDER BY tipofactura;

-- 7) 

SELECT 
	p.razonsocial
FROM proveedores p
LEFT JOIN compras c
ON p.codiproveedor = c.codiproveedor
WHERE c.codiproveedor IS NULL
GROUP BY razonsocial;


-- 8) 

SELECT 
	p.razonsocial,
    SUM(c.importe) as ganancias
FROM compras c
INNER JOIN proveedores p
ON c.codiproveedor = p.codiproveedor
GROUP BY p.razonsocial
ORDER BY ganancias LIMIT 1;


-- 9)

SET @imp = 99;
SET @fecha1 = '2024-01-01';
SET @fecha2 = '2024-12-31';

SELECT p.razonsocial,
       SUM(c.importe) AS total_vendido
FROM proveedores p
INNER JOIN compras c
    ON p.codiproveedor = c.codiproveedor
WHERE c.tipofactura = 'A'
  AND c.fecha BETWEEN @fecha1 AND @fecha2
GROUP BY p.codiproveedor
HAVING SUM(c.importe) > @imp;

-- 10) 


SET @fecha1 = '2017-01-01';
SET @fecha2 = '2024-12-31';

SELECT *
FROM compras
WHERE MOD(codiproveedor, 2) = 0
  AND fecha BETWEEN @fecha1 AND @fecha2
  AND importe < (
      SELECT AVG(importe)
      FROM compras
  );

-- 11) 


SELECT *
FROM productos 
WHERE stock < puntopedido 
	AND fuepedido = 0  
    AND ABS(DATEDIFF(curdate(), fechaulticompra)) > 15;

-- 12) 

SELECT *
FROM proveedores
WHERE ( calleynro LIKE "%AV. Rivadavia" AND 
		MOD(CAST(SUBSTRING_INDEX(calleynro, ' ', -1) AS UNSIGNED), 2) = 0 AND 
        codiclase = 2 ) 
        
	OR ( LENGHT(razonsocial) >= 10 )
; 

-- 13) 


SELECT * 
FROM compras
WHERE MOD(nummovimiento, 2) = 0 OR MOD(DAY(fecha), 5 ) = 0 
ORDER BY NumFactura, CodiProveedor;


-- 14)

SELECT * 
FROM compras
WHERE MOD(nummovimiento, 2) = 0 OR MOD(DAY(fecha), 5 ) = 0 
HAVING importe > (SELECT AVG(importe) FROM compras
					WHERE MOD(nummovimiento, 2) = 0 OR 
                    MOD(DAY(fecha), 5 ) = 0 )
ORDER BY NumFactura, CodiProveedor;







