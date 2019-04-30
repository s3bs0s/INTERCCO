<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="com.INTERCCO.modelo.Beans.Pqrsf"%>
<%@page import="com.INTERCCO.modelo.Beans.Sedes"%>
<%@page import="java.util.ArrayList"%>
<section class="sectionPqrsf">

<% if (session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("Usuario")){ %>
        
    <article class="sectionPqrsfR">
        <div class="sectionPqrsfRContent">
            <div class="sectionPqrsfRContentH">
                <h4 class="sectionPqrsfRContentHTitulo"><label>¡Crear Solicitud PQRSF!</label><span style="font-size:17px;" class="me">Solicitudes de petición, queja, reclamo, sugerencia o felicitaciones.</span></h4>
            </div>
            <div class="sectionPqrsfRContentDtdo">
                <button id="Acceder" type="button" class="btn">Acceder</button>
            </div>
            <div class="sectionPqrsfRContentB">
                <form>
                    <div class="filas-i">
                        <div class="input-group" style="width:85%;">
                            <span class="input-group-addon">Sede:</span>
                            <select class="form-control">
                                <option value="1">Mi Sede</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group" style="width:15%;">
                            <button type="button" class="sectionPqrsfRContentBtns btn">Atrás</button>
                        </div>
                    </div>
                      
<% } else { %>

    <article id="PqrsfListar" class="sectionPqrsfL">
        <div class="sectionPqrsfLTitulo">
            <p>Mis Solicitudes PQRSF<span style="font-size:17px;" class="me">Solicitudes de petición, queja, reclamo, sugerencia o felicitaciones.</span></p>
        </div>
        <div class="tabla-reg">
            <button type="button" class="btn">Enviar Solicitud <span class="tabla-reg-m"><span class="glyphicon glyphicon-plus"></span></span></button>
        </div>
        <% ArrayList<Pqrsf> listaPqrsfIndex = (ArrayList) request.getAttribute("listaPqrsfIndex"); %>
        <table class="tablaListarPQRSF table-bordered table">
            <thead>
                <tr>
                    <th>Fecha</th>
                    <th>Hora</th>
                    <th>Dirigido a</th>
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
                    <th>Dirigido a</th>
                    <th>Tipo de Solicitud</th>
                    <th>Para</th>
                    <th>Estado</th>
                    <th>Acciones</th>
                </tr>
            </tfoot>
            <tbody>
                <% for (Pqrsf pqrsfIndex: listaPqrsfIndex) { %>
                    <tr>
                        <%  EstructuraFYH eFYH = new EstructuraFYH();
                            CifradoASCII cAIndexPqrsf = new CifradoASCII();
                            String fecha = String.valueOf(pqrsfIndex.getFchRegistro());
                            String hora = String.valueOf(pqrsfIndex.getHoraRegistro()); %>
                        <td><%= eFYH.estFecha(fecha, "dd")+" / "+eFYH.estFecha(fecha, "mm")+" / "+eFYH.estFecha(fecha, "aa") %></td>
                        <td><%= eFYH.estHora(hora, "h")+" : "+eFYH.estHora(hora, "m") %></td>
                        <td><%= pqrsfIndex.getIdSedeDirigido() %></td>
                        <td><%= pqrsfIndex.getTipoSolicitud()%></td>
                        <td><%= pqrsfIndex.getDirigidoA()%></td>
                        <% if (pqrsfIndex.getEstado().equals("Atendido")){ %>
                            <td class="success">¡Atendida!</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#pqrsfVerModal" onClick="pqrsfVerModal('<%= pqrsfIndex.getFchRegistro()%>', '<%= pqrsfIndex.getHoraRegistro()%>', '<%= pqrsfIndex.getTipoSolicitud()%>', '<%= pqrsfIndex.getDirigidoA()%>', '<%= pqrsfIndex.getConsulta()%>', '<%= cAIndexPqrsf.CifrarASCII(pqrsfIndex.getNombreInterlocutor())%>', '<%= pqrsfIndex.getRespuesta()%>', '<%= cAIndexPqrsf.CifrarASCII(pqrsfIndex.getIdSedeDirigido())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                            </td>
                        <% } else if (pqrsfIndex.getEstado().equals("Descartado")){ %>
                            <td class="danger">Descartado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#pqrsfVerModal" onClick="pqrsfVerModal('<%= pqrsfIndex.getFchRegistro()%>', '<%= pqrsfIndex.getHoraRegistro()%>', '<%= pqrsfIndex.getTipoSolicitud()%>', '<%= pqrsfIndex.getDirigidoA()%>', '<%= pqrsfIndex.getConsulta()%>', '<%= cAIndexPqrsf.CifrarASCII(pqrsfIndex.getNombreInterlocutor())%>', '<%= pqrsfIndex.getRespuesta()%>', '<%= cAIndexPqrsf.CifrarASCII(pqrsfIndex.getIdSedeDirigido())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                            </td>
                        <% } else if (pqrsfIndex.getEstado().equals("Cancelado")){ %>
                            <td class="purple">Cancelado</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#pqrsfVerModal" onClick="pqrsfVerModal('<%= pqrsfIndex.getFchRegistro()%>', '<%= pqrsfIndex.getHoraRegistro()%>', '<%= pqrsfIndex.getTipoSolicitud()%>', '<%= pqrsfIndex.getDirigidoA()%>', '<%= pqrsfIndex.getConsulta()%>', '<%= cAIndexPqrsf.CifrarASCII(pqrsfIndex.getNombreInterlocutor())%>', '<%= pqrsfIndex.getRespuesta()%>', '<%= cAIndexPqrsf.CifrarASCII(pqrsfIndex.getIdSedeDirigido())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                            </td>
                        <% } else if (pqrsfIndex.getRespuesta().equals("83S105S110S32S114S101S115S112S117S101S115S116S97")) { %>
                            <td class="warning">Pendiente</td>
                            <td class="td-espaciado">
                                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#pqrsfVerModal" onClick="pqrsfVerModal('<%= pqrsfIndex.getFchRegistro()%>', '<%= pqrsfIndex.getHoraRegistro()%>', '<%= pqrsfIndex.getTipoSolicitud()%>', '<%= pqrsfIndex.getDirigidoA()%>', '<%= pqrsfIndex.getConsulta()%>', '<%= cAIndexPqrsf.CifrarASCII(pqrsfIndex.getNombreInterlocutor())%>', '<%= pqrsfIndex.getRespuesta()%>', '<%= cAIndexPqrsf.CifrarASCII(pqrsfIndex.getIdSedeDirigido())%>')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                <button type="button" onClick="window.location = 'PqrsfDyC?mensa=Cancelado&idPqrsf='+<%= pqrsfIndex.getIdPqrsf()%>;" class="btn btn-purple"><span class="glyphicon glyphicon-ban-circle"></span> Cancelar</button>
                            </td>
                        <% } %>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </article>
    <article id="PqrsfRegistrar" class="sectionPqrsfR">
        <div class="sectionPqrsfRContent">
            <div class="sectionPqrsfRContentH">
                <h4 class="sectionPqrsfRContentHTitulo"><label for="sede-pqrsf">¡Crear Solicitud PQRSF!</label><span style="font-size:17px;" class="me">Solicitudes de petición, queja, reclamo, sugerencia o felicitaciones.</span></h4>
            </div>
            <div class="sectionPqrsfRContentB">
                <form action="Pqrsf" method="POST">
                    <div class="filas-i">
                        <div class="input-group" style="width:85%;">
                            <span class="input-group-addon">Sede:</span>
                            <% ArrayList<Sedes> listaSedSIndexP = (ArrayList) request.getAttribute("listaSedSIndex"); %>
                            <select class="form-control" name="regSedePqrsf">
                                <option value="<%= session.getAttribute("idSedeUsuario") %>">Mi Sede</option>
                                <% for (Sedes  sedeSIndexP: listaSedSIndexP) { %>
                                    <option value="<%= sedeSIndexP.getIdSedes()%>"><%= sedeSIndexP.getNombre()%></option>
                                <% } %>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group" style="width:15%;">
                            <button id="MisSolis" type="button" class="sectionPqrsfRContentBtns btn">Atrás</button>
                        </div>
                    </div>
                    
<% } %>

                    <div class="filas-i">
                        <div class="input-group" style="width:50%;">
                            <span class="input-group-addon">Tipo de solicitud:</span>
                            <select required onchange="document.getElementById('regBtnPqrsf').innerText = 'Enviar '+ this.value;" class="form-control" name="regTipoSolicitudPqrsf">
                                <option value="Petición">Petición</option>
                                <option value="Queja">Queja</option>
                                <option value="Reclamo">Reclamo</option>
                                <option value="Sugerencia">Sugerencia</option>
                                <option value="Felicitaciones">Felicitación</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group" style="width:50%;">
                            <span class="input-group-addon">Para:</span>
                            <select required class="form-control" name="regDirigidoAPqrsf">
                                <option value="General">General</option>
                                <option value="Gerente">Gerente</option>
                                <option value="Cajero">Cajero</option>
                                <option value="Cocinero">Cocinero</option>
                                <option value="Mesero">Mesero</option>
                                <option value="Domiciliario">Domiciliario</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Mensaje:</span>
                        <textarea required class="form-control" placeholder="Mensaje según su Solicitud." name="regConsultaPqrsf"></textarea>
                    </div>

                    <div class="input-group sectionPqrsfRContentBCJBtns">
                        <div class="sectionPqrsfRContentBCJBtnsP">
                            <button type="" id="regBtnPqrsf" class="sectionPqrsfRContentBtns btn btn-principal">Enviar Petición</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="sectionPqrsfRContentF"></div>
        </div>
    </article>
</section>


<div class="modal fade" id="pqrsfVerModal" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label class="me">Solicitud de PQRSF</label></h4>
            </div>
            <div class="mb-textaling modal-body">
                <div class="verDetalles-caj">
                    <div>
                        <div>
                            <p class="verDetalles-titulo">Fecha:</p>
                            <p class="verDetalles-contenido" id="verFechaPQRSF"></p>
                        </div>
                        <div>
                            <p class="verDetalles-titulo">Hora:</p>
                            <p class="verDetalles-contenido" id="verHoraPQRSF"></p>
                        </div>
                    </div>
                    <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Se dirige a:</p>
                                <p class="verDetalles-contenido" id="verSedePQRSF"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Atendido por:</p>
                                <p class="verDetalles-contenido" id="verInterlocutorPQRSF"></p>
                            </div>
                        </div>
                    <hr>
                    <div>
                        <div>
                            <p class="verDetalles-titulo">Tipo de Solicitud:</p>
                            <p class="verDetalles-contenido" id="verTipoSolicitudPQRSF"></p>
                        </div>
                        <div>
                            <p class="verDetalles-titulo">Para:</p>
                            <p class="verDetalles-contenido" id="verDirigidoAPQRSF"></p>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <div>
                            <p class="verDetalles-titulo">Mensaje:</p>
                            <p class="verDetalles-contenido" id="verConsultaPQRSF"></p>
                        </div>
                    </div>
                    <hr>
                    <div>
                        <div>
                            <p class="verDetalles-titulo">Respuesta:</p>
                            <p class="verDetalles-contenido" id="verRespuestaPQRSF"></p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>