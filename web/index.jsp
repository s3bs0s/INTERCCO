<%@page import="com.INTERCCO.modelo.Beans.InfoUsuarios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>SUCCO</title>
    </head>
    <%@include file="header.jsp" %>
    <%  rolUsuario = "Usuario";
        idUsuario = 0;
        nomUsuario = "";
        idSedeUsuario = 0;
        nomSedeUsuario = "";
    if (session.getAttribute("idUsuario") != null){
        rolUsuario = (String) session.getAttribute("rolUsuario");
        idUsuario = (int) session.getAttribute("idUsuario");
        nomUsuario = (String) session.getAttribute("nomUsuario");
        idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
        nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario"); 
    }
    
    if (rolUsuario.equals("Usuario")){ %>
    
        <body>
            <div id="share-social">
                <p>Redes Sociales</p>
                <ul>
                    <li><a target="_blank" href="https://www.facebook.com/" class="icon-facebook"></a></li>
                    <li><a target="_blank" href="https://www.instagram.com/succo.restaurant/" class="icon-instagram"></a></li>
                    <li><a target="_blank" href="https://www.twitter.com/" class="icon-twitter"></a></li>
                    <li><a target="_blank" href="https://plus.google.com/discover" class="icon-google-plus"></a></li>
                </ul>
            </div>
            <div id="btn-subir">
                <p id="p-btn-subir" class="glyphicon glyphicon-chevron-up"></p>
            </div>
            <div class="mainiu">
                <% String mens = request.getParameter("mensaje");
                    String emailUsu = request.getParameter("emailUsu");
                    String numUsu = request.getParameter("numUsu");
                    String razonS = request.getParameter("razonS");
                    String diasS = request.getParameter("diasS");
                    if (mens != null) { %>
                    <% if (mens.equals("Ne")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> No se pudo lograr el movimiento por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                    </div>
                    <% } else if (mens.equals("YCambioContra")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La recuperación de su contraseña SUCCO fue exitosa, ahora puede acceder.
                        </div>
                    </div>
                    <% } else if (mens.equals("YCambioContraPerfil")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> Su contraseña SUCCO fue actualizada correctamente, ahora acceda de nuevo.
                        </div>
                    </div>
                    <% } else if (mens.equals("YActualizarPerfil")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> Su perfil fue actualizado correctamente, ahora acceda de nuevo.
                        </div>
                    </div>
                    <% } else if (mens.equals("YActualizarME")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> Su número de identificación fue actualizado correctamente, ahora acceda de nuevo.
                        </div>
                    </div>
                    <% } else if (mens.equals("YEliminarImg")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> Su foto de perfil fue eliminada con éxito, ahora acceda de nuevo.
                        </div>
                    </div>
                    <% } else if (mens.equals("YCambio")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> Su foto de perfil fue actualizada correctamente, ahora acceda de nuevo.
                        </div>
                    </div>
                    <% } else if (mens.equals("YCambioN")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> Su primera foto de perfil, fue agregada correctamente, ahora acceda de nuevo.
                        </div>
                    </div>
                    <% } else if (mens.equals("NuAcc")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> El email o la contraseña SUCCO son incorrectos.
                        </div>
                    </div>
                    <% } else if (mens.equals("NSancionado")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-info alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <% if (Integer.parseInt(diasS) > 8){ %>
                                <strong>¡Lo sentimos!</strong> Usted esta sancionado <b>permanentemente</b> por la razón <b>"<%= razonS %>"</b>.
                            <% } else { %>
                                <strong>¡Lo sentimos!</strong> Usted sigue sancionado por la razón <b>"<%= razonS %>"</b>, intentelo de nuevo <b><%= diasS %></b> días.
                            <% } %>
                        </div>
                    </div>
                    <% } else if (mens.equals("NeEmail")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> El email <b>"<%= emailUsu %>"</b> no existe.
                        </div>
                    </div>
                    <% } else if (mens.equals("Nee")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> El email <b>"<%= emailUsu %>"</b> ya se encuentra registrado.
                        </div>
                    </div>
                    <% } else if (mens.equals("Neni")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> El número de identificación <b>"<%= numUsu %>"</b> ya se encuentra registrado.
                        </div>
                    </div>
                    <% } else if (mens.equals("NeEV")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> Su email no existe, por lo cual no podemos verificarlo, lo sentimos.
                        </div>
                    </div>
                    <% } else if (mens.equals("NeERC")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El email <b>"<%= emailUsu %>"</b> no esta verificado, por lo cual no puedemos recuperar su contraseña, lo sentimos.
                        </div>
                    </div>
                    <% } %>
                <% } %>
                
                <%@include file="seccionPrincipalIndex.jsp" %>
                <%@include file="seccionElijaSedeIndex.jsp" %>
                <%@include file="seccionCarruselIndex.jsp" %>
                <%@include file="seccionCartaIndex.jsp" %>
                <%@include file="seccionPqrsfIndex.jsp" %>
                <%@include file="seccionAcercadeIndex.jsp" %>
                
            </div>
        </body>
        <%@include file="footer-iu.jsp" %>
        
    <% } else if (rolUsuario.equals("Cliente")){ %>
    
        <body>
            <div id="share-social">
                <p>Redes Sociales</p>
                <ul>
                    <li><a target="_blank" href="https://www.facebook.com/" class="icon-facebook"></a></li>
                    <li><a target="_blank" href="https://www.instagram.com/succo.restaurant/" class="icon-instagram"></a></li>
                    <li><a target="_blank" href="https://www.twitter.com/" class="icon-twitter"></a></li>
                    <li><a target="_blank" href="https://plus.google.com/discover" class="icon-google-plus"></a></li>
                </ul>
            </div>
            <div id="btn-subir">
                <p id="p-btn-subir" class="glyphicon glyphicon-chevron-up"></p>
            </div>
            <div class="mainiu">
                <% String mens = request.getParameter("mensaje");
                   String numI = request.getParameter("numIdenti");
                    if (mens != null) { %>
                    <% if (mens.equals("Ne")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> No se pudo lograr el movimiento por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                    </div>
                    <% } else if (mens.equals("NeAP")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> No se pudo actualizar su perfil por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                    </div>
                    <% } else if (mens.equals("YPQRSF")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La solicitud PQRSF fue enviada con éxito.
                        </div>
                    </div>
                    <% } else if (mens.equals("YCancelar")) { %>
                    <div class="cjAlert">
                        <div class="alert alert-success alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Perfecto!</strong> La solicitud PQRSF fue cancelada correctamente.
                        </div>
                    </div>
                    <% } else if (mens.equals("NActualizarME")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> El número de identificación <b>"<%= numI %>"</b> ya se encuentra registrado, en 3 segundos puede intentarlo de nuevo.
                        </div>
                    </div>
                    <% } else if (mens.equals("NeC")){ %>
                    <div class="cjAlert">
                        <div class="alert alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> Debe escribir una consulta para enviar su solicitud PQRSF.
                        </div>
                    </div>
                    <% } %>
                <% }%>
                
                <%@include file="seccionPqrsfIndex.jsp" %>
                <%@include file="seccionCartaIndex.jsp" %>
                <%@include file="seccionCarruselIndex.jsp" %>
                <%@include file="seccionAcercadeIndex.jsp" %>
            
            </div>
        </body>
        <%@include file="mayorEdadModal.jsp" %>
        <%@include file="footer-iu.jsp" %>
        
    <% } else { %>
        
        <body>
            <ul class="breadcrumb">
                <li class="active">Inicio</li>
            </ul>
            <section class="section-indexs">
                <% String mens = request.getParameter("mensaje");
                   String numI = request.getParameter("numIdenti");
                    if (mens != null){ %>
                        <% if (mens.equals("Ne")){ %>
                        <div class="alert me alert-danger alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Error!</strong> El perfil no se pudo actualizar por un error general en las bases de datos, contacte al administrador del sistema.
                        </div>
                        <% } else if (mens.equals("NActualizarME")){ %>
                        <div class="alert me alert-warning alert-dismissible">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <strong>¡Intentelo de Nuevo!</strong> El número de identificación <b>"<%= numI %>"</b> ya se encuentra registrado, en 3 segundos puede intentarlo de nuevo.
                        </div>
                    <% } %>
                <% } %>
                
                <% if (rolUsuario.equals("Mesero")){ %>

                    <%@include file="llamadaMesaMeseroModal.jsp" %>
                    <article class="CJAccRap">
                        <div class="CJAccRapTitulo">
                            <p>Accesos Rápidos</p>
                        </div>
                        <div class="CJAccRapBtns">
                            <button onClick="window.open('Pedidos', '_self')" type="button" class="btn"><span class="icon-clipboard"></span> Pedidos<span class="me-bi"><%= request.getAttribute("estadoPedidosHoy") %> Pedidos de Hoy</span></button>
                            <button onClick="window.open('Parametros', '_self')" type="button" class="btn"><span class="icon-phone"></span> Soporte<span class="me-bi"><%= request.getAttribute("estadoSopoPendientes") %> Peticiones Pendientes</span></button>
                        </div>
                    </article>

                <% } else if (rolUsuario.equals("Cocinero")) { %>

                    <article class="CJAccRap">
                        <div class="CJAccRapTitulo">
                            <p>Accesos Rápidos</p>
                        </div>
                        <div class="CJAccRapBtns">
                            <button onClick="window.open('Pedidos', '_self')" type="button" class="btn"><span class="icon-clipboard"></span> Pedidos<span class="me-bi"><%= request.getAttribute("estadoPedidosHoy") %> Pedidos por Producir</span></button>
                            <button onClick="window.open('Parametros', '_self')" type="button" class="btn"><span class="icon-phone"></span> Soporte<span class="me-bi"><%= request.getAttribute("estadoSopoPendientes") %> Peticiones Pendientes</span></button>
                        </div>
                    </article>

                <% } else if (rolUsuario.equals("Cajero")) { %>

                    <article class="CJAccRap">
                        <div class="CJAccRapTitulo">
                            <p>Accesos Rápidos</p>
                        </div>
                        <div class="CJAccRapBtns">
                            <button type="button" class="btn"><span class="icon-coin-dollar"></span> Facturas<span class="me-bi">- Facturas de Hoy</span></button>
                            <button onClick="window.open('Parametros', '_self')" type="button" class="btn"><span class="icon-phone"></span> Soporte<span class="me-bi"><%= request.getAttribute("estadoSopoPendientes") %> Peticiones Pendientes</span></button>
                        </div>
                    </article>

                <% } else if (rolUsuario.equals("Gerente")) { %>

                    <article class="CJAccRap">
                        <div class="CJAccRapTitulo">
                            <p>Accesos Rápidos</p>
                        </div>
                        <div class="CJAccRapBtns">
                            <button onClick="window.open('Pedidos', '_self')" type="button" class="btn<%= Integer.parseInt(String.valueOf(request.getAttribute("estadoPedidosNFinali")))>0?" btnAR-danger":"" %>"><span class="icon-clipboard"></span> Pedidos<span class="me-bi"><%= request.getAttribute("estadoPedidosHoy") %> Pedidos de Hoy</span><span class="me-bi"><%= request.getAttribute("estadoPedidosNFinali") %> Pedidos no Finalizados</span></button>
                            <button type="button" class="btn"><span class="icon-folder-open"></span> Recibos <span class="me-bi">- Recibos de Hoy</span></button>
                            <button onClick="window.open('Insumos', '_self')" type="button" class="btn<%= Integer.parseInt(String.valueOf(request.getAttribute("estadoInsuAgotados")))>0||Integer.parseInt(String.valueOf(request.getAttribute("estadoInsuCaducados")))>0?" btnAR-danger":"" %>"><span class="icon-books"></span> Insumos<span class="me-bi"><%= request.getAttribute("estadoInsuAgotados") %> Insumos Agotados</span><span class="me-bi"><%= request.getAttribute("estadoInsuCaducados") %> Insumos Vencidos</span></button>
                            <button onClick="window.open('Proveedores', '_self')" type="button" class="btn"><span class="icon-address-book"></span> Proveedores</button>
                            <button onClick="window.open('Pqrsf', '_self')" type="button" class="btn<%= Integer.parseInt(String.valueOf(request.getAttribute("estadoPqrsfSResponder")))>0?" btnAR-warning":"" %>"><span class="glyphicon glyphicon-share-alt"></span> PQRSF<span class="me-bi"><%= request.getAttribute("estadoPqrsfSResponder") %> Solicitudes sin Responder</span></button>
                            <button onClick="window.open('Usuarios', '_self')" type="button" class="btn"><span class="icon-users"></span> Usuarios<span class="me-bi"><%= request.getAttribute("estadoUsuaEmpleados") %> Empleados en esta Sede</span><span class="me-bi"><%= request.getAttribute("estadoUsuaSancionados") %> Usuarios Sancionados</span></button>
                            <button onClick="window.open('Auditoria', '_self')" type="button" class="btn"><span class="icon-stats-dots"></span> Logs</button>
                            <button onClick="window.open('Parametros', '_self')" type="button" class="btn"><span class="icon-cog"></span> Parámetros<span class="me-bi"><%= request.getAttribute("estadoSopoPendientes") %> Peticiones Pendientes en Soporte</span></button>
                        </div>
                    </article>

                <% } else if (rolUsuario.equals("AdminS")) { %>

                    <article class="CJAccRap">
                        <div class="CJAccRapTitulo">
                            <p>Accesos Rápidos</p>
                        </div>
                        <div class="CJAccRapBtns">
                            <button onClick="window.open('interccoAdminS.jsp', '_self')" type="button" class="btn"><span class="icon-rocket"></span> INTERCCO</button>
                            <button onClick="window.open('Sedes', '_self')" type="button" class="btn"><span class="glyphicon glyphicon-globe"></span> Sedes<span class="me-bi"><%= request.getAttribute("estadoSedeExistentes") %> Sedes en Total</span><span class="me-bi"><%= request.getAttribute("estadoSedePExistentes") %> Sedes Principales</span></button>
                            <button onClick="window.open('Auditoria', '_self')" type="button" class="btn"><span class="icon-stats-dots"></span> Auditoría</button>
                            <button onClick="window.open('Parametros', '_self')" type="button" class="btn"><span class="icon-cog"></span> Parámetros<span class="me-bi"><%= request.getAttribute("estadoSopoPendientesAdmin") %> Peticiones Pendiente en Soporte</span></button>
                        </div>
                    </article>

                <% } %>

                <% if(!rolUsuario.equals("AdminS")){ %>
                    <article class="art-carrusel">
                        <% ArrayList<Carruseles> listaCarruselesIndex = (ArrayList) request.getAttribute("listaCarrIndex");
                            CifradoASCII cAIndexEmpleado = new CifradoASCII(); %>
                        <div id="CarruselMesero" class="carousel slide" data-ride="carousel">
                            <!-- Circulos Indicadores -->
                            <ol class="carousel-indicators">
                                <% int contEmpre = 0;
                                int contActives = 0;
                                if (listaCarruselesIndex.size() > 0){
                                    for (Carruseles carrIndex : listaCarruselesIndex) {
                                        if (carrIndex.getTipo().equals("Empresarial")){
                                            contEmpre++;
                                            if (carrIndex.getDirigidoA().equals("Todas las Sedes")){
                                                //Solo los que son Todas las Sedes
                                                if (contActives<1){ %>
                                                    <li data-target="#CarruselMesero" data-slide-to="<%= contActives %>" class="active"></li>
                                                <% } else { %>
                                                    <li data-target="#CarruselMesero" data-slide-to="<%= contActives %>"></li>
                                            <%  } contActives++;
                                            } else if (carrIndex.getDirigidoA().equals("Sedes de mi Ciudad")) {
                                                if ((int) session.getAttribute("idCiudadUsuario") == carrIndex.getIdCiudad()){
                                                    //Solo los de su Ciudad
                                                    if (contActives<1){ %>
                                                        <li data-target="#CarruselMesero" data-slide-to="<%= contActives %>" class="active"></li>
                                                    <% } else { %>
                                                        <li data-target="#CarruselMesero" data-slide-to="<%= contActives %>"></li>
                                                <%  } contActives++;
                                                }
                                            } else {
                                                if ((int) session.getAttribute("idSedeUsuario") == carrIndex.getIdSede()){
                                                    //Solo los de su sede
                                                    if (contActives<1){ %>
                                                        <li data-target="#CarruselMesero" data-slide-to="<%= contActives %>" class="active"></li>
                                                    <% } else { %>
                                                        <li data-target="#CarruselMesero" data-slide-to="<%= contActives %>"></li>
                                                <%  } contActives++;
                                                }
                                            }
                                        }
                                    }
                                    if (contEmpre < 1){ %>
                                        <!--No hay ningun carrusel empresarial, foto sin informacion-->
                                        <li data-target="#CarruselMesero" data-slide-to="0" class="active"></li>
                                    <% }
                                } else { %>
                                    <!--No hay ningun carrusel, foto sin informacion-->
                                    <li data-target="#CarruselMesero" data-slide-to="0" class="active"></li>
                                <% } %>
                            </ol>

                            <!-- Imagenes Carrusel -->
                            <div class="carousel-inner">
                                <% contEmpre = 0;
                                contActives = 0;
                                if (listaCarruselesIndex.size() > 0){
                                    for (Carruseles carrIndex : listaCarruselesIndex) {
                                        if (carrIndex.getTipo().equals("Empresarial")){
                                            contEmpre++;
                                            if (carrIndex.getDirigidoA().equals("Todas las Sedes")){
                                                //Solo los que son Todas las Sedes
                                                if (contActives<1){ %>
                                                    <div class="item active">
                                                        <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexEmpleado.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                                    </div>
                                                <% } else { %>
                                                    <div class="item">
                                                        <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexEmpleado.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                                    </div>
                                            <%  } contActives++;
                                            } else if (carrIndex.getDirigidoA().equals("Sedes de mi Ciudad")) {
                                                if ((int) session.getAttribute("idCiudadUsuario") == carrIndex.getIdCiudad()){
                                                    //Solo los de su Ciudad
                                                    if (contActives<1){ %>
                                                        <div class="item active">
                                                            <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexEmpleado.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                                        </div>
                                                    <% } else { %>
                                                        <div class="item">
                                                            <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexEmpleado.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                                        </div>
                                                <%  } contActives++;
                                                }
                                            } else {
                                                if ((int) session.getAttribute("idSedeUsuario") == carrIndex.getIdSede()){
                                                    //Solo los de su sede
                                                    if (contActives<1){ %>
                                                        <div class="item active">
                                                            <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexEmpleado.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                                        </div>
                                                    <% } else { %>
                                                        <div class="item">
                                                            <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexEmpleado.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                                        </div>
                                                <%  } contActives++;
                                                }
                                            }
                                        }
                                    }
                                    if (contEmpre < 1){ %>
                                        <!--No hay ningun carrusel empresarial, foto sin informacion-->
                                        <div class="item active">
                                            <img src="Estilos/img/CarrouselGeneral/SinInformacion.jpg" alt="N1" style="width:100%;">
                                        </div>
                                    <% }
                                } else { %>
                                    <!--No hay ningun carrusel, foto sin informacion-->
                                    <div class="item active">
                                        <img src="Estilos/img/CarrouselGeneral/SinInformacion.jpg" alt="N1" style="width:100%;">
                                    </div>
                                <% } %>
                            </div>

                            <!-- Botones Izquierda y Derecha -->
                            <a class="left carousel-control" href="#CarruselMesero" data-slide="prev">
                                <span class="glyphicon glyphicon-chevron-left"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control" href="#CarruselMesero" data-slide="next">
                                <span class="glyphicon glyphicon-chevron-right"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </article>
                
                
                    <div class="misCompas">
                        <div class="misCompasTitulo">
                            <p>Mis Compañeros</p>
                        </div>
                        <div class="swiper-container">
                            <% ArrayList<InfoUsuarios> listaUsuariosIndex = (ArrayList) request.getAttribute("listaUsuaIndex"); %>
                            <div class="swiper-wrapper">
                                <%int contUsu = 0;
                                nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario");
                                for (InfoUsuarios usuaIndex : listaUsuariosIndex) {
                                    if (usuaIndex.getRol().equals("Gerente")){
                                        if (nomSedeUsuario.equals(usuaIndex.getSede())){ %>
                                            <div class="swiper-slide">
                                                <div class="imgBx imgBx-Gerente">
                                            <% if (usuaIndex.getNombreImg().equals("86S97S99S105S111")){ 
                                                if (usuaIndex.getGenero().equals("Masculino")){ %>
                                                    <img src="Estilos/img/FotoPerfilEmpleados/PerfilAnonimoH.jpg" alt="U<%= contUsu %>"> 
                                                <% } else { %>
                                                    <img src="Estilos/img/FotoPerfilEmpleados/PerfilAnonimoM.jpg" alt="U<%= contUsu %>">
                                                <% }
                                            } else { %>
                                            <img src="ArchivosSistema/Usuarios/<%= usuaIndex.getSede() %>/<%= cAIndexEmpleado.DescifrarASCII(usuaIndex.getNombreImg())%>" alt="U<%= contUsu %>">
                                            <% } %>
                                                </div>
                                                <div class="details details-Gerente">
                                                    <h3><%= usuaIndex.getNombres()+" "+usuaIndex.getApellidos() %><br><span class="span-Gerente me">Gerente</span><span class="span-GerenteEmail me"><%= cAIndexEmpleado.DescifrarASCII(usuaIndex.getEmail()) %></span></h3>
                                                </div>
                                            </div>
                                        <% }
                                    }
                                }

                                for (InfoUsuarios usuaIndex : listaUsuariosIndex) {
                                    if (usuaIndex.getRol().equals("Cocinero")){
                                        if (nomSedeUsuario.equals(usuaIndex.getSede())){ %>
                                            <div class="swiper-slide">
                                                <div class="imgBx imgBx-Cocinero">
                                            <% if (usuaIndex.getNombreImg().equals("86S97S99S105S111")){ 
                                                if (usuaIndex.getGenero().equals("Masculino")){ %>
                                                    <img src="Estilos/img/FotoPerfilEmpleados/PerfilAnonimoH.jpg" alt="U<%= contUsu %>"> 
                                                <% } else { %>
                                                    <img src="Estilos/img/FotoPerfilEmpleados/PerfilAnonimoM.jpg" alt="U<%= contUsu %>">
                                                <% }
                                            } else { %>
                                            <img src="ArchivosSistema/Usuarios/<%= usuaIndex.getSede() %>/<%= cAIndexEmpleado.DescifrarASCII(usuaIndex.getNombreImg())%>" alt="U<%= contUsu %>">
                                            <% } %>
                                                </div>
                                                <div class="details details-Cocinero">
                                                    <h3><%= usuaIndex.getNombres()+" "+usuaIndex.getApellidos() %><br><span class="span-Cocinero me">Cociner<%= usuaIndex.getGenero().equals("Masculino")?"o":"a" %></span><span class="span-CocineroEmail me"><%= cAIndexEmpleado.DescifrarASCII(usuaIndex.getEmail()) %></span></h3>
                                                </div>
                                            </div>
                                        <% }
                                    }
                                }

                                for (InfoUsuarios usuaIndex : listaUsuariosIndex) {
                                    if (usuaIndex.getRol().equals("Cajero")){
                                        if (nomSedeUsuario.equals(usuaIndex.getSede())){ %>
                                            <div class="swiper-slide">
                                                <div class="imgBx imgBx-Cajero">
                                            <% if (usuaIndex.getNombreImg().equals("86S97S99S105S111")){ 
                                                if (usuaIndex.getGenero().equals("Masculino")){ %>
                                                    <img src="Estilos/img/FotoPerfilEmpleados/PerfilAnonimoH.jpg" alt="U<%= contUsu %>"> 
                                                <% } else { %>
                                                    <img src="Estilos/img/FotoPerfilEmpleados/PerfilAnonimoM.jpg" alt="U<%= contUsu %>">
                                                <% }
                                            } else { %>
                                            <img src="ArchivosSistema/Usuarios/<%= usuaIndex.getSede() %>/<%= cAIndexEmpleado.DescifrarASCII(usuaIndex.getNombreImg())%>" alt="U<%= contUsu %>">
                                            <% } %>
                                                </div>
                                                <div class="details details-Cajero">
                                                    <h3><%= usuaIndex.getNombres()+" "+usuaIndex.getApellidos() %><br><span class="span-Cajero me">Cajer<%= usuaIndex.getGenero().equals("Masculino")?"o":"a" %></span><span class="span-CajeroEmail me"><%= cAIndexEmpleado.DescifrarASCII(usuaIndex.getEmail()) %></span></h3>
                                                </div>
                                            </div>
                                        <% }
                                    }
                                }

                                for (InfoUsuarios usuaIndex : listaUsuariosIndex) {
                                    if (usuaIndex.getRol().equals("Mesero")){
                                        if (nomSedeUsuario.equals(usuaIndex.getSede())){ %>
                                            <div class="swiper-slide">
                                                <div class="imgBx imgBx-Mesero">
                                            <% if (usuaIndex.getNombreImg().equals("86S97S99S105S111")){ 
                                                if (usuaIndex.getGenero().equals("Masculino")){ %>
                                                    <img src="Estilos/img/FotoPerfilEmpleados/PerfilAnonimoH.jpg" alt="U<%= contUsu %>"> 
                                                <% } else { %>
                                                    <img src="Estilos/img/FotoPerfilEmpleados/PerfilAnonimoM.jpg" alt="U<%= contUsu %>">
                                                <% }
                                            } else { %>
                                            <img src="ArchivosSistema/Usuarios/<%= usuaIndex.getSede() %>/<%= cAIndexEmpleado.DescifrarASCII(usuaIndex.getNombreImg())%>" alt="U<%= contUsu %>">
                                            <% } %>
                                                </div>
                                                <div class="details details-Mesero">
                                                    <h3><%= usuaIndex.getNombres()+" "+usuaIndex.getApellidos() %><br><span class="span-Mesero me">Meser<%= usuaIndex.getGenero().equals("Masculino")?"o":"a" %></span><span class="span-MeseroEmail me"><%= cAIndexEmpleado.DescifrarASCII(usuaIndex.getEmail()) %></span></h3>
                                                </div>
                                            </div>
                                        <% }
                                    }
                                } %>
                            </div>

                            <div class="swiper-button-next swiper-button-white"></div>
                            <div class="swiper-button-prev swiper-button-white"></div>

                            <div class="swiper-pagination"></div>
                        </div>
                    </div>
                <% } %>
            </section>
        </body>
        <%@include file="mayorEdadModal.jsp" %>
        <%@include file="footer.jsp" %>

    <% } %>
</html>
