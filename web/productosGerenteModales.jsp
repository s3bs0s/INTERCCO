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
                    <p class="mi-obli">Los campos que contengan el s�mbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser as�, son totalmente opcional.</p>
                    <form action="Producto" method="POST" autocomplete="off">
                        <div class="input-group">
                            <span class="input-group-addon">Nombre:</span>
                            <input required type="text" onkeypress="return refuseCPyP(event)" maxlength="50" minlength="2" class="form-control" name="regNombreProducto" placeholder="Producto.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Precio:</span>
                            <input required type="tel" class="form-control" onkeypress="return acceptNum(event)" onkeyup="formatNumber(this.value,'regPrecioProducto', 'reg')" name="regPrecioProducto" id="regPrecioProducto" minlength="1" maxlength="14" placeholder="Preci�n de Venta.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Categor�a:</span>
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
                            <span class="input-group-addon">Descripci�n:</span>
                            <textarea class="form-control" placeholder="Descripci�n del producto." name="regDescripcionProducto"></textarea>
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
                                <p class="verDetalles-titulo">Categor�a:</p>
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
                                <p class="verDetalles-titulo">Descripci�n</p>
                                <p class="verDetalles-contenido" id="verDescripcionProducto"></p>
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
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label for="actuaNombreProducto" class="me">Actualizar Informaci�n del Producto</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="ProductoA" method="POST">
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
                            <span class="input-group-addon">Categor�a:</span>
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
                            <span class="input-group-addon">Descripci�n:</span>
                            <textarea onkeypress="this.style.color = '#87A2D1';" class="form-control" id="actuaDescripcionProducto" name="actuaDescripcionProducto"></textarea>
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
    
    <!-- Modal para Eliminar -->
    <div class="modal fade" id="productosEGerenteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            
            <div class="modal-content">
                <div class="modal-header modal-header-elim">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-remove"></span><label class="me">�Desea eliminar el Producto?</label></h4>
                </div>
                <div class="modal-body modal-body-elim">
                    <form action="ProductoE" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="elimIDProducto" name="elimIDProducto">
                        </div>
                        <p class="mi-obli">Recuerde que cuando elimin� el producto <span class="a-mi-elim-sp" id="elimNombreProducto"></span>, tambi�n se eliminar�n todas las promociones existentes de el.</p>
                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal-elim btn btn-principal">Estoy Segur<%= session.getAttribute("genUsuario").equals("Masculino")?"o":"a" %>, �Eliminar!</button>
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
