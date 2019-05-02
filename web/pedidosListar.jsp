<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <ul class="breadcrumb">
            <li><a href="index">Inicio</a></li>
            <li class="active">Pedidos</li>
        </ul>
        <section class="section-bodys">
            <h1><span class="icon-clipboard"></span> Pedidos (Mesero)</h1>
            <div class="tabla-reg">
                <button onClick="window.open('pedidosRegistrarMesero.jsp', '_self')" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
            </div>
            <div class="table-responsive">
                <table class="tablaListarPedidos table-bordered table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Mesa</th>
                            <th>SubTotal</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Mesa</th>
                            <th>SubTotal</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td>08/10/2018</td>
                            <td>14:15PM</td>
                            <td>05</td>
                            <td>13.600</td>
                            <td class="warning">En espera</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                <button type="button" data-toggle="modal" data-target="#cancelarModal" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                <button type="button" class="btn btn-active-os"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>14:10PM</td>
                            <td>08</td>
                            <td>24.100</td>
                            <td class="info">En producción</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                <button type="button" class="btn btn-active-os"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>13:55PM</td>
                            <td>10</td>
                            <td>10.000</td>
                            <td class="active">Facturado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                <button type="button" class="btn btn-active-os"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>13:45PM</td>
                            <td>05</td>
                            <td>37.900</td>
                            <td class="danger">Cancelado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                <button type="button" class="btn btn-active-os"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
    <br>
    <body>
        <ul class="breadcrumb">
            <li><a href="index">Inicio</a></li>
            <li class="active">Domicilios</li>
        </ul>
        <section class="section-bodys">
            <h1><span class="icon-truck"></span> Domicilios (Cajero)</h1>
            <div class="table-responsive">
                <table class="tablaListarDomicilios table-bordered table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Cliente</th>
                            <th>Dirección Entrega</th>
                            <th>SubTotal</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Cliente</th>
                            <th>Dirección Entrega</th>
                            <th>SubTotal</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td>08/10/2018</td>
                            <td>14:15PM</td>
                            <td>Camilo Lopez</td>
                            <td>Calle 45 #67-3</td>
                            <td>15.800</td>
                            <td class="warning">En espera</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Confirmar</button>
                                <button type="button" data-toggle="modal" data-target="#cancelarModal" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>14:10PM</td>
                            <td>Paulina Gomes</td>
                            <td>Carrera 80 #45G</td>
                            <td>23.150</td>
                            <td class="info">En producción</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Confirmar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>13:55PM</td>
                            <td>Estefania Marquez</td>
                            <td>Calle 12 #78 ASUR</td>
                            <td>2.000</td>
                            <td class="active">Facturado<br>
                            (En camino)</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Confirmar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>13:45PM</td>
                            <td>Sebastian While</td>
                            <td>Calle 60 #58-T3</td>
                            <td>43.700</td>
                            <td class="danger">Cancelado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Confirmar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>13:50PM</td>
                            <td>Catalina Santana</td>
                            <td>Calle 69 #66-12</td>
                            <td>98.000</td>
                            <td class="success">Entregado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Confirmar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
    <br>
    <body>
        <ul class="breadcrumb">
            <li><a href="index">Inicio</a></li>
            <li class="active">Domicilios Disponibles</li>
        </ul>
        <section class="section-bodys">
            <h1><span class="icon-truck"></span> Domicilios por Entregar (Domiciliario)</h1>
            <div class="tabla-reg">
                <button type="button" class="btn">Mis Domicilios <span class="tabla-reg-m"><span class="glyphicon glyphicon-search"></span></span></button>
            </div>
            <div class="table-responsive">
                <table class="tablaListarDomicilios table-bordered table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Cliente</th>
                            <th>Dirección Entrega</th>
                            <th>SubTotal</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Cliente</th>
                            <th>Dirección Entrega</th>
                            <th>SubTotal</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td>?</td>
                            <td class="warning">?</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-ok"></span> Confirmar</button>
                                <button type="button" data-toggle="modal" data-target="#cancelarModal" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
    <br>
    <body>
        <ul class="breadcrumb">
            <li><a href="index">Inicio</a></li>
            <li class="active">Pedidos</li>
        </ul>
        <section class="section-bodys">
            <h1><span class="icon-clipboard"></span> Pedidos (Gerente)</h1>
            <div class="tabla-reg">
                <button type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
            </div>
            <div class="table-responsive">
                <table class="tablaListarPedidos table-bordered table">
                    <thead>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Mesa</th>
                            <th>SubTotal</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </thead>
                    <tfoot>
                        <tr>
                            <th>Fecha</th>
                            <th>Hora</th>
                            <th>Mesa</th>
                            <th>SubTotal</th>
                            <th>Estado</th>
                            <th>Acciones</th>
                        </tr>
                    </tfoot>
                    <tbody>
                        <tr>
                            <td>08/10/2018</td>
                            <td>14:15PM</td>
                            <td>05</td>
                            <td>13.600</td>
                            <td class="warning">En espera</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                <button type="button" data-toggle="modal" data-target="#cancelarModal" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                <button type="button" class="btn btn-active-os"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>14:10PM</td>
                            <td>08</td>
                            <td>24.100</td>
                            <td class="info">En producción</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                <button type="button" class="btn btn-active-os"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>13:55PM</td>
                            <td>10</td>
                            <td>10.000</td>
                            <td class="active">Facturado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                <button type="button" class="btn btn-active-os"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                            </td>
                        </tr>
                        <tr>
                            <td>08/10/2018</td>
                            <td>13:45PM</td>
                            <td>05</td>
                            <td>37.900</td>
                            <td class="danger">Cancelado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                <button type="button" class="btn btn-active-os"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </section>
    </body>
    <%@include file="footer.jsp" %>
</html>
