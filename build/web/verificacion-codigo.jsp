<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
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
        <title>Verificación</title>
    </head>
    <body>
        <%  String codigo = "";
            String email = "";
            String nom = "";
            if (request.getParameter("codigoV") == null){
                request.getRequestDispatcher("index").forward(request, response);
            } else {
                codigo = request.getParameter("codigoV");
                email = request.getParameter("emailV");
                nom = request.getParameter("nomV"); %>
                <section class="body-codigoRC">
                    <article class="codigoRC-modal">
                        <div class="div-content">
                            <div class="div-header">
                                <h4 class="div-title"><span class="icon-user-check"></span><label for="verifCodigo" class="me">Código de Verificación</label></h4>
                            </div>
                            <div class="div-body">
                                <form autocomplete="off">
                                    <p class="mi-intru">Se ha enviado un código de verificación a su correo electrónico, escribalo en el campo inferior. La verificación se repite una sola vez en su cuenta, no evité ejercerla.</p>
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="icon-user-check"></i></span>
                                        <input required type="text" onfocus="if (this.value === 'Solo 10 caracteres!' || this.value === 'Código incorrecto!'){this.value = '';}" onkeyup="HayCodigo(this)" class="form-control" id="verifCodigo" name="verifCodigo" placeholder="Código de Verificación">
                                    </div>

                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button disabled id="BtnConfirmarRC" onclick="CodigoCorrectoV('<%= codigo %>','<%= email %>')" type="button" class="btn-div btn btn-principal">Confirmar</button>
                                        </div>
                                        <div class="cont-btns-secundario">
                                            <button type="button" onClick="window.location = 'UsuarioCV?verifEmailUsuario='+DescifrarASCII('<%= email %>')+'&verifNombresUsuario='+DescifrarASCII('<%= nom %>')" class="btn-div btn btn-secundario">Reenviar Código</button>
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
