# COVID-19: México en Datos

# Introducción

En el presente trabajo se analizará el repositorio de datos abiertos de la Secretaría de Salud Federal referentes a la pandemia de COVID-19 durante el año 2021 en nuestro país. 

La fuente de los datos es la misma Secretaría de Salud, en su apartado de [datos abiertos](https://www.gob.mx/salud/documentos/datos-abiertos-152127). Para este análisis, tomamos los datos históricos del 2021, los cuales se encuentran almacenados en un archivo .csv (valores separados por comas) con un peso aproximado de 1.5 Gb. 

Cada fila en esta base representa un paciente admitido en un Centro Médico del país por posible contagio de COVID-19. Las diferentes columnas representan diversas características o padecimientos del paciente, tales como su lugar de residencia, de nacimiento, la ubicación de la unidad médica donde se atendió y si era una institución pública o privada, si sufría de diabetes, hipertensión, EPOC, u otras condiciones, si pertenecía a una comunidad indígena, entre otros.

# Explorando los datos

## Estructura de la Base de Datos

Para generar nuestra base de datos MySQL, utilizaremos un único archivo csv proporcionado por la Secretaría de Salud. Sin embargo, utilizando el diccionario de datos proporcionado por la misma Secretaría, podemos generar tablas adicionales para complementar nuestra tabla principal. Una vez realizado este proceso, nuestra base de datos contaría con la siguiente estructura.

![Diagram ER de la base de datos](./img/diagrama.png)

Estas relaciones nos permitirán, como veremos más adelante, analizar e interpretar más facilmente los datos que recabaremos con nuestras queries. Las queries utilizadas estarán disponibles en el repositorio del proyecto. 

## Analizando los datos de nuestra base

### ¿Cuántos casos registró la Secretaría?

Comenzamos analizando la cantidad total de registros en nuestra tabla principal, para eso podemos utilizar una query simple utilizando la función COUNT.

```SQL
SELECT 
	COUNT(*) AS FILAS_TOTALES
FROM 
	covid.COVID19MEXICO2021 cm 
```

La cual nos arroja el siguiente resultado:

|FILAS TOTALES|
|-------------|
|8,710,345|

Esto nos indica que existen mas de ocho millones de entradas en nuestra base de datos. Sin embargo, no todos estos casos fueron casos confirmados de la enfermedad, ya que la columna ```CLASIFICACION_FINAL``` de nuestra tabla principal nos indica si el caso fue confirmado como COVID. Si nos vamos a la tabla ```Clasificacion``` de nuestra base, vemos que los valores 1,2 y 3 de la columna son considerados como *confirmados*. Tomando esto en cuenta, podemos observar que el número de casos confirmados es mucho menor al número de entradas de la tabla.

Podemos realizar un query uniendo nuestra tabla principal con la tabla de Clasificacion:

```SQL
SELECT 
	cf.CLASIFICACION AS CLASIFICACION,
	COUNT(cm.ID_REGISTRO) AS TOTAL
FROM 
	covid.COVID19MEXICO2021 cm 
INNER JOIN 
	covid.ClasificacionFinal cf ON cf.CLAVE = cm.CLASIFICACION_FINAL 
WHERE 
	cm.CLASIFICACION_FINAL < 4 /* solo casos confirmados */
GROUP BY
	cf.CLASIFICACION WITH ROLLUP /* total de los datos agrupados */
```
En este caso, la tabla de ```Clasiifacion``` nos ayudó a generar un filtro para tomar en cuenta sólo los casos confirmados. Al ejecutar la query anterior, obtenemos una tabla indicando la cantidad de casos confirmados, dividios según la forma en que fueron clasificados como tal.

|CLASIFICACION|TOTAL|
|-------------|-----|
|Casos confirmado por prueba|2,276,031|
|Casos confirmados por asociación|215,863|
|Casos confirmados por dictaminación|4,182|
|Total|2,496,076|

Esto nos indica que de los más de ocho millones de casos sospechosos, "solo" dos millones y medio de ellos resultaron positivos.

#### **¿Cómo fuerón detectados estos casos?**

Utilizando la tabla ```Sector```, así como la columna del mismo nombre en nuestra tabla principal, podemos apreciar la distribución de dónde fueron detectados estos casos.

```SQL
SELECT
	s.DESCRIPCION  AS INSTITUCION,
	(COUNT(*) / (SELECT COUNT(*) FROM covid.COVID19MEXICO2021 cm WHERE cm.CLASIFICACION_FINAL < 4)) * 100 AS PORCENTAJE
FROM 
	covid.COVID19MEXICO2021 cm
INNER JOIN 
	covid.Sector s  ON s.CLAVE = cm.SECTOR  
WHERE 
	cm.CLASIFICACION_FINAL < 4 /* cualquier valor menor a 4 indica que el caso fue considerado como positivo */
GROUP BY
	s.DESCRIPCION 
ORDER BY
	PORCENTAJE DESC
```

La query anterior nos muestra los diferentes tipos de instituciones médicas donde fueron detectados casos positivos de COVID, así como el porcentaje correspondiente a cada una.

|INSTITUCION|PORCENTAJE|
|-----------|----------|
|SSA|47.0565|
|IMSS|44.8462|
|PRIVADA|2.8582|
|ISSTE|2.4101|
|ESTATAL|0.9662|
|IMSS-BIENESTAR|0.7007|
|PEMEX|0.4616|
|SEDENA|0.4120|
|SEMAR|0.1519|
|MUNICIPAL|0.0682|
|UNIVERSITARIO|0.0458|
|CRUZ ROJA|0.0111|
|DIF|0.0105|
|NO ESPECIFICADO|0.0009|
|OTROS|0.0000|

De la tabla anterior, podemos observar que la gran mayoría de los casos (más del 90%) fueron confirmados en instituciones públicas.