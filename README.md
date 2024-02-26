# Dataflux archives

## Descripción

Parte de la serie dataflux, como dataflux becas y dataflux scoreboard, ahora un simple sistema web que recoge PDF y lo almacena en un servidor de archivos. El sistema no está diseñado para accederse desde fuera de la red local.

## Especificaciones

El sistema es un sistema web simple usando PHP como script de lado del servidor, consulta a una base de datos en un servidor web virtualizado y almacena los PDF cargados en el sistema a un servidor de archivos.

El sistema debe permitir subir un archivo PDF, editar sus datos y contar con búsquedas de documentos por keywords en el título del documento o en el contenido del archivo.

El tipo de documentos aceptado son resoluciones de distintos órganos resolutores.
