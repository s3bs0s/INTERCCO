<%@page import="java.util.ArrayList"%>
<%@page import="com.INTERCCO.modelo.Beans.Proveedores"%>
<body>
    <!-- Modal de Ver Producto en el Pedido -->
    <div class="modal fade" id="productoPedidoVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label class="me">Ver detalles del Producto en el Pedido</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="cont-titulo-sect">
                        <h1 class="titulo-sect">Información del Producto en el Pedido</h1>
                    </div>
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Categoría:</p>
                                <p class="verDetalles-contenido" id="verCategoriaProductoPedido"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Producto:</p>
                                <p class="verDetalles-contenido" id="verProductoProductoPedido"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Cantidad:</p>
                                <p class="verDetalles-contenido" id="verCantidadProductoPedido"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Subtotal:</p>
                                <p class="verDetalles-contenido" id="verSubtotalProductoPedido"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Observación:</p>
                                <p class="verDetalles-contenido" id="verObservacionProductoPedido"></p>
                            </div>
                        </div>
                    </div>
                    <div class="cont-titulo-sect">
                        <h1 class="titulo-sect">Información del Producto</h1>
                    </div>
                    <div class="panel-group" id="accordionVerProductoPedido">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionVerProductoPedido" data-target="#verProPed">Presióne para ver<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                            </div>
                            <div id="verProPed" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="verDetalles-caj">
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Categoría:</p>
                                                <p class="verDetalles-contenido" id="verCateProProductoPedido"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">Nombre:</p>
                                                <p class="verDetalles-contenido" id="verNomProProductoPedido"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">Precio:</p>
                                                <p class="verDetalles-contenido" id="verPreProProductoPedido"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Descripción:</p>
                                                <p class="verDetalles-contenido" id="verDesProProductoPedido"></p>
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
    <div class="modal fade" id="productoPedidoAModal" role="dialog">
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
                                <option value="Docenas">Docenas</option>
                                <option value="Kilogramo">Kilogramo</option>
                                <option value="Gramo">Gramo</option>
                                <option value="Miligramo">Miligramo</option>
                                <option value="Libra">Libra</option>
                                <option value="Onza">Onza</option>
                                <option value="Litro">Litro</option>
                                <option value="Mililitro">Mililitro</option>
                                <option value="Galón">Galón</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Cantidad:</span>
                            <input required type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="1" maxlength="9" class="form-control" id="actuaCantidadInsumo" name="actuaCantidadInsumo">
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
</body>