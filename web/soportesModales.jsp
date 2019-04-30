<body>
    <!-- Modal de Registrar -->
    <div class="modal fade" id="soporteRModal" role="dialog">
        <div class="modal-dialog modal-lg">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-phone"></span><label for="regRoMSoportes" class="me">Registrar Soporte</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
                    <form action="Soporte" method="POST">
                        <div class="filas-i">
                            <div class="input-group" style="width:66%;">
                                <span class="input-group-addon">Ruta o Módulo:</span>
                                <input required type="text" maxlength="250" minlength="4" class="form-control" name="regRoMSoportes" placeholder="Ubicación del caso.">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group" style="width:34%;">
                                <span class="input-group-addon">¿Urgencia?</span>
                                <select class="form-control" name="regUrgenciaSoportes">
                                    <option value="NU">No es Urgente</option>
                                    <option value="U">Es Urgente</option>
                                </select>
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Descripción:</span>
                                <textarea required class="form-control" placeholder="Descripción de su caso." name="regDescripcionSoportes"></textarea>
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal btn btn-principal">Registrar</button>
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
    <div class="modal fade" id="soportesVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-phone"></span><label class="me">Detalles de la Solicitud</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Fecha de la Solicitud:</p>
                                <p class="verDetalles-contenido" id="verFechaSolicitudSoportes"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Fecha de Solución:</p>
                                <p class="verDetalles-contenido" id="verFechaResueltoSoportes"></p>
                            </div>
                        </div>
                        <hr>
                        <div id="verDivAdminSSoportes">
                            <div>
                                <p class="verDetalles-titulo">Usuario:</p>
                                <p class="verDetalles-contenido" id="verUsuarioSoportes"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Sede del Usuario:</p>
                                <p class="verDetalles-contenido" id="verSedeSoportes"></p>
                            </div>
                        </div>
                        <hr id="verHrAdminSSoportes">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Ruta o Módulo:</p>
                                <p class="verDetalles-contenido" id="verRutaSoportes"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Descripción:</p>
                                <p class="verDetalles-contenido" id="verDescripcionSoportes"></p>
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
    <div class="modal fade" id="soporteAModal" role="dialog">
        <div class="modal-dialog modal-lg">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label for="regRoMSoportes" class="me">Actualizar Información de Soporte</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="SoporteA" method="POST">
                        <div class="filas-i">
                            <div class="input-group inpDesa">
                                <span class="input-group-addon">ID:</span>
                                <input type="text" class="form-control" id="actuaIDSoportes" name="actuaIDSoportes">
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Ruta o Módulo:</span>
                                <input required type="text" onkeypress="this.style.color = '#87A2D1';" maxlength="250" minlength="4" class="form-control" id="actuaRoMSoportes" name="actuaRoMSoportes">
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Descripción:</span>
                                <textarea required onkeypress="this.style.color = '#87A2D1';" class="form-control" id="actuaDescripcionSoportes" name="actuaDescripcionSoportes"></textarea>
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal btn btn-principal">Actualizar</button>
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