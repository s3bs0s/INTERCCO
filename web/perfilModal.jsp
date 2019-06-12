<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page import="com.INTERCCO.modelo.Beans.Sedes"%>
<%@page import="java.util.ArrayList"%>
<body>
    <div id="ModalPerfil" class="modal-perfil s-aye">
        <div class="flex-perfil" id="FlexPerfil">
            <div class="contenido-modal-perfil">
                <div class="modal-header-perfil">
                    <span class="icon-user-circle"></span><span class="me">Mi Perfil</span>
                    <span class="cerrar-perfil" id="CerrarHeaderPerfil">&times;</span>
                </div>
                <div class="modal-body-perfil">
                    <form id="FormPerfil" action="UsuarioAP" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="perfilIDUsuario" name="perfilIDUsuario">
                        </div>
                        
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Rol:</span>
                            <input type="text" class="form-control" id="perfilRolOcultoUsuario" name="perfilRolOcultoUsuario">
                        </div>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Actual:</span>
                            <input type="text" class="form-control" id="perfilContraActualOcultoUsuario">
                        </div>
                        <div class="panel-group" id="accordionPerfil">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionPerfil" data-target="#Perfil1"><span class="icon-user"></span> Información Personal<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="Perfil1" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="input-group">
                                            <span class="input-group-addon">Nombres:</span>
                                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" pattern="[a-zA-z ]+" maxlength="70" minlength="2" class="form-control" id="perfilNombresUsuario" name="perfilNombresUsuario">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Apellidos:</span>
                                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" minlength="2" maxlength="90" class="form-control" id="perfilApellidosUsuario" name="perfilApellidosUsuario">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Rol:</span>
                                            <input disabled type="text" class="form-control" id="perfilRolUsuario">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Tipo:</span>
                                            <input disabled type="text" class="form-control" id="perfilTipoIdentiUsuario">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Número de identificación:</span>
                                            <input disabled type="text" class="form-control" id="perfilNumIdentiUsuario">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Genero:</span>
                                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" title="Seleccione su genero actual." id="perfilGeneroUsuario" name="perfilGeneroUsuario">
                                                <option value="Masculino">Masculino</option>
                                                <option value="Femenino">Femenino</option>
                                            </select>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Fecha de nacimiento:</span>
                                            <input required type="date" onkeypress="this.style.color = '#87A2D1';" class="form-control" id="perfilFechaNacimientoUsuario" name="perfilFechaNacimientoUsuario">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionPerfil" data-target="#Perfil2"><span class="icon-bullhorn"></span> Comunicación<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="Perfil2" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="input-group">
                                            <span class="input-group-addon">Email:</span>
                                            <input disabled type="email" class="form-control" id="perfilEmailUsuario">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Teléfono:</span>
                                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="4" maxlength="15" class="form-control" id="perfilTelefonoUsuario" name="perfilTelefonoUsuario">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Móvil:</span>
                                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="6" maxlength="28" class="form-control" id="perfilMovilUsuario" name="perfilMovilUsuario">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionPerfil" data-target="#Perfil3"><span class="icon-key"></span> Contraseña SUCCO<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="Perfil3" class="panel-collapse collapse seccionPasswordPerfil">
                                    <div class="panel-body">
                                        <div class="input-group">
                                            <span class="input-group-addon">Contraseña actual:</span>
                                            <input type="text" class="form-control" id="perfilContraActualUsuario" name="perfilContraActualUsuario" placeholder="Contraseña Actual">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Contraseña nueva:</span>
                                            <input type="text" onkeyup="ContrasIgualesPerfil()" class="form-control" id="perfilContraNuevaUsuario" name="perfilContraNuevaUsuario" placeholder="Nueva Contraseña">
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">De nuevo:</span>
                                            <input type="text" onkeyup="ContrasIgualesPerfil()" class="form-control" id="perfilRepitaContraNuevaUsuario" placeholder="Repita la Nueva Contraseña">
                                        </div>
                                        
                                        <div class="input-group cont-btn">
                                            <div class="cont-btn-principal">
                                                <button type="button" id="perfilCambiarContras" onclick="EnviarFormContras()" class="btn-modal btn btn-principal">Cambiar Contraseña SUCCO</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionPerfil" data-target="#Perfil4"><span class="icon-compass2"></span> Ubicación<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="Perfil4" class="panel-collapse collapse">
                                    <div class="panel-body">
                                        <div class="input-group">
                                            <span class="input-group-addon">Dirección de residencia:</span>
                                            <input type="text" onkeypress="this.style.color = '#87A2D1';" minlength="8" maxlength="150" class="form-control" id="perfilDireccionUsuario" name="perfilDireccionUsuario">
                                        </div>
                                        <div class="input-group" id="perfilCajSedeUsuario">
                                            <span class="input-group-addon">Sede:</span>
                                            <input disabled type="text" class="form-control" id="perfilSedeUsuario">
                                        </div>
                                        <div class="input-group" id="perfilCajSedeCliente">
                                            <span class="input-group-addon">Sede:</span>
                                            <select class="form-control" onchange="this.style.color = '#87A2D1';" title="Seleccione una Sede." id="perfilSedeCliente" name="perfilSedeCliente">
                                                <option value="1">Itagüí</option>
                                                <option value="2">Bello</option>
                                                <option value="3">Fontibón</option>
                                            </select>
                                        </div>
                                        <!--<div class="input-group" id="perfilCajSedeCliente">
                                            <span class="input-group-addon">Sede:</span>
                                            <%-- ArrayList<Sedes> listaSedesSPro = (ArrayList) request.getAttribute("listaCiuSPro"); %>
                                            <select class="form-control" onchange="this.style.color = '#87A2D1';" title="Seleccione una Sede." id="perfilSedeCliente" name="perfilSedeCliente">
                                                <% for (Sedes sedeSP: listaSedesSPro) { %>
                                                    <option value="<%= sedeSP.getIdSedes()%>"><%= sedeSP.getNombre()%></option>
                                                <% } --%>
                                            </select>
                                        </div>-->
                                    </div>
                                </div>
                            </div>
                            <div id="perfilPanelFotoUsuario" class="panel panel-default">
                                <div class="panel-heading">
                                    <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionPerfil" data-target="#Perfil5"><span class="icon-file-picture"></span> Foto<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                                </div>
                                <div id="Perfil5" class="panel-collapse collapse seccionFotoPerfil">
                                    <div class="panel-body">
                                        <div class="input-group inpDesa">
                                            <span class="input-group-addon">Nombre Imagen:</span>
                                            <input type="text" class="form-control" id="perfilHayImagenUsuario">
                                        </div>
                                        <div class="input-group inpDesa">
                                            <span class="input-group-addon">Hay Imagen:</span>
                                            <input type="text" class="form-control" id="perfilNombreImagenUsuario">
                                        </div>
                                        <p class="mi-obli"><span class="a-mi-sp">Recuerde seguir las siguientes reglas:</span> el tamaño máximo es de 6MB y los formatos permitidos son .png, .bmp, .jpg, .svg y .jpeg</p>
                                        <div class="input-group" id="perfilCajFotoUsuario">
                                            <img>
                                        </div>
                                        <div class="input-group">
                                            <span class="input-group-addon">Imagen:</span>
                                            <input type="file" onchange="validarFilePerfil(this)" class="form-control" id="perfilArchivoUsuario" name="perfilArchivoUsuario">
                                        </div>
                                        
                                        <div class="input-group cont-btn">
                                            <div class="cont-btn-principal">
                                                <% CifradoASCII cAPerfilM = new CifradoASCII(); %>
                                                <button type="button" id="perfilCambiarFoto" onclick="EnviarFormFoto('AI', '<%= cAPerfilM.CifrarASCII((String)session.getAttribute("nomSedeUsuario")) %>')" class="btn-modal btn btn-principal">Cambiar Foto</button>
                                                <button type="button" id="perfilEliminarFoto" onclick="EnviarFormFoto('EI', '<%= cAPerfilM.CifrarASCII((String)session.getAttribute("nomSedeUsuario")) %>')" class="btn-modal btn btn-principal">Eliminar Foto</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="BtnActuaPerfil" class="btn-modal btn btn-principal">Actualizar</button>
                                <button type="button" id="CerrarBodyPerfil" class="btn-modal btn btn-principal">Cerrar</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>