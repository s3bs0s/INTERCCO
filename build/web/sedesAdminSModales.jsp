<%@page import="com.INTERCCO.modelo.Beans.Ciudades"%>
<%@page import="java.util.ArrayList"%>
<body>
    <!-- Modal de Registrar -->
    <div class="modal fade" id="sedesRGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-globe"></span><label for="regNombreSedes" class="me">Registrar Sede</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
                    <form action="#" method="POST" id="regFormSedes">
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Información de la Sede</h1>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Nombre:</span>
                            <input required autofocus type="text" maxlength="70" minlength="2" class="form-control" name="regNombreSedes" placeholder="Nombre de la Sede.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Rango:</span>
                            <select required class="form-control" title="Seleccione el Rango de la Sede." name="regRangoSedes">
                                <option value="Principal">Principal</option>
                                <option value="Secundaria">Secundaria</option>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Ciudad:</span>
                            <% ArrayList<Ciudades> listaCiudadesSSedes = (ArrayList) request.getAttribute("listaCiuSSedes"); %>
                            <select required class="form-control" title="Seleccione la Ciudad de la Sede." name="regCiudadSedes">
                                <% for (Ciudades  ciudSS: listaCiudadesSSedes) { %>
                                    <option value="<%= ciudSS.getIdCiudades()%>"><%= ciudSS.getNombre()%></option>
                                <% } %>
                            </select>
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Dirección:</span>
                            <input required type="text" minlength="5" maxlength="150" class="form-control" name="regDireccionSedes" placeholder="Dirección de la Sede.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Número de mesas:</span>
                            <input required type="tel" onkeypress="return acceptNum(event)" minlength="1" maxlength="2" class="form-control" name="regMesasSedes" placeholder="Número de Mesas en la Sede.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Mapa SRC:</span>
                            <input required type="text" class="form-control" minlength="20" name="regSrcSedes" title="La dirección URL que esta en el SRC de la etiqueta HTML del Mapa de Google." placeholder="La dirección URL que esta en el SRC de la etiqueta HTML del Mapa de Google.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                            
                            
                            
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Horario</h1>
                        </div>
                        <p class="mi-obli">Para registrar su horario, debe escoger mínimo una de las tres opciones de días que se le ofrecen a continuación.</p>
                        <div class="input-group">
                            <span class="input-group-addon">Opción #1</span>
                            <select class="form-control" onchange="validacionHorario(this, '1', 'reg')" title="Seleccione una de las Opciones de Días." id="regOpcion1Sedes" name="regOpcion1Sedes">
                                <option value="">Entre Semana...</option>
                                <option value="Lunes a Viernes">Lunes a Viernes</option>
                                <option value="Martes a Viernes">Martes a Viernes</option>
                                <option value="Lunes a Jueves">Lunes a Jueves</option>
                                <option value="Viernes">Viernes</option>
                                <option value="Viernes y Sábados">Viernes y Sábados</option>
                            </select>
                        </div>
                        <div id="regCJOpcion1Sedes">
                            <div class="input-group">
                                <span class="input-group-addon">Desde las (Hora):</span>
                                <input type="time" class="form-control" id="regDesdeOpcion1Sedes" name="regDesdeOpcion1Sedes">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Hasta las (Hora):</span>
                                <input type="time" class="form-control" id="regHastaOpcion1Sedes" name="regHastaOpcion1Sedes">
                            </div>
                        </div>
                        
                        <div id="regCJMOpcion2Sedes">
                            <hr>
                            <div class="input-group">
                                <span class="input-group-addon">Opción #2</span>
                                <select class="form-control" onchange="validacionHorario(this, '2', 'reg')" title="Seleccione una de las Opciones de Días." id="regOpcion2Sedes" name="regOpcion2Sedes">
                                    <option value="">Fines de Semana...</option>
                                    <option value="Sábados">Sábados</option>
                                    <option value="Sábados y Domingos">Sábados y Domingos</option>
                                    <option value="Fines de Semana y Festivos">Fines de Semana y Festivos</option>
                                </select>
                            </div>
                            <div id="regCJOpcion2Sedes">
                                <div class="input-group">
                                    <span class="input-group-addon">Desde las (Hora):</span>
                                    <input type="time" class="form-control" id="regDesdeOpcion2Sedes" name="regDesdeOpcion2Sedes">
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon">Hasta las (Hora):</span>
                                    <input type="time" class="form-control" id="regHastaOpcion2Sedes" name="regHastaOpcion2Sedes">
                                </div>
                            </div>
                        </div>
                        
                        <div id="regCJMOpcion3Sedes">
                            <hr>
                            <div class="input-group">
                                <span class="input-group-addon">Opción #3</span>
                                <select class="form-control" onchange="validacionHorario(this, '3', 'reg')" title="Seleccione una de las Opciones de Días." id="regOpcion3Sedes" name="regOpcion3Sedes">
                                    <option value="">Fines de Semana...</option>
                                    <option value="Domingos">Domingos</option>
                                    <option value="Festivos">Festivos</option>
                                    <option value="Domingos y Festivos">Domingos y Festivos</option>
                                </select>
                            </div>
                            <div id="regCJOpcion3Sedes">
                                <div class="input-group">
                                    <span class="input-group-addon">Desde las (Hora):</span>
                                    <input type="time" class="form-control" id="regDesdeOpcion3Sedes" name="regDesdeOpcion3Sedes">
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon">Hasta las (Hora):</span>
                                    <input type="time" class="form-control" id="regHastaOpcion3Sedes" name="regHastaOpcion3Sedes">
                                </div>
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="regBtnSedes" class="btn-modal btn btn-principal">Registrar</button>
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
    <div class="modal fade" id="sedesVerModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-globe"></span><label id="verTituloNombreSedes" class="me">Detalles de..</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <div class="cont-titulo-sect">
                        <h1 class="titulo-sect">Información de la Sede</h1>
                    </div>
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Nombre:</p>
                                <p class="verDetalles-contenido" id="verNombreSedes"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Número de Mesas:</p>
                                <p class="verDetalles-contenido" id="verMesasSedes"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Rango:</p>
                                <p class="verDetalles-contenido" id="verRangoSedes"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Ciudad:</p>
                                <p class="verDetalles-contenido" id="verCiudadSedes"></p>
                            </div>
                            <div>
                                <p class="verDetalles-titulo">Dirección:</p>
                                <p class="verDetalles-contenido" id="verDireccionSedes"></p>
                            </div>
                        </div>
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Horarios:</p>
                                <p class="verDetalles-contenido" id="verHorariosSedes"></p>
                            </div>
                        </div>
                    </div>
                    <div class="cont-titulo-sect">
                        <h1 class="titulo-sect">Mapa Google de la Sede</h1>
                    </div>
                    <div class="panel-group" id="accordionVerSede">
                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionVerSede" data-target="#verSRC">Presióne para ver<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                            </div>
                            <div id="verSRC" class="panel-collapse collapse">
                                <div class="panel-body">
                                    <div class="verDetalles-caj">
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">SRC:</p>
                                                <p class="verDetalles-contenido" id="verSrcSedes"></p>
                                            </div>
                                        </div>
                                        <hr>
                                        <div>
                                            <div>
                                                <p class="verDetalles-titulo">Mapa:</p>
                                                <p class="verDetalles-contenido" id="verMapaSedes">
                                                    <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d16289433.169682765!2d-83.39715810640162!3d4.6097012817348455!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x8e15a43aae1594a3%3A0x9a0d9a04eff2a340!2sColombia!5e0!3m2!1ses-419!2sco!4v1557393603755!5m2!1ses-419!2sco" width="100%" height="300" frameborder="0" allowfullscreen></iframe>
                                                </p>
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
    
    <!-- Modal de Actualizar -->
    <div class="modal fade" id="sedesAGerenteModal" role="dialog">
        <div class="modal-dialog modal">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="glyphicon glyphicon-edit"></span><label id="actuaTituloNombreSedes" for="actuaNombreSedes" class="me">Actualizar Información de la Sede</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="#" method="POST" id="actuaFormSedes">
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Información de la Sede</h1>
                        </div>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">ID:</span>
                            <input type="text" class="form-control" id="actuaIDSedes" name="actuaIDSedes">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Nombre:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" maxlength="70" minlength="2" class="form-control" id="actuaNombreSedes" name="actuaNombreSedes">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Rango:</span>
                            <select disabled class="form-control" id="actuaRangoSedes">
                                <option value="Principal">Principal</option>
                                <option value="Secundaria">Secundaria</option>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Ciudad:</span>
                            <select required onchange="this.style.color = '#87A2D1';" class="form-control" title="Seleccione la Ciudad de la Sede." id="actuaCiudadSedes" name="actuaCiudadSedes">
                                <% for (Ciudades  ciudSS: listaCiudadesSSedes) { %>
                                    <option value="<%= ciudSS.getIdCiudades()%>"><%= ciudSS.getNombre()%></option>
                                <% } %>
                            </select>
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Dirección:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" minlength="5" maxlength="150" class="form-control" id="actuaDireccionSedes" name="actuaDireccionSedes">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Número de mesas:</span>
                            <input required type="tel" onkeypress="this.style.color = '#87A2D1'; return acceptNum(event)" minlength="1" maxlength="2" class="form-control" name="actuaMesasSedes" id="actuaMesasSedes">
                        </div>
                        <div class="input-group">
                            <span class="input-group-addon">Mapa SRC:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" class="form-control" minlength="20" id="actuaSrcSedes" name="actuaSrcSedes" title="La dirección URL que esta en el SRC de la etiqueta HTML del Mapa de Google.">
                        </div>
                            
                            
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Horario</h1>
                        </div>
                        <p class="mi-obli">Para actualizar su horario, debe tener seleccionada mínimo una de las tres opciones de días que se le ofrecen a continuación.</p>
                        <div class="input-group">
                            <span class="input-group-addon">Opción #1</span>
                            <select class="form-control" onchange="this.style.color = '#87A2D1'; validacionHorario(this, '1', 'actua')" title="Seleccione una de las Opciones de Días." id="actuaOpcion1Sedes" name="actuaOpcion1Sedes">
                                <option value="">Entre Semana...</option>
                                <option value="Lunes a Viernes">Lunes a Viernes</option>
                                <option value="Martes a Viernes">Martes a Viernes</option>
                                <option value="Lunes a Jueves">Lunes a Jueves</option>
                                <option value="Viernes">Viernes</option>
                                <option value="Viernes y Sábados">Viernes y Sábados</option>
                            </select>
                        </div>
                        <div id="actuaCJOpcion1Sedes">
                            <div class="input-group">
                                <span class="input-group-addon">Desde las (Hora):</span>
                                <input type="time" onkeypress="this.style.color = '#87A2D1'" class="form-control" id="actuaDesdeOpcion1Sedes" name="actuaDesdeOpcion1Sedes">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Hasta las (Hora):</span>
                                <input type="time" onkeypress="this.style.color = '#87A2D1'" class="form-control" id="actuaHastaOpcion1Sedes" name="actuaHastaOpcion1Sedes">
                            </div>
                        </div>

                        <div id="actuaCJMOpcion2Sedes">
                            <hr>
                            <div class="input-group">
                                <span class="input-group-addon">Opción #2</span>
                                <select class="form-control" onchange="this.style.color = '#87A2D1'; validacionHorario(this, '2', 'actua')" title="Seleccione una de las Opciones de Días." id="actuaOpcion2Sedes" name="actuaOpcion2Sedes">
                                    <option value="">Fines de Semana...</option>
                                    <option value="Sábados">Sábados</option>
                                    <option value="Sábados y Domingos">Sábados y Domingos</option>
                                    <option value="Fines de Semana y Festivos">Fines de Semana y Festivos</option>
                                </select>
                            </div>
                            <div id="actuaCJOpcion2Sedes">
                                <div class="input-group">
                                    <span class="input-group-addon">Desde las (Hora):</span>
                                    <input type="time" onkeypress="this.style.color = '#87A2D1'" class="form-control" id="actuaDesdeOpcion2Sedes" name="actuaDesdeOpcion2Sedes">
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon">Hasta las (Hora):</span>
                                    <input type="time" onkeypress="this.style.color = '#87A2D1'" class="form-control" id="actuaHastaOpcion2Sedes" name="actuaHastaOpcion2Sedes">
                                </div>
                            </div>
                        </div>

                        <div id="actuaCJMOpcion3Sedes">
                            <hr>
                            <div class="input-group">
                                <span class="input-group-addon">Opción #3</span>
                                <select class="form-control" onchange="this.style.color = '#87A2D1'; validacionHorario(this, '3', 'actua')" title="Seleccione una de las Opciones de Días." id="actuaOpcion3Sedes" name="actuaOpcion3Sedes">
                                    <option value="">Fines de Semana...</option>
                                    <option value="Domingos">Domingos</option>
                                    <option value="Festivos">Festivos</option>
                                    <option value="Domingos y Festivos">Domingos y Festivos</option>
                                </select>
                            </div>
                            <div id="actuaCJOpcion3Sedes">
                                <div class="input-group">
                                    <span class="input-group-addon">Desde las (Hora):</span>
                                    <input type="time" onkeypress="this.style.color = '#87A2D1'" class="form-control" id="actuaDesdeOpcion3Sedes" name="actuaDesdeOpcion3Sedes">
                                </div>
                                <div class="input-group">
                                    <span class="input-group-addon">Hasta las (Hora):</span>
                                    <input type="time" onkeypress="this.style.color = '#87A2D1'" class="form-control" id="actuaHastaOpcion3Sedes" name="actuaHastaOpcion3Sedes">
                                </div>
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="actuaBtnSedes" class="btn-modal btn btn-principal">Actualizar</button>
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
