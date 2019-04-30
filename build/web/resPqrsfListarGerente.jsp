<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="com.INTERCCO.modelo.Beans.Pqrsf"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PQRSF</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        if (!session.getAttribute("rolUsuario").equals("Gerente")){
            request.getRequestDispatcher("index").forward(request, response);
        } else { %>
            <body>
                <ul class="breadcrumb">
                    <li><a href="index">Inicio</a></li>
                    <li class="active">Respuestas PQRSF</li>
                </ul>
                <section class="section-bodys">
                    <% String mens = request.getParameter("mensaje");
                    if (mens != null){ %>
                        <% if (mens.equals("YEliminar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La solicitud PQRSF fue descartada correctamente.
                        </div>
                        <% } else if (mens.equals("YAtendido")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La solicitud PQRSF fue respondida correctamente.
                        </div>
                        <% } else if (mens.equals("Ne")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> La solicitud PQRSF no se pudo responder por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                        <% } %>
                    <% } %>
                    <%  nomSedeUsuario = "";
                        if (session.getAttribute("nomSedeUsuario") == null){
                            nomSedeUsuario = "Vacio";
                        } else {
                            nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario"); 
                        } 
                        if (nomSedeUsuario.equals("Vacio")){ %>
                        <h1><span class="icon-users"></span> Respuestas PQRSF</h1>
                    <% } else { %>
                        <h1><span class="icon-users"></span> Respuestas PQRSF de <%= nomSedeUsuario%></h1>
                    <% } %>
                    <% ArrayList<Pqrsf> listaPqrsf = (ArrayList) request.getAttribute("listaPqrsf"); %>
                    <table class="tablaListarResPQRSF table-bordered table">
                        <thead>
                            <tr>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Cliente</th>
                                <th>Tipo de Solicitud</th>
                                <th>Para</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Fecha</th>
                                <th>Hora</th>
                                <th>Cliente</th>
                                <th>Tipo de Solicitud</th>
                                <th>Para</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </tfoot
                        <tbody>
                            <% for (Pqrsf pqrsf: listaPqrsf) { %>
                                <% if(pqrsf.getIdSedeDirigido().equals(nomSedeUsuario)){ %>
                                    <tr>
                                        <%  EstructuraFYH eFYH = new EstructuraFYH();
                                            String fecha = String.valueOf(pqrsf.getFchRegistro());
                                            String hora = String.valueOf(pqrsf.getHoraRegistro()); %>
                                        <td><%= eFYH.estFecha(fecha, "dd")+" / "+eFYH.estFecha(fecha, "mm")+" / "+eFYH.estFecha(fecha, "aa") %></td>
                                        <td><%= eFYH.estHora(hora, "h")+" : "+eFYH.estHora(hora, "m") %></td>
                                        <td><%= cA.DescifrarASCII(pqrsf.getIdCliente())%></td>
                                        <td><%= pqrsf.getTipoSolicitud()%></td>
                                        <td><%= pqrsf.getDirigidoA()%></td>
                                        <% if (pqrsf.getEstado().equals("Atendido")){ %>
                                            <td class="success">Atendido</td>
                                            <td class="td-espaciado">
                                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#resPqrsfVerModal" onClick="resPqrsfVerModal('<%= pqrsf.getIdCliente()%>', '<%= cA.CifrarASCII(pqrsf.getNombreCliente())%>', '<%= pqrsf.getFchRegistro()%>', '<%= pqrsf.getHoraRegistro()%>', '<%= pqrsf.getTipoSolicitud()%>', '<%= pqrsf.getDirigidoA()%>', '<%= pqrsf.getConsulta()%>', '<%= pqrsf.getIdInterlocutor()%>', '<%= pqrsf.getRespuesta()%>', '<%= cA.CifrarASCII(pqrsf.getIdSedeDirigido())%>', '<%= cA.CifrarASCII(pqrsf.getIdSedeCliente())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                            </td>
                                        <% } else if (pqrsf.getEstado().equals("Descartado")){ %>
                                            <td class="danger">Descartado</td>
                                            <td class="td-espaciado">
                                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#resPqrsfVerModal" onClick="resPqrsfVerModal('<%= pqrsf.getIdCliente()%>', '<%= cA.CifrarASCII(pqrsf.getNombreCliente())%>', '<%= pqrsf.getFchRegistro()%>', '<%= pqrsf.getHoraRegistro()%>', '<%= pqrsf.getTipoSolicitud()%>', '<%= pqrsf.getDirigidoA()%>', '<%= pqrsf.getConsulta()%>', '<%= pqrsf.getIdInterlocutor()%>', '<%= pqrsf.getRespuesta()%>', '<%= cA.CifrarASCII(pqrsf.getIdSedeDirigido())%>', '<%= cA.CifrarASCII(pqrsf.getIdSedeCliente())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                            </td>
                                        <% } else if (pqrsf.getRespuesta().equals("83S105S110S32S114S101S115S112S117S101S115S116S97")) { %>
                                            <td class="active">Sin respuesta</td>
                                            <td class="td-espaciado">
                                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#resPqrsfVerModal" onClick="resPqrsfVerModal('<%= pqrsf.getIdCliente()%>', '<%= cA.CifrarASCII(pqrsf.getNombreCliente())%>', '<%= pqrsf.getFchRegistro()%>', '<%= pqrsf.getHoraRegistro()%>', '<%= pqrsf.getTipoSolicitud()%>', '<%= pqrsf.getDirigidoA()%>', '<%= pqrsf.getConsulta()%>', '<%= pqrsf.getIdInterlocutor()%>', '<%= pqrsf.getRespuesta()%>', '<%= cA.CifrarASCII(pqrsf.getIdSedeDirigido())%>', '<%= cA.CifrarASCII(pqrsf.getIdSedeCliente())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                <button type="button" class="btn btn-success" data-toggle="modal" data-target="#pqrsfRGerenteModal" onClick="resPqrsfResponderModal('<%= pqrsf.getIdPqrsf()%>', '<%= pqrsf.getIdCliente()%>');"><span class="glyphicon glyphicon-share-alt"></span> Responder</button>
                                                <button type="button" onClick="window.location = 'PqrsfDyC?mensa=Descartado&idPqrsf='+<%= pqrsf.getIdPqrsf()%>;" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Descartar</button>
                                            </td>
                                        <% } %>
                                    </tr>
                                <% } %>
                            <% } %>
                            <!--<tr>
                                <td>08/10/2018</td>
                                <td>14:20PM</td>
                                <td>Sebastian Sossa</td>
                                <td>Felicitaciones</td>
                                <td>Administración</td>
                                <td class="active">Sin respuesta</td>
                                <td>
                                    <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                    <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-share-alt"></span> Responder</button>
                                    <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Descartar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>08/10/2018</td>
                                <td>14:25PM</td>
                                <td>Alejandro Rivas</td>
                                <td>Queja</td>
                                <td>Empleado</td>
                                <td class="danger">Descartado</td>
                                <td>
                                    <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                    <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-share-alt"></span> Responder</button>
                                    <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Descartar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>08/10/2018</td>
                                <td>14:30PM</td>
                                <td>Vannesa Cadavid</td>
                                <td>Sugerencia</td>
                                <td>Administración</td>
                                <td class="success">Atendido</td>
                                <td>
                                    <button type="button" class="btn btn-info"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                    <button type="button" class="btn btn-success"><span class="glyphicon glyphicon-share-alt"></span> Responder</button>
                                    <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-ban-circle"></span> Descartar</button>
                                </td>
                            </tr>-->
                        </tbody>
                    </table>
                </section>
            </body>
            <%@include file="resPqrsfGerenteModales.jsp" %>
            <%@include file="footer.jsp" %>
        <% } %>
</html>
