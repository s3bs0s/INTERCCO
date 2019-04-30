<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="Estilos/css/sheader.css">
        <link rel="stylesheet" type="text/css" href="Estilos/css/smodales.css"/>
        <link rel="stylesheet" type="text/css" href="Estilos/fonts/fonts.css">
        
        <link rel="stylesheet" type="text/css" href="Estilos/css/sbodys.css">
        
        <link rel="stylesheet" type="text/css" href="Estilos/css/bootstrap.css">
        
        <link rel="icon" href="Estilos/img/PapeleriaCorporativaSucco/Favicon/Marca SUCCO COREL (Favicon-ICO).ico">
        <title>Recuperar Contraseña</title>
    </head>
    <body>
        <%  String email = "";
            if (request.getParameter("emailU") == null){
                request.getRequestDispatcher("index").forward(request, response);
            } else {
                email = request.getParameter("emailU"); %>
                <section class="body-codigoRC">
                    <article class="codigoRC-modal">
                        <div class="div-content">
                            <div class="div-header">
                                <h4 class="div-title"><span class="glyphicon glyphicon-plus"></span><label for="#" class="me">Nueva Contraseña</label></h4>
                            </div>
                            <div class="div-body">
                                <form action="UsuarioNC" method="POST">
                                    <div class="input-group inpDesa">
                                        <span class="input-group-addon">Email:</span>
                                        <input type="text" class="form-control" value="<%= email %>" id="recupEmail" name="recupEmail">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icon-key"></i></span>
                                        <input required type="password" onkeyup="ContrasIguales()" class="form-control" id="recupNuevaContra" name="recupNuevaContra" placeholder="Nueva Contraseña">
                                        <span class="input-group-addon i-pass" id="BtnMOPassword1" onClick="MOPass(1)">Mostrar</span>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="glyphicon glyphicon-repeat"></i></span>
                                        <input required type="password" onkeyup="ContrasIguales()" class="form-control" id="recupRepitaNuevaContra" placeholder="Repita la Nueva Contraseña">
                                        <span class="input-group-addon i-pass" id="BtnMOPassword2" onClick="MOPass(2)">Mostrar</span>
                                    </div>

                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button type="submit" id="recupCambiarContra" class="btn-div btn btn-principal">Cambiar Contraseña</button>
                                        </div>
                                        <div class="cont-btns-secundario">
                                            <button type="button" onClick="window.open('Salir', '_self')"  class="btn-div btn btn-secundario">Cancelar</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                            <div class="div-footer"></div>
                        </div>
                    </article>
                </section>
            <% } %>
    </body>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    
    <script src="Estilos/js/modalesExternas.js"></script>
</html>
