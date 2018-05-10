La carpeta "ScriptsSQL" generan las tablas y las llenan de datos. En MySQL Workbench elegir Server => Import Data.
Asegurarse de que la base de datos se llame "sqlbuscador" y sea usuario "root" y contrasena "lapasssql".
Para ejecutar el projecto desde Intellij:
	-En la ventana de projectos de Maven buscar el plugin wildfly-swarm:run y darle doble click.
	-Hacer consultas de 1 palabra a http://localhost:8080/rest/libros/buscar/{la-palabra-sin-corchetes}
	-Para cortar la ejecucion hay que cortar el projecto de intellij y darle doble click al plugin wildfly-swarm:stop