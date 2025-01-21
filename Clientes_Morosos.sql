

-- Actualizar pagos con la nueva fecha convertida --

ALTER TABLE pagos ADD COLUMN Fecha_Convertida DATE;

UPDATE pagos
SET Fecha_Convertida = STR_TO_DATE(
    CONCAT(
        LPAD(SUBSTRING_INDEX(Fecha_pago, '/', 1), 2, '0'), '/', -- Día
        LPAD(SUBSTRING_INDEX(SUBSTRING_INDEX(Fecha_pago, '/', 2), '/', -1), 2, '0'), '/', -- Mes
        CASE 
            WHEN LENGTH(SUBSTRING_INDEX(Fecha_pago, '/', -1)) > 2 THEN 
                RIGHT(SUBSTRING_INDEX(Fecha_pago, '/', -1), 2) 
            ELSE 
                SUBSTRING_INDEX(Fecha_pago, '/', -1) 
        END -- Año
    ), 
    '%d/%m/%y'
);

  -- LISTA DE CLIENTES DE MOROSOS POR FECHA--

USE db_practicas;

SELECT DISTINCT(v.ID_cliente), c.Nombre  FROM ventas v
JOIN clientes c
USING (ID_cliente)
JOIN pagos p
USING(ID_venta)
WHERE v.ID_cliente IN (
	SELECT v.ID_cliente FROM ventas v
	JOIN pagos p
	USING (ID_venta)
	WHERE Fecha_Convertida > STR_TO_DATE(v.Fecha_venta,'%d-%b-%y')
);


-- Clientes morosos por SALDO --
SELECT 
    p.ID_venta, 
    c.Nombre, 
    v.venta, 
    SUM(CAST(REPLACE(p.pago, ',', '') AS DECIMAL)) AS pago, 
    v.venta - SUM(CAST(REPLACE(p.pago, ',', '') AS DECIMAL)) AS saldo
FROM pagos p
JOIN ventas v
USING (ID_venta)
JOIN clientes c
USING (ID_cliente)
GROUP BY p.ID_venta, c.Nombre, v.venta
HAVING saldo > 0;

