<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language='java' contentType='text/html' isErrorPage='true' %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Estilos/css/sbodys.css">
        <link rel="stylesheet" type="text/css" href="Estilos/css/bootstrap.css">
        <link rel="icon" href="Estilos/img/PapeleriaCorporativaSucco/Favicon/Marca SUCCO COREL (Favicon-ICO).ico">
        <title>404</title>
    </head>
    <body class="body-error">
        <div class="caj-error">
            <p class="caj-error-1">404</p>
            <p class="caj-error-2">Error</p>
            <hr>
            <p class="caj-error-3">Mensaje</p>
            <% String mens = request.getParameter("mensaje");
                if (mens != null){ %>
                <p class="caj-error-4"><%= mens %></p>
            <% } else { %>
                <p class="caj-error-4"><%= exception %></p>
            <% } %>
            <hr>
            <button type="button" class="btn" onclick="window.location = 'Salir'">Volver</button>
        </div>
    </body>
</html>
