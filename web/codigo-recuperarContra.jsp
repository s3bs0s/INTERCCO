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
        <title>Código de Recuperación</title>
    </head>
    <body>
        <%  String codigo = "";
            String email = "";
            if (request.getParameter("codigo") == null){
                request.getRequestDispatcher("index").forward(request, response);
            } else {
                codigo = request.getParameter("codigo");
                email = request.getParameter("emailU"); %>
                <section class="body-codigoRC">
                    <article class="codigoRC-modal">
                        <div class="div-content">
                            <div class="div-header">
                                <h4 class="div-title"><span class="icon-qrcode"></span><label for="codigo-recu" class="me">Código de Recuperación</label></h4>
                            </div>
                            <div class="div-body">
                                <form>
                                    <p class="mi-intru">Escriba el código que ha sido enviado a su correo electrónico en el campo inferior.</p>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icon-qrcode"></i></span>
                                        <input required type="text" onkeyup="HayCodigo(this)" class="form-control" id="recupCodigo" placeholder="Código de Recuperación">
                                    </div>

                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button disabled id="BtnConfirmarRC" onclick="CodigoCorrecto('<%= codigo %>','<%= email %>')" type="button" class="btn-div btn btn-principal">Confirmar</button>
                                        </div>
                                        <div class="cont-btns-secundario">
                                            <button type="button" onClick="window.location = 'UsuarioRC?recupEmailUsuario='+DescifrarASCII('<%= email %>')" class="btn-div btn btn-secundario">Reenviar Código</button>
                                            <button type="button" onClick="window.location = 'Salir'"  class="btn-div btn btn-secundario">Cancelar</button>
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
