<%@page import="com.INTERCCO.modelo.Beans.Facturas"%>
<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Facturas</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        if (session.getAttribute("rolUsuario") != null){
            rolUsuario = (String) session.getAttribute("rolUsuario");
        }
        if (!rolUsuario.equals("Gerente")){
            request.getRequestDispatcher("index").forward(request, response);
        } else { %>
            <body>
                <ul class="breadcrumb">
                    <li><a href="index">Inicio</a></li>
                    <li class="active">Facturas</li>
                </ul>
                <section class="section-bodys">
                    <% String mens = request.getParameter("mensaje");
                    if (mens != null){ %>
                        <% if (mens.equals("Y")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La factura <b>""</b> fue registrado con éxito.
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
                        <h1><span class="icon-coin-dollar"></span> Facturas</h1>
                    <% } else { %>
                        <h1><span class="icon-coin-dollar"></span> Facturas de <%= nomSedeUsuario%></h1>
                    <% } %>
                    <% ArrayList<Facturas> listaFacturas = (ArrayList) request.getAttribute("listaFact"); %>
                    <div class="table-responsive">
                        <table class="tablaListarFacturas table-bordered table">
                            <thead>
                                <tr>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Cliente</th>
                                    <th>Cajero</th>
                                    <th>Total</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Cliente</th>
                                    <th>Cajero</th>
                                    <th>Total</th>
                                    <th>Acciones</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <% for (Facturas  fact : listaFacturas) {
                                    if(fact.getNomSede().equals(nomSedeUsuario)){ %>
                                        <tr>
                                            <%  EstructuraFYH eFYH = new EstructuraFYH();
                                                String fecha = String.valueOf(fact.getFchRegistro());
                                                String hora = String.valueOf(fact.getHoraRegistro()); %>
                                            <td><%= eFYH.estFecha(fecha, "dd")+"/"+eFYH.estFecha(fecha, "mm")+"/"+eFYH.estFecha(fecha, "aa") %></td>
                                            <td><%= eFYH.estHora(hora, "h")+":"+eFYH.estHora(hora, "m") %></td>
                                            <td><%= fact.getNomCliente()%></td>
                                            <td><%= fact.getNomCajero()%></td>
                                            <td><%= dP.formatNumber(fact.getTotal()) %></td>
                                            <td>
                                                <div class="td-espaciado">
                                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#facturasVerModal" onclick="facturasVer('<%= cA.CifrarASCII(fact.getNomMesero()) %>', '<%= cA.CifrarASCII(fact.getNomCajero()) %>', '<%= cA.CifrarASCII(fact.getNomCliente()) %>', '<%= fact.getMesa()%>', '<%= fact.getImporte()%>', '<%= fact.getSubTotal()%>', '<%= fact.getTotal()%>', '<%= cA.CifrarASCII(fact.getDetallesPedidos()) %>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                    <button type="button" class="btn btn-active-os" onclick="verFactura('<%= fact.getIdFacturas() %>')"><span class="glyphicon glyphicon-download-alt"></span> Ver Factura</button>
                                                </div>
                                            </td>
                                        </tr>
                                    <% } %>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </section>
            </body>
            <%@include file="facturasModales.jsp" %>
            <%@include file="footer.jsp" %>
        <% } %>
</html>
