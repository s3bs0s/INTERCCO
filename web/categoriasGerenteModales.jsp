<body>
    <!-- Modal de Registrar -->
    <div class="modal fade" id="categoriasRGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-list-alt"></span><label for="regNombreCategoria" class="me">Registrar Categoría</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
                    <form action="Categoria" method="POST" autocomplete="off">
                        <div class="input-group">
                            <span class="input-group-addon">Nombre:</span>
                            <input required type="text" onkeypress="return refuseCPyP(event)" maxlength="80" minlength="2" class="form-control" name="regNombreCategoria" placeholder="Categoría.">
                            <span class="input-group-addon i-obli">*</span>
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
    
    <!-- Modal de Editar -->
    <div class="modal fade" id="categoriasAGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label for="actuaNombreCategoria" class="me">Actualizar Información de la Categoría</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="CategoriaA" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="actuaIDCategoria" name="actuaIDCategoria">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Nombre:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1'; return refuseCPyP(event)" maxlength="80" minlength="2" class="form-control" id="actuaNombreCategoria" name="actuaNombreCategoria">
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
    <div class="modal fade" id="categoriasEGerenteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            
            <div class="modal-content">
                <div class="modal-header modal-header-elim">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-remove"></span><label class="me">¿Desea eliminar la Categoría?</label></h4>
                </div>
                <div class="modal-body modal-body-elim">
                    <form action="CategoriaE" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="elimIDCategoria" name="elimIDCategoria">
                        </div>
                        <p class="mi-obli">Recuerde que cuando eliminé la categoría <span class="a-mi-elim-sp" id="elimNombreCategoria"></span>, también se eliminarán todos los productos de ella más sus promociones.</p>
                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal-elim btn btn-principal">Estoy Segur<%= session.getAttribute("genUsuario").equals("Masculino")?"o":"a" %>, ¡Eliminar!</button>
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
