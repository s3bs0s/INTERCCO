<%@page import="java.util.Calendar"%>
<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.INTERCCO.modelo.Beans.Insumos"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insumos</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        if (!session.getAttribute("rolUsuario").equals("Gerente")){
            request.getRequestDispatcher("index").forward(request, response);
        } else { %>
            <body>
                <ul class="breadcrumb">
                    <li><a href="index">Inicio</a></li>
                    <li class="active">Insumos</li>
                </ul>
                <section class="section-bodys">
                    <% String mens = request.getParameter("mensaje");
                    String nomIns = request.getParameter("nomIns");
                    String refIns = request.getParameter("refIns");
                    if (mens != null){ %>
                        <% if (mens.equals("Y")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El insumo <b>"<%= nomIns %>"</b> fue registrado con éxito.
                        </div>
                        <% } else if (mens.equals("YEliminar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El insumo <b>"<%= nomIns %>"</b> fue eliminado con éxito.
                        </div>
                        <% } else if (mens.equals("YActualizar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La información del insumo <b>"<%= nomIns %>"</b> fue actualizada correctamente.
                        </div>
                        <% } else if (mens.equals("YDevuelto")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El correo fue enviado al proveedor correctamente para la devolución del insumo.
                        </div>
                        <% } else if (mens.equals("Ne")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El insumo no se pudo registrar por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                        <% } else if (mens.equals("NeF")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El insumo no se pudo registrar por un error de fechas, contacte al administrador del sistema.
                        </div>
                        <% } else if (mens.equals("NfcIoA")){ %>
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> Debe agregar una fecha de caducidad posterior a la actual, para el insumo <b>"<%= nomIns %>"</b>.
                        </div>
                        <% } else if (mens.equals("NeNom")){ %>
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> El nombre <b>"<%= nomIns %>"</b> del insumo ya se encuentra registrado.
                        </div>
                        <% } else if (mens.equals("NeRef")){ %>
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> La referencia <b>"<%= refIns %>"</b> del insumo ya se encuentra registrada.
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
                        <h1><span class="icon-books"></span> Insumos</h1>
                    <% } else { %>
                        <h1><span class="icon-books"></span> Insumos de <%= nomSedeUsuario%></h1>
                    <% } %>
                    <div class="tabla-reg">
                        <button data-toggle="modal" data-target="#insumoRGerenteModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                    </div>
                    <% ArrayList<Insumos> listaInsumos = (ArrayList) request.getAttribute("listaInsu"); %>
                    <table class="tablaListarInsumos table-bordered table">
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>Cantidad</th>
                                <th>Unidad de Medida</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Nombre</th>
                                <th>Cantidad</th>
                                <th>Unidad de Medida</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <% for (Insumos  insu: listaInsumos) { %>
                                <% if(insu.getIdSede().equals(nomSedeUsuario)){ %>
                                    <% Date date = new Date();
                                        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                        
                                        Calendar calendarInsumo = Calendar.getInstance();
                                        calendarInsumo.setTime(dateFormat.parse(String.valueOf(insu.getFchIngreso())));
                                        calendarInsumo.add(Calendar.DAY_OF_YEAR, 7);
                                        Date dateLimite = dateFormat.parse(dateFormat.format(calendarInsumo.getTime()));
                                        
                                        if ((insu.getFchCaducidad().before(dateFormat.parse(dateFormat.format(date))) || insu.getFchCaducidad().equals(dateFormat.parse(dateFormat.format(date)))) && !insu.getExistencia().equals("D")){%>
                                    <tr class="purple">
                                        <% } else { %>
                                    <tr>
                                        <% } %>
                                        <td><%= insu.getNombre()%></td>
                                        <td><%= insu.getCantidad()%></td>
                                        <td><%= insu.getUnidadMedida()%></td>
                                        <% if (insu.getExistencia().equals("D")) { %>
                                            <td class="info">Devuelto</td>
                                        <% } else { %>
                                            <% if (insu.getFchCaducidad().before(dateFormat.parse(dateFormat.format(date))) || insu.getFchCaducidad().equals(dateFormat.parse(dateFormat.format(date)))){%>
                                                <td class="purple">Vencido</td>
                                            <% } else {%>
                                                <% if (insu.getCantidad() < 1) { %>
                                                <td class="danger">¡Agotado!</td>
                                                <% } else if (insu.getCantidad() >= 1 && insu.getCantidad() <= 20) { %>
                                                <td class="warning">Por agota</td>
                                                <% } else if (insu.getCantidad() > 20) { %>
                                                <td class="success">Hay suficiente</td>
                                                <% } %>
                                            <% } %>
                                        <% } %>
                                        <td class="td-espaciado">
                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#insumosVerModal" onClick="insumoVerModal('<%= cA.CifrarASCII(insu.getReferencia())%>', '<%= cA.CifrarASCII(insu.getNombre())%>', '<%= insu.getFchIngreso()%>', '<%= insu.getFchCaducidad()%>', '<%= insu.getUnidadMedida()%>', '<%= insu.getCantidad()%>', '<%= insu.getPrecioUnitario()%>', '<%= cA.CifrarASCII(insu.getNombreProveedor())%>', '<%= insu.getTipoIf()%>', '<%= cA.CifrarASCII(insu.getNumIt())%>', '<%= cA.CifrarASCII(insu.getNombrePc())%>', '<%= cA.CifrarASCII(insu.getCargoPc())%>', '<%= cA.CifrarASCII(insu.getEmail())%>', '<%= cA.CifrarASCII(insu.getFaxPc())%>', '<%= cA.CifrarASCII(insu.getExtensionFaxPc())%>', '<%= cA.CifrarASCII(insu.getTelefonoPc())%>', '<%= cA.CifrarASCII(insu.getMovilPc())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#insumoAGerenteModal" onClick="insumoActualizarModal('<%= insu.getIdInsumos()%>', '<%= cA.CifrarASCII(insu.getReferencia())%>', '<%= cA.CifrarASCII(insu.getNombre())%>', '<%= insu.getFchCaducidad()%>', '<%= insu.getUnidadMedida()%>', '<%= insu.getCantidad()%>', '<%= insu.getPrecioUnitario()%>', '<%= insu.getIdProveedor()%>')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                            <% if ((dateLimite.equals(dateFormat.parse(dateFormat.format(date))) || dateLimite.after(dateFormat.parse(dateFormat.format(date)))) && !insu.getExistencia().equals("D") && insu.getFchCaducidad().after(dateFormat.parse(dateFormat.format(date)))) { %>
                                            <button type="button" class="btn btn-active-os" data-toggle="modal" data-target="#insumoDGerenteModal" onClick="insumoDevolverModal('<%= insu.getIdInsumos()%>', '<%= cA.CifrarASCII(insu.getEmail())%>', '<%= cA.CifrarASCII(insu.getNombre())%>', '<%= cA.CifrarASCII(insu.getNombrePc())%>')"><span class="glyphicon glyphicon-transfer"></span> Devolver</button>
                                            <% } %>
                                            <% if ((insu.getFchCaducidad().before(dateFormat.parse(dateFormat.format(date))) || insu.getFchCaducidad().equals(dateFormat.parse(dateFormat.format(date)))) && !insu.getExistencia().equals("D")) { %>
                                                <button type="button" onClick="window.location = 'InsumoE?idIns='+<%= insu.getIdInsumos()%>;" class="btn btn-purple"><span class="icon-hour-glass"></span> Venció</button>
                                            <% } else { %>
                                                <button type="button" onClick="window.location = 'InsumoE?idIns='+<%= insu.getIdInsumos()%>;" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                            <% } %>
                                        </td>
                                    </tr>
                                <% } %>
                            <% } %>
                        </tbody>
                    </table>
                </section>
            </body>
            <%@include file="insumosGerenteModales.jsp" %>
            <%@include file="footer.jsp" %>
        <% } %>
</html>
