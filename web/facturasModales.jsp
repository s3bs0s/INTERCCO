<body>
    <!-- Modal de Ver -->
    <div class="modal fade" id="facturasVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label class="me">Detalles de la Factura</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Mesero:</p>
                                <p class="verDetalles-contenido" id="verMeseroFacturas"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Cajero:</p>
                                <p class="verDetalles-contenido" id="verCajeroFacturas"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Cliente:</p>
                                <p class="verDetalles-contenido" id="verClienteFacturas"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Mesa:</p>
                                <p class="verDetalles-contenido" id="verMesaFacturas"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Subtotal:</p>
                                <p class="verDetalles-contenido" id="verSubtotalFacturas"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Total:</p>
                                <p class="verDetalles-contenido" id="verTotalFacturas"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Importe:</p>
                                <p class="verDetalles-contenido" id="verImporteFacturas"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Cambio:</p>
                                <p class="verDetalles-contenido" id="verCambioFacturas"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Productos del Pedido:</p>
                            </div>
                        </div>
                    </div>
                    <div class="table-responsive">
                        <table class="tablaListarProductos table-bordered table">
                            <thead>
                                <tr>
                                    <th>Categoría</th>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Observación</th>
                                    <th>Subtotal</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <th>Categoría</th>
                                    <th>Producto</th>
                                    <th>Cantidad</th>
                                    <th>Observación</th>
                                    <th>Subtotal</th>
                                </tr>
                            </tfoot>
                            <tbody></tbody>
                        </table>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn" data-dismiss="modal">Cerrar</button>
                </div>
            </div>
        </div>
    </div>
</body>