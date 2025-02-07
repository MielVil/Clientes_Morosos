USE db_practicas;

-- Creación de Tabla que muestre la balanza de pagos por ID_Cliente --
CREATE table balance_pagos AS (
SELECT 	ID_Cliente, c.Nombre AS Nombre,
		SUM(v. venta) AS Venta_Total,
        SUM(p.Pago) AS Pago_Total,
        SUM(v. venta) - SUM(p.Pago) AS Balance
FROM ventas v
JOIN clientes c
USING (ID_Cliente)
JOIN pagos p
ON p.ID_venta = v.ID_Venta
GROUP BY ID_Cliente, c.Nombre);