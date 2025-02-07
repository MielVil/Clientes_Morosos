
-- Creación del TRIGGER para actualizar Balance de pagos cuando se ingrese nuevo pago--

DELIMITER $$
-- DROP TRIGGER IF EXISTS actualizar_pago_balance; --
CREATE TRIGGER actualizar_pago_balance
	AFTER INSERT ON pagos
    FOR EACH ROW
BEGIN
	UPDATE balance_pagos
    
    SET Balance = Balance - NEW.Pago
    WHERE ID_Cliente = (
			SELECT v.ID_Cliente
            FROM ventas v
            JOIN pagos p
            ON v.ID_Venta = p.ID_venta
            WHERE p.ID_pago = NEW.ID_pago
            LIMIT 1
    );
END $$
DELIMITER ;