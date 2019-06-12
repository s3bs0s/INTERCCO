<%@page import="com.INTERCCO.modelo.Beans.Sedes"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sedes</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        if (session.getAttribute("rolUsuario") != null){
            rolUsuario = (String) session.getAttribute("rolUsuario");
        }
        if (!rolUsuario.equals("AdminS")){
            request.getRequestDispatcher("index").forward(request, response);
        } else { %>
            <body>
                <ul class="breadcrumb">
                    <li><a href="index">Inicio</a></li>
                    <li class="active">Sedes</li>
                </ul>
                <section class="section-bodys">
                    <% String mens = request.getParameter("mensaje");
                    String nomSed = request.getParameter("nomSed");
                    String nomCiu = request.getParameter("nomCiu");
                    String rgoSed = request.getParameter("rgoSed");
                    if (mens != null){ %>
                        <% if (mens.equals("YP")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La sede principal <b>"<%= nomSed %>"</b> fue registrada con éxito.
                        </div>
                        <% } else if (mens.equals("YS")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La sede secundaria <b>"<%= nomSed %>"</b> fue registrada con éxito.
                        </div>
                        <% } else if (mens.equals("YActualizar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La información de la sede <b>"<%= nomSed %>"</b> fue actualizada correctamente.
                        </div>
                        <% } else if (mens.equals("YActualizarRango")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El rango de la sede fue actualizado a <b>"<%= rgoSed %>"</b> correctamente.
                        </div>
                        <% } else if (mens.equals("NeSed")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> Ya existe la sede <b>"<%= nomSed %>"</b>.
                        </div>
                        <% } else if (mens.equals("NeSedP")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> Ya existe una sede principal en la ciudad <b>"<%= nomCiu %>"</b>.
                        </div>
                        <% } else if (mens.equals("Ne")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> La sede no se pudo registrar por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                        <% } %>
                    <% } %>
                    <h1><span class="glyphicon glyphicon-globe"></span> Sedes</h1>
                    <div class="tabla-reg">
                        <button data-toggle="modal" data-target="#sedesRGerenteModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                    </div>
                    <% ArrayList<Sedes> listaSedes = (ArrayList) request.getAttribute("listaSedes"); %>
                    <div class="table-responsive">
                        <table class="tablaListarSedes table-bordered table">
                            <thead>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Rango</th>
                                    <th>Ciudad</th>
                                    <th>Dirección</th>
                                    <th>Mesas</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Nombre</th>
                                    <th>Rango</th>
                                    <th>Ciudad</th>
                                    <th>Dirección</th>
                                    <th>Mesas</th>
                                    <th>Acciones</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <% for (Sedes sede : listaSedes) {%>
                                    <tr>
                                        <td><%= sede.getNombre()%></td>
                                        <td><%= sede.getRango()%></td>
                                        <td><%= sede.getNombreCiudad()%></td>
                                        <td><%= sede.getDireccion()%></td>
                                        <td><%= sede.getNumMesas()%></td>
                                        <td>
                                            <div class="td-espaciado">
                                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#sedesVerModal" onClick="sedesVerModal('<%= cA.CifrarASCII(sede.getNombre())%>', '<%= sede.getRango()%>', '<%= cA.CifrarASCII(sede.getNombreCiudad())%>', '<%= cA.CifrarASCII(sede.getDireccion())%>', '<%= sede.getNumMesas()%>', '<%= sede.getSrcMapa()%>', '<%= sede.getHorasHorario()%>', '<%= sede.getDiasHorario()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#sedesAGerenteModal" onClick="sedesActualizarModal('<%= sede.getIdSedes()%>', '<%= cA.CifrarASCII(sede.getNombre())%>', '<%= sede.getRango()%>', '<%= sede.getIdCiudad()%>', '<%= cA.CifrarASCII(sede.getDireccion())%>', '<%= sede.getNumMesas()%>', '<%= sede.getSrcMapa()%>', '<%= sede.getHorasHorario()%>', '<%= sede.getDiasHorario()%>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                <% if (sede.getTienePrincipal().equals("Y")){
                                                    if (sede.getRango().equals("Principal")){ %>
                                                        <button type="button" class="btn btn-active-os" onClick="window.location = 'SedeAR?rgo=S&idSede='+<%= sede.getIdSedes()%>;"><span class="glyphicon glyphicon-chevron-down"></span> Descender</button>
                                                <% }
                                                } else {
                                                    if (sede.getRango().equals("Secundaria")){ %>
                                                        <button type="button" class="btn btn-purple" onClick="window.location = 'SedeAR?rgo=P&idSede='+<%= sede.getIdSedes()%>;"><span class="glyphicon glyphicon-chevron-up"></span> Ascender</button>
                                                <% }
                                                } %>
                                            </div>
                                        </td>
                                    </tr>
                                <% }%>
                            </tbody>
                        </table>
                    </div>
                </section>
            </body>
            <%@include file="sedesAdminSModales.jsp" %>
            <%@include file="footer.jsp" %>
        <% } %>
</html>