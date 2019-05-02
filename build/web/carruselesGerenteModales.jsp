<body>
    <!-- Modal de Registrar -->
    <div class="modal fade" id="carruselesRGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-map"></span><label for="regNombreCategoria" class="me">Registrar Carrusel</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
                    <form action="Carrusel" method="POST" enctype="multipart/form-data">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Hay Imagen:</span>
                            <input type="text" class="form-control" id="regHayImagenCarrusel">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Tipo:</span>
                            <select required onchange="cambioDeSelectCarrusel(this, 'reg')" class="form-control" name="regTipoCarrusel">
                                <option value="Empresarial">Empresarial</option>
                                <option value="Publico">Público</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Dirigido a:</span>
                            <select required class="form-control" id="regDirigidoAEmpresarialCarrusel" name="regDirigidoAEmpresarialCarrusel">
                                <option value="Mi Sede">Mi Sede</option>
                                <option value="Sedes de mi Ciudad">Sedes de mi Ciudad</option>
                                <option value="Todas las Sedes">Todas las Sedes</option>
                            </select>
                            <select required class="form-control" id="regDirigidoAPublicoCarrusel" name="regDirigidoAPublicoCarrusel">
                                <option value="Mi Ciudad">Mi Ciudad</option>
                                <option value="Nacional">Nacional</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <p class="mi-obli"><span class="a-mi-sp">Recuerde seguir las siguientes reglas:</span> el tamaño máximo es de 4MB, se recomienda usar una medida de 4500 píxeles de ancho y 1365 píxeles de alto, y los formatos permitidos son .png, .bmp, .jpg, .svg y .jpeg</p>
                        <div class="input-group">
                            <span class="input-group-addon">Imagen:</span>
                            <input type="file" onchange="validarFileCarrusel(this, 'reg')" class="form-control" id="regArchivoCarrusel" name="regArchivoCarrusel">
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="regBtnCarrusel" class="btn-modal btn btn-principal">Registrar</button>
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
    <div class="modal fade" id="carruselesVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label class="me">Detalles del Carrusel</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Tipo:</p>
                                <p class="verDetalles-contenido" id="verTipoCarrusel"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Para:</p>
                                <p class="verDetalles-contenido" id="verDirigidoACarrusel"></p>
                            </div>
                        </div>
                        <hr>
                        <div id="verDivAdminSCarrusel">
                            <div>
                                <p class="verDetalles-titulo">Nombre de la Imagen:</p>
                                <p class="verDetalles-contenido" id="verNombreImgCarrusel"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Sede del Carrusel:</p>
                                <p class="verDetalles-contenido" id="verSedeCarrusel"></p>
                            </div>
                        </div>
                        <hr id="verHrAdminSCarrusel">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Imagen:</p>
                                <p class="verDetalles-contenido" id="verImgCarrusel"></p>
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
    <div class="modal fade" id="carruselesAGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label for="actuaTipoCarrusel" class="me">Actualizar Información del Carrusel</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="CarruselA" method="POST">
                            <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="actuaIDCarrusel" name="actuaIDCarrusel">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Tipo:</span>
                            <select required onchange="cambioDeSelectCarrusel(this, 'actua'); this.style.color = '#87A2D1';" class="form-control" id="actuaTipoCarrusel" name="actuaTipoCarrusel">
                                <option value="Empresarial">Empresarial</option>
                                <option value="Publico">Público</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Dirigido a:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" id="actuaDirigidoAEmpresarialCarrusel" name="actuaDirigidoAEmpresarialCarrusel">
                                <option value="Mi Sede">Mi Sede</option>
                                <option value="Sedes de mi Ciudad">Sedes de mi Ciudad</option>
                                <option value="Todas las Sedes">Todas las Sedes</option>
                            </select>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" id="actuaDirigidoAPublicoCarrusel" name="actuaDirigidoAPublicoCarrusel">
                                <option value="Mi Ciudad">Mi Ciudad</option>
                                <option value="Nacional">Nacional</option>
                            </select>
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
    
    <!-- Modal de Cambiar IMG -->
    <div class="modal fade" id="carruselesCGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label class="me">Actualizar Imagen del Carrusel</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="CarruselC" method="POST" enctype="multipart/form-data">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="cambIDCarrusel" name="cambIDCarrusel">
                        </div>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Hay Imagen:</span>
                            <input type="text" class="form-control" id="cambHayImagenCarrusel">
                        </div>
                        <p class="mi-obli"><span class="a-mi-sp">Recuerde seguir las siguientes reglas:</span> el tamaño máximo es de 4MB, se recomienda usar una medida de 4500 píxeles de ancho y 1365 píxeles de alto, y los formatos permitidos son .png, .bmp, .jpg, .svg y .jpeg</p>
                        <div class="input-group">
                            <span class="input-group-addon">Imagen:</span>
                            <input type="file" onchange="validarFileCarrusel(this, 'camb')" class="form-control" id="cambArchivoCarrusel" name="cambArchivoCarrusel">
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="cambBtnCarrusel" class="btn-modal btn btn-principal">Cambiar Imagen</button>
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
