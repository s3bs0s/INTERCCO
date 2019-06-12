<%@page import="com.INTERCCO.modelo.Beans.Proveedores"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Proveedores</title>
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
                    <li class="active">Proveedores</li>
                </ul>
                <section class="section-bodys">
                    <% String mens = request.getParameter("mensaje");
                    String NIT = request.getParameter("NIT");
                    String nomPC = request.getParameter("nomPC");
                    String nomCOE = request.getParameter("nomCOE");
                    if (mens != null){ %>
                        <% if (mens.equals("Y")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El proveedor <b>"<%= nomCOE %>"</b> fue registrado con éxito.
                        </div>
                        <% } else if (mens.equals("YEliminar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> El proveedor <b>"<%= nomCOE %>"</b> fue eliminado con éxito.
                        </div>
                        <% } else if (mens.equals("YActualizar")){ %>
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La información del proveedor <b>"<%= nomCOE %>"</b> fue actualizada correctamente.
                        </div>
                        <% } else if (mens.equals("Ne")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El proveedor no se pudo registrar por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                        <% } else if (mens.equals("NcontCOE")){ %>
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> Recuerde que debe ingresar alguno de los campos de contacto, ya sea teléfono, móvil o fax para la empresa o companía con NIT <b>"<%= NIT %>"</b>.
                        </div>
                        <% } else if (mens.equals("NcontPC")){ %>
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> Recuerde que debe ingresar alguno de los campos de contacto, ya sea email, fax, teléfono o móvil para la persona de contacto <b>"<%= nomPC %>"</b>.
                        </div>
                        <% } else if (mens.equals("NeNomCOE")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El nombre de la empresa o compañía <b>"<%= nomCOE %>"</b> ya se encuentra registrado.
                        </div>
                        <% } else if (mens.equals("NeNIT")){ %>
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El número de identificación tributaria <b>"<%= NIT %>"</b> ya se encuentra registrado.
                        </div>
                        <% } %>
                    <% } %>
                    <h1><span class="icon-address-book"></span> Proveedores</h1>
                    <% rolSedeUsuario = "";
                        if (session.getAttribute("rolSedeUsuario") == null){
                            rolSedeUsuario = "Secundario";
                        } else {
                            rolSedeUsuario = (String) session.getAttribute("rolSedeUsuario"); 
                        } 
                        if (rolSedeUsuario.equals("Principal")){ %>
                            <div class="tabla-reg">
                                <button data-toggle="modal" data-target="#proveedoresRGerenteModal" type="button" class="btn">Registrar <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
                            </div>
                        <% } %>
                    <% ArrayList<Proveedores> listaProveedores = (ArrayList) request.getAttribute("listaPro"); %>
                    <div class="table-responsive">
                        <table class="tablaListarProveedores table-bordered table">
                            <thead>
                                <tr>
                                    <th>Nombre Proveedor</th>
                                    <th>Ciudad</th>
                                    <th>Persona de contacto</th>
                                    <th>Cargo</th>
                                    <th>Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Nombre Proveedor</th>
                                    <th>Ciudad</th>
                                    <th>Persona de contacto</th>
                                    <th>Cargo</th>
                                    <th>Acciones</th>
                                </tr>
                            </tfoot>
                            <tbody>
                                <%  rolSedeUsuario = "";
                                    if (session.getAttribute("rolSedeUsuario") == null){
                                        rolSedeUsuario = "Secundario";
                                    } else {
                                        rolSedeUsuario = (String) session.getAttribute("rolSedeUsuario"); 
                                    }
                                    for (Proveedores  prov: listaProveedores) { %>
                                    <tr>
                                        <td><%= prov.getNombreCoe()%></td>
                                        <td><%= prov.getNombreCiudad()%></td>
                                        <td><%= prov.getNombrePc()%></td>
                                        <td><%= prov.getCargoPc()%></td>
                                        <% if (rolSedeUsuario.equals("Secundaria")){ %>
                                            <td>
                                                <div class="td-espaciado">
                                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#proveedoresVerModal" onClick="proveedorVerModal('<%= cA.CifrarASCII(prov.getNombreCoe())%>', '<%= prov.getTipoIf()%>', '<%= cA.CifrarASCII(prov.getNumIt())%>', '<%= cA.CifrarASCII(prov.getTelefonoCoe())%>', '<%= cA.CifrarASCII(prov.getExtensionTelCoe())%>', '<%= cA.CifrarASCII(prov.getMovilCoe())%>', '<%= cA.CifrarASCII(prov.getFaxCoe())%>', '<%= cA.CifrarASCII(prov.getExtensionFaxCoe())%>', '<%= cA.CifrarASCII(prov.getNombreCiudad())%>', '<%= cA.CifrarASCII(prov.getDireccion())%>', '<%= cA.CifrarASCII(prov.getNombrePc())%>', '<%= cA.CifrarASCII(prov.getCargoPc())%>', '<%= prov.getTipoI()%>', '<%= cA.CifrarASCII(prov.getNumI())%>', '<%= cA.CifrarASCII(prov.getEmail())%>', '<%= cA.CifrarASCII(prov.getFaxPc())%>', '<%= cA.CifrarASCII(prov.getExtensionFaxPc())%>', '<%= cA.CifrarASCII(prov.getTelefonoPc())%>', '<%= cA.CifrarASCII(prov.getMovilPc())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                </div>
                                            </td>
                                        <% } else { %>
                                            <td>
                                                <div class="td-espaciado">
                                                    <button type="button" class="btn btn-info" data-toggle="modal" data-target="#proveedoresVerModal" onClick="proveedorVerModal('<%= cA.CifrarASCII(prov.getNombreCoe())%>', '<%= prov.getTipoIf()%>', '<%= cA.CifrarASCII(prov.getNumIt())%>', '<%= cA.CifrarASCII(prov.getTelefonoCoe())%>', '<%= cA.CifrarASCII(prov.getExtensionTelCoe())%>', '<%= cA.CifrarASCII(prov.getMovilCoe())%>', '<%= cA.CifrarASCII(prov.getFaxCoe())%>', '<%= cA.CifrarASCII(prov.getExtensionFaxCoe())%>', '<%= cA.CifrarASCII(prov.getNombreCiudad())%>', '<%= cA.CifrarASCII(prov.getDireccion())%>', '<%= cA.CifrarASCII(prov.getNombrePc())%>', '<%= cA.CifrarASCII(prov.getCargoPc())%>', '<%= prov.getTipoI()%>', '<%= cA.CifrarASCII(prov.getNumI())%>', '<%= cA.CifrarASCII(prov.getEmail())%>', '<%= cA.CifrarASCII(prov.getFaxPc())%>', '<%= cA.CifrarASCII(prov.getExtensionFaxPc())%>', '<%= cA.CifrarASCII(prov.getTelefonoPc())%>', '<%= cA.CifrarASCII(prov.getMovilPc())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                                    <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#proveedoresAGerenteModal" onClick="proveedorActualizarModal('<%= prov.getIdProveedores()%>', '<%= cA.CifrarASCII(prov.getNombreCoe())%>', '<%= prov.getTipoIf()%>', '<%= cA.CifrarASCII(prov.getNumIt())%>', '<%= cA.CifrarASCII(prov.getTelefonoCoe())%>', '<%= cA.CifrarASCII(prov.getExtensionTelCoe())%>', '<%= cA.CifrarASCII(prov.getMovilCoe())%>', '<%= cA.CifrarASCII(prov.getFaxCoe())%>', '<%= cA.CifrarASCII(prov.getExtensionFaxCoe())%>', '<%= prov.getIdCiudad()%>', '<%= cA.CifrarASCII(prov.getDireccion())%>', '<%= cA.CifrarASCII(prov.getNombrePc())%>', '<%= cA.CifrarASCII(prov.getCargoPc())%>', '<%= prov.getTipoI()%>', '<%= cA.CifrarASCII(prov.getNumI())%>', '<%= cA.CifrarASCII(prov.getEmail())%>', '<%= cA.CifrarASCII(prov.getFaxPc())%>', '<%= cA.CifrarASCII(prov.getExtensionFaxPc())%>', '<%= cA.CifrarASCII(prov.getTelefonoPc())%>', '<%= cA.CifrarASCII(prov.getMovilPc())%>')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                                    <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#proveedoresEGerenteModal" onClick="proveedorEliminarModal('<%= prov.getIdProveedores()%>', '<%= cA.CifrarASCII(prov.getNombreCoe())%>')"><span class="glyphicon glyphicon-remove"></span> Eliminar</button>
                                                </div>
                                            </td>
                                        <% } %>
                                    </tr>
                                <% } %>
                            </tbody>
                        </table>
                    </div>
                </section>
            </body>
            <%@include file="proveedoresGerenteModales.jsp" %>
            <%@include file="footer.jsp" %>
        <% } %>
</html>
