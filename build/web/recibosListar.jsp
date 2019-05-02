<%@page import="com.INTERCCO.modelo.Beans.Comandas"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Recibos</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <ul class="breadcrumb">
            <li><a href="index">Inicio</a></li>
            <li class="active">Facturas & Comandas</li>
        </ul>
        <section class="section-bodys s-aye">
            <div class="panel-group" id="accordion">
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-facturas"><span class="icon-coin-dollar"></span> Facturas (Gerente)<span class="icon-play3 btn-collap"></span></button>
                    </div>
                    <div id="coll-facturas" class="panel-collapse collapse in">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="tablaListarFacturas table-bordered table">
                                    <thead>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Tipo de Pedido</th>
                                            <th>Mesero</th>
                                            <th>Total</th>
                                            <th>Estado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Tipo de Pedido</th>
                                            <th>Mesero</th>
                                            <th>Total</th>
                                            <th>Estado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr>
                                            <td>08/10/2018</td>
                                            <td>14:15PM</td>
                                            <td>Restaurante</td>
                                            <td>Luz Marina</td>
                                            <td>19.000</td>
                                            <td class="active">Por facturar</td>
                                            <td class="td-espaciado">
                                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                <button type="button" class="btn btn-active-os"><span class="icon-clipboard"></span> Facturar</button>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>08/10/2018</td>
                                            <td>13:55PM</td>
                                            <td>Domicilio</td>
                                            <td>Felipe Lozano</td>
                                            <td>43.000</td>
                                            <td class="active-os">Facturado</td>
                                            <td class="td-espaciado">
                                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                <button type="button" class="btn btn-active-os"><span class="icon-clipboard"></span> Facturar</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="panel panel-default">
                    <div class="panel-heading">
                        <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-comandas"><span class="icon-copy"></span> Comandas<span class="icon-play3 btn-collap"></span></button>
                    </div>
                    <div id="coll-comandas" class="panel-collapse collapse">
                        <div class="panel-body">
                            <div class="table-responsive">
                                <table class="tablaListarComandas table-bordered table">
                                    <thead>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Tipo de Pedido</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Tipo de Pedido</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <%-- for (Comandas  c: listaComandas) { %>
                                        <tr>
                                            <% String fdr = String.valueOf(c.getFchRegistro());
                                                String afdr = "";
                                                String mfdr = "";
                                                String dfdr = "";
                                                int yheq = 1;
                                                for (int n = 0; n < fdr.length(); n++) {
                                                    char ca = fdr.charAt(n);
                                                    if (ca != '-'){
                                                        if (yheq == 1){
                                                            afdr = afdr + ca;
                                                        } else if (yheq == 2){
                                                            mfdr = mfdr + ca;
                                                        } else if (yheq == 3){
                                                            dfdr = dfdr + ca;
                                                        }
                                                    } else {
                                                        yheq = yheq + 1;
                                                    }
                                                }
                                                yheq = 1; %>
                                            <td><%= dfdr+" / "+mfdr+" / "+afdr %></td>
                                            <% String hdr = String.valueOf(c.getHoraRegistro());
                                                String hhdr = "";
                                                String mhdr = "";
                                                String shdr = "";
                                                for (int n = 0; n < hdr.length(); n++) {
                                                    char ca = hdr.charAt(n);
                                                    if (ca != ':'){
                                                        if (yheq == 1){
                                                            hhdr = hhdr + ca;
                                                        } else if (yheq == 2){
                                                            mhdr = mhdr+ ca;
                                                        } else if (yheq == 3){
                                                            shdr = shdr + ca;
                                                        }
                                                    } else {
                                                        yheq = yheq + 1;
                                                    }
                                                }
                                                yheq = 1; %>
                                            <td><%= hhdr+" : "+mhdr %></td>
                                            <td>Restaurante</td>
                                            <td class="td-espaciado">
                                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                            </td>
                                        </tr>
                                        <% } --%>
                                        <tr>
                                            <td>08/10/2018</td>
                                            <td>13:55PM</td>
                                            <td>Domicilio</td>
                                            <td class="td-espaciado">
                                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
    <br>
    <body>
        <ul class="breadcrumb">
            <li><a href="index">Inicio</a></li>
            <li class="active">Facturas</li>
        </ul>
        <section class="section-bodys">
            <h1><span class="icon-clipboard"></span> Facturas (Cajero)</h1>
            <div class="table-responsive">
                <table class="tablaListarFacturas table-bordered table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Tipo de Pedido</th>
                            <th>Mesero</th>
                            <th>Total</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Tipo de Pedido</th>
                            <th>Mesero</th>
                            <th>Total</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td>08/10/2018</td>
                            <td>14:15PM</td>
                            <td>Restaurante</td>
                            <td>Luz Marina</td>
                            <td>19.000</td>
                            <td class="active">Por facturar</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-active-os"><span class="icon-clipboard"></span> Facturar</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>13:55PM</td>
                            <td>Domicilio</td>
                            <td>Felipe Lozano</td>
                            <td>43.000</td>
                            <td class="active-os">Facturado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-active-os"><span class="icon-clipboard"></span> Facturar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
    <%@include file="footer.jsp" %>
</html>
