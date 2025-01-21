# Clientes_Morosos
Acorde a la base de datos de una inmobiliaria, se pretende consultar quienes son los cliente morosos, existen dos clasificaciones, aquellos que no cumplen con la fecha de pago y venta, y la segunda categoría es constituida por clientes que aún no han terminado de realizar sus pagos. Esa consulta se realiza con MySQL Workbench.

## Fechas

Es este proyecto se detecta que las fechas no son homogéneas y que son del tipo TEXT por lo cual se procede a usar CONCAT, LPAD, CASE WHEN THEN, para tener fechas estructuradas.
![Screenshot 2025-01-21 at 12 18 09](https://github.com/user-attachments/assets/63a10657-b381-4f17-a4c4-c96e82deb823)


## Clientes Morosos por Fecha

![Screenshot 2025-01-21 at 12 18 52](https://github.com/user-attachments/assets/5f489b15-edba-468e-a58f-53700737086e)

## Clientes Morosos por Saldo Deudor

Se calcula el saldo deudor con la diferencia entre la suma de pagos y el precio de venta, posteriormente se agrupan por ID_venta, Nombre del cliente y Monto de Venta.

![Screenshot 2025-01-21 at 12 19 34](https://github.com/user-attachments/assets/95686ee1-64d3-433d-9d45-ea9d602dd4f4)
