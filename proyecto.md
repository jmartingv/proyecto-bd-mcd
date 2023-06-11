# COVID-19: México en Datos

# Introducción

En el presente trabajo se analizará el repositorio de datos abiertos de la Secretaría de Salud Federal referentes a la pandemia de COVID-19 durante el año 2021 en nuestro país. 

La fuente de los datos es la misma Secretaría de Salud, en su apartado de [datos abiertos](https://www.gob.mx/salud/documentos/datos-abiertos-152127). Para este análisis, tomamos los datos históricos del 2021, los cuales se encuentran almacenados en un archivo .csv (valores separados por comas) con un peso aproximado de 1.5 Gb. 

Cada fila en esta base representa un paciente admitido en un Centro Médico del país por posible contagio de COVID-19. Las diferentes columnas representan diversas características o padecimientos del paciente, tales como su lugar de residencia, de nacimiento, la ubicación de la unidad médica donde se atendió y si era una institución pública o privada, si sufría de diabetes, hipertensión, EPOC, u otras condiciones, si pertenecía a una comunidad indígena, entre otros.

# Explorando los datos

## Estructura de la Base de Datos

Para generar nuestra base de datos MySQL, utilizaremos un único archivo csv proporcionado por la Secretaría de Salud. Sin embargo, utilizando el diccionario de datos proporcionado por la misma Secretaría, podemos generar tablas adicionales para complementar nuestra tabla principal. Una vez realizado este proceso, nuestra base de datos contaría con la siguiente estructura.

![Diagram ER de la base de datos](./img/diagrama.png)

Estas relaciones nos permitirán, como veremos más adelante, analizar e interpretar más facilmente los datos que recabaremos con nuestras queries.

## Analizando los datos de nuestra base

### ¿Cuántos casos registró la Secretaría?