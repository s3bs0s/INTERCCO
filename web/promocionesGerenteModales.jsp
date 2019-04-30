<%@page import="com.INTERCCO.modelo.Beans.Productos"%>
<%@page import="java.util.ArrayList"%>
<body>
    <!-- Modal para Registrar -->
    <div class="modal fade" id="promocionesRGerenteModal" role="dialog">
        <div class="modal-dialog modal-lg">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-price-tags"></span><label for="regProductoPromocion" class="me">Registrar Promoción</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
                    <form action="Promocion" method="POST" autocomplete="off">
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Producto:</span>
                                <% ArrayList<Productos> listaProductosSPar = (ArrayList) request.getAttribute("listaProSPar"); %>
                                <select required class="form-control" title="Seleccione el producto que será promocionado." name="regProductoPromocion">
                                    <%  int idSedeUsuarioProd = 0;
                                        String rolUsuarioProd = "";
                                        if (session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("")){
                                            idSedeUsuarioProd = 0;
                                        } else {
                                            idSedeUsuarioProd = (int) session.getAttribute("idSedeUsuario"); 
                                            rolUsuarioProd = (String) session.getAttribute("rolUsuario");
                                        }
                                        for (Productos  prodSP: listaProductosSPar) { 
                                        if (rolUsuarioProd.equals("AdminS")){ %>
                                            <option value="<%= prodSP.getIdProductos()%>"><%= prodSP.getNombre()%></option>
                                        <% } else { 
                                            if (prodSP.getIdSede() == idSedeUsuarioProd){ %>
                                                <option value="<%= prodSP.getIdProductos()%>"><%= prodSP.getNombre()%></option>
                                            <% } %>
                                        <% } %>
                                    <% } %>
                                </select>
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:50%;">
                                <span class="input-group-addon">Porcentaje:</span>
                                <input required type="tel" onkeypress="return acceptNP(event)" pattern="[0-9.]+" maxlength="5" minlength="3" class="form-control" name="regPorcentajePromocion" placeholder="Ejemplo: 12.0">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group" style="width:50%;">
                                <span class="input-group-addon">Caducidad:</span>
                                <input required type="date" class="form-control" name="regFechaCaducidadPromocion">
                                <span class="input-group-addon i-obli">*</span>
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

    <!-- Modal para Actualizar -->
    <div class="modal fade" id="promocionesAGerenteModal" role="dialog">
        <div class="modal-dialog modal-lg">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label id="actuaTituloNombreUsuario" for="actuaNombresUsuario" class="me">Actualizar Información de la Promocion</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="PromocionA" method="POST">
                        <div class="filas-i">
                            <div class="input-group inpDesa">
                                <span class="input-group-addon">ID:</span>
                                <input type="text" class="form-control" id="actuaIDPromocion" name="actuaIDPromocion">
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:50%;">
                                <span class="input-group-addon">Porcentaje:</span>
                                <input required type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9.]+" maxlength="5" minlength="3" class="form-control" id="actuaPorcentajePromocion" name="actuaPorcentajePromocion">
                            </div>
                            <div class="input-group" style="width:50%;">
                                <span class="input-group-addon">Caducidad:</span>
                                <input required type="date" onkeypress="this.style.color = '#87A2D1';" class="form-control" id="actuaFechaCaducidadPromocion" name="actuaFechaCaducidadPromocion">
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
