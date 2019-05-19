<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="com.INTERCCO.modelo.Beans.InfoUsuarios"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Usuarios</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        if (!session.getAttribute("rolUsuario").equals("Gerente")){
            request.getRequestDispatcher("index").forward(request, response);
        } else { %>
            <body>
                <ul class="breadcrumb">
                    <li><a href="index">Inicio</a></li>
                    <li class="active">Usuarios</li>
                </ul>
                <section class="section-bodys">
                    <% String mens = request.getParameter("mensaje");
                    String nomu = request.getParameter("nomusu");
                    String emailu = request.getParameter("emailusu");
                    String diasSan = request.getParameter("sandias");
                    String numi = request.getParameter("numi");
                    if (mens != null){ %>
                        <% if (mens.equals("Y")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El usuario <b>"<%= nomu %>"</b> fue registrado con éxito.
                        </div>
                        <% } else if (mens.equals("YEliminar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El usuario <b>"<%= emailu %>"</b> fue eliminado con éxito.
                        </div>
                        <% } else if (mens.equals("YSancionar")){ %>
                        <% if (Integer.parseInt(diasSan) > 8){ %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El usuario <b>"<%= emailu %>"</b> fue sancionado <b>permanentemente</b> con éxito.
                            </div>
                            <% } else { %>
                            <div class="alert alert-success alert-dismissible">
                                <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                                <strong>¡Perfecto!</strong> El usuario <b>"<%= emailu %>"</b> fue sancionado con éxito por <b><%= diasSan %></b> días.
                            </div>
                            <% } %>
                        <% } else if (mens.equals("YLiberar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El usuario fue liberado de su sanción correctamente.
                        </div>
                        <% } else if (mens.equals("YActualizar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La información del usuario <b>"<%= nomu %>"</b> fue actualizada correctamente.
                        </div>
                        <% } else if (mens.equals("Ne")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El usuario no se pudo registrar por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                        <% } else if (mens.equals("NeL")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El usuario ya se encuentra en libertad.
                        </div>
                        <% } else if (mens.equals("NeS")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El usuario ya se encuentra sancionado.
                        </div>
                        <% } else if (mens.equals("Nee")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El correo electrónico <b>"<%= emailu %>"</b> ya se encuentra registrado.
                        </div>
                        <% } else if (mens.equals("Neni")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El número de identificación <b>"<%= numi %>"</b> ya se encuentra registrado.
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
                        <h1><span class="icon-users"></span> Usuarios</h1>
                    <% } else { %>
                        <h1><span class="icon-users"></span> Usuarios de <%= nomSedeUsuario%></h1>
                    <% } %>
                    <div class="tabla-reg">
                        <button data-toggle="modal" data-target="#usuariosRGerenteModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                    </div>
                    <% ArrayList<InfoUsuarios> listaInfoUsuarios = (ArrayList) request.getAttribute("listaInfUsu"); %>
                    <div class="table-responsive">
                        <table class="tablaListarUsuarios table-bordered table">
                            <thead>
                                <tr>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Nombre</th>
                                    <th>Email</th>
                                    <th>Rol</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Fecha</th>
                                    <th>Hora</th>
                                    <th>Nombre</th>
                                    <th>Email</th>
                                    <th>Rol</th>
                                    <th>Estado</th>
                                    <th>Acciones</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <% for (InfoUsuarios  usua: listaInfoUsuarios) {
                                    if(usua.getSede().equals(nomSedeUsuario)){ %>
                                        <tr>
                                            <%  EstructuraFYH eFYH = new EstructuraFYH();
                                                String fecha = String.valueOf(usua.getFchRegistro());
                                                String hora = String.valueOf(usua.getHoraRegistro()); %>
                                            <td><%= eFYH.estFecha(fecha, "dd")+"/"+eFYH.estFecha(fecha, "mm")+"/"+eFYH.estFecha(fecha, "aa") %></td>
                                            <td><%= eFYH.estHora(hora, "h")+":"+eFYH.estHora(hora, "m") %></td>
                                            <td><%= usua.getNombres()%> <%= usua.getApellidos()%></td>
                                            <td><%= cA.DescifrarASCII(usua.getEmail()) %></td>
                                            <td><%= usua.getRol() %></td>
                                            <% if (usua.getRol().equals("Gerente")){ %>
                                                <td class="info">¡Gerente!</td>
                                                <td><div class="td-espaciado"></div></td>
                                            <% } else { %>
                                                <% if (usua.getExistenciaSancion().equals("Y")){ %>
                                                    <td class="danger">Sancionado</td>
                                                    <td>
                                                        <div class="td-espaciado">
                                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#usuariosVerModal" onClick="usuarioVerModal('<%= cA.CifrarASCII(usua.getRol())%>', '<%= cA.CifrarASCII(usua.getNombres())%>', '<%= cA.CifrarASCII(usua.getApellidos())%>', '<%= usua.getEmail()%>', '<%= usua.getTipoI()%>', '<%= cA.CifrarASCII(usua.getNumI())%>', '<%= cA.CifrarASCII(usua.getTelefono())%>', '<%= cA.CifrarASCII(usua.getMovil())%>', '<%= usua.getGenero()%>', '<%= usua.getFchNaci()%>', '<%= cA.CifrarASCII(usua.getDireccion())%>', '<%= usua.getEmailModerador()%>', '<%= usua.getFchLimite()%>', '<%= usua.getJustificacion()%>', '<%= usua.getExistenciaSancion()%>', '<%= usua.getVerificado()%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#usuariosAGerenteModal" onClick="usuarioActualizarModal('<%= usua.getIdUsuario()%>', '<%= cA.CifrarASCII(usua.getRol())%>', '<%= cA.CifrarASCII(usua.getNombres())%>', '<%= cA.CifrarASCII(usua.getApellidos())%>', '<%= usua.getEmail()%>', '<%= usua.getTipoI()%>', '<%= cA.CifrarASCII(usua.getNumI())%>', '<%= cA.CifrarASCII(usua.getTelefono())%>', '<%= cA.CifrarASCII(usua.getMovil())%>', '<%= usua.getGenero()%>', '<%= usua.getFchNaci()%>', '<%= cA.CifrarASCII(usua.getDireccion())%>')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                            <button type="button" onClick="window.location = 'UsuarioL?idUsuaL='+<%= usua.getIdUsuario()%>;" class="btn btn-success"><span class="icon-accessibility"></span> Liberar</button>
                                                        </div>
                                                    </td>
                                                <% } else { %>
                                                    <td class="success">Libre</td>
                                                    <td>
                                                        <div class="td-espaciado">
                                                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#usuariosVerModal" onClick="usuarioVerModal('<%= cA.CifrarASCII(usua.getRol())%>', '<%= cA.CifrarASCII(usua.getNombres())%>', '<%= cA.CifrarASCII(usua.getApellidos())%>', '<%= usua.getEmail()%>', '<%= usua.getTipoI()%>', '<%= cA.CifrarASCII(usua.getNumI())%>', '<%= cA.CifrarASCII(usua.getTelefono())%>', '<%= cA.CifrarASCII(usua.getMovil())%>', '<%= usua.getGenero()%>', '<%= usua.getFchNaci()%>', '<%= cA.CifrarASCII(usua.getDireccion())%>', '<%= usua.getEmailModerador()%>', '<%= usua.getFchLimite()%>', '<%= usua.getJustificacion()%>', '<%= usua.getExistenciaSancion()%>', '<%= usua.getVerificado()%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#usuariosAGerenteModal" onClick="usuarioActualizarModal('<%= usua.getIdUsuario()%>', '<%= cA.CifrarASCII(usua.getRol())%>', '<%= cA.CifrarASCII(usua.getNombres())%>', '<%= cA.CifrarASCII(usua.getApellidos())%>', '<%= usua.getEmail()%>', '<%= usua.getTipoI()%>', '<%= cA.CifrarASCII(usua.getNumI())%>', '<%= cA.CifrarASCII(usua.getTelefono())%>', '<%= cA.CifrarASCII(usua.getMovil())%>', '<%= usua.getGenero()%>', '<%= usua.getFchNaci()%>', '<%= cA.CifrarASCII(usua.getDireccion())%>')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                            <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#usuariosEGerenteModal" onClick="usuarioEliminarModal('<%= usua.getIdUsuario()%>', '<%= usua.getEmail()%>')"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                            <button type="button" class="btn btn-active-os" data-toggle="modal" data-target="#usuariosSGerenteModal" onClick="usuarioSancionarModal('<%= usua.getIdUsuario()%>', '<%= usua.getEmail()%>')"><span class="icon-library"></span> Sancionar</button>
                                                        </div>
                                                    </td>
                                                <% } %>
                                            <% } %>
                                        </tr>
                                    <% } %>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </section>
            </body>
            <%@include file="usuariosGerenteModales.jsp" %>
            <%@include file="footer.jsp" %>
        <% } %>
</html>
