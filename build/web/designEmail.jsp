<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div style="font-family:Arial; width:90%; margin:auto; padding:10px; background:#C1D0E7; "><div style="width:100%; "><div style="width:100%; padding:12px 0; background:#446EB6; "><a target="_blank" href="https://www.google.com/" style="width:20%; display:inline-block; margin-left:30px; "><img alt="FSUCCO" style="width:100%; " src="https://i.imgur.com/u2GoMPN.png"></a></div>
        <%  int eleccion = 7;
            if (eleccion == 1){ %>
            <!-- Respuesta PQRSF del Usuario para el Usuario -->
            <div style="width:92%; padding:18px 4%; background:#fff; ">
                <div style="display:flex; ">
                    <p style="display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; ">Señor(a) Usuario,</p>
                    <p style="display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; ">Día 29 del mes 03 de 2019</p>
                </div>
                <div style="font-size:17px; ">
                    <p style="text-align:justify; ">A continuación, la respuesta a la solicitud PQRSF enviada por usted.</p>
                    <p style=" padding-left:10px; display:inline-block; margin-top:15px; font-size:20px; color:#446EB6; ">Respuesta:</p>
                    <p style="text-align:justify; margin:0; "></p>
                </div>
        <% } else if (eleccion == 2) { %>
        <!-- Urgencia de Soporte para el Administrador -->
            <div style="width:92%; padding:18px 4%; background:#fff; ">
                <div style="display:flex; ">
                    <p style="display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; ">Señor(a) Usuario,</p>
                    <p style="display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; ">Día 29 del mes 03 de 2019</p>
                </div>
                <div style="font-size:17px; ">
                    <p style="text-align:justify; ">Se acaba de registrar una solicitud de soporte, te necesitan con URGENCIA!.</p>
                    <p style=" padding-left:10px; display:inline-block; margin-bottom:10px; margin-top:15px; font-size:20px; color:#446EB6; ">Fecha de la Solicitud:</p>
                    <p style="text-align:justify; margin:0; ">22 del 03 del año 2019</p>
                    <p style=" padding-left:10px; display:inline-block; margin:10px 0; font-size:20px; color:#446EB6; ">Solicitud enviada por:</p>
                    <p style="text-align:justify; margin:0; ">emailUsuario</p>
                    <p style=" padding-left:10px; display:inline-block; margin:10px 0; font-size:20px; color:#446EB6; ">Sede del Usuario:</p>
                    <p style="text-align:justify; margin:0; ">nomSedeUsuario</p>
                    <p style=" padding-left:10px; display:inline-block; margin:10px 0; font-size:20px; color:#446EB6; ">Ruta del Caso:</p>
                    <p style="text-align:justify; margin:0; ">ruta</p>
                    <p style=" padding-left:10px; display:inline-block; margin:10px 0; font-size:20px; color:#446EB6; ">Descripción del Caso:</p>
                    <p style="text-align:justify; margin:0; ">descripcion</p>
                </div>
        <% } else if (eleccion == 3) { %>
        <!-- No hay Administrador para la solicitud de soporte para el Empleado -->
            <div style="width:92%; padding:18px 4%; background:#fff; ">
                <div style="display:flex; ">
                    <p style="display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; ">Señor(a) Usuario,</p>
                    <p style="display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; ">Día 29 del mes 03 de 2019</p>
                </div>
                <div style="font-size:17px; ">
                    <p style="text-align:justify; ">En el momento no se encuentran disponibles <span style="color:#446EB6; ">Administradores de SUCCO</span> para atender su solicitud de soporte, por favor tenga paciencia, encontraremos otra manera de resolver su problema.</p>
                </div>
        <% } else if (eleccion == 4) { %>
        <!-- Codigo de Recuperación de Contraseña para el Usuario -->
            <div style="width:92%; padding:18px 4%; background:#fff; ">
                <div style="display:flex; ">
                    <p style="display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; ">Señor(a) Usuario,</p>
                    <p style="display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; ">Día 29 del mes 03 de 2019</p>
                </div>
                <div style="font-size:17px; ">
                    <p style="text-align:justify; margin-bottom:5px; ">Su código de recuperación es:</p>
                    <p style=" padding-left:10px; display:inline-block; font-size:20px; color:#446EB6; ">Codigo</p>
                </div>
        <% } else if (eleccion == 5) { %>
        <!-- Codigo de Verificación para el Usuario -->
            <div style="width:92%; padding:18px 4%; background:#fff; ">
                <div style="display:flex; ">
                    <p style="display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; ">Señor(a) Usuario,</p>
                    <p style="display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; ">Día 29 del mes 03 de 2019</p>
                </div>
                <div style="font-size:17px; ">
                    <p style="text-align:justify; margin-bottom:5px; ">Su código de verificación es:</p>
                    <p style=" padding-left:10px; display:inline-block; font-size:20px; color:#446EB6; ">Codigo</p>
                </div>
        <% } else if (eleccion == 6) { %>
        <!-- Devolución de Insumo para el Proveedor -->
            <div style="width:92%; padding:18px 4%; background:#fff; ">
                <div style="display:flex; ">
                    <p style="display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; ">Señor(a) nomPCPro,</p>
                    <p style="display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; ">Día 29 del mes 03 de 2019</p>
                </div>
                <div style="font-size:17px; ">
                    <p style="text-align:justify; ">El restaurante <span style="color:#446EB6; ">SUCCO</span> pide un reembolso por el insumo <b>"nomIns"</b>, la información sobre esa devolución es:</p>
                    <p style=" padding-left:10px; display:inline-block; margin-bottom:10px; margin-top:15px; font-size:20px; color:#446EB6; ">Gerente de la Solicitud:</p>
                    <p style="text-align:justify; margin:0; ">nomUsuario</p>
                    <p style=" padding-left:10px; display:inline-block; margin:10px 0; font-size:20px; color:#446EB6; ">Email del Gerente:</p>
                    <p style="text-align:justify; margin:0; ">emailUsuario</p>
                    <p style=" padding-left:10px; display:inline-block; margin:10px 0; font-size:20px; color:#446EB6; ">Razón del Reembolso:</p>
                    <p style="text-align:justify; margin:0; ">razon</p>
                </div>
        <% } else if (eleccion == 7) { %>
        <!-- Solicitud Queja o Reclamo para el Gerente -->
            <div style="width:92%; padding:18px 4%; background:#fff; ">
                <div style="display:flex; ">
                    <p style="display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; ">Señor(a) Gerente,</p>
                    <p style="display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; ">Día 29 del mes 03 de 2019</p>
                </div>
                <div style="font-size:17px; ">
                    <p style="text-align:justify; ">Su sede ha recibido una solicitud PQRSF de <span style="color:#446EB6; ">"tipoSoli"</span>, se pide que la revise inmediatamente.</p>
                </div>
        <% } %>
        <div style="margin-top:40px; "><p style="font-size:18px; ">Gracias por la atención prestada, feliz día.</p></div></div><div style="width:100%; padding:15px 0; background:#446EB6; "><div style="width:100%; text-align:center; "><p style="color:#fff; font-size:19px; margin:0; letter-spacing:1pt; ">tel. 01 8055 44 69 22</p><p style="color:#fff; font-size:19px; margin:0; text-decoration:none; letter-spacing:1pt; ">contacto.succo@gmail.com</p><a target="_blank" style="color:#fff; font-size:19px; letter-spacing:1pt; text-decoration:none; " href="https://www.google.com/">www.succo.com.co</a></div><div style="width:100%; padding:10px 0; margin-top:12px; display:flex; "><div style="width:25%; "></div><div style="width:50%; display:flex; "><a target="_blank" style="width:50%; text-align:center; " href="https://www.facebook.com/"><img alt="Facebook" style="width:50%; " src="https://i.imgur.com/1Y79eZu.png"></a><a target="_blank" style="width:50%; text-align:center; " href="https://www.instagram.com/"><img alt="Instagram" style="width:50%; " src="https://i.imgur.com/m7Ruie1.png"></a><a target="_blank" style="width:50%; text-align:center; " href="https://www.twitter.com/"><img alt="Twitter" style="width:50%; " src="https://i.imgur.com/aeXEkNV.png"></a><a target="_blank" style="width:50%; text-align:center; " href="https://plus.google.com/discover"><img alt="Google Plus" style="width:50%; " src="https://i.imgur.com/0uNWCEw.png"></a></div><div style="width:25%; "></div></div><div style="width:100%; text-align:center; margin-top:12px; "><p style="margin:0; color:#fff; letter-spacing:1pt; ">&copy; 2004-2019 National Restaurant SUCCO.</p></div></div></div></div>
        
        
        
        
        <%  int eleccion2 = 2;
            if (eleccion2 == 1){ %>
            <div style="font-family:Arial; width:90%; margin:auto; padding:10px; background:#C1D0E7; "><div style="width:100%; "><div style="width:100%; padding:12px 0; background:#446EB6; "><a target="_blank" href="https://www.google.com/" style="width:20%; display:inline-block; margin-left:30px; "><img alt="FSUCCO" style="width:100%; " src="https://i.imgur.com/u2GoMPN.png"></a></div>
                    
            <div style="margin-top:40px; "><p style="font-size:18px; ">Gracias por la atención prestada, feliz día.</p></div></div><div style="width:100%; padding:15px 0; background:#446EB6; "><div style="width:100%; text-align:center; "><p style="color:#fff; font-size:19px; margin:0; letter-spacing:1pt; ">tel. 01 8055 44 69 22</p><p style="color:#fff; font-size:19px; margin:0; text-decoration:none; letter-spacing:1pt; ">contacto.succo@gmail.com</p><a target="_blank" style="color:#fff; font-size:19px; letter-spacing:1pt; text-decoration:none; " href="https://www.google.com/">www.succo.com.co</a></div><div style="width:100%; padding:10px 0; margin-top:12px; display:flex; "><div style="width:25%; "></div><div style="width:50%; display:flex; "><a target="_blank" style="width:50%; text-align:center; " href="https://www.facebook.com/"><img alt="Facebook" style="width:50%; " src="https://i.imgur.com/1Y79eZu.png"></a><a target="_blank" style="width:50%; text-align:center; " href="https://www.instagram.com/"><img alt="Instagram" style="width:50%; " src="https://i.imgur.com/m7Ruie1.png"></a><a target="_blank" style="width:50%; text-align:center; " href="https://www.twitter.com/"><img alt="Twitter" style="width:50%; " src="https://i.imgur.com/aeXEkNV.png"></a><a target="_blank" style="width:50%; text-align:center; " href="https://plus.google.com/discover"><img alt="Google Plus" style="width:50%; " src="https://i.imgur.com/0uNWCEw.png"></a></div><div style="width:25%; "></div></div><div style="width:100%; text-align:center; margin-top:12px; "><p style="margin:0; color:#fff; letter-spacing:1pt; ">&copy; 2004-2019 National Restaurant SUCCO.</p></div></div></div></div>
        <% } %>
    </body>
</html>
