<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>INTERCCO</title>
        </style>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <ul class="breadcrumb">
            <li><a href="index">Inicio</a></li>
            <li class="active">INTERCCO</li>
        </ul>
        <section class="section-indexs">
            <article class="art-panel-btns">
                <div class="acc-rap">
                    <p>Base de Datos completa de INTERCCO</p>
                </div>
                <div class="panel-btns">
                    <div class="panelchild-btn">
                        <button type="button" class="btn">Pedidos <span class="icon-clipboard"></span></button>
                    </div>
                    <div class="panelchild-btn">
                        <button type="button" class="btn">Recibos <span class="icon-folder-open"></span></button>
                    </div>
                    <div class="panelchild-btn">
                        <button type="button" class="btn">Insumos <span class="icon-books"></span></button>
                    </div>
                </div>
                <div class="panel-btns">
                    <div class="panelchild-btn">
                        <button type="button" class="btn">Proveedores <span class="icon-address-book"></span></button>
                    </div>
                    <div class="panelchild-btn">
                        <button type="button" class="btn">Usuarios <span class="icon-users"></span></button>
                    </div>
                    <div class="panelchild-btn">
                        <button type="button" class="btn">PQRSF <span class="glyphicon glyphicon-share-alt"></span></button>
                    </div>
                </div>
            </article>
        </section>
    </body>
    <%@include file="footer.jsp" %>
</html>
