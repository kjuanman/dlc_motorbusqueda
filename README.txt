La carpeta "ScriptsSQL" generan las tablas y las llenan de datos.
El script para las listas de posteo (que es muy grande para github) esta en https://drive.google.com/open?id=1NLPHnzl1MGO-lnqB5LeT70FZjhRFqnMh
En MySQL Workbench elegir Server => Import Data.
Asegurarse de que la base de datos se llame "sqlbuscador" y sea usuario "root" y contrasena "lapasssql".
Para ejecutar el projecto desde Intellij:
	-En la ventana de projectos de Maven buscar el plugin wildfly-swarm:run y darle doble click.
	-Hacer consultas a http://localhost:8080/libros/buscar/{palabras a buscar}
	-Para cortar la ejecucion hay que cortar el projecto de intellij y darle doble click al plugin wildfly-swarm:stop
