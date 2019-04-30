<body>
    <!-- Modal de Responder -->
    <div class="modal fade" id="pqrsfRGerenteModal" role="dialog">
        <div class="modal-dialog modal-lg">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-users"></span><label for="responderRespuestaResPQRSF" class="me">Responder Solicitud</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="PqrsfR" method="POST">
                        <div class="filas-i">
                            <div class="input-group inpDesa">
                                <span class="input-group-addon">ID PQRSF:</span>
                                <input type="text" id="respIDResPQRSF" class="form-control" name="respIDResPQRSF">
                            </div>
                            <div class="input-group inpDesa">
                                <span class="input-group-addon">Cliente:</span>
                                <input type="text" id="respEmailCliOcultoResPQRSF" class="form-control" name="respEmailCliOcultoResPQRSF">
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Cliente:</span>
                                <input disabled type="text" id="respEmailCliResPQRSF" class="form-control" name="respEmailCliResPQRSF">
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Respuesta:</span>
                                <textarea required class="form-control" placeholder="Respuesta a la Solicitud PQRSF." name="respRespuestaResPQRSF"></textarea>
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal btn btn-principal">Responder</button>
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

    <!-- Modal de Ver -->
    <div class="modal fade" id="resPqrsfVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label id="verTituloNombreResPQRSF" class="me">Solicitud de...</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Fecha:</p>
                                <p class="verDetalles-contenido" id="verFechaResPQRSF"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Hora:</p>
                                <p class="verDetalles-contenido" id="verHoraResPQRSF"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Usuario:</p>
                                <p class="verDetalles-contenido" id="verUsuarioResPQRSF"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Interlocutor:</p>
                                <p class="verDetalles-contenido" id="verInterlocutorResPQRSF"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Tipo de Solicitud:</p>
                                <p class="verDetalles-contenido" id="verTipoSolicitudResPQRSF"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Se dirige a:</p>
                                <p class="verDetalles-contenido" id="verDirigidoAResPQRSF"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Consulta:</p>
                                <p class="verDetalles-contenido" id="verConsultaResPQRSF"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Respuesta:</p>
                                <p class="verDetalles-contenido" id="verRespuestaResPQRSF"></p>
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
</body>