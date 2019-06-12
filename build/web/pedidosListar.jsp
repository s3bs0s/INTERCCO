<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="com.INTERCCO.modelo.Beans.Pedidos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Pedidos</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        if (session.getAttribute("rolUsuario") != null){
            rolUsuario = (String) session.getAttribute("rolUsuario");
        }
        if (rolUsuario.equals("Usuario") || rolUsuario.equals("Cliente")){
            request.getRequestDispatcher("index").forward(request, response);
        } else {
            if (rolUsuario.equals("Gerente") || rolUsuario.equals("Mesero")){ %>
            
                <div id="pedidosRegistrar">
                    <ul class="breadcrumb">
                        <li><a href="index">Inicio</a></li>
                        <li><a class="btnListarRutaPedidos" href="#">Pedidos</a></li>
                        <li class="active">Registrar</li>
                    </ul>
                    <section class="section-rp">
                        <form id="regFormPedidos" action="#" method="POST">
                            <div id="regCAJProductosPedidos"></div>
                            <article>

                                <div class="srpIG">
                                    <h1>Información General</h1>
                                    <div class="input-group">
                                        <span class="input-group-addon">Número de mesa:</span>
                                        <select required class="form-control" id="regMesaPedidos" name="regMesaPedidos"></select>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">Subtotal:</span>
                                        <input disabled type="text" class="form-control" name="regSubtotalPedidos" id="regSubtotalPedidos">
                                    </div>

                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button type="button" onclick="registrarPedido('reg')" class="btn-rp btn btn-principal">Registrar Pedido<span id="regSpanWarningPedidos">Debe agregar productos!</span></button>
                                        </div>
                                        <div class="cont-btns-secundario">
                                            <button type="button" class="btn-rp btn btn-secundario btnListarPedidos">Atrás</button>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="srpAPP">
                                    <h1>Agregar producto al pedido</h1>
                                    <div class="input-group">
                                        <span class="input-group-addon">Categoría:</span>
                                        <select required onchange="cambioCategoria(this.value, 'reg'); $('#regBtnAgregarPedidos').removeAttr('disabled')" class="form-control" id="regCategoriaPedidos"></select>
                                    </div>
                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button type="button" data-toggle="modal" data-target="#productoPAggVerModal" onclick="productoPAggVerModal('reg')" class="btn-rp btn btn-ip btn-principal">Información del Producto</button>
                                        </div>
                                    </div>
                                    <div id="regCJSProductosPedidos" class="input-group"></div>
                                    <div class="input-group">
                                        <span class="input-group-addon">Cantidad:</span>
                                        <input required type="tel" onkeyup="validacionCantidad(this,this.value)" onblur="if(this.value === ''){this.value = '1';}" onkeypress="return acceptNum(event)" class="form-control" id="regCantidadPedidos" placeholder="Cantidad.">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">Observación:</span>
                                        <textarea required class="form-control" placeholder="¿Alguna observación para el producto pedido?" id="regObservacionPedidos"></textarea>
                                    </div>

                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button type="button" id="regBtnAgregarPedidos" onclick="agregarProductoPedido('reg')" class="btn-rp btn btn-principal">Agregar</button>
                                        </div>
                                    </div>
                                </div>

                            </article>

                            <h1>Lista de Productos del Pedido</h1>
                            <div class="table-responsive">
                                <table class="regTablaListarProductosPedido table-bordered table">
                                    <thead>
                                        <tr>
                                            <th>Categoría</th>
                                            <th>Producto</th>
                                            <th>Cantidad</th>
                                            <th>Subtotal</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Categoría</th>
                                            <th>Producto</th>
                                            <th>Cantidad</th>
                                            <th>Subtotal</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </form>
                    </section>
                </div>
                <div id="pedidosActualizar">
                    <ul class="breadcrumb">
                        <li><a href="index">Inicio</a></li>
                        <li><a class="btnListarRutaPedidos" href="#">Pedidos</a></li>
                        <li class="active">Actualizar</li>
                    </ul>
                    <section class="section-rp">
                        <form id="actuaFormPedidos" action="#" method="POST">
                            <div id="actuaCAJProductosPedidos"></div>
                            <article>

                                <div class="srpIG">
                                    <h1>Información General</h1>
                                    <div class="input-group">
                                        <input type="hidden" name="actuaIDPedido" id="actuaIDPedido">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">Número de mesa:</span>
                                        <select required class="form-control" name="actuaMesaPedidos" id="actuaMesaPedidos"></select>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">Subtotal:</span>
                                        <input disabled type="text" class="form-control" name="actuaSubtotalPedidos" id="actuaSubtotalPedidos">
                                    </div>

                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button type="button" onclick="registrarPedido('actua')" class="btn-rp btn btn-principal">Actualizar Pedido<span id="actuaSpanWarningPedidos">Debe agregar productos!</span></button>
                                        </div>
                                        <div class="cont-btns-secundario">
                                            <button type="button" class="btn-rp btn btn-secundario btnListarPedidos">Atrás</button>
                                        </div>
                                    </div>
                                </div>
                                
                                <div class="srpAPP">
                                    <h1>Agregar producto al pedido</h1>
                                    <div class="input-group">
                                        <span class="input-group-addon">Categoría:</span>
                                        <select required onchange="cambioCategoria(this.value, 'actua'); $('#actuaBtnAgregarPedidos').removeAttr('disabled')" class="form-control" id="actuaCategoriaPedidos"></select>
                                    </div>
                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button type="button" data-toggle="modal" data-target="#productoPAggVerModal" onclick="productoPAggVerModal('actua')" class="btn-rp btn btn-ip btn-principal">Información del Producto</button>
                                        </div>
                                    </div>
                                    <div id="actuaCJSProductosPedidos" class="input-group"></div>
                                    <div class="input-group">
                                        <span class="input-group-addon">Cantidad:</span>
                                        <input required type="tel" onkeyup="validacionCantidad(this,this.value)" onblur="if(this.value === ''){this.value = '1';}" onkeypress="return acceptNum(event)" class="form-control" id="actuaCantidadPedidos" placeholder="Cantidad.">
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-addon">Observación:</span>
                                        <textarea required class="form-control" placeholder="¿Alguna observación para el producto pedido?" id="actuaObservacionPedidos"></textarea>
                                    </div>

                                    <div class="input-group cont-btn">
                                        <div class="cont-btn-principal">
                                            <button type="button" id="actuaBtnAgregarPedidos" onclick="agregarProductoPedido('actua')" class="btn-rp btn btn-principal">Agregar</button>
                                        </div>
                                    </div>
                                </div>

                            </article>

                            <h1>Lista de Productos del Pedido</h1>
                            <div class="table-responsive">
                                <table class="actuaTablaListarProductosPedido table-bordered table">
                                    <thead>
                                        <tr>
                                            <th>Categoría</th>
                                            <th>Producto</th>
                                            <th>Cantidad</th>
                                            <th>Subtotal</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Categoría</th>
                                            <th>Producto</th>
                                            <th>Cantidad</th>
                                            <th>Subtotal</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody></tbody>
                                </table>
                            </div>
                        </form>
                    </section>
                </div>
                <% if (rolUsuario.equals("Gerente")){ %>
                    <div id="pedidosListar">
                        <ul class="breadcrumb">
                            <li><a href="index">Inicio</a></li>
                            <li class="active">Pedidos</li>
                        </ul>
                        <section class="section-bodys">
                            <% String mens = request.getParameter("mensaje");
                            if (mens != null){ %>
                                <% if (mens.equals("Y")){ %>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Perfecto!</strong> El pedido fue registrado con éxito.
                                </div>
                                <% } else if (mens.equals("Ne")){ %>
                                <div class="alert alert-danger alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Error!</strong> El pedido no se pudo registrar por un error general en las bases de datos, contacte al administrador del sistema.
                                </div>
                                <% } else if (mens.equals("YActualizar")){ %>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Perfecto!</strong> El pedido fue actualizado correctamente.
                                </div>
                                <% } else if (mens.equals("YCancelar")){ %>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Perfecto!</strong> El pedido fue cancelado correctamente.
                                </div>
                                <% } else if (mens.equals("YDevolver")){ %>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Perfecto!</strong> El pedido fue devuelto correctamente.
                                </div>
                                <% } %>
                            <% } %>
                            <%  nomSedeUsuario = "";
                                rolUsuario = "Mesero";
                                if (session.getAttribute("nomSedeUsuario") == null){
                                    nomSedeUsuario = "Vacio";
                                } else {
                                    nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario"); 
                                    rolUsuario = (String) session.getAttribute("rolUsuario");
                                } 
                                if (nomSedeUsuario.equals("Vacio")){ %>
                                <h1><span class="icon-clipboard"></span> Pedidos</h1>
                            <% } else { %>
                                <h1><span class="icon-clipboard"></span> Pedidos de <%= nomSedeUsuario%></h1>
                            <% } %>
                            <div class="tabla-reg">
                                <button type="button" id="btnRegistrarPedidos" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                            </div>
                            <% ArrayList<Pedidos> listaPedidos = (ArrayList) request.getAttribute("listaPed"); %>
                            <div class="table-responsive">
                                <table class="tablaListarPedidosGerente table-bordered table">
                                    <thead>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Empleado</th>
                                            <th>Mesa</th>
                                            <th>Subtotal</th>
                                            <th>Estado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Fecha</th>
                                            <th>Hora</th>
                                            <th>Empleado</th>
                                            <th>Mesa</th>
                                            <th>Subtotal</th>
                                            <th>Estado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <% for (Pedidos  pedi : listaPedidos) { 
                                            String numero = String.valueOf(pedi.getSubTotal());
                                            String resultado = "";
                                            for (int j = 0, i = numero.length() - 1; i >= 0; i--) {
                                                resultado = numero.charAt(i) + ((j > 0) && (j % 3 == 0) ? "." : "") + resultado;
                                                j++;
                                            }
                                            if (pedi.getNomSede().equals(nomSedeUsuario)){ %>
                                                <tr>
                                                    <%  EstructuraFYH eFYH = new EstructuraFYH();
                                                        String fecha = String.valueOf(pedi.getFchRegistro());
                                                        String hora = String.valueOf(pedi.getHoraRegistro()); %>
                                                    <td><%= eFYH.estFecha(fecha, "dd")+"/"+eFYH.estFecha(fecha, "mm")+"/"+eFYH.estFecha(fecha, "aa") %></td>
                                                    <td><%= eFYH.estHora(hora, "h")+":"+eFYH.estHora(hora, "m") %></td>
                                                    <td><%= pedi.getNomMesero()%></td>
                                                    <td><%= pedi.getNumMesa() %></td>
                                                    <td><%= resultado %></td>
                                                    <% if (pedi.getEstado().equals("En espera")){ %>
                                                        <td class="warning"><%= pedi.getEstado() %></td>
                                                    <% } else if (pedi.getEstado().equals("En produccion")){ %>
                                                        <td class="info">En producción</td>
                                                    <% } else if (pedi.getEstado().equals("Entregado")){ %>
                                                        <td class="success"><%= pedi.getEstado() %></td>
                                                    <% } else if (pedi.getEstado().equals("Devuelto")){ %>
                                                        <td class="purple"><%= pedi.getEstado() %></td>
                                                    <% } else if (pedi.getEstado().equals("Cancelado")){ %>
                                                        <td class="danger"><%= pedi.getEstado() %></td>
                                                    <% } else if (pedi.getEstado().equals("Facturado")){ %>
                                                        <td class="active-os"><%= pedi.getEstado() %></td>
                                                    <% } %>
                                                    <td>
                                                        <div class="td-espaciado">
                                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#pedidosVerModal" onclick="pedidosVer('<%= rolUsuario %>', '<%= cA.CifrarASCII(pedi.getNomMesero()) %>', '<%= cA.CifrarASCII(pedi.getNomCliente()) %>', '<%= pedi.getNumMesa()%>', '<%= pedi.getSubTotal()%>', '<%= cA.CifrarASCII(pedi.getDetallesPedidos()) %>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                            <% if (pedi.getEstado().equals("En espera")){ %>
                                                                <button type="button" class="btn btn-warning" onclick="pedidosActualizar('<%= pedi.getIdPedidos() %>', '<%= pedi.getNumMesa()%>', '<%= pedi.getSubTotal()%>', '<%= cA.CifrarASCII(pedi.getDetallesPedidos()) %>')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                <button type="button" class="btn btn-danger" onClick="window.location = 'PedidoC?idPed='+<%= pedi.getIdPedidos()%>;"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                                            <% }
                                                            if (pedi.getEstado().equals("Entregado")){ %>
                                                                <button type="button" class="btn btn-active-os" onClick="window.location = 'PedidoD?idPed='+<%= pedi.getIdPedidos()%>;"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                                                            <% } %>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <% } %>
                                        <% } %>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                <% } else { %>
                    <div id="pedidosListar">
                        <ul class="breadcrumb">
                            <li><a href="index">Inicio</a></li>
                            <li class="active">Pedidos</li>
                        </ul>
                        <section class="section-bodys">
                            <% String mens = request.getParameter("mensaje");
                            if (mens != null){ %>
                                <% if (mens.equals("Y")){ %>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Perfecto!</strong> El pedido fue registrado con éxito.
                                </div>
                                <% } else if (mens.equals("Ne")){ %>
                                <div class="alert alert-danger alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Error!</strong> El pedido no se pudo registrar por un error general en las bases de datos, contacte al administrador del sistema.
                                </div>
                                <% } else if (mens.equals("YActualizar")){ %>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Perfecto!</strong> El pedido fue actualizado correctamente.
                                </div>
                                <% } else if (mens.equals("YCancelar")){ %>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Perfecto!</strong> El pedido fue cancelado correctamente.
                                </div>
                                <% } else if (mens.equals("YDevolver")){ %>
                                <div class="alert alert-success alert-dismissible">
                                    <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                    <strong>¡Perfecto!</strong> El pedido fue devuelto correctamente.
                                </div>
                                <% } %>
                            <% } %>
                            <%  Date date = new Date();
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                String hoy = dateFormat.format(date);
                                EstructuraFYH eFYH = new EstructuraFYH();
                                nomUsuario = "";
                                idUsuario = 0;
                                rolUsuario = "Mesero";
                                if (session.getAttribute("nomUsuario") == null){
                                    nomUsuario = "Mesero";
                                    idUsuario = 0;
                                } else {
                                    nomUsuario = (String) session.getAttribute("nomUsuario"); 
                                    idUsuario = (int) session.getAttribute("idUsuario");
                                    rolUsuario = (String) session.getAttribute("rolUsuario");
                                } 
                                if (nomSedeUsuario.equals("Vacio")){ %>
                                <h1><span class="icon-clipboard"></span> Pedidos</h1>
                            <% } else { %>
                            <h1><span class="icon-clipboard"></span> Pedidos hechos por <%= nomUsuario %>, de hoy <%= eFYH.estFechaMeses(hoy, "dd") %> de <%= eFYH.estFechaMeses(hoy, "mm") %></h1>
                            <% } %>
                            <div class="tabla-reg">
                                <button type="button" id="btnRegistrarPedidos" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                            </div>
                            <% ArrayList<Pedidos> listaPedidos = (ArrayList) request.getAttribute("listaPed"); %>
                            <div class="table-responsive">
                                <table class="tablaListarPedidosMesero table-bordered table">
                                    <thead>
                                        <tr>
                                            <th>Hora</th>
                                            <th>Mesa</th>
                                            <th>Subtotal</th>
                                            <th>Estado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Hora</th>
                                            <th>Mesa</th>
                                            <th>Subtotal</th>
                                            <th>Estado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <% for (Pedidos  pedi : listaPedidos) {
                                            if (pedi.getIdMesero() == idUsuario && pedi.getFchRegistro().equals(dateFormat.parse(dateFormat.format(date)))){ %>
                                                <tr>
                                                    <%  String hora = String.valueOf(pedi.getHoraRegistro()); %>
                                                    <td><%= eFYH.estHora(hora, "h")+":"+eFYH.estHora(hora, "m") %></td>
                                                    <td><%= pedi.getNumMesa() %></td>
                                                    <td><%= dP.formatNumber(pedi.getSubTotal()) %></td>
                                                    <% if (pedi.getEstado().equals("En espera")){ %>
                                                        <td class="warning"><%= pedi.getEstado() %></td>
                                                    <% } else if (pedi.getEstado().equals("En produccion")){ %>
                                                        <td class="info">En producción</td>
                                                    <% } else if (pedi.getEstado().equals("Entregado")){ %>
                                                        <td class="success"><%= pedi.getEstado() %></td>
                                                    <% } else if (pedi.getEstado().equals("Devuelto")){ %>
                                                        <td class="purple"><%= pedi.getEstado() %></td>
                                                    <% } else if (pedi.getEstado().equals("Cancelado")){ %>
                                                        <td class="danger"><%= pedi.getEstado() %></td>
                                                    <% } else if (pedi.getEstado().equals("Facturado")){ %>
                                                        <td class="active-os"><%= pedi.getEstado() %></td>
                                                    <% } %>
                                                    <td>
                                                        <div class="td-espaciado">
                                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#pedidosVerModal" onclick="pedidosVer('<%= rolUsuario %>', '<%= cA.CifrarASCII(pedi.getNomMesero()) %>', '<%= cA.CifrarASCII(pedi.getNomCliente()) %>', '<%= pedi.getNumMesa()%>', '<%= pedi.getSubTotal()%>', '<%= cA.CifrarASCII(pedi.getDetallesPedidos()) %>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                            <% if (pedi.getEstado().equals("En espera")){ %>
                                                                <button type="button" class="btn btn-warning" onclick="pedidosActualizar('<%= pedi.getIdPedidos() %>', '<%= pedi.getNumMesa()%>', '<%= pedi.getSubTotal()%>', '<%= cA.CifrarASCII(pedi.getDetallesPedidos()) %>')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                                <button type="button" class="btn btn-danger" onClick="window.location = 'PedidoC?idPed='+<%= pedi.getIdPedidos()%>;"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                                                            <% }
                                                            if (pedi.getEstado().equals("Entregado")){ %>
                                                                <button type="button" class="btn btn-active-os" onClick="window.location = 'PedidoD?idPed='+<%= pedi.getIdPedidos()%>;"><span class="glyphicon glyphicon-transfer"></span> Devolución</button>
                                                            <% } %>
                                                        </div>
                                                    </td>
                                                </tr>
                                            <% } 
                                        } %>
                                    </tbody>
                                </table>
                            </div>
                        </section>
                    </div>
                <% } %>
                <%@include file="pedidosModales.jsp" %>
            
            <% } else if (rolUsuario.equals("Cocinero")) { %>
            
                <div id="pedidosListar">
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
                                        <th>Subtotal</th>
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
                                        <th>Subtotal</th>
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
                </div>
            
        <% }
    } %>
    <%@include file="footer.jsp" %>
</html>
