<%@page import="java.util.ArrayList"%>
<%@page import="com.INTERCCO.modelo.Beans.Proveedores"%>
<body>
    <!-- Modal de Registrar -->
    <div class="modal fade" id="insumoRGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-books"></span><label for="regNombreInsumo" class="me">Registrar Insumo</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
                    <form action="Insumo" method="POST">
                        <div class="input-group">
                            <span class="input-group-addon">Nombre del insumo:</span>
                            <input required type="text" minlength="4" maxlength="120" class="form-control" name="regNombreInsumo" placeholder="Nombre del Insumo.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Referencia:</span>
                            <input required type="text" maxlength="90" minlength="2" class="form-control" name="regReferenciaInsumo" placeholder="Referencia.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Proveedor:</span>
                            <% ArrayList<Proveedores> listaProveedoresSInsu = (ArrayList) request.getAttribute("listaProSInsu"); %>
                            <select required class="form-control" name="regProveedorInsumo" title="Seleccione el proveedor.">
                                <% for (Proveedores  provSI: listaProveedoresSInsu) { %>
                                    <option value="<%= provSI.getIdProveedores()%>"><%= provSI.getNombreCoe()%></option>
                                <% } %>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Fecha de vencimiento:</span>
                            <input required type="date" class="form-control" name="regFechaCaducidadInsumo" >
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Precio unitario:</span>
                            <input required type="tel" onkeypress="return acceptNum(event)" onkeyup="formatNumber(this.value,'regPrecioUnitarioInsumo', 'reg')" minlength="1" maxlength="14" class="form-control" id="regPrecioUnitarioInsumo" name="regPrecioUnitarioInsumo" placeholder="Precio del Insumo.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Unidad de medida:</span>
                            <select required class="form-control" title="Seleccione la unidad de medida." name="regUnidadMedidaInsumo">
                                <option value="Unidades">Unidades</option>
                                <option value="Kilogramo">Kilogramo</option>
                                <option value="Libra">Libra</option>
                                <option value="Litro">Litro</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Cantidad:</span>
                            <input required type="tel" onkeypress="return acceptNum(event)" pattern="[0-9]+" minlength="1" maxlength="9" class="form-control" name="regCantidadInsumo" placeholder="Cantidad.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="ValidacionPuntosInsumos" class="btn-modal btn btn-principal">Registrar</button>
                            </div>
                            <div class="cont-btns-secundario">
                                <button type="reset" class="btn-modal btn btn-secundario">Limpiar</button>
                                <button data-dismiss="modal" type="button" class="btn-modal btn btn-secundario">Cancelar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>

    <!-- Modal de Ver -->
    <div class="modal fade" id="insumosVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label class="me">Ver detalles del Insumo..</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="cont-titulo-sect">
                        <h1 class="titulo-sect">Información del insumo</h1>
                    </div>
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Nombre del Insumo:</p>
                                <p class="verDetalles-contenido" id="verNombreInsumo"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Referencia:</p>
                                <p class="verDetalles-contenido" id="verReferenciaInsumo"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Cantidad:</p>
                                <p class="verDetalles-contenido" id="verCantidadInsumo"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Precio Unitario:</p>
                                <p class="verDetalles-contenido" id="verPrecioUnitarioInsumo"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Fecha de Ingreso:</p>
                                <p class="verDetalles-contenido" id="verFechaIngresoInsumo"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Fecha de Vencimiento:</p>
                                <p class="verDetalles-contenido" id="verFechaCaducidadInsumo"></p>
                            </div>
                        </div>
                    </div>
                    <div class="cont-titulo-sect">
                        <h1 class="titulo-sect">Información del proveedor</h1>
                    </div>
                    <div class="panel-group" id="accordionVerInsumos">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionVerInsumos" data-target="#verPro">Presióne para ver<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                            </div>
                            <div id="verPro" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="verDetalles-caj">
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Nombre Proveedor:</p>
                                                <p class="verDetalles-contenido" id="verProveedorInsumo"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo" id="verTipoIdentiFiscalProInsumo"></p>
                                                <p class="verDetalles-contenido" id="verNumIdentifiTribuProInsumo"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Nombre Encargado:</p>
                                                <p class="verDetalles-contenido" id="verNombrePCProInsumo"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">Cargo:</p>
                                                <p class="verDetalles-contenido" id="verCargoPCProInsumo"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Email:</p>
                                                <p class="verDetalles-contenido" id="verEmailPCProInsumo"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">FAX:</p>
                                                <p class="verDetalles-contenido" id="verFaxPCProInsumo"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Teléfono:</p>
                                                <p class="verDetalles-contenido" id="verTelefonoPCProInsumo"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">Móvil:</p>
                                                <p class="verDetalles-contenido" id="verMovilPCProInsumo"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
    
    <!-- Modal de Editar -->
    <div class="modal fade" id="insumoAGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label for="actuaNombreInsumo" class="me">Actualizar Información del Insumo</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="InsumoA" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="actuaIDInsumo" name="actuaIDInsumo">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Nombre del insumo:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" minlength="4" maxlength="120" class="form-control" id="actuaNombreInsumo" name="actuaNombreInsumo">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Referencia:</span>
                            <input disabled type="text" class="form-control" id="actuaReferenciaInsumo">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Proveedor:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" id="actuaProveedorInsumo" name="actuaProveedorInsumo" title="Seleccione el proveedor.">
                                <% for (Proveedores  provSI: listaProveedoresSInsu) { %>
                                    <option value="<%= provSI.getIdProveedores()%>"><%= provSI.getNombreCoe()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Fecha de vencimiento:</span>
                            <input required type="date" onkeypress="this.style.color = '#87A2D1';" class="form-control" id="actuaFechaCaducidadInsumo" name="actuaFechaCaducidadInsumo">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Precio unitario:</span>
                            <input required type="tel" id="actuaPrecioUnitarioInsumo" name="actuaPrecioUnitarioInsumo" onkeypress="this.style.color = '#87A2D1'; return acceptNum(event)" onkeyup="formatNumber(this.value,'actuaPrecioUnitarioInsumo', 'reg')" minlength="1" maxlength="14" class="form-control">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Unidad de medida:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" title="Seleccione la unidad de medida." id="actuaUnidadMedidaInsumo" name="actuaUnidadMedidaInsumo">
                                <option value="Unidades">Unidades</option>
                                <option value="Kilogramo">Kilogramo</option>
                                <option value="Libra">Libra</option>
                                <option value="Litro">Litro</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Cantidad:</span>
                            <input required type="tel" onkeypress="return acceptNum(event); this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="1" maxlength="9" class="form-control" id="actuaCantidadInsumo" name="actuaCantidadInsumo">
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="ValidacionPuntosActuaInsumos" class="btn-modal btn btn-principal">Actualizar</button>
                            </div>
                            <div class="cont-btns-secundario">
                                <button data-dismiss="modal" type="button" class="btn-modal btn btn-secundario">Cancelar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
                                
    <!-- Modal de Devolver -->
    <div class="modal fade" id="insumoDGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-transfer"></span><label for="devoMensajeInsumo" class="me">Devolver Insumo</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p id="devoAdvertenciaInsumo" class="mi-obli"></p>
                    <p id="devoInsumoInsumo" class="mi-insumo"></p>
                    <form id="devoFormInsumo" action="InsumoD" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" id="devoIDInsumo" class="form-control" name="devoIDInsumo">
                        </div>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Nombre Insumo:</span>
                            <input type="text" id="devoNomInsInsumo" class="form-control" name="devoNomInsInsumo">
                        </div>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Nombre PC Proveedor:</span>
                            <input type="text" id="devoNomProPCInsumo" class="form-control" name="devoNomProInsumo">
                        </div>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Proveedor:</span>
                            <input type="text" id="devoEmailProOcultoInsumo" class="form-control" name="devoEmailProOcultoInsumo">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Proveedor:</span>
                            <input disabled type="text" id="devoEmailProInsumo" class="form-control" name="devoEmailProInsumo">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Razón:</span>
                            <textarea required class="form-control" id="devoRazonInsumo" name="devoRazonInsumo"></textarea>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal btn btn-principal">Devolver</button>
                            </div>
                            <div class="cont-btns-secundario">
                                <button data-dismiss="modal" type="button" class="btn-modal btn btn-secundario">Cancelar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
    
    <!-- Modal para Eliminar -->
    <div class="modal" id="insumoEGerenteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            
            <div class="modal-content">
                <div class="modal-header modal-header-elim">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-remove"></span><label class="me">¿Desea eliminar el Insumo?</label></h4>
                </div>
                <div class="modal-body modal-body-elim">
                    <form action="InsumoE" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="elimIDInsumo" name="elimIDInsumo">
                        </div>
                        <p class="mi-obli">Recuerde que cuando eliminé el insumo <span class="a-mi-elim-sp" id="elimNombreInsumo"></span>, también se elimina en todos los insumos que gasta cada producto.</p>
                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal-elim btn btn-principal">Estoy Segur<%= session.getAttribute("genUsuario").equals("Masculino")?"o":"a" %>, ¡Eliminar!</button>
                            </div>
                            <div class="cont-btns-secundario">
                                <button data-dismiss="modal" type="button" class="btn-modal-elim btn btn-secundario">Cancelar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer modal-footer-elim"></div>
            </div>
        </div>
    </div>
</body>