<%@page import="com.INTERCCO.modelo.Beans.Sedes"%>
<%@page import="java.util.ArrayList"%>
<div class="modal fade" id="registrarseModal" role="dialog">
    <div class="modal-dialog modal">

        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title"><span class="icon-user-plus"></span><label for="regNombresUsuario" class="me">Registrarse</label></h4>
            </div>
            <div class="mb-textaling modal-body">
                <p class="mi-obli">Los campos que contengan el símbolo asterisco <span class="a-mi">*</span> son obligatorios, de no ser así, son totalmente opcional.</p>
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
                        <span class="input-group-addon">Tipo:</span>
                        <select required class="form-control" title="Seleccione su tipo de identificación." name="regTipoIdentiUsuario">
                            <option value="TI">TI (Tarjeta de Identidad)</option>
                            <option value="CC">CC (Cédula de Ciudadanía)</option>
                            <option value="TP">TP (Tarjeta Pasaporte)</option>
                            <option value="CE">CE (Cédula de Extranjería)</option>
                        </select>
                        <span class="input-group-addon i-obli">*</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Número de identificación:</span>
                        <input required type="text" minlength="5" maxlength="20" class="form-control" name="regNumIdentiUsuario" placeholder="Número de Identificación.">
                        <span class="input-group-addon i-obli">*</span>
                    </div>
                <p>
                    <div class="input-group">
                        <span class="input-group-addon">Email:</span>
                        <input required type="email" minlength="10" maxlength="150" class="form-control" name="regEmailUsuario" placeholder="user@succo.com">
                        <span class="input-group-addon i-obli">*</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Contraseña SUCCO:</span>
                        <input required type="password"  id="InpMOPasswordRegUsu" minlength="3" maxlength="20" class="form-control" name="regContraUsuario" placeholder="Máximo 20 caracteres.">
                        <span class="input-group-addon i-pass" id="BtnMOPasswordRegUsu" onClick="MOPass('RegUsu')">Mostrar</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Teléfono:</span>
                        <input type="tel" pattern="[0-9]+" minlength="4" maxlength="15" class="form-control" name="regTelefonoUsuario" placeholder="Teléfono Fijo.">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Móvil:</span>
                        <input type="tel" pattern="[0-9]+" minlength="6" maxlength="28" class="form-control" name="regMovilUsuario" placeholder="Teléfono Móvil.">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Genero:</span>
                        <select required class="form-control" title="Seleccione su genero actual." name="regGeneroUsuario">
                            <option value="Masculino">Masculino</option>
                            <option value="Femenino">Femenino</option>
                        </select>
                        <span class="input-group-addon i-obli">*</span>
                    </div><div class="input-group">
                        <span class="input-group-addon">Fecha de nacimiento:</span>
                        <input required type="date" class="form-control" name="regFechaNacimientoUsuario">
                        <span class="input-group-addon i-obli">*</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Sede:</span>
                        <% ArrayList<Sedes> listaSedSIndexPP = (ArrayList) request.getAttribute("listaSedSIndex"); %>
                        <select required class="form-control" title="Seleccione su Sede favorita." name="regSedeUsuario">
                            <% for (Sedes  sedeSIndexPP: listaSedSIndexPP) { %>
                                <option value="<%= sedeSIndexPP.getIdSedes()%>"><%= sedeSIndexPP.getNombre()%></option>
                            <% } %>
                        </select>
                        <span class="input-group-addon i-obli">*</span>
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon">Dirección de residencia:</span>
                        <input type="text" minlength="8" maxlength="150" class="form-control" name="regDireccionUsuario" placeholder="Dirección de Residencia.">
                    </div>

                    <div class="input-group cont-btn">
                        <div class="cont-btn-principal">
                            <button type="submit" class="btn-modal btn btn-principal">Registrarse</button>
                        </div>
                        <div class="cont-btns-secundario">
                            <button type="button" data-dismiss="modal" class="btn-modal btn btn-secundario">Acceder</button>
                            <button type="reset" class="btn-modal btn btn-secundario">Limpiar</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn" data-dismiss="modal">Cancelar</button>
            </div>
        </div>
    </div>
</div>
