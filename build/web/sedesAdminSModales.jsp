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
                    <form action="Sede" method="POST" class="regFormSedes">
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
                            <span class="input-group-addon">Mapa SRC:</span>
                            <input required type="text" class="form-control" minlength="20" name="regSrcSedes" title="La dirección URL que esta en el SRC de la etiqueta HTML del Mapa de Google." placeholder="La dirección URL que esta en el SRC de la etiqueta HTML del Mapa de Google.">
                            <span class="input-group-addon i-obli">*</span>
                        </div>
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Horario</h1>
                        </div>
                        <p class="mi-obli">Tiene máximo 5 opciones de horario y intenté no usar punto y coma ; en los campos de texto.</p>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Numero de Inp:</span>
                            <input type="text" class="form-control" name="regNumInpSedes" id="regNumInpSedes">
                        </div>
                        <div class="input-group" style="display:flex; justify-content:center; align-items:center;">
                            <button type="button" onClick="agregarHSedes('reg')" class="btn btn-success btnMyM">Agregar Horario</button>
                            <button type="button" onClick="eliminarHSedes('reg')" class="btn btn-danger btnMyM">Eliminar Horario</button>
                        </div>
                        <div class="regHorarioSedes" id="1" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input required type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" name="regDias1Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input required type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" name="regHoras1Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                        </div>
                        <div class="regHorarioSedes" id="2" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" id="regDias2Sedes" name="regDias2Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" id="regHoras2Sedes" name="regHoras2Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                        </div>
                        <div class="regHorarioSedes" id="3" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" id="regDias3Sedes" name="regDias3Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" id="regHoras3Sedes" name="regHoras3Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                        </div>
                        <div class="regHorarioSedes" id="4" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" id="regDias4Sedes" name="regDias4Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" id="regHoras4Sedes" name="regHoras4Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                        </div>
                        <div class="regHorarioSedes" id="5" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" id="regDias5Sedes" name="regDias5Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input type="text" onkeypress="return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'reg');" class="form-control" id="regHoras5Sedes" name="regHoras5Sedes">
                                <span class="input-group-addon i-obli">*</span>
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="regBtnSedes" class="btn-modal btn btn-principal">Registrar</button>
                            </div>
                            <div class="cont-btns-secundario">
                                <button data-dismiss="modal" type="button" data-toggle="modal" class="btn-modal btn btn-secundario">Cancelar</button>
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
                    <div class="verDetalles-caj">
                        <div>
                            <div>
                                <p class="verDetalles-titulo">Nombre:</p>
                                <p class="verDetalles-contenido" id="verNombreSedes"></p>
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
                        <hr>
                        <div>
                            <div>
                                <p class="verDetalles-titulo">SRC de Maps Google:</p>
                                <p class="verDetalles-contenido" id="verSrcSedes"></p>
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
                    <form action="SedeA" method="POST" class="actuaFormSedes">
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
                            <span class="input-group-addon">Mapa SRC:</span>
                            <input required type="text" onkeypress="this.style.color = '#87A2D1';" class="form-control" minlength="20" id="actuaSrcSedes" name="actuaSrcSedes" title="La dirección URL que esta en el SRC de la etiqueta HTML del Mapa de Google.">
                        </div>
                        <div class="cont-titulo-sect">
                            <h1 class="titulo-sect">Horario</h1>
                        </div>
                        <p class="mi-obli">Tiene máximo 5 opciones de horario y intenté no usar punto y coma ; en los campos de texto.</p>
                        <div class="input-group inpDesa">
                            <span class="input-group-addon">Numero de Inp:</span>
                            <input type="text" class="form-control" name="actuaNumInpSedes" id="actuaNumInpSedes">
                        </div>
                        <div class="input-group" style="display:flex; justify-content:center; align-items:center;">
                            <button type="button" onClick="agregarHSedes('actua')" class="btn btn-success btnMyM">Agregar Horario</button>
                            <button type="button" onClick="eliminarHSedes('actua')" class="btn btn-danger btnMyM">Eliminar Horario</button>
                        </div>
                        <div class="actuaHorarioSedes" id="1A" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input required type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaDias1Sedes" name="actuaDias1Sedes">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input required type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaHoras1Sedes" name="actuaHoras1Sedes">
                            </div>
                        </div>
                        <div class="actuaHorarioSedes" id="2A" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaDias2Sedes" name="actuaDias2Sedes">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaHoras2Sedes" name="actuaHoras2Sedes">
                            </div>
                        </div>
                        <div class="actuaHorarioSedes" id="3A" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaDias3Sedes" name="actuaDias3Sedes">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaHoras3Sedes" name="actuaHoras3Sedes">
                            </div>
                        </div>
                        <div class="actuaHorarioSedes" id="4A" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaDias4Sedes" name="actuaDias4Sedes">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaHoras4Sedes" name="actuaHoras4Sedes">
                            </div>
                        </div>
                        <div class="actuaHorarioSedes" id="5A" style="border:solid 1px #365892; margin:4px 0;">
                            <div class="input-group">
                                <span class="input-group-addon">Días:</span>
                                <input type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaDias5Sedes" name="actuaDias5Sedes">
                            </div>
                            <div class="input-group">
                                <span class="input-group-addon">Horas:</span>
                                <input type="text" onkeypress="this.style.color = '#87A2D1'; return refusePC(event)" onfocus="if (this.value === 'Evite usar punto y coma!'){this.value = '';}" onblur="validacionSedes(this, 'actua');" class="form-control" id="actuaHoras5Sedes" name="actuaHoras5Sedes">
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" id="actuaBtnSedes" class="btn-modal btn btn-principal">Actualizar</button>
                            </div>
                            <div class="cont-btns-secundario">
                                <button data-dismiss="modal" type="button" data-toggle="modal" class="btn-modal btn btn-secundario">Cancelar</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer"></div>
            </div>
        </div>
    </div>
</body>
