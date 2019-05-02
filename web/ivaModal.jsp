<body>
    <!-- Modal para Actualizar -->
    <div class="modal fade" id="ivaAModal" role="dialog">
        <div class="modal-dialog modal-sm">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title" style="padding-left:30px;"><span class="icon-mug"></span></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="IVAA" method="POST">
                        <div class="input-group" style="width:97%;">
                            <input required onkeypress="return acceptNP(event)" style="text-align:center;" placeholder="Porcentaje" type="tel" pattern="[0-9.]+" maxlength="5" minlength="3" class="form-control" name="actPorcentajeIVA">
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btns-secundario">
                                <button type="submit" class="btn-modal btn btn-secundario">Actualizar</button>
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