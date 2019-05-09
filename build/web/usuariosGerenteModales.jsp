<body>
    <!-- Modal para Registrar -->
    <div class="modal fade" id="usuariosRGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-user-plus"></span><label for="regNombresUsuario" class="me">Registrar Usuario</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p class="mi-obli">Los campos que contengan el s�mbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser as�, son totalmente opcional.</p>
                    <form action="Usuario" method="POST">
                        <div class="input-group">
                            <span class="input-group-addon">Nombres:</span>
                            <input required autofocus type="text" pattern="[a-zA-z ]+" maxlength="70" minlength="2" class="form-control" name="regNombresUsuario" placeholder="Nombres.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Apellidos:</span>
                            <input required type="text" minlength="2" maxlength="90" class="form-control" name="regApellidosUsuario" placeholder="Apellidos.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Rol:</span>
                            <select required class="form-control" title="Seleccione un rol para el usuario." name="regRolUsuario">
                                <option value="Cajero">Cajero</option>
                                <option value="Cocinero">Cocinero</option>
                                <option value="Mesero">Mesero</option>
                                <option value="Domiciliario">Domiciliario</option>
                                <option value="Cliente">Cliente</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Tipo:</span>
                            <select required class="form-control" title="Seleccione su tipo de identificaci�n." name="regTipoIdentiUsuario">
                                <option value="TI">TI (Tarjeta de Identidad)</option>
                                <option value="CC">CC (C�dula de Ciudadan�a)</option>
                                <option value="TP">TP (Tarjeta Pasaporte)</option>
                                <option value="CE">CE (C�dula de Extranjer�a)</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">N�mero de identificaci�n:</span>
                            <input required type="text" minlength="5" maxlength="20" class="form-control" name="regNumIdentiUsuario" placeholder="N�mero de Identificaci�n.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Email:</span>
                            <input required type="email" minlength="10" maxlength="150" class="form-control" name="actuaEmailUsuario" placeholder="user@succo.com">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Contrase�a SUCCO:</span>
                            <input required type="password"  id="InpMOPasswordRegGer" minlength="3" maxlength="20" class="form-control" name="actuaContraUsuario" placeholder="M�ximo 20 caracteres.">
                            <span class="input-group-addon i-pass" id="BtnMOPasswordRegGer" onClick="MOPass('RegGer')">Mostrar</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Tel�fono:</span>
                            <input type="tel" pattern="[0-9]+" minlength="4" maxlength="15" class="form-control" name="regTelefonoUsuario" placeholder="Tel�fono Fijo.">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">M�vil:</span>
                            <input type="tel" pattern="[0-9]+" minlength="6" maxlength="28" class="form-control" name="regMovilUsuario" placeholder="Tel�fono M�vil.">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Genero:</span>
                            <select required class="form-control" title="Seleccione su genero actual." name="regGeneroUsuario">
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Fecha de nacimiento:</span>
                            <input required type="date" class="form-control" name="regFechaNacimientoUsuario">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Direcci�n de residencia:</span>
                            <input type="text" minlength="8" maxlength="150" class="form-control" name="regDireccionUsuario" placeholder="Direcci�n de Residencia.">
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

    <!-- Modal para Ver -->
    <div class="modal fade" id="usuariosVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label id="verTituloNombreUsuario" class="me">Ver detalles de..</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div id="verTituloInformacionUsuario" class="cont-titulo-sect">
                        <h1 class="titulo-sect">Informaci�n del usuario</h1>
                    </div>
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Nombre Completo:</p>
                                <p class="verDetalles-contenido" id="verNombreUsuario"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Rol:</p>
                                <p class="verDetalles-contenido" id="verRolUsuario"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Email:</p>
                                <p class="verDetalles-contenido" id="verEmailUsuario"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Contrase�a SUCCO:</p>
                                <p class="verDetalles-contenido" id="verContraUsuario"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo" id="verTipoIdentiUsuario"></p>
                                <p class="verDetalles-contenido" id="verNumIdentiUsuario"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Tel�fono Fijo:</p>
                                <p class="verDetalles-contenido" id="verTelefonoUsuario"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Fecha de Nacimiento:</p>
                                <p class="verDetalles-contenido" id="verFechaNacimientoUsuario"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Genero:</p>
                                <p class="verDetalles-contenido" id="verGeneroUsuario"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">M�vil:</p>
                                <p class="verDetalles-contenido" id="verMovilUsuario"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Direcci�n:</p>
                                <p class="verDetalles-contenido" id="verDireccionUsuario"></p>
                            </div>
                        </div>
                    </div>
                    <div id="verTituloSancionUsuario" class="cont-titulo-sect">
                        <h1 class="titulo-sect">Informaci�n de la sanci�n</h1>
                    </div>
                    <div class="panel-group" id="accordionVerUsuario">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionVerUsuario" data-target="#verSancion">Presi�ne para ver<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                            </div>
                            <div id="verSancion" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="verDetalles-caj">
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Moderador:</p>
                                                <p class="verDetalles-contenido" id="verEmailModeradorUsuario"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">Fecha L�mite:</p>
                                                <p class="verDetalles-contenido" id="verFechaLimiteUsuario"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Justificaci�n:</p>
                                                <p class="verDetalles-contenido" id="verJustificacionUsuario"></p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
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
    
    <!-- Modal para Actualizar -->
    <div class="modal fade" id="usuariosAGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label id="actuaTituloNombreUsuario" for="actuaNombresUsuario" class="me">Actualizar Informaci�n de Usuario</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="UsuarioA" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="actuaIDUsuario" name="actuaIDUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Nombres:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" pattern="[a-zA-z ]+" maxlength="70" minlength="2" class="form-control" id="actuaNombresUsuario" name="actuaNombresUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Apellidos:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" minlength="2" maxlength="90" class="form-control" id="actuaApellidosUsuario" name="actuaApellidosUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Rol:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" title="Seleccione un rol para el usuario." id="actuaRolUsuario" name="actuaRolUsuario">
                                <option value="Gerente">Gerente</option>
                                <option value="Cajero">Cajero</option>
                                <option value="Cocinero">Cocinero</option>
                                <option value="Mesero">Mesero</option>
                                <option value="Domiciliario">Domiciliario</option>
                                <option value="Cliente">Cliente</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Tipo:</span>
                            <select disabled class="form-control" id="actuaTipoIdentiUsuario">
                                <option value="TI">TI (Tarjeta de Identidad)</option>
                                <option value="CC">CC (C�dula de Ciudadan�a)</option>
                                <option value="TP">TP (Tarjeta Pasaporte)</option>
                                <option value="CE">CE (C�dula de Extranjer�a)</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">N�mero de identificaci�n:</span>
                            <input disabled type="text" class="form-control" id="actuaNumIdentiUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Email:</span>
                            <input disabled type="email" class="form-control" id="actuaEmailUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Contrase�a SUCCO:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" minlength="3" maxlength="20" class="form-control" id="actuaContraUsuario" name="actuaContraUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Tel�fono:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="4" maxlength="15" class="form-control" id="actuaTelefonoUsuario" name="actuaTelefonoUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">M�vil:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="6" maxlength="28" class="form-control" id="actuaMovilUsuario" name="actuaMovilUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Genero:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" title="Seleccione su genero actual." id="actuaGeneroUsuario" name="actuaGeneroUsuario">
                                <option value="Masculino">Masculino</option>
                                <option value="Femenino">Femenino</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Fecha de nacimiento:</span>
                            <input required type="date" onkeypress="this.style.color = '#87A2D1';" class="form-control" id="actuaFechaNacimientoUsuario" name="actuaFechaNacimientoUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Direcci�n de residencia:</span>
                            <input type="text" onkeypress="this.style.color = '#87A2D1';" minlength="8" maxlength="150" class="form-control" id="actuaDireccionUsuario" name="actuaDireccionUsuario">
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
    
    <!-- Modal para Sancionar -->
    <div class="modal fade" id="usuariosSGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-library"></span><label for="sanFchLimiteUsuario" class="me">Sancionar Usuario</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="UsuarioS" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" id="sanIDUsuario" class="form-control" name="sanIDUsuario">
                        </div>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Usuario:</span>
                            <input type="text" id="sanEmailOcultoUsuario" class="form-control" name="sanEmailOcultoUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Usuario:</span>
                            <input disabled type="text" id="sanEmailUsuario" class="form-control" name="sanEmailUsuario">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">L�mite de tiempo:</span>
                            <select required class="form-control" title="Seleccione el L�mite de Tiempo de la Sanci�n." name="sanFchLimiteUsuario">
                                <option value="1">1 D�a</option>
                                <option value="2">2 D�as</option>
                                <option value="3">3 D�as</option>
                                <option value="4">4 D�as</option>
                                <option value="5">5 D�as</option>
                                <option value="6">6 D�as</option>
                                <option value="7">7 D�as</option>
                                <option value="73000">Permanente</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Justificaci�n:</span>
                            <textarea required class="form-control" id="sanJustificacionUsuario" name="sanJustificacionUsuario"></textarea>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal btn btn-principal">Sancionar</button>
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
    <div class="modal fade" id="usuariosEGerenteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            
            <div class="modal-content">
                <div class="modal-header modal-header-elim">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-remove"></span><label class="me">�Desea eliminar el Usuario?</label></h4>
                </div>
                <div class="modal-body modal-body-elim">
                    <form action="UsuarioE" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="elimIDUsuario" name="elimIDUsuario">
                        </div>
                        <p class="mi-obli">Recuerde que cuando elimin� el usuario <span class="a-mi-elim-sp" id="elimEmailUsuario"></span>, tambi�n se eliminar�n todas las solicitudes PQRSF de el.</p>
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
