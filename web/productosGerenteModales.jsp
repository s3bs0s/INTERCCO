<%@page import="com.INTERCCO.modelo.Beans.Insumos"%>
<%@page import="com.INTERCCO.modelo.Beans.Categorias"%>
<%@page import="java.util.ArrayList"%>
<body>
    <!-- Modal de Registrar -->
    <div class="modal fade" id="productosRGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-spoon-knife"></span><label for="regNombreCategoria" class="me">Registrar Producto</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
                    <form action="Producto" method="POST" autocomplete="off">
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Información del Producto</h1>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Nombre:</span>
                            <input required type="text" onkeypress="return refuseCPyP(event)" maxlength="50" minlength="2" class="form-control" name="regNombreProducto" placeholder="Producto.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Precio:</span>
                            <input required type="tel" class="form-control" onkeypress="return acceptNum(event)" onkeyup="formatNumber(this.value,'regPrecioProducto', 'reg')" name="regPrecioProducto" id="regPrecioProducto" minlength="1" maxlength="14" placeholder="Preción de Venta.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Categoría:</span>
                            <% ArrayList<Categorias> listaCategoriasSPar = (ArrayList) request.getAttribute("listaCatSPar"); %>
                            <select required class="form-control" name="regCategoriaProducto">
                                <%  int idSedeUsuarioCate = 0;
                                    String rolUsuarioCate = "";
                                    if (session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("")){
                                        idSedeUsuarioCate = 0;
                                    } else {
                                        idSedeUsuarioCate = (int) session.getAttribute("idSedeUsuario"); 
                                        rolUsuarioCate = (String) session.getAttribute("rolUsuario");
                                    }
                                    for (Categorias  cateSP: listaCategoriasSPar) { 
                                    if (rolUsuarioCate.equals("AdminS")){ %>
                                        <option value="<%= cateSP.getIdCategorias()%>"><%= cateSP.getNombre()%></option>
                                    <% } else { 
                                        if (cateSP.getIdSede() == idSedeUsuarioCate){ %>
                                            <option value="<%= cateSP.getIdCategorias()%>"><%= cateSP.getNombre()%></option>
                                        <% } %>
                                    <% } %>
                                <% } %>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Descripción:</span>
                            <textarea class="form-control" placeholder="Descripción del producto." name="regDescripcionProducto"></textarea>
                        </div>
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Insumos que Gasta</h1>
                        </div>
                        <p class="mi-obli">Para registrar el producto, debe agregar como mínimo un insumo que gasté.</p>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Insumos:</span>
                            <input type="text" class="form-control" id="regInsumosPProducto" name="regInsumosPProducto">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Insumo:</span>
                            <% ArrayList<Insumos> listaInsumosSPar = (ArrayList) request.getAttribute("listaInsSPar"); %>
                            <select class="form-control" onchange="autocompleteInsumosProducto('reg', this)" onfocus="this.style.background = '#fff'" id="regInsumosProducto">
                                <%  idSedeUsuarioCate = 0;
                                    rolUsuarioCate = "";
                                    if (session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("")){
                                        idSedeUsuarioCate = 0;
                                    } else {
                                        idSedeUsuarioCate = (int) session.getAttribute("idSedeUsuario"); 
                                        rolUsuarioCate = (String) session.getAttribute("rolUsuario");
                                    }
                                    for (Insumos  insuSP: listaInsumosSPar) { 
                                    if (rolUsuarioCate.equals("AdminS")){ %>
                                        <option value="<%= insuSP.getIdInsumos()+";"+insuSP.getUnidadMedida()%>"><%= insuSP.getNombre()%></option>
                                    <% } else {
                                        if (insuSP.getIdSede() == idSedeUsuarioCate){ %>
                                            <option value="<%= insuSP.getIdInsumos()+";"+insuSP.getUnidadMedida()%>"><%= insuSP.getNombre()%></option>
                                        <% } %>
                                    <% } %>
                                <% } %>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Unidad de medida:</span>
                            <input disabled type="text" class="form-control" id="regUnidadMInsumoProducto">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Cantidad:</span>
                            <input type="tel" pattern="[0-9]+" onfocus="this.style.background = '#fff'" onkeyup="if(this.value==='0'){this.value='1';}" onkeypress="return acceptNum(event)" minlength="1" maxlength="5" class="form-control" id="regCantidadInsumosProducto" placeholder="Cantidad que Gasta.">
                        </div>
                        <div class="input-group btnCJMSecundario">
                            <button type="button" id="regBtnAggProducto" onclick="agregarInsumoProducto('reg')" class="btn btn-success btnMSecundario">Agregar Insumo</button>
                            <button type="button" onclick="limpiarInsumosProducto('reg')" class="btn btn-info btnMSecundario">Limpiar Insumos</button>
                        </div>
                        <div class="table-responsive">
                            <table class="tablaListarInsumosProductosReg table-bordered table">
                                <thead>
                                    <tr>
                                        <th>Insumo</th>
                                        <th>Cantidad</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Insumo</th>
                                        <th>Cantidad</th>
                                        <th>Acciones</th>
                                    </tr>
                                </tfoot>
                                <tbody id="regBodyTableProducto">
                                </tbody>
                            </table>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="regBtnProducto" class="btn-modal btn btn-principal">Registrar</button>
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
    <div class="modal fade" id="productosVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label class="me">Detalles del Producto</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Nombre:</p>
                                <p class="verDetalles-contenido" id="verNombreProducto"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Categoría:</p>
                                <p class="verDetalles-contenido" id="verCategoriaProducto"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Precio:</p>
                                <p class="verDetalles-contenido" id="verPrecioProducto"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Descripción:</p>
                                <p class="verDetalles-contenido" id="verDescripcionProducto"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Insumos que Gasta:</p>
                                <p class="verDetalles-contenido" id="verInsumosGastaProducto"></p>
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
    <div class="modal fade" id="productosAGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label for="actuaNombreProducto" class="me">Actualizar Información del Producto</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="ProductoA" method="POST">
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Información del Producto</h1>
                        </div>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="actuaIDProducto" name="actuaIDProducto">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Nombre:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1'; return refuseCPyP(event)" maxlength="80" minlength="2" class="form-control" id="actuaNombreProducto" name="actuaNombreProducto">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Precio:</span>
                            <input required type="tel" class="form-control" onkeypress="this.style.color = '#87A2D1'; return acceptNum(event)" onkeyup="formatNumber(this.value,'actuaPrecioProducto', 'reg')" id="actuaPrecioProducto" name="actuaPrecioProducto" minlength="1" maxlength="14">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Categoría:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" id="actuaCategoriaProducto" name="actuaCategoriaProducto">
                                <%  idSedeUsuarioCate = 0;
                                    rolUsuarioCate = "";
                                    if (session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("")){
                                        idSedeUsuarioCate = 0;
                                    } else {
                                        idSedeUsuarioCate = (int) session.getAttribute("idSedeUsuario"); 
                                        rolUsuarioCate = (String) session.getAttribute("rolUsuario");
                                    }
                                    for (Categorias  cateSP: listaCategoriasSPar) { 
                                    if (rolUsuarioCate.equals("AdminS")){ %>
                                        <option value="<%= cateSP.getIdCategorias()%>"><%= cateSP.getNombre()%></option>
                                    <% } else { 
                                        if (cateSP.getIdSede() == idSedeUsuarioCate){ %>
                                            <option value="<%= cateSP.getIdCategorias()%>"><%= cateSP.getNombre()%></option>
                                        <% } %>
                                    <% } %>
                                <% } %>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Descripción:</span>
                            <textarea onkeypress="this.style.color = '#87A2D1';" class="form-control" id="actuaDescripcionProducto" name="actuaDescripcionProducto"></textarea>
                        </div>
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Insumos que Gasta</h1>
                        </div>
                        <p class="mi-obli">Para registrar el producto, debe agregar como mínimo un insumo que gasté.</p>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Insumos:</span>
                            <input type="text" class="form-control" id="actuaInsumosPProducto" name="actuaInsumosPProducto">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Insumo:</span>
                            <select class="form-control" onchange="autocompleteInsumosProducto('actua', this)" onfocus="this.style.background = '#fff'" id="actuaInsumosProducto">
                                <%  idSedeUsuarioCate = 0;
                                    rolUsuarioCate = "";
                                    if (session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("")){
                                        idSedeUsuarioCate = 0;
                                    } else {
                                        idSedeUsuarioCate = (int) session.getAttribute("idSedeUsuario"); 
                                        rolUsuarioCate = (String) session.getAttribute("rolUsuario");
                                    }
                                    for (Insumos  insuSP: listaInsumosSPar) { 
                                    if (rolUsuarioCate.equals("AdminS")){ %>
                                        <option value="<%= insuSP.getIdInsumos()+";"+insuSP.getUnidadMedida()%>"><%= insuSP.getNombre()%></option>
                                    <% } else {
                                        if (insuSP.getIdSede() == idSedeUsuarioCate){ %>
                                            <option value="<%= insuSP.getIdInsumos()+";"+insuSP.getUnidadMedida()%>"><%= insuSP.getNombre()%></option>
                                        <% } %>
                                    <% } %>
                                <% } %>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Unidad de medida:</span>
                            <input disabled type="text" class="form-control" id="actuaUnidadMInsumoProducto">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Cantidad:</span>
                            <input type="tel" pattern="[0-9]+" onfocus="this.style.background = '#fff'" onkeyup="if(this.value==='0'){this.value='1';}" onkeypress="return acceptNum(event)" minlength="1" maxlength="5" class="form-control" id="actuaCantidadInsumosProducto" placeholder="Cantidad que Gasta.">
                        </div>
                        <div class="input-group btnCJMSecundario">
                            <button type="button" id="actuaBtnAggProducto" onclick="agregarInsumoProducto('actua')" class="btn btn-success btnMSecundario">Agregar Insumo</button>
                            <button type="button" onclick="limpiarInsumosProducto('actua')" class="btn btn-info btnMSecundario">Limpiar Insumos</button>
                        </div>
                        <div class="table-responsive">
                            <table class="tablaListarInsumosProductosActua table-bordered table">
                                <thead>
                                    <tr>
                                        <th>Insumo</th>
                                        <th>Cantidad</th>
                                        <th>Acciones</th>
                                    </tr>
                                </thead>
                                <tfoot>
                                    <tr>
                                        <th>Insumo</th>
                                        <th>Cantidad</th>
                                        <th>Acciones</th>
                                    </tr>
                                </tfoot>
                                <tbody id="actuaBodyTableProducto">
                                </tbody>
                            </table>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="actuaBtnProducto" class="btn-modal btn btn-principal">Actualizar</button>
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
