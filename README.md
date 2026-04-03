# Proyecto: Conciertos Chile S.A - Semana 4

## 📝 Descripción general del sistema

En esta semana se construyen consultas SQL sobre caso planteado de la empresa Conciertos Chile S.A, como solución a los requerimientos del caso, por lo que se aplica funciones simples y
agrupadas y JOINS entre las tablas.

### Objetivo general

Permitir combinar información almacenada en múltiples tablas, aprovechando relaciones entre columnas.

### Alcance del modelo

- Conectarse como usuario `PRY2205_S4` y ejecutar el script de creación y poblamiento del esquema ConciertosChile.
- Desarrollar consultas para:
  - **Caso 1 – Listado de Trabajadores:** Conciertos Chile, requiere listar información específica de los trabajadores de forma ordenada y respetando las normas de visualización.
  - **Caso 2 – Listado Cajeros:**  Implementar un registro bitácora por trabajador que haya vendido tickets,mostrando cantidad tickets vendidos, total vendido entre los tickets, comisión total que estos tengan y nombre de la comuna del trabajador.
se tendrá que listar a todos los trabajadores que tengan rol de CAJERO, mostrando:
  - **Caso 3 – Listado de Bonificiaciones:** El módulo debe entregar información de cada trabajador considerando su año de ingreso para calcular la antigüedad, si posee asignación familiar mediante cargas familiares y si pertenece a FONASA o ISAPRE; además,
  - si el trabajador es de FONASA recibirá un bono extra equivalente al 1% de su sueldo, mientras que si no lo es no recibirá dicho bono, y también se debe calcular un bono por antigüedad para todos los trabajadores, asignando un 10% del sueldo a quienes tengan
  - 10 años o menos de servicio y un 15% a quienes tengan 11 años o más, incluyendo en el reporte solo a aquellos trabajadores cuyo estado civil no tenga fecha de término o cuya fecha de término sea posterior a la fecha de ejecución del reporte.
---
## 👤 Autores del proyecto
- **Nombre completo:** Cinthya Guzman R. / Matias Suarez M.
- **Ramo:** Consulta de Bases de Datos
- **Grupo:** Grupo N°06
- **Sección:** 001A
- **Profesor:** Armando Romero M.
- **Carrera:** Analista Programador Computacional
- **Sede:** Carrera 100% Online
