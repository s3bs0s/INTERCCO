<body>
    <div class="modal" id="olvido-contraModal" role="dialog">
        <div class="modal-dialog">

            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title"><span class="icon-cogs"></span><label for="recupEmailUsuario" class="me">¿Olvidó su contraseña SUCCO?</label></h4>
                </div>
                <div class="mb-textaling modal-body">
                    <form action="UsuarioRC" method="POST">
                        <p class="mi-intru">Ingrese su dirección de correo electrónico y le enviaremos instrucciones sobre cómo restablecer su contraseña SUCCO.</p>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input required type="email" class="form-control" name="recupEmailUsuario" placeholder="Email">
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="submit" class="btn-modal btn btn-principal">Restablecer Contraseña SUCCO</button>
                            </div>
                            <div class="cont-btns-secundario">
                                <button type="button" data-dismiss="modal" class="btn-modal btn btn-secundario">Acceder</button>
                                <button type="button" data-dismiss="modal" data-toggle="modal" data-target="#registrarseModal" class="btn-modal btn btn-secundario">Registrarse</button>
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
</body>