<section class="sectionAcceso">
    <div class="saContent">
        <div class="saAContent">
            <div class="saAContentH">
                <h4 class="saAContentHTitle"><label id="accederTitulo" for="accederEmail">Acceder a SUCCO</label></h4>
            </div>
            <form id="accederForm" action="Acceder" method="POST">
                <label for="accederRecordar" class="contentInputRecuerdame">
                    <span>Recordar Información</span>
                    <input type="checkbox" name="accederRecordar" id="accederRecordar">
                    <i></i>
                </label>
                
                <div class="saAContentFormCJInputs">
                    <div class="input-group">
                        <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                        <input autofocus required type="email" onkeyup="validacionAcceder(this,'InpMOPasswordAcceder')" minlength="10" maxlength="150" id="accederEmail" class="form-control" name="accederEmail" placeholder="Email">
                    </div>
                    <div class="input-group">
                        <span class="input-group-addon iga-2"><i class="glyphicon glyphicon-lock"></i></span>
                        <input required type="password" onkeyup="validacionAcceder(this,'accederEmail')" id="InpMOPasswordAcceder" minlength="3" maxlength="20" class="form-control" name="accederPassword" placeholder="Contraseña SUCCO">
                        <span class="input-group-addon i-pass" id="BtnMOPasswordAcceder" onClick="MOPass('Acceder')">Mostrar</span>
                    </div>
                </div>

                <div class="input-group saAContentFormCJOC">
                    <button data-toggle="modal" data-target="#olvido-contraModal" class="saAContentFormBtnOC" type="button">¿Olvidó su contraseña SUCCO?</button>
                </div>

                <div class="input-group saAContentFormCJBtns">
                    <div class="saAContentFormCJBtnPrincipal">
                        <button type="button" onclick="btnAcceder()" id="accBtnAcceder" class="saAContentBtns btn btn-principal">Acceder</button>
                    </div>
                    <div class="saAContentFormCJBtnsSecundarios">
                        <button type="button" data-toggle="modal" data-target="#registrarseModal" class="saAContentBtns btn btn-secundario">Registrarme</button>
                    </div>
                </div>
            </form>
            <div class="saAContentF"></div>
        </div>
    <div class="saABtnFlecha">
        <a id="BotonFlecha" href="#"><span class="glyphicon glyphicon-chevron-down"></span></a>
    </div>
</section>
<%@include file="olvido-contraModal.jsp" %>
<%@include file="registrarseModal.jsp" %>