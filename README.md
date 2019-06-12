<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
</head>
<body>
    <h1>Proceso de Ejecución</h1>
    <p>Luego de descargar o clonar el proyecto desde <b>GitHub</b> abrimos <b>INTERCCO</b> en NetBeans, se debe integrar la base de datos en MySQL para así evitar errores en la ejecución:</p><br>
    <h3>¿Cómo integro la base de datos? Paso#1</h3>
    <p>El primer paso es dirigirse a la ventana <b>Services/Servicios</b>; en caso de no encontrarla, puede buscarla en <b>Windows/Ventanas</b> en el menú de navegación, luego colapsé la opción <b>Database/Base de datos</b> y registré el server de MySQL con clic derecho en la opción colapsada, el nombre de usuario que debe ingresar es <b>1599195</b> sin contraseña; en caso de no tener este usuario, puede crearlo <i>(El usuario debe tener todos los permisos en MySQL)</i> o cambiar el usuario que desea usar en el proyecto <i>(Puede ver como se hace en la parte inferior)</i>, ahora cree la base de datos usando el clic derecho en <b>MySQL Server at localhost:3036 [1599195]</b> y escriba a continuación el nombre <b>intercco</b> <i>(Escribaló tal como se muestra y en letras minusculas)</i>, por último dirijase a la ruta: <b>Web Pages &gt; ArchivosApoyo &gt; Base de Datos &gt; SQL.sql</b> y ejecuté el archivo en la base de datos ya creada.</p>
    <h4>¿Cómo cambio mi usuario de MySQL en el proyecto?</h4>
    <p>Dirijasé a la siguiente ruta: <b>Source Packages &gt; com.INTERCCO.modelo.Conexion &gt; ConectaDB.java</b> y luego cambié los parametros deseados entre las líneas <b>31</b> y <b>36</b> asegurandose que sean validos para la ejecución.</p><br>
    <h3>¿Como evitar errores de rutas? Paso#2</h3>
    <p>Ahora debes realizar algo llamado <b>Clean and Build/Limpiar y Reconstruir</b> para así evitar algún error por rutas; si no sabes realizar esta acción, utilicé la herramienta Google.</p><br>
    <h1>¡Ya puede ejecutarlo!</h1>
    <h3>Usuarios de prueba para acceder</h3>
    <p>cliente@succo.com<br>clienteME@succo.com<br>domiciliario@succo.com<br>mesero@succo.com<br>cocinero@succo.com<br>cajero@succo.com<br>gerente@succo.com<br>gerenteSC@succo.com</p>
    <p>La contraseña de todos, es sencillamente <b>123</b>.</p><br>
    <blockquote>Atentamente, Sebastian Sossa desarrollador de INTERCCO.</blockquote>
</body>
</html>