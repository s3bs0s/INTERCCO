<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="com.INTERCCO.modelo.Beans.Logs"%>
<%@page import="com.INTERCCO.modelo.Beans.Pqrsf"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Auditoría</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        if (!session.getAttribute("rolUsuario").equals("AdminS") && !session.getAttribute("rolUsuario").equals("Gerente")){
            request.getRequestDispatcher("index").forward(request, response);
        } else { 
            rolUsuario = (String) session.getAttribute("rolUsuario");
            if (rolUsuario.equals("AdminS")){ %>
                <div style="position:relative; margin-bottom:-50px;">
                    <div style="height:100%; width:100%; background:rgba(0,0,0,0.9); z-index:600; position:absolute; top:0; left:0; display:flex; align-items:center; justify-content:center; ">
                        <img style="height:50%; transform:rotate(-20deg);" src="Estilos/img/PubilicidadSucco/EnConstruccion (Transparente).png" alt="En Contrucción">
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="index">Inicio</a></li>
                        <li class="active">Auditoría</li>
                    </ul>
                    <section class="section-bodys s-aye">
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-logs"><span class="icon-search"></span> Logs<span class="glyphicon glyphicon-minus btn-collap"></span></button>
                                </div>
                                <div id="coll-logs" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <% ArrayList<Logs> listaLogs = (ArrayList) request.getAttribute("listaLogs"); %>
                                        <div class="table-responsive">
                                            <table class="tablaListarLogs table-bordered table">
                                                <thead>
                                                    <tr>
                                                        <th>Fecha</th>
                                                        <th>Hora</th>
                                                        <th>Sede</th>
                                                        <th>Usuario</th>
                                                        <th>Ubicación</th>
                                                        <th>Operación</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Fecha</th>
                                                        <th>Hora</th>
                                                        <th>Sede</th>
                                                        <th>Usuario</th>
                                                        <th>Ubicación</th>
                                                        <th>Operación</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <% for (Logs logs : listaLogs) { %>
                                                    <tr>
                                                        <%  EstructuraFYH eFYH = new EstructuraFYH();
                                                            String fechaReg = String.valueOf(logs.getFchRegistro());
                                                            String horaReg = String.valueOf(logs.getHoraRegistro()); %>
                                                        <td><%= eFYH.estFecha(fechaReg, "dd")+"/"+eFYH.estFecha(fechaReg, "mm")+"/"+eFYH.estFecha(fechaReg, "aa") %></td>
                                                        <td><%= eFYH.estHora(horaReg, "h")+":"+eFYH.estHora(horaReg, "m") %></td>
                                                        <td><%= logs.getIdSede()%></td>
                                                        <td><%= logs.getIdUsuario()%></td>
                                                        <td><%= logs.getTabla()%></td>
                                                        <td><%= logs.getAccion()%></td>
                                                    </tr>
                                                    <% } %>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-permisos"><span class="icon-equalizer2"></span> Permisos<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="coll-permisos" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <p>hola</p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </div>
            <% } else { %>
                <div style="position:relative; margin-bottom:-50px;">
                    <div style="height:100%; width:100%; background:rgba(0,0,0,0.9); z-index:600; position:absolute; top:0; left:0; display:flex; align-items:center; justify-content:center; ">
                        <img style="height:50%; transform:rotate(-20deg);" src="Estilos/img/PubilicidadSucco/EnConstruccion (Transparente).png" alt="En Contrucción">
                    </div>
                    <ul class="breadcrumb">
                        <li><a href="index">Inicio</a></li>
                        <li class="active">Logs</li>
                    </ul>
                    <section class="section-bodys">
                        <h1><span class="icon-stats-dots"></span> Logs</h1>
                        <% ArrayList<Logs> listaLogs = (ArrayList) request.getAttribute("listaLogs"); %>
                        <div class="table-responsive">
                            <table class="tablaListarLogs table-bordered table">
                                <thead>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Usuario</th>
                                        <th>Ubicación</th>
                                        <th>Operación</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Fecha</th>
                                        <th>Hora</th>
                                        <th>Usuario</th>
                                        <th>Ubicación</th>
                                        <th>Operación</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <% for (Logs logs : listaLogs) { %>
                                        <% if (logs.getIdSede().equals("Itagüí") && !logs.getTabla().equals("Accediendo..")) { %>
                                            <tr>
                                                <%  EstructuraFYH eFYH = new EstructuraFYH();
                                                    String fecha = String.valueOf(logs.getFchRegistro());
                                                    String hora = String.valueOf(logs.getHoraRegistro()); %>
                                                <td><%= eFYH.estFecha(fecha, "dd")+"/"+eFYH.estFecha(fecha, "mm")+"/"+eFYH.estFecha(fecha, "aa") %></td>
                                                <td><%= eFYH.estHora(hora, "h")+":"+eFYH.estHora(hora, "m") %></td>
                                                <td><%= logs.getIdUsuario()%></td>
                                                <td><%= logs.getTabla()%></td>
                                                <td><%= logs.getAccion()%></td>
                                            </tr>
                                        <% } %>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </div>
        <% }
        } %>
        <%@include file="footer.jsp" %>
</html>
