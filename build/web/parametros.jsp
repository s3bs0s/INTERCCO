<%@page import="com.INTERCCO.modelo.Beans.Carruseles"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="com.INTERCCO.modelo.Beans.Promociones"%>
<%@page import="com.INTERCCO.modelo.Beans.Productos"%>
<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page import="com.INTERCCO.modelo.Beans.Soportes"%>
<%@page import="com.INTERCCO.modelo.Beans.Categorias"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Parámetros</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        if (session.getAttribute("rolUsuario").equals("Usuario") || session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("Cliente")){
            request.getRequestDispatcher("index").forward(request, response);
        } else { 
            rolUsuario = (String) session.getAttribute("rolUsuario");
            if (rolUsuario.equals("AdminS") || rolUsuario.equals("Gerente")){ %>
            
                <body>
                    <ul class="breadcrumb">
                        <li><a href="index">Inicio</a></li>
                        <li class="active">Parámetros</li>
                    </ul>
                    <section class="section-bodys s-aye">
                        <% String mens = request.getParameter("mensaje");
                            String nomMod = request.getParameter("nomMod");
                            String accMod = request.getParameter("accMod");
                            String tipoE = request.getParameter("tipoE");
                            String nomCateg = request.getParameter("nomCateg");
                            String nomProd = request.getParameter("nomProd");
                            if (mens != null) { %>
                            <% if (mens.equals("YEditarIVA")) {%>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El IVA fue actualizado correctamente.
                            </div>
                            <% } else if (mens.equals("YEstadoSoporte")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <% if (tipoE.equals("P")){ %>
                                    <strong>¡Perfecto!</strong> El soporte fue actualizado a <b>"Pendiente"</b> correctamente.
                                <% } else { %>
                                    <strong>¡Perfecto!</strong> El soporte fue actualizado a <b>"Corregido"</b> correctamente.
                                <% } %>
                            </div>
                            <% } else if (mens.equals("YUrgencia")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El soporte con <b>"Urgencia"</b> fue registrado con éxito.
                            </div>
                            <% } else if (mens.equals("YNoUrgencia")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El soporte fue registrado con éxito.
                            </div>
                            <% } else if (mens.equals("YActualizarSoporte")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La información del soporte fue actualizada correctamente.
                            </div>
                            <% } else if (mens.equals("YCategoria")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La categoría <b>"<%= nomCateg %>"</b> fue registrada con éxito.
                            </div>
                            <% } else if (mens.equals("YProducto")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El producto <b>"<%= nomProd %>"</b> fue registrado con éxito.
                            </div>
                            <% } else if (mens.equals("YPromocion")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La promoción fue registrada con éxito.
                            </div>
                            <% } else if (mens.equals("YCarrusel")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La imagen del carrusel fue registrada con éxito.
                            </div>
                            <% } else if (mens.equals("YActualizarCategoria")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La información de la categoría fue actualizada correctamente.
                            </div>
                            <% } else if (mens.equals("YActualizarProducto")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La información del producto fue actualizada correctamente.
                            </div>
                            <% } else if (mens.equals("YActualizarPromocion")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La información de la promoción fue actualizada correctamente.
                            </div>
                            <% } else if (mens.equals("YActualizarCarrusel")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La información del carrusel fue actualizada correctamente.
                            </div>
                            <% } else if (mens.equals("YCambioCarrusel")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La imagen del carrusel fue actualizada correctamente.
                            </div>
                            <% } else if (mens.equals("YEliminarCategoria")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La categoría <b>"<%= nomCateg %>"</b> fue eliminada con éxito.
                            </div>
                            <% } else if (mens.equals("YEliminarProducto")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El producto <b>"<%= nomProd %>"</b> fue eliminado con éxito.
                            </div>
                            <% } else if (mens.equals("YEliminarPromocion")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La promoción fue eliminada con éxito.
                            </div>
                            <% } else if (mens.equals("YEliminarCarrusel")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> La imagen del carrusel fue eliminada con éxito.
                            </div>
                            <% } else if (mens.equals("Ne")) { %>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Error!</strong> <%= nomMod%> no se pudo <%= accMod%> por un error general en las bases de datos, contacte al administrador del sistema.
                            </div>
                            <% } else if (mens.equals("NeSCorregido")) { %>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Error!</strong> El soporte ya fue corregido, no puede editar su información.
                            </div>
                            <% } else if (mens.equals("NeEnvC")) { %>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Error!</strong> El soporte con <b>"Urgencia"</b> no se pudo registrar por un error en el envió de correo electrónico, contacte al administrador del sistema.
                            </div>
                            <% } else if (mens.equals("NptMP")) { %>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Intentelo de Nuevo!</strong> Escriba un porcentaje valido, sea con un solo punto o ningúno.
                            </div>
                            <% } else if (mens.equals("Nepr")) { %>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Error!</strong> Ya existe una promoción para el producto <b>"<%= nomProd %>"</b>.
                            </div>
                            <% } else if (mens.equals("NfcA")) { %>
                            <div class="alert alert-warning alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Intentelo de Nuevo!</strong> Debe agregar una fecha de caducidad posterior a la de ayer, para la promoción.
                            </div>
                            <% } else if (mens.equals("Nec")) {%>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Error!</strong> La categoría <b>"<%= nomCateg%>"</b> ya se encuentra registrada.
                            </div>
                            <% } %>
                        <% } %>
                        <div class="panel-group" id="accordion">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-carta"><span class="icon-spoon-knife"></span> Productos Carta<span class="glyphicon glyphicon-minus btn-collap"></span></button>
                                </div>
                                <div id="coll-carta" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="tabla-reg">
                                            <button data-toggle="modal" data-target="#productosRGerenteModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                                        </div>
                                        <% ArrayList<Productos> listaProductos = (ArrayList) request.getAttribute("listaProd"); %>
                                        <% if (rolUsuario.equals("Gerente")){ %>
                                            <div class="table-responsive">
                                                <table class="tablaListarProductos table-bordered table">
                                                    <thead>
                                                        <tr>
                                                            <th>Categoría</th>
                                                            <th>Nombre</th>
                                                            <th>Precio</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Categoría</th>
                                                            <th>Nombre</th>
                                                            <th>Precio</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <%  nomSedeUsuario = "";
                                                            if (session.getAttribute("nomSedeUsuario") == null){
                                                                nomSedeUsuario = "Sin Sede";
                                                            } else {
                                                                nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario"); 
                                                            }
                                                            for (Productos prod : listaProductos) {%>
                                                            <% if (prod.getNombreSede().equals(nomSedeUsuario)) { %>
                                                                <tr>
                                                                    <td><%= prod.getNombreCategoria()%></td>
                                                                    <td><%= prod.getNombre()%></td>
                                                                    <td><%= dP.formatNumber(prod.getPrecio()) %></td>
                                                                    <td>
                                                                        <div class="td-espaciado">
                                                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#productosVerModal" onClick="productosVerModal('<%= cA.CifrarASCII(prod.getNombreCategoria()) %>', '<%= cA.CifrarASCII(prod.getNombre()) %>', '<%= prod.getDescripcion()%>', '<%= prod.getPrecio()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#productosAGerenteModal" onClick="productosActualizarModal('<%= prod.getIdProductos()%>', '<%= prod.getIdCategoria() %>', '<%= cA.CifrarASCII(prod.getNombre()) %>', '<%= prod.getDescripcion()%>', '<%= prod.getPrecio()%>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#productosEGerenteModal" onClick="productosEliminarModal('<%= prod.getIdProductos()%>', '<%= cA.CifrarASCII(prod.getNombre()) %>')"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            <% } %>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        <% } else {%>
                                            <table class="tablaListarProductos table-bordered table">
                                                <thead>
                                                    <tr>
                                                        <th>Sede</th>
                                                        <th>Categoría</th>
                                                        <th>Nombre</th>
                                                        <th>Precio</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Sede</th>
                                                        <th>Categoría</th>
                                                        <th>Nombre</th>
                                                        <th>Precio</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <% for (Productos prod : listaProductos) { %>
                                                        <tr>
                                                            <td><%= prod.getNombreSede()%></td>
                                                            <td><%= prod.getNombreCategoria()%></td>
                                                            <td><%= prod.getNombre()%></td>
                                                            <td><%= dP.formatNumber(prod.getPrecio()) %></td>
                                                            <td>
                                                                <div class="td-espaciado">
                                                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#productosVerModal" onClick="productosVerModal('<%= cA.CifrarASCII(prod.getNombreCategoria()) %>', '<%= cA.CifrarASCII(prod.getNombre()) %>', '<%= prod.getDescripcion()%>', '<%= prod.getPrecio()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#productosAGerenteModal" onClick="productosActualizarModal('<%= prod.getIdProductos()%>' ,'<%= prod.getIdCategoria() %>', '<%= cA.CifrarASCII(prod.getNombre()) %>', '<%= prod.getDescripcion()%>', '<%= prod.getPrecio()%>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#productosEGerenteModal" onClick="productosEliminarModal('<%= prod.getIdProductos()%>', '<%= cA.CifrarASCII(prod.getNombre()) %>')"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    <% }%>
                                                </tbody>
                                            </table>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-categorias"><span class="glyphicon glyphicon-list-alt"></span> Categorías Carta<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="coll-categorias" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="tabla-reg">
                                            <button data-toggle="modal" data-target="#categoriasRGerenteModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                                        </div>
                                        <% ArrayList<Categorias> listaCategorias = (ArrayList) request.getAttribute("listaCat"); %>
                                        <% if (rolUsuario.equals("Gerente")){ %>
                                            <div class="table-responsive">
                                                <table class="tablaListarCategorias table-bordered table">
                                                    <thead>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Nombre</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <%  nomSedeUsuario = "";
                                                            if (session.getAttribute("nomSedeUsuario") == null){
                                                                nomSedeUsuario = "Sin Sede";
                                                            } else {
                                                                nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario"); 
                                                            }
                                                            for (Categorias cate : listaCategorias) {%>
                                                            <% if (cate.getNombreSede().equals(nomSedeUsuario)) {%>
                                                                <tr>
                                                                    <td><%= cate.getNombre()%></td>
                                                                    <td>
                                                                        <div class="td-espaciado">
                                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#categoriasAGerenteModal" onClick="categoriasActualizarModal('<%= cate.getIdCategorias() %>', '<%= cA.CifrarASCII(cate.getNombre()) %>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#categoriasEGerenteModal" onClick="categoriasEliminarModal('<%= cate.getIdCategorias() %>', '<%= cA.CifrarASCII(cate.getNombre()) %>');"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            <% } %>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        <% } else {%>
                                            <div class="table-responsive">
                                                <table class="tablaListarCategorias table-bordered table">
                                                    <thead>
                                                        <tr>
                                                            <th>Sede</th>
                                                            <th>Nombre</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Sede</th>
                                                            <th>Nombre</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <% for (Categorias cate : listaCategorias) {%>
                                                            <tr>
                                                                <td><%= cate.getNombreSede()%></td>
                                                                <td><%= cate.getNombre()%></td>
                                                                <td>
                                                                    <div class="td-espaciado">
                                                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#categoriasAGerenteModal" onClick="categoriasActualizarModal('<%= cate.getIdCategorias() %>', '<%= cA.CifrarASCII(cate.getNombre()) %>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                        <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#categoriasEGerenteModal" onClick="categoriasEliminarModal('<%= cate.getIdCategorias() %>', '<%= cA.CifrarASCII(cate.getNombre()) %>');"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-promo"><span class="icon-price-tags"></span> Promociones<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="coll-promo" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="tabla-reg">
                                            <button data-toggle="modal" data-target="#promocionesRGerenteModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                                        </div>
                                        <% ArrayList<Promociones> listaPromociones = (ArrayList) request.getAttribute("listaProm"); %>
                                        <% if (rolUsuario.equals("Gerente")){ %>
                                            <div class="table-responsive">
                                                <table class="tablaListarPromociones table-bordered table">
                                                    <thead>
                                                        <tr>
                                                            <th>Fecha</th>
                                                            <th>Hora</th>
                                                            <th>Producto</th>
                                                            <th>Porcentaje</th>
                                                            <th>Caducidad</th>
                                                            <th>Estado</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Fecha</th>
                                                            <th>Hora</th>
                                                            <th>Producto</th>
                                                            <th>Porcentaje</th>
                                                            <th>Caducidad</th>
                                                            <th>Estado</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <%  nomSedeUsuario = "";
                                                            if (session.getAttribute("nomSedeUsuario") == null){
                                                                nomSedeUsuario = "Sin Sede";
                                                            } else {
                                                                nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario"); 
                                                            }
                                                            for (Promociones prom : listaPromociones) {%>
                                                            <% if (prom.getNombreSede().equals(nomSedeUsuario)) {
                                                                Date date = new Date();
                                                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); %>
                                                                <tr>
                                                                    <%  EstructuraFYH eFYH = new EstructuraFYH();
                                                                        String fecha = String.valueOf(prom.getFchRegistro());
                                                                        String fechaC = String.valueOf(prom.getFchCaducidad());
                                                                        String hora = String.valueOf(prom.getHoraRegistro()); %>
                                                                    <td><%= eFYH.estFecha(fecha, "dd")+"/"+eFYH.estFecha(fecha, "mm")+"/"+eFYH.estFecha(fecha, "aa") %></td>
                                                                    <td><%= eFYH.estHora(hora, "h")+":"+eFYH.estHora(hora, "m") %></td>
                                                                    <td><%= prom.getNombreProducto()%></td>
                                                                    <td><%= prom.getPorcentajePromo()%>%</td>
                                                                    <td><%= eFYH.estFecha(fechaC, "dd")+"/"+eFYH.estFecha(fechaC, "mm")+"/"+eFYH.estFecha(fechaC, "aa") %></td>
                                                                    <% if (prom.getFchCaducidad().before(dateFormat.parse(dateFormat.format(date)))){ %>
                                                                        <td class="danger">Caducada</td>
                                                                    <% } else { %>
                                                                        <td class="success">Vigente</td>
                                                                    <% } %>
                                                                    <td>
                                                                        <div class="td-espaciado">
                                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#promocionesAGerenteModal" onClick="promocionesActualizarModal('<%= prom.getIdPromociones()%>', '<%= prom.getPorcentajePromo()%>', '<%= prom.getFchCaducidad()%>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                            <button type="button" onClick="window.location = 'PromocionE?idProm='+<%= prom.getIdPromociones()%>;" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            <% } %>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        <% } else {%>
                                            <div class="table-responsive">
                                                <table class="tablaListarPromocionesAdminS table-bordered table">
                                                    <thead>
                                                        <tr>
                                                            <th>Sede</th>
                                                            <th>Fecha</th>
                                                            <th>Hora</th>
                                                            <th>Producto</th>
                                                            <th>Porcentaje</th>
                                                            <th>Caducidad</th>
                                                            <th>Estado</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Sede</th>
                                                            <th>Fecha</th>
                                                            <th>Hora</th>
                                                            <th>Producto</th>
                                                            <th>Porcentaje</th>
                                                            <th>Caducidad</th>
                                                            <th>Estado</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <% for (Promociones prom : listaPromociones) {
                                                            Date date = new Date();
                                                            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd"); %>
                                                            <tr>
                                                                <%  EstructuraFYH eFYH = new EstructuraFYH();
                                                                    String fecha = String.valueOf(prom.getFchRegistro());
                                                                    String fechaC = String.valueOf(prom.getFchCaducidad());
                                                                    String hora = String.valueOf(prom.getHoraRegistro()); %>
                                                                <td><%= prom.getNombreSede()%></td>
                                                                <td><%= eFYH.estFecha(fecha, "dd")+"/"+eFYH.estFecha(fecha, "mm")+"/"+eFYH.estFecha(fecha, "aa") %></td>
                                                                <td><%= eFYH.estHora(hora, "h")+":"+eFYH.estHora(hora, "m") %></td>
                                                                <td><%= prom.getNombreProducto()%></td>
                                                                <td><%= prom.getPorcentajePromo()%>%</td>
                                                                <td><%= eFYH.estFecha(fechaC, "dd")+"/"+eFYH.estFecha(fechaC, "mm")+"/"+eFYH.estFecha(fechaC, "aa") %></td>
                                                                <% if (prom.getFchCaducidad().before(dateFormat.parse(dateFormat.format(date)))){ %>
                                                                    <td class="danger">Caducada</td>
                                                                <% } else { %>
                                                                    <td class="success">Vigente</td>
                                                                <% } %>
                                                                <td>
                                                                    <div class="td-espaciado">
                                                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#promocionesAGerenteModal" onClick="promocionesActualizarModal('<%= prom.getIdPromociones()%>', '<%= prom.getPorcentajePromo()%>', '<%= prom.getFchCaducidad()%>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                        <button type="button" onClick="window.location = 'PromocionE?idProm='+<%= prom.getIdPromociones()%>;" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-e-carrusel"><span class="icon-map"></span> Carrusel<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="coll-e-carrusel" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="tabla-reg">
                                            <button data-toggle="modal" data-target="#carruselesRGerenteModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                                        </div>
                                        <% ArrayList<Carruseles> listaCarruseles = (ArrayList) request.getAttribute("listaCarr"); %>
                                        <% if (rolUsuario.equals("Gerente")){ %>
                                            <div class="table-responsive">
                                                <table class="tablaListarCarruseles table-bordered table">
                                                    <thead>
                                                        <tr>
                                                            <th>Tipo de Imagen</th>
                                                            <th>Para</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Tipo de Imagen</th>
                                                            <th>Para</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <%  nomSedeUsuario = "";
                                                            if (session.getAttribute("nomSedeUsuario") == null){
                                                                nomSedeUsuario = "Sin Sede";
                                                            } else {
                                                                nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario"); 
                                                            }
                                                            for (Carruseles carr : listaCarruseles) {%>
                                                            <% if (carr.getNombreSede().equals(nomSedeUsuario)) { %>
                                                                <tr>
                                                                    <% if (carr.getTipo().equals("Publico")){ %>
                                                                        <td>Público</td>
                                                                    <% } else { %>
                                                                        <td><%= carr.getTipo()%></td>
                                                                    <% } %>
                                                                    <td><%= carr.getDirigidoA()%></td>
                                                                    <td>
                                                                        <div class="td-espaciado">
                                                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#carruselesVerModal" onClick="carruselesVerModal('<%= rolUsuario %>', '<%= carr.getTipo()%>', '<%= carr.getDirigidoA()%>', '<%= carr.getNombreImg()%>', '<%= cA.CifrarASCII(carr.getNombreSede())%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#carruselesAGerenteModal" onClick="carruselesActualizarModal('<%= carr.getIdCarruseles()%>' ,'<%= carr.getTipo()%>', '<%= carr.getDirigidoA()%>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#carruselesCGerenteModal" onClick="carruselesCambioModal('<%= carr.getIdCarruseles()%>');"><span class="icon-file-picture"></span> Cambiar Imagen</button>
                                                                            <button type="button" onClick="window.location = 'CarruselE?idCarr='+<%= carr.getIdCarruseles()%>;" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            <% } %>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        <% } else {%>
                                            <div class="table-responsive">
                                                <table class="tablaListarCarruseles table-bordered table">
                                                    <thead>
                                                        <tr>
                                                            <th>Sede</th>
                                                            <th>Tipo de Imagen</th>
                                                            <th>Para</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </thead>
                                                    <tfoot>
                                                        <tr>
                                                            <th>Sede</th>
                                                            <th>Tipo de Imagen</th>
                                                            <th>Para</th>
                                                            <th>Acciones</th>
                                                        </tr>
                                                    </tfoot>
                                                    <tbody>
                                                        <% for (Carruseles carr : listaCarruseles) {%>
                                                            <tr>
                                                                <td><%= carr.getNombreSede()%></td>
                                                                <% if (carr.getTipo().equals("Publico")){ %>
                                                                    <td>Público</td>
                                                                <% } else { %>
                                                                    <td><%= carr.getTipo()%></td>
                                                                <% } %>
                                                                <td><%= carr.getDirigidoA()%></td>
                                                                <td>
                                                                    <div class="td-espaciado">
                                                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#carruselesVerModal" onClick="carruselesVerModal('<%= rolUsuario %>', '<%= carr.getTipo()%>', '<%= carr.getDirigidoA()%>', '<%= carr.getNombreImg()%>', '<%= cA.CifrarASCII(carr.getNombreSede())%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#carruselesAGerenteModal" onClick="carruselesActualizarModal('<%= carr.getIdCarruseles()%>' ,'<%= carr.getTipo()%>', '<%= carr.getDirigidoA()%>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#carruselesCGerenteModal" onClick="carruselesCambioModal('<%= carr.getIdCarruseles()%>');"><span class="icon-file-picture"></span> Cambiar Imagen</button>
                                                                        <button type="button" onClick="window.location = 'CarruselE?idCarr='+<%= carr.getIdCarruseles()%>;" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                                    </div>
                                                                </td>
                                                            </tr>
                                                        <% }%>
                                                    </tbody>
                                                </table>
                                            </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-soporte"><span class="icon-phone"></span> Soporte Técnico<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="coll-soporte" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <%  ArrayList<Soportes> listaSoportes = (ArrayList) request.getAttribute("listaSop"); 
                                            if (rolUsuario.equals("Gerente")){ %>
                                                <p class="mi-obli">Si encuentra algún error o falta de actualización en el <span class="a-mi-sp">software de SUCCO</span>, puede hacer un petición para una futura revisión y correción.</p>
                                                <div class="tabla-reg">
                                                    <button data-toggle="modal" data-target="#soporteRModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                                                </div>
                                        <% } %>
                                        <div class="table-responsive">
                                            <table class="tablaListarSoportes table-bordered table">
                                                <% if (rolUsuario.equals("Gerente")){ %>

                                                <thead>
                                                    <tr>
                                                        <th>Descripción</th>
                                                        <th>Ruta o Módulo</th>
                                                        <th>Estado</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Descripción</th>
                                                        <th>Ruta o Módulo</th>
                                                        <th>Estado</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%  idUsuario = 0;
                                                        if (session.getAttribute("idUsuario") == null || (int) session.getAttribute("idUsuario") == 0){
                                                            idUsuario = 0;
                                                        } else {
                                                            idUsuario = (int) session.getAttribute("idUsuario"); 
                                                        }
                                                        for (Soportes sopo : listaSoportes) {%>
                                                        <% if (sopo.getIdUsuario() == idUsuario) {%>
                                                            <tr>
                                                                <td><%= cA.DescifrarASCII(sopo.getDescripcion()) %></td>
                                                                <td><%= cA.DescifrarASCII(sopo.getRuta()) %></td>
                                                                <% if (sopo.getEstado().equals("P")) { %>
                                                                <td class="warning">Pendiente</td>
                                                                <td>
                                                                    <div class="td-espaciado">
                                                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#soportesVerModal" onClick="soportesVerModal('<%= rolUsuario %>', '<%= sopo.getFchSolicitud() %>', '<%= sopo.getFchResuelto()%>', '<%= sopo.getEmailUsuario()%>', '<%= sopo.getIdSede()%>', '<%= sopo.getRuta()%>', '<%= sopo.getDescripcion()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                                        <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#soporteAModal" onClick="soportesActualizarModal('<%= sopo.getIdSoportes() %>', '<%= sopo.getRuta()%>', '<%= sopo.getDescripcion()%>');"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                    </div>
                                                                </td>
                                                                <% } else { %>
                                                                <td class="success">Corregido</td>
                                                                <td>
                                                                    <div class="td-espaciado">
                                                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#soportesVerModal" onClick="soportesVerModal('<%= rolUsuario %>', '<%= sopo.getFchSolicitud() %>', '<%= sopo.getFchResuelto()%>', '<%= sopo.getEmailUsuario()%>', '<%= sopo.getIdSede()%>', '<%= sopo.getRuta()%>', '<%= sopo.getDescripcion()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                                    </div>
                                                                </td>
                                                                <% } %>
                                                            </tr>
                                                        <% } %>
                                                    <% } %>
                                                </tbody>

                                                <% } else { %>

                                                <thead>
                                                    <tr>
                                                        <th>Descripción</th>
                                                        <th>Ruta o Módulo</th>
                                                        <th>Estado</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </thead>
                                                <tfoot>
                                                    <tr>
                                                        <th>Descripción</th>
                                                        <th>Ruta o Módulo</th>
                                                        <th>Estado</th>
                                                        <th>Acciones</th>
                                                    </tr>
                                                </tfoot>
                                                <tbody>
                                                    <%  for (Soportes sopo : listaSoportes) {%>
                                                        <tr>
                                                            <td><%= cA.DescifrarASCII(sopo.getDescripcion()) %></td>
                                                            <td><%= cA.DescifrarASCII(sopo.getRuta()) %></td>
                                                            <% if (sopo.getEstado().equals("P")) { %>
                                                            <td class="warning">Pendiente</td>
                                                            <td>
                                                                <div class="td-espaciado">
                                                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#soportesVerModal" onClick="soportesVerModal('<%= rolUsuario %>', '<%= sopo.getFchSolicitud() %>', '<%= sopo.getFchResuelto()%>', '<%= sopo.getEmailUsuario()%>', '<%= sopo.getIdSede()%>', '<%= sopo.getRuta()%>', '<%= sopo.getDescripcion()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                                    <button type="button" class="btn btn-success" onClick="window.location = 'SoporteE?tipoE=C&idSop='+<%= sopo.getIdSoportes()%>;"><span class="glyphicon glyphicon-ok"></span> Corregido</button>
                                                                </div>
                                                            </td>
                                                            <% } else { %>
                                                            <td class="success">Corregido</td>
                                                            <td>
                                                                <div class="td-espaciado">
                                                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#soportesVerModal" onClick="soportesVerModal('<%= rolUsuario %>', '<%= sopo.getFchSolicitud() %>', '<%= sopo.getFchResuelto()%>', '<%= sopo.getEmailUsuario()%>', '<%= sopo.getIdSede()%>', '<%= sopo.getRuta()%>', '<%= sopo.getDescripcion()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                                    <button type="button" class="btn btn-warning" onClick="window.location = 'SoporteE?tipoE=P&idSop='+<%= sopo.getIdSoportes()%>;"><span class="glyphicon glyphicon-ban-circle"></span> Pendiente</button>
                                                                </div>
                                                            </td>
                                                            <% } %>
                                                        </tr>
                                                    <% } %>
                                                </tbody>

                                                <% } %>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordion" data-target="#coll-iva"><span class="icon-mug"></span> IVA<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="coll-iva" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="coll-iva-titulo">
                                            <p>Impuesto al valor agregado</p>
                                        </div>
                                        <%  float IVA = (float) request.getAttribute("IVA");
                                            rolSedeUsuario = "";
                                            if (session.getAttribute("rolSedeUsuario") == null){
                                                rolSedeUsuario = "";
                                            } else {
                                                rolSedeUsuario = (String) session.getAttribute("rolSedeUsuario"); 
                                            }
                                            if (rolSedeUsuario.equals("Principal")){ %>
                                            <div class="coll-iva-cj">
                                                <div class="coll-iva-cj-btn">
                                                    <button type="button" data-toggle="modal" data-target="#ivaAModal" class="btn">Editar</button>
                                                </div>
                                                <p class="coll-iva-cj-porcen"><%= IVA%>%</p>
                                            </div>
                                            <%@include file="ivaModal.jsp" %>
                                        <% } else { %>
                                            <div class="coll-iva-cj">
                                                <p class="coll-iva-cj-porcen"><%= IVA%>%</p>
                                            </div>
                                        <% } %>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </section>
                </body>
                <%@include file="soportesModales.jsp" %>
                <%@include file="categoriasGerenteModales.jsp" %>
                <%@include file="productosGerenteModales.jsp" %>
                <%@include file="promocionesGerenteModales.jsp" %>
                <%@include file="carruselesGerenteModales.jsp" %>
            
            <% } else { %>
            
                <body>
                    <ul class="breadcrumb">
                        <li><a href="index">Inicio</a></li>
                        <li class="active">Soporte</li>
                    </ul>
                    <section class="section-bodys s-aye">
                        <% String mens = request.getParameter("mensaje");
                            String accMod = request.getParameter("accMod");
                            if (mens != null) { %>
                            <% if (mens.equals("YUrgencia")) {%>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El soporte con <b>URGENCIA</b> fue registrado con éxito.
                            </div>
                            <% } else if (mens.equals("YNoUrgencia")) { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El soporte fue registrado con éxito.
                            </div>
                            <% } else if (mens.equals("NeEnvC")) { %>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Error!</strong> El soporte con <b>URGENCIA</b> no se pudo registrar por un error en el envió de correo electrónico, contacte al administrador del sistema.
                            </div>
                            <% } else if (mens.equals("Ne")) { %>
                            <div class="alert alert-danger alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Error!</strong> El soporte no se pudo <%= accMod%> por un error general en las bases de datos, contacte al administrador del sistema.
                            </div>
                            <% } %>
                        <% } %>
                        <h1><span class="icon-phone"></span> Soporte Técnico</h1>
                        <p class="mi-obli">Si encuentra algún error o falta de actualización en el <span class="a-mi-sp">software de SUCCO</span>, puede hacer un petición para una futura revisión y correción.</p>
                        <div class="tabla-reg">
                            <button data-toggle="modal" data-target="#soporteRModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                        </div>
                        <% ArrayList<Soportes> listaSoportes = (ArrayList) request.getAttribute("listaSop"); %>
                        <div class="table-responsive">
                            <table class="tablaListarSoportes table-bordered table">
                                <thead>
                                    <tr>
                                        <th>Descripción</th>
                                        <th>Ruta o Módulo</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Descripción</th>
                                        <th>Ruta o Módulo</th>
                                        <th>Estado</th>
                                        <th>Acciones</th>
                                    </tr>
                                </tfoot>
                                <tbody>
                                    <%  idUsuario = 0;
                                        if (session.getAttribute("idUsuario") == null || (int) session.getAttribute("idUsuario") == 0){
                                            idUsuario = 0;
                                        } else {
                                            idUsuario = (int) session.getAttribute("idUsuario"); 
                                        }
                                        for (Soportes sopo : listaSoportes) {%>
                                        <% if (sopo.getIdUsuario() == idUsuario) {%>
                                            <tr>
                                                <td><%= cA.DescifrarASCII(sopo.getDescripcion())%></td>
                                                <td><%= cA.DescifrarASCII(sopo.getRuta())%></td>
                                                <% if (sopo.getEstado().equals("P")) { %>
                                                <td class="warning">Pendiente</td>
                                                <td>
                                                    <div class="td-espaciado">
                                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#soportesVerModal" onClick="soportesVerModal('<%= rolUsuario %>', '<%= sopo.getFchSolicitud() %>', '<%= sopo.getFchResuelto()%>', '<%= sopo.getEmailUsuario()%>', '<%= sopo.getIdSede()%>', '<%= sopo.getRuta()%>', '<%= sopo.getDescripcion()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                    </div>
                                                </td>
                                                <% } else { %>
                                                <td class="success">Corregido</td>
                                                <td>
                                                    <div class="td-espaciado">
                                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#soportesVerModal" onClick="soportesVerModal('<%= rolUsuario %>', '<%= sopo.getFchSolicitud() %>', '<%= sopo.getFchResuelto()%>', '<%= sopo.getEmailUsuario()%>', '<%= sopo.getIdSede()%>', '<%= sopo.getRuta()%>', '<%= sopo.getDescripcion()%>');"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                    </div>
                                                </td>
                                                <% } %>
                                            </tr>
                                        <% } %>
                                    <% } %>
                                </tbody>
                            </table>
                        </div>
                    </section>
                </body>
                <%@include file="soportesModales.jsp" %>
                
        <% }
        } %>
        <%@include file="footer.jsp" %>
</html>
