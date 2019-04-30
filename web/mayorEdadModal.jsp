<!-- Modal para Actualizar la Tarjeta de Identidad -->
<div class="modal fade" id="mayorEdadAModal" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><span class="icon-user-tie"></span><label for="meNumIdentiUsuario" class="me">¡Eres mayor de edad!</label></h4>
            </div>
            <div class="mb-textaling modal-body">
                <form id="meFormUsuario" action="#" method="POST">
                    <div class="filas-i">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="meIDUsuario" name="meIDUsuario">
                        </div>
                    </div>
                    <p class="mi-obli">Ya tienes <span class="a-mi-sp" id="meEdadUsuario"></span> años y SUCCO te da la oportunidad de actualizar tu número de identificación para una mejor gestión de tu cuenta.</p>
                    <div class="filas-i">
                        <div class="input-group" style="width:100%;">
                            <span class="input-group-addon">Tipo:</span>
                            <select required class="form-control" id="meTipoIdentiUsuario" name="meTipoIdentiUsuario">
                                <option value="CC">CC (Cédula de Ciudadanía)</option>
                                <option value="TP">TP (Tarjeta Pasaporte)</option>
                                <option value="CE">CE (Cédula de Extranjería)</option>
                            </select>
                        </div>
                    </div>
                    <div class="filas-i">
                        <div class="input-group" style="width:100%;">
                            <span class="input-group-addon">Número de identificación:</span>
                            <input required type="text" class="form-control" minlength="5" maxlength="20" id="meNumIdentiUsuario" name="meNumIdentiUsuario">
                        </div>
                    </div>

                    <div class="input-group cont-btn">
                        <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal btn btn-principal">¡Listo!</button>
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