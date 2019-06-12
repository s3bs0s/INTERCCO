<%@page import="com.INTERCCO.modelo.Beans.Ciudades"%>
<%@page import="java.util.ArrayList"%>
<body>
    <!-- Modal para Registrar -->
    <% String rolSedeUsuarioPro = "";
        if (session.getAttribute("rolSedeUsuario") == null){
            rolSedeUsuarioPro = "Secundario";
        } else {
            rolSedeUsuarioPro = (String) session.getAttribute("rolSedeUsuario"); 
        } 
        if (rolSedeUsuarioPro.equals("Principal")){ %>
        <div class="modal fade" id="proveedoresRGerenteModal" role="dialog">
            <div class="modal-dialog modal">

                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"><span class="icon-address-book"></span><label for="regNombreCOEProveedor" class="me">Registrar Proveedor</label></h4>
                    </div>
                    <div class="mb-textaling modal-body">
                        <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
                        <form action="Proveedor" method="POST" autocomplete="off">
                            <div class="cont-titulo-sect">
                                <h1 class="titulo-sect">Información de la empresa o compañía</h1>
                            </div>
                            <p class="mi-obli">Por favor escoja entre el <span onClick="document.getElementById('regTelefonoCOEProveedor').focus()" class="a-mi">télefono</span>, <span onClick="document.getElementById('regMovilCOEProveedor').focus()" class="a-mi">móvil</span> o <span onClick="document.getElementById('regFaxCOEProveedor').focus()" class="a-mi">fax</span>, pero debe ingresar uno de los mencionados anteriormente.</p>
                            <div class="input-group">
                                <span class="input-group-addon">Nombre de la compañía o empresa:</span>
                                <input required autofocus type="text" maxlength="90" minlength="3" class="form-control" name="regNombreCOEProveedor" placeholder="Nombre de la Compañía o Empresa.">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Tipo de identificación fiscal:</span>
                                <select required class="form-control" title="Seleccione su tipo de identificación fiscal." name="regTipoIdentiFiscalCOEProveedor">
                                    <option value="A">A - Número de identificación de empleador de los EE.UU. (EIN)</option>
                                    <option value="N">N - Número de identificación nacional</option>
                                    <option value="R">R - RUT / RUC / RFC Número de identificación fiscal</option>
                                </select>
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Número de identificación tributaria:</span>
                                <input required type="text" minlength="5" maxlength="20" class="form-control" name="regNumIdentiTribuCOEProveedor" placeholder="Número de Identificación Tributaria.">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Teléfono:</span>
                                <input type="tel" pattern="[0-9]+" minlength="4" maxlength="20" class="form-control" name="regTelefonoCOEProveedor" placeholder="Teléfono.">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Extensión:</span>
                                <input type="tel" minlength="1" maxlength="15" class="form-control" name="regExtTelefonoCOEProveedor" placeholder="Extensión.">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Móvil:</span>
                                <input type="tel" minlength="2" maxlength="18" class="form-control" name="regMovilCOEProveedor" placeholder="Móvil.">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">FAX:</span>
                                <input type="tel" minlength="2" maxlength="15" class="form-control" name="regFaxCOEProveedor" placeholder="FAX.">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Extensión:</span>
                                <input type="tel" minlength="1" maxlength="15" class="form-control" name="regExtFaxCOEProveedor" placeholder="Extensión.">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Ciudad:</span>
                                <% ArrayList<Ciudades> listaCiudadesSPro = (ArrayList) request.getAttribute("listaCiuSPro"); %>
                                <select required class="form-control" title="Seleccione su ciudad de residencia." name="regCiudadCOEProveedor">
                                    <% for (Ciudades  ciudSP: listaCiudadesSPro) { %>
                                        <option value="<%= ciudSP.getIdCiudades()%>"><%= ciudSP.getNombre()%></option>
                                    <% } %>
                                </select>
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Dirección:</span>
                                <input required type="text" minlength="8" maxlength="150" class="form-control" name="regDireccionCOEProveedor" placeholder="Dirección residencial.">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="cont-titulo-sect cont-titulo-sect-m">
                                <h1 class="titulo-sect">Información de la persona de contacto</h1>
                            </div>
                            <p class="mi-obli">Por favor escoja entre el <span onClick="document.getElementById('regEmailPCProveedor').focus()" class="a-mi">email</span>, <span onClick="document.getElementById('regFaxPCProveedor').focus()" class="a-mi">fax</span>, <span onClick="document.getElementById('regTelefonoPCProveedor').focus()" class="a-mi">télefono</span> o <span onClick="document.getElementById('regMovilPCProveedor').focus()" class="a-mi">móvil</span>, pero debe ingresar uno los mencionados anteriormente.</p>
                            <div class="input-group">
                                <span class="input-group-addon">Nombre completo:</span>
                                <input required type="text" maxlength="110" minlength="5" class="form-control" name="regNombrePCProveedor" placeholder="Nombre completo.">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Cargo:</span>
                                <input required type="text" maxlength="60" minlength="3" class="form-control" name="regCargoPCProveedor" placeholder="Cargo en la Compañía o Empresa.">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Tipo:</span>
                                <select required class="form-control" title="Seleccione su tipo de identificación." name="regTipoIdentiPCProveedor">
                                    <option value="CC">CC (Cédula de Ciudadanía)</option>
                                    <option value="TP">TP (Tarjeta Pasaporte)</option>
                                    <option value="CE">CE (Cédula de Extranjería)</option>
                                </select>
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Número de identificación:</span>
                                <input required type="text" minlength="5" maxlength="20" class="form-control" name="regNumIdentiPCProveedor" placeholder="Número de Identificación.">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Email:</span>
                                <input type="email" minlength="10" maxlength="150" class="form-control" name="regEmailPCProveedor" placeholder="user@succo.com">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">FAX:</span>
                                <input type="tel" minlength="2" maxlength="15" class="form-control" name="regFaxPCProveedor" placeholder="FAX.">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Extensión:</span>
                                <input type="tel" minlength="1" maxlength="15" class="form-control" name="regExtFaxPCProveedor" placeholder="Extensión.">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Teléfono:</span>
                                <input type="tel" pattern="[0-9]+" minlength="4" maxlength="15" class="form-control" name="regTelefonoPCProveedor" placeholder="Teléfono Fijo.">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Móvil:</span>
                                <input type="tel" pattern="[0-9]+" minlength="6" maxlength="28" class="form-control" name="regMovilPCProveedor" placeholder="Teléfono Móvil.">
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
    <% } %>

    <!-- Modal para Ver -->
    <div class="modal fade" id="proveedoresVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-eye-open"></span><label class="me">Ver detalles del Proveedor..</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="cont-titulo-sect">
                        <h1 class="titulo-sect">Información de la empresa o compañía</h1>
                    </div>
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Nombre del Proveedor:</p>
                                <p class="verDetalles-contenido" id="verNombreCOEProveedor"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo" id="verTipoIdentiFiscalCOEProveedor"></p>
                                <p class="verDetalles-contenido" id="verNumIdentiTribuCOEProveedor"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Teléfono:</p>
                                <p class="verDetalles-contenido" id="verTelefonoCOEProveedor"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">FAX Teléfono:</p>
                                <p class="verDetalles-contenido" id="verFaxCOEProveedor"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Móvil:</p>
                                <p class="verDetalles-contenido" id="verMovilCOEProveedor"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Ciudad:</p>
                                <p class="verDetalles-contenido" id="verCiudadCOEProveedor"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Dirección:</p>
                                <p class="verDetalles-contenido" id="verDireccionCOEProveedor"></p>
                            </div>
                        </div>
                    </div>


                    <div class="cont-titulo-sect">
                        <h1 class="titulo-sect">Información de la persona de contacto</h1>
                    </div>
                    <div class="panel-group" id="accordionVerProveedor">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionVerProveedor" data-target="#verPC">Presióne para ver<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                            </div>
                            <div id="verPC" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="verDetalles-caj">
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Nombre:</p>
                                                <p class="verDetalles-contenido" id="verNombrePCProveedor"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">Cargo:</p>
                                                <p class="verDetalles-contenido" id="verCargoPCProveedor"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo" id="verTipoIdentiPCProveedor"></p>
                                                <p class="verDetalles-contenido" id="verNumIdentiPCProveedor"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Email:</p>
                                                <p class="verDetalles-contenido" id="verEmailPCProveedor"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">Móvil:</p>
                                                <p class="verDetalles-contenido" id="verMovilPCProveedor"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">FAX:</p>
                                                <p class="verDetalles-contenido" id="verFaxPCProveedor"></p>
                                            </div>
                                            <div>
                                                <p class="verDetalles-titulo">Teléfono:</p>
                                                <p class="verDetalles-contenido" id="verTelefonoPCProveedor"></p>
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
    <div class="modal fade" id="proveedoresAGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label for="actuaNombreCOEProveedor" class="me">Actualizar Información del Proveedor</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="ProveedorA" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="actuaIDProveedor" name="actuaIDProveedor">
                        </div>
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Información de la empresa o compañía</h1>
                        </div>
                        <p class="mi-obli">Por favor escoja entre el <span onClick="document.getElementById('actuaTelefonoCOEProveedor').focus()" class="a-mi">télefono</span>, <span onClick="document.getElementById('actuaMovilCOEProveedor').focus()" class="a-mi">móvil</span> o <span onClick="document.getElementById('actuaFaxCOEProveedor').focus()" class="a-mi">fax</span>, pero debe ingresar uno de los mencionados anteriormente.</p>
                        <div class="input-group">
                            <span class="input-group-addon">Nombre de la compañía o empresa:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" maxlength="90" minlength="3" class="form-control" id="actuaNombreCOEProveedor" name="actuaNombreCOEProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Tipo de identificación fiscal:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" title="Seleccione su tipo de identificación fiscal." id="actuaTipoIdentiFiscalCOEProveedor" name="actuaTipoIdentiFiscalCOEProveedor">
                                <option value="A">A - Número de identificación de empleador de los EE.UU. (EIN)</option>
                                <option value="N">N - Número de identificación nacional</option>
                                <option value="R">R - RUT / RUC / RFC Número de identificación fiscal</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Número de identificación tributaria:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" minlength="5" maxlength="20" class="form-control" id="actuaNumIdentiTribuCOEProveedor" name="actuaNumIdentiTribuCOEProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Teléfono:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="4" maxlength="20" class="form-control" id="actuaTelefonoCOEProveedor" name="actuaTelefonoCOEProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Extensión:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" minlength="1" maxlength="15" class="form-control" id="actuaExtTelefonoCOEProveedor" name="actuaExtTelefonoCOEProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Móvil:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" minlength="2" maxlength="18" class="form-control" id="actuaMovilCOEProveedor" name="actuaMovilCOEProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">FAX:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" minlength="2" maxlength="15" class="form-control" id="actuaFaxCOEProveedor" name="actuaFaxCOEProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Extensión:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" minlength="1" maxlength="15" class="form-control" id="actuaExtFaxCOEProveedor" name="actuaExtFaxCOEProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Ciudad:</span>
                            <% ArrayList<Ciudades> listaCiudadesSPro = (ArrayList) request.getAttribute("listaCiuSPro"); %>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" title="Seleccione su ciudad de residencia." id="actuaCiudadCOEProveedor" name="actuaCiudadCOEProveedor">
                                <% for (Ciudades  ciudSP: listaCiudadesSPro) { %>
                                    <option value="<%= ciudSP.getIdCiudades()%>"><%= ciudSP.getNombre()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Dirección:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" minlength="8" maxlength="150" class="form-control" id="actuaDireccionCOEProveedor" name="actuaDireccionCOEProveedor">
                        </div>
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Información de la persona de contacto</h1>
                        </div>
                        <p class="mi-obli">Por favor escoja entre el <span onClick="document.getElementById('actuaEmailPCProveedor').focus()" class="a-mi">email</span>, <span onClick="document.getElementById('actuaFaxPCProveedor').focus()" class="a-mi">fax</span>, <span onClick="document.getElementById('actuaTelefonoPCProveedor').focus()" class="a-mi">télefono</span> o <span onClick="document.getElementById('actuaMovilPCProveedor').focus()" class="a-mi">móvil</span>, pero debe ingresar uno los mencionados anteriormente.</p>
                        <div class="input-group">
                            <span class="input-group-addon">Nombre completo:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" maxlength="110" minlength="5" class="form-control" id="actuaNombrePCProveedor" name="actuaNombrePCProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Cargo:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" maxlength="60" minlength="3" class="form-control" id="actuaCargoPCProveedor" name="actuaCargoPCProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Tipo:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" title="Seleccione su tipo de identificación." id="actuaTipoIdentiPCProveedor" name="actuaTipoIdentiPCProveedor">
                                <option value="CC">CC (Cédula de Ciudadanía)</option>
                                <option value="TP">TP (Tarjeta Pasaporte)</option>
                                <option value="CE">CE (Cédula de Extranjería)</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Número de identificación:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" minlength="5" maxlength="20" class="form-control" id="actuaNumIdentiPCProveedor" name="actuaNumIdentiPCProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Email:</span>
                            <input type="email" onkeypress="this.style.color = '#87A2D1';" minlength="10" maxlength="150" class="form-control" id="actuaEmailPCProveedor" name="actuaEmailPCProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">FAX:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" minlength="2" maxlength="15" class="form-control" id="actuaFaxPCProveedor" name="actuaFaxPCProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Extensión:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" minlength="1" maxlength="15" class="form-control" id="actuaExtFaxPCProveedor" name="actuaExtFaxPCProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Teléfono:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="4" maxlength="15" class="form-control" id="actuaTelefonoPCProveedor" name="actuaTelefonoPCProveedor">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Móvil:</span>
                            <input type="tel" onkeypress="this.style.color = '#87A2D1';" pattern="[0-9]+" minlength="6" maxlength="28" class="form-control" id="actuaMovilPCProveedor" name="actuaMovilPCProveedor">
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
    <div class="modal" id="proveedoresEGerenteModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered" role="document">
            
            <div class="modal-content">
                <div class="modal-header modal-header-elim">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-remove"></span><label class="me">¿Desea eliminar el Proveedor?</label></h4>
                </div>
                <div class="modal-body modal-body-elim">
                    <form action="ProveedorE" method="POST">
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="elimIDProveedor" name="elimIDProveedor">
                        </div>
                        <p class="mi-obli">Recuerde que cuando eliminé el proveedor <span class="a-mi-elim-sp" id="elimCOEProveedor"></span>, también se eliminarán todos los insumos de cada sede proveídos por el.</p>
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
