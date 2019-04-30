<section class="section4-domi">
    <article class="section4-domiRegistrar">
        <div class="div-content">
            <div class="section4-domiR-Desactivado">
                <div></div>
                <div></div>
                <div></div>
                <div></div>
                <button id="Acceder" type="button" class="btn-div btn">Acceder</button>
                <div></div>
                <div></div>
                <div></div>
                <div></div>
            </div>
            <div class="div-header">
                <h4 class="div-title"><label for="">¡Domicilios!</label></h4>
            </div>
            <div class="div-body">
                <form>
                    <div class="filas-i">
                        <div class="input-group" style="width:40%;">
                            <span class="input-group-addon">Sede:</span>
                            <select disabled class="form-control" id="sede-domi" name="sede-domi">
                                <option value="Itagüí">Itagüí</option>
                            </select>
                        </div>
                        <div class="input-group estado-domi">
                            <span disabled class="input-group-addon">Estado:</span>
                            <input readonly id="estado-domi" type="text" class="form-control" name="estado-domi" value="Sin Domicilio">
                        </div>
                        <div class="input-group" style="width:25%;">
                            <button disabled type="button" class="btn-div btn">Mis Pedidos</button>
                        </div>
                    </div>
                    <div class="filas-i">
                        <div class="input-group recuadroDomiObser recuadroDomi" style="width:35%;">
                            <div class="titulo-recuadroDomi">
                                <p>Observaciones</p>
                            </div>
                            <textarea  disabled class="form-control contenido-recuadroDomi" id="observa-domi" placeholder="Alguna Sugerencia o Petición para tener en Cuenta al momento de Producir su Pedido." name="observa-domi"></textarea>
                        </div>
                        <div class="input-group recuadroDomi" style="width:65%;">
                            <div class="titulo-recuadroDomi">
                                <p>Carrito</p>
                            </div>
                            <div class="contenido-recuadroDomi">
                                <table class="table-bordered table">
                                    <thead>
                                        <tr>
                                            <th>Categoría</th>
                                            <th>Producto</th>
                                            <th>Precio</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tfoot>
                                        <tr>
                                            <th>Categoría</th>
                                            <th>Producto</th>
                                            <th>Precio</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </tfoot>
                                    <tbody>
                                        <tr  class="danger">
                                            <td colspan="4">No hay Seleccionados.</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    <div class="filas-i">
                        <div class="input-group" style="width:45%;">
                            <span class="input-group-addon">Dirección:</span>
                            <input disabled required id="direc-domi" type="text" minlength="8" maxlength="150" class="form-control" name="direc-domi" placeholder="Dirección de Entrega.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group" style="width:35%;">
                            <span class="input-group-addon">¿Cambio?</span>
                            <input disabled required id="cambio-domi" type="text" pattern="[0-9]+" minlength="1" maxlength="9" class="form-control" name="cambio-domi" placeholder="Cantidad de Efectivo.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group" style="width:20%;">
                            <span class="input-group-addon">Total:</span>
                            <input readonly id="total-domi" type="text" class="form-control" name="total-domi" placeholder="0$">
                        </div>
                    </div>

                    <div class="input-group cont-btn">
                        <div class="cont-btn-principal">
                            <button disabled type="submit" class="btn-div btn btn-principal">Pedir</button>
                        </div>
                        <div class="cont-btns-secundario">
                            <button disabled type="button" class="btn-div btn btn-secundario">Cancelar</button>
                            <button disabled type="button" class="btn-div btn btn-secundario">Editar</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="div-footer"></div>
        </div>
    </article>
</section>