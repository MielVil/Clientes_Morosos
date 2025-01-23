# Clientes_Morosos
Acorde a la base de datos de una inmobiliaria, se pretende consultar quienes son los cliente morosos, existen dos clasificaciones, aquellos que no cumplen con la fecha de pago y venta, y la segunda categoría es constituida por clientes que aún no han terminado de realizar sus pagos. Esa consulta se realiza con MySQL Workbench.

## Conceptos usados
En este proyecto se hace uso de diversos conceptos como sub-consulta / sub-queries, transformación de fechas, consultas, filtrados, actualización de información, cruce de tablas, y agrupaciones. 

## SQL STATEMENTS USADOS

### 1. Modificación de la Base de Datos:
**ALTER TABLE:** Altera la estrucutra de la base, en este caso agregando columnas.

**UPDATE:** Actualiza la información de la base de datos.

**SET:** Permite especificar que valores cambiar en los registros.

### 2. Operadores y Manipulación de Datos:

**CONCAT:** Permite unir cadenas de textos almacenadas en diferentes variables.

**LPAD:** Rellena una cadena por la izquierda con un caracter especifico para tener una longitud es especifico. Por ejemplo, en el caso de este proyecto el día se encuentra como 05 o 5, para tener una estructura homogenea se rellena el segundo caso para que el resultado final sea 05.

**SUBSTRING_INDEX:** Toma una parte de una cadena o string tomando en cuenta algún delimitador. Ejemplos de delimitadores: "|", ";", "/", etc.

**DATE:** Convierte variables a tipo Fecha, tambien se puede usar STR_TO_DATE, para pasar de un string a fecha.

**AS DECIMAL:** Convierte una variable a tipo decimal.

### 3. Condicionales:

**WHEN:** Usado para filtrar la infromación de consulta, trae infomación que cumpla certa condición. Ej: Ventas mayores a 500, traer clientes que tengan ventas, etc.

**CASE WHEN THEN:** Devuelve diferentes resultados dependiendo de las caracteristicas especificas de la información. En este caso es usado para indicar cuando usar LPAD y completar fechas.

### 4. Cruces de tablas:

**JOIN USING:** Permite unir bases de datos a partir de un ID en común, este JOIN tiene como condición hacer la unión simepre y cuando se tenga mismo nombre en la variable.

### 5. Consulta de Datos:

**USE:** Se usa para indicar cual es la base de datos con la que se va a trabajar.

**SELECT:** Permite seleccionar todas las variables o variables especificas de una tabla, por lo general se usa con FROM, para saber de que tabla se solicitan las variables.

**DISTINCT:** Elimina duplicados en la consulta de información. 

**GROUP BY:** Agrupa resultados acorde a una o más columnas, por lo general es útil cuando se busca sumar, promediar y hacer algún otro tipo de calculo por categorías o jerarquías.

**HAVING:** Filtra resultados de GROUP BY si se cumple con condiciones especificas.

**AS:** Es útil para dar un alias que ayude a identificar alguna columna consultada.


## Limpieza de la base de datos
Como primer paso se procede a realizar un cruce la información entre las tres tablas existentes: 

Es este proyecto se detecta que las fechas no son homogéneas y que son del tipo TEXT por lo cual se procede a usar CONCAT, LPAD, CASE WHEN THEN, para tener fechas estructuradas.

**¿Por que no usar DATE o STR_TO_SATE directamente?**
 Para evitar duplicar código y tener que crear diferentes combinaciones de casos, como fechas se puede tener que el día, mes o año sea de dos digitos, uno o cuatro. 

 El **día** puede aparecer como: '1' o '01'
 Análogamente pasa los mismo con el **mes**: '9' o '09'
 Año: '16' o '2016'

 Para evitar tener que lidiar con las posibles combinaciones de fechas y realizar 
 cambios acorde a la fecha como:

| Formato de Fecha | Código para convertir de String a Date |
|------------------|----------------------------------------|
|    '01/09/2016'  |      STR_TO_DATE(Fecha,'%d/%m/%Y')     |
|    '1/09/2016'   |      STR_TO_DATE(Fecha,'%e/%b/%Y')     |
|    '01/9/2016'   |      STR_TO_DATE(Fecha,'%d/%c/%Y')     |
|    '01/09/16'    |      STR_TO_DATE(Fecha,'%d/%m/%y')     |
|        ...       |                   ...                  |
|     '1/9/16'     |      STR_TO_DATE(Fecha,'%e/%c/%y')     |

Se tendrían en total **8** posibles combinaciones si se toma el como formato de un dígito o dos, si en el mes se desea incluir escribir el mes como Jan, May, etc..
se tendrían en total **12** posibles combinaciones. 

<div align="center">
  <img src="https://github.com/user-attachments/assets/63a10657-b381-4f17-a4c4-c96e82deb823" alt="Fechas" style="width:25%;">
</div>



## Clientes Morosos por Fecha

<div align="center">
  <img src="https://github.com/user-attachments/assets/5f489b15-edba-468e-a58f-53700737086e" alt="Morosos por Fecha" style="width:25%;">
</div>


## Clientes Morosos por Saldo Deudor

Se calcula el saldo deudor con la diferencia entre la suma de pagos y el precio de venta, posteriormente se agrupan por ID_venta, Nombre del cliente y Monto de Venta.
<div align="center">
  <img src="https://github.com/user-attachments/assets/95686ee1-64d3-433d-9d45-ea9d602dd4f4" alt="Morosos por Saldo Deudor" style="width:25%;">
</div>

