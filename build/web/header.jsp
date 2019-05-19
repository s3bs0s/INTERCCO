<%@page import="com.INTERCCO.controlador.General.DecoracionPesos"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page language='java' contentType='text/html' errorPage='Error404.jsp' %>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <link rel="stylesheet" type="text/css" href="Estilos/css/swiper.css">
    <link rel="stylesheet" type="text/css" href="Estilos/css/bootstrap.css">
    <link rel="stylesheet" type="text/css" href="Estilos/css/dataTables.bootstrap.css">
    <link rel="stylesheet" type="text/css" href="Estilos/css/sb-admin-2.css">
    <link rel="stylesheet" type="text/css" href="Estilos/font-awesome/css/font-awesome.css">
    <link rel="stylesheet" type="text/css" href="Estilos/css/sbodys.css">
    <link rel="stylesheet" type="text/css" href="Estilos/css/sfooter.css">
    <link rel="stylesheet" type="text/css" href="Estilos/css/sheader.css">
    <link rel="stylesheet" type="text/css" href="Estilos/css/smodales.css">
    <link rel="stylesheet" type="text/css" href="Estilos/css/stablasListar.css">
    <link rel="stylesheet" type="text/css" href="Estilos/fonts/fonts.css">
    
    <link rel="icon" href="Estilos/img/PapeleriaCorporativaSucco/Favicon/Marca SUCCO COREL (Favicon-ICO).ico">
<head>
    <%  CifradoASCII cA = new CifradoASCII();
        DecoracionPesos dP = new DecoracionPesos();
        int idUsuario = 0;
        String verificadoUsuario = "";
        String emailUsuario = "";
        String passwordUsuario = "";
        String nomUsuario = "";
        String apeUsuario = "";
        String fotUsuario = "";
        String rolUsuario = "Usuario";
        String tipoUsuario = "";
        String numUsuario = "";
        String telUsuario = "";
        String movUsuario = "";
        String genUsuario = "";
        String fnaUsuario = "";
        String dirUsuario = "";
        int idSedeUsuario = 0;
        String nomSedeUsuario = "";
        String rolSedeUsuario = "";
        int idCiudadUsuario = 0;
        String nomCiudadUsuario = "";
    if (session.getAttribute("idUsuario") == null){
        rolUsuario = "Usuario";
    } else {
        idUsuario = (int) session.getAttribute("idUsuario");
        emailUsuario = (String) session.getAttribute("emailUsuario");
        passwordUsuario = (String) session.getAttribute("passwordUsuario");
        nomUsuario = (String) session.getAttribute("nomUsuario");
        apeUsuario = (String) session.getAttribute("apeUsuario");
        fotUsuario = (String) session.getAttribute("fotUsuario");
        rolUsuario = (String) session.getAttribute("rolUsuario");
        tipoUsuario = (String) session.getAttribute("tipoUsuario");
        numUsuario = (String) session.getAttribute("numUsuario");
        telUsuario = (String) session.getAttribute("telUsuario");
        movUsuario = (String) session.getAttribute("movUsuario");
        genUsuario = (String) session.getAttribute("genUsuario");
        fnaUsuario = (String) session.getAttribute("fnaUsuario");
        dirUsuario = (String) session.getAttribute("dirUsuario");
        idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
        nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario");
    }
    
    if (rolUsuario.equals("Usuario")){ %>
    <% if (session.getAttribute("elijaIdSede") != null){ %>
    <body onload="validacionSedeElejida('<%= session.getAttribute("elijaIdSede") %>')">
    <% } else { %>
    <body>
    <% } %>
        <header>
            <nav class="naviu">
                <div class="naviuHover">
                    <div class="logonaviu">
                        <img src="Estilos/img/PapeleriaCorporativaSucco/Nombre/Marca SUCCO COREL (Nombre-Blanco-Transparente).png" alt="Logo">
                    </div>
                    <div class="menupriniu">
                        <ul>
                            <li><a id="Acceder" href="#"><span class="me">Acceder</span></a></li>
                            <li><a id="Sede" href="#"><span class="me">Elejir Sede</span></a></li>
                            <li><a id="Carta" href="#"><span class="me">Carta</span></a></li>
                            <li><a id="Domicilios" href="#"><span class="me">Domicilios</span></a></li>
                            <li><a id="Acercade" href="#"><span class="me">Acerca de</span></a></li>
                            <li><a id="PQRSF" href="#"><span class="me">PQRSF</span></a></li>
                            <li><button type="button" data-toggle="modal" data-target="#registrarseModal"><span class="me">Registrarse</span></button></li>
                        </ul>
                    </div>
                </div>
                <section class="sectionElijaSedeSN">
                    <article>
                        <div class="sesTitulo">
                            <p>Elija una Sede:</p>
                        </div>
                        <div class="sesSelect">
                            <div class="input-group">
                                <% ArrayList<Sedes> listaSedSIndexES = (ArrayList) request.getAttribute("listaSedSIndex"); %>
                                <select required onchange="window.location = 'index?elijaIdSede='+this.value" class="form-control" title="Seleccione una sede para ver su información." id="indexElijaSedeUsuarioSN">
                                    <% for (Sedes  sedeSIndexES: listaSedSIndexES) { %>
                                        <option value="<%= sedeSIndexES.getIdSedes()%>"><%= sedeSIndexES.getNombre()%></option>
                                    <% } %>
                                </select>
                            </div>
                        </div>
                    </article>
                </section>
            </nav>
        </header>
        
    <% } else if (rolUsuario.equals("Cliente")) { %>
    <body onload="mayorEdad('<%= idUsuario %>', '<%= fnaUsuario %>', '<%= tipoUsuario %>')">
        <header>
            <nav class="naviu">
                <div class="naviuHover">
                    <div class="logonaviu">
                        <img src="Estilos/img/PapeleriaCorporativaSucco/Nombre/Marca SUCCO COREL (Nombre-Blanco-Transparente).png" alt="Logo">
                    </div>
                    <div class="menupriniu">
                        <ul>
                            <li><a id="InicioCliente" href="#"><span class="me">Inicio</span></a></li>
                            <li><a id="Domicilios" href="#"><span class="me">Domicilios</span></a></li>
                            <li><a id="Carta" href="#"><span class="me">Carta</span></a></li>
                            <li><a id="Acercade" href="#"><span class="me">Acerca de</span></a></li>
                            <li><a id="PQRSF" href="#"><span class="me">PQRSF</span></a></li>
                        </ul>
                    </div>
                    <div class="menuperfil">
                        <div class="caj-menuperfil">
                            <ul>
                                <li><a href="Salir"><span class="me">Salir</span></a></li>
                                <li><a style="cursor:pointer;" id="AbrirPerfil" onclick="verModalPerfil('<%= cA.CifrarASCII(String.valueOf(idUsuario)) %>', '<%= cA.CifrarASCII(nomUsuario) %>', '<%= cA.CifrarASCII(apeUsuario) %>', '<%= fotUsuario %>', '<%= cA.CifrarASCII(rolUsuario) %>', '<%= cA.CifrarASCII(tipoUsuario) %>', '<%= cA.CifrarASCII(numUsuario) %>', '<%= cA.CifrarASCII(genUsuario) %>', '<%= cA.CifrarASCII(fnaUsuario) %>', '<%= cA.CifrarASCII(emailUsuario) %>', '<%= cA.CifrarASCII(telUsuario) %>', '<%= cA.CifrarASCII(movUsuario) %>', '<%= cA.CifrarASCII(passwordUsuario) %>', '<%= cA.CifrarASCII(dirUsuario) %>', '<%= cA.CifrarASCII(String.valueOf(idSedeUsuario)) %>', '<%= cA.CifrarASCII(nomSedeUsuario) %>')"><span class="me">Perfil</span></a></li>
                            </ul>
                            <div class="menuperfil-nom">
                                <p><%= nomUsuario%></p>
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <nav class="naviu-Rem">

            </nav>
        </header>
    <%@include file="perfilModal.jsp" %>
    <% } else if (rolUsuario.equals("Domiciliario")) { %>
    <body onload="mayorEdad('<%= idUsuario %>', '<%= fnaUsuario %>', '<%= tipoUsuario %>')">
        <header>
            <div class="logoheader">
                <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Cartel/Marca SUCCO COREL (Cartel-Transparente).png" width="20%" alt="Logo"></a>
            </div>
            
            <p class="p-rango"><span>Domiciliari<%= genUsuario.equals("Masculino")?"o":"a" %></span><span class="me">de <%= nomSedeUsuario%></span></p>
            <!--<p class="p-reloj"><span id="RhActual">00:00:00</span><span id="RfActual" class="me">0 de 0 del 0</span></p>-->
            
            <nav class="navslogo">
                <div class="logonav-slogo">
                    <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Nombre/Marca SUCCO COREL (Nombre-Blanco-Transparente).png" alt="Logo"></a>
                </div>
                <div class="menuprin-slogo">
                    <ul>
                        <li><a href="index"><span class="icon-office"></span><span class="me">Inicio</span></a></li>
                        <li><a href="Pedidos"><span class="icon-truck"></span><span class="me">Domicilios</span></a></li>
                        <li><a href="Parametros"><span class="icon-phone"></span><span class="me">Soporte</span></a></li>
                    </ul>
                </div>
                <div class="singup">
                    <ul>
                        <li><a title="Mi Perfil" style="cursor:pointer;" id="AbrirPerfil" onclick="verModalPerfil('<%= cA.CifrarASCII(String.valueOf(idUsuario)) %>', '<%= cA.CifrarASCII(nomUsuario) %>', '<%= cA.CifrarASCII(apeUsuario) %>', '<%= fotUsuario %>', '<%= cA.CifrarASCII(rolUsuario) %>', '<%= cA.CifrarASCII(tipoUsuario) %>', '<%= cA.CifrarASCII(numUsuario) %>', '<%= cA.CifrarASCII(genUsuario) %>', '<%= cA.CifrarASCII(fnaUsuario) %>', '<%= cA.CifrarASCII(emailUsuario) %>', '<%= cA.CifrarASCII(telUsuario) %>', '<%= cA.CifrarASCII(movUsuario) %>', '<%= cA.CifrarASCII(passwordUsuario) %>', '<%= cA.CifrarASCII(dirUsuario) %>', '<%= cA.CifrarASCII(String.valueOf(idSedeUsuario)) %>', '<%= cA.CifrarASCII(nomSedeUsuario) %>')"><span class="icon-user"></span><span class="me"><%= nomUsuario%></span></a></li>
                        <li><a href="Salir"><span class="icon-exit"></span><span class="me">Salir</span></a></li>
                    </ul>
                </div>
            </nav>

            <nav class="navrnlogo">

            </nav>
        </header>
    <%@include file="perfilModal.jsp" %>
    <% } else if (rolUsuario.equals("Mesero")) { %>
    <body onload="mayorEdad('<%= idUsuario %>', '<%= fnaUsuario %>', '<%= tipoUsuario %>')">
        <header>
            <div class="logoheader">
                <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Cartel/Marca SUCCO COREL (Cartel-Transparente).png" width="20%" alt="Logo"></a>
            </div>
            
            <p data-toggle="modal" data-target="#llamadaMesaMeseroModal" class="p-rango"><span>Meser<%= genUsuario.equals("Masculino")?"o":"a" %></span><span class="me">de <%= nomSedeUsuario%></span></p>
            <!--<p class="p-reloj"><span id="RhActual">00:00:00</span><span id="RfActual" class="me">0 de 0 del 0</span></p>-->
            
            <nav class="navslogo">
                <div class="logonav-slogo">
                    <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Nombre/Marca SUCCO COREL (Nombre-Blanco-Transparente).png" alt="Logo"></a>
                </div>
                <div class="menuprin-slogo">
                    <ul>
                        <li><a href="index"><span class="icon-office"></span><span class="me">Inicio</span></a></li>
                        <li><a href="Pedidos"><span class="icon-clipboard"></span><span class="me">Pedidos</span></a></li>
                        <li><a href="Parametros"><span class="icon-phone"></span><span class="me">Soporte</span></a></li>
                    </ul>
                </div>
                <div class="singup">
                    <ul>
                        <li><a title="Mi Perfil" style="cursor:pointer;" id="AbrirPerfil" onclick="verModalPerfil('<%= cA.CifrarASCII(String.valueOf(idUsuario)) %>', '<%= cA.CifrarASCII(nomUsuario) %>', '<%= cA.CifrarASCII(apeUsuario) %>', '<%= fotUsuario %>', '<%= cA.CifrarASCII(rolUsuario) %>', '<%= cA.CifrarASCII(tipoUsuario) %>', '<%= cA.CifrarASCII(numUsuario) %>', '<%= cA.CifrarASCII(genUsuario) %>', '<%= cA.CifrarASCII(fnaUsuario) %>', '<%= cA.CifrarASCII(emailUsuario) %>', '<%= cA.CifrarASCII(telUsuario) %>', '<%= cA.CifrarASCII(movUsuario) %>', '<%= cA.CifrarASCII(passwordUsuario) %>', '<%= cA.CifrarASCII(dirUsuario) %>', '<%= cA.CifrarASCII(String.valueOf(idSedeUsuario)) %>', '<%= cA.CifrarASCII(nomSedeUsuario) %>')"><span class="icon-user"></span><span class="me"><%= nomUsuario%></span></a></li>
                        <li><a href="Salir"><span class="icon-exit"></span><span class="me">Salir</span></a></li>
                    </ul>
                </div>
            </nav>

            <nav class="navrnlogo">

            </nav>
        </header>
    <%@include file="perfilModal.jsp" %>
    <% } else if (rolUsuario.equals("Cocinero")) { %>
    <body onload="mayorEdad('<%= idUsuario %>', '<%= fnaUsuario %>', '<%= tipoUsuario %>')">
        <header>
            <div class="logoheader">
                <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Cartel/Marca SUCCO COREL (Cartel-Transparente).png" width="20%" alt="Logo"></a>
            </div>
            
            <p class="p-rango"><span>Cociner<%= genUsuario.equals("Masculino")?"o":"a" %></span><span class="me">de <%= nomSedeUsuario%></span></p>
            <!--<p class="p-reloj"><span id="RhActual">00:00:00</span><span id="RfActual" class="me">0 de 0 del 0</span></p>-->
            
            <nav class="navslogo">
                <div class="logonav-slogo">
                    <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Nombre/Marca SUCCO COREL (Nombre-Blanco-Transparente).png" alt="Logo"></a>
                </div>
                <div class="menuprin-slogo">
                    <ul>
                        <li><a href="index"><span class="icon-office"></span><span class="me">Inicio</span></a></li>
                        <li><a href="Pedidos"><span class="icon-clipboard"></span><span class="me">Pedidos</span></a></li>
                        <li><a href="Parametros"><span class="icon-phone"></span><span class="me">Soporte</span></a></li>
                    </ul>
                </div>
                <div class="singup">
                    <ul>
                        <li><a title="Mi Perfil" style="cursor:pointer;" id="AbrirPerfil" onclick="verModalPerfil('<%= cA.CifrarASCII(String.valueOf(idUsuario)) %>', '<%= cA.CifrarASCII(nomUsuario) %>', '<%= cA.CifrarASCII(apeUsuario) %>', '<%= fotUsuario %>', '<%= cA.CifrarASCII(rolUsuario) %>', '<%= cA.CifrarASCII(tipoUsuario) %>', '<%= cA.CifrarASCII(numUsuario) %>', '<%= cA.CifrarASCII(genUsuario) %>', '<%= cA.CifrarASCII(fnaUsuario) %>', '<%= cA.CifrarASCII(emailUsuario) %>', '<%= cA.CifrarASCII(telUsuario) %>', '<%= cA.CifrarASCII(movUsuario) %>', '<%= cA.CifrarASCII(passwordUsuario) %>', '<%= cA.CifrarASCII(dirUsuario) %>', '<%= cA.CifrarASCII(String.valueOf(idSedeUsuario)) %>', '<%= cA.CifrarASCII(nomSedeUsuario) %>')"><span class="icon-user"></span><span class="me"><%= nomUsuario%></span></a></li>
                        <li><a href="Salir"><span class="icon-exit"></span><span class="me">Salir</span></a></li>
                    </ul>
                </div>
            </nav>

            <nav class="navrnlogo">

            </nav>
        </header>
    <%@include file="perfilModal.jsp" %>
    <% } else if (rolUsuario.equals("Cajero")) { %>
    <body onload="mayorEdad('<%= idUsuario %>', '<%= fnaUsuario %>', '<%= tipoUsuario %>')">
        <header>
            <div class="logoheader">
                <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Cartel/Marca SUCCO COREL (Cartel-Transparente).png" width="20%" alt="Logo"></a>
            </div>
            
            <p class="p-rango"><span>Cajer<%= genUsuario.equals("Masculino")?"o":"a" %></span><span class="me">de <%= nomSedeUsuario%></span></p>
            <!--<p class="p-reloj"><span id="RhActual">00:00:00</span><span id="RfActual" class="me">0 de 0 del 0</span></p>-->
            
            <nav class="navslogo">
                <div class="logonav-slogo">
                    <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Nombre/Marca SUCCO COREL (Nombre-Blanco-Transparente).png" alt="Logo"></a>
                </div>
                <div class="menuprin-slogo">
                    <ul>
                        <li><a href="index"><span class="icon-office"></span><span class="me">Inicio</span></a></li>
                        <li><a href="recibosListar.jsp"><span class="icon-coin-dollar"></span><span class="me">Facturas</span></a></li>
                        <li><a href="Pedidos"><span class="icon-truck"></span><span class="me">Domicilios</span></a></li>
                        <li><a href="Parametros"><span class="icon-phone"></span><span class="me">Soporte</span></a></li>
                    </ul>
                </div>
                <div class="singup">
                    <ul>
                        <li><a title="Mi Perfil" style="cursor:pointer;" id="AbrirPerfil" onclick="verModalPerfil('<%= cA.CifrarASCII(String.valueOf(idUsuario)) %>', '<%= cA.CifrarASCII(nomUsuario) %>', '<%= cA.CifrarASCII(apeUsuario) %>', '<%= fotUsuario %>', '<%= cA.CifrarASCII(rolUsuario) %>', '<%= cA.CifrarASCII(tipoUsuario) %>', '<%= cA.CifrarASCII(numUsuario) %>', '<%= cA.CifrarASCII(genUsuario) %>', '<%= cA.CifrarASCII(fnaUsuario) %>', '<%= cA.CifrarASCII(emailUsuario) %>', '<%= cA.CifrarASCII(telUsuario) %>', '<%= cA.CifrarASCII(movUsuario) %>', '<%= cA.CifrarASCII(passwordUsuario) %>', '<%= cA.CifrarASCII(dirUsuario) %>', '<%= cA.CifrarASCII(String.valueOf(idSedeUsuario)) %>', '<%= cA.CifrarASCII(nomSedeUsuario) %>')"><span class="icon-user"></span><span class="me"><%= nomUsuario%></span></a></li>
                        <li><a href="Salir"><span class="icon-exit"></span><span class="me">Salir</span></a></li>
                    </ul>
                </div>
            </nav>

            <nav class="navrnlogo">

            </nav>
        </header>
    <%@include file="perfilModal.jsp" %>
    <% } else if (rolUsuario.equals("Gerente")) { %>
    <body onload="mayorEdad('<%= idUsuario %>', '<%= fnaUsuario %>', '<%= tipoUsuario %>')">
    <!--<body onload="mueveReloj()">-->
        <header>
            <div class="logoheader">
                <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Cartel/Marca SUCCO COREL (Cartel-Transparente).png" width="20%" alt="Logo"></a>
            </div>
            
            <p class="p-rango"><span><%= rolUsuario%></span><span class="me">de <%= nomSedeUsuario%></span></p>
            <!--<p class="p-reloj"><span id="RhActual">00:00:00</span><span id="RfActual" class="me">0 de 0 del 0</span></p>-->
            
            <nav class="navslogo">
                <div class="logonav-slogo">
                    <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Nombre/Marca SUCCO COREL (Nombre-Blanco-Transparente).png" alt="Logo"></a>
                </div>
                <div class="menuprin-slogo">
                    <ul>
                        <li><a href="index"><span class="icon-office"></span><span class="me">Inicio</span></a></li>
                        <li><a href="Pedidos"><span class="icon-clipboard"></span><span class="me">Pedidos</span></a></li>
                        <li><a href="recibosListar.jsp"><span class="icon-folder-open"></span><span class="me">Recibos</span></a></li>
                        <li><a href="Insumos"><span class="icon-books"></span><span class="me">Insumos</span></a></li>
                        <li><a href="Proveedores"><span class="icon-address-book"></span><span class="me">Proveedores</span></a></li>
                        <li><a href="Usuarios"><span class="icon-users"></span><span class="me">Usuarios</span></a></li>
                        <li><a href="Pqrsfs"><span class="glyphicon glyphicon-share-alt"></span><span class="me">PQRSF</span></a></li>
                        <li><a href="Auditoria"><span class="icon-stats-dots"></span><span class="me">Logs</span></a></li>
                        <li><a href="Parametros"><span class="icon-cog"></span><span class="me">Parámetros</span></a></li>
                    </ul>
                </div>
                <div class="singup">
                    <ul>
                        <li><a title="Mi Perfil" style="cursor:pointer;" id="AbrirPerfil" onclick="verModalPerfil('<%= cA.CifrarASCII(String.valueOf(idUsuario)) %>', '<%= cA.CifrarASCII(nomUsuario) %>', '<%= cA.CifrarASCII(apeUsuario) %>', '<%= fotUsuario %>', '<%= cA.CifrarASCII(rolUsuario) %>', '<%= cA.CifrarASCII(tipoUsuario) %>', '<%= cA.CifrarASCII(numUsuario) %>', '<%= cA.CifrarASCII(genUsuario) %>', '<%= cA.CifrarASCII(fnaUsuario) %>', '<%= cA.CifrarASCII(emailUsuario) %>', '<%= cA.CifrarASCII(telUsuario) %>', '<%= cA.CifrarASCII(movUsuario) %>', '<%= cA.CifrarASCII(passwordUsuario) %>', '<%= cA.CifrarASCII(dirUsuario) %>', '<%= cA.CifrarASCII(String.valueOf(idSedeUsuario)) %>', '<%= cA.CifrarASCII(nomSedeUsuario) %>')"><span class="icon-user"></span><span class="me"><%= nomUsuario%></span></a></li>
                        <li><a href="Salir"><span class="icon-exit"></span><span class="me">Salir</span></a></li>
                    </ul>
                </div>
            </nav>

            <nav class="navrnlogo">

            </nav>
        </header>
    <%@include file="perfilModal.jsp" %>
    <% } else if (rolUsuario.equals("AdminS")) { %>
    <body onload="mayorEdad('<%= idUsuario %>', '<%= fnaUsuario %>', '<%= tipoUsuario %>')">
        <header>
            <div class="logoheader">
                <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Cartel/Marca SUCCO COREL (Cartel-Transparente).png" width="20%" alt="Logo"></a>
            </div>
            
            <p class="p-rango">Administrador<%= genUsuario.equals("Masculino")?"":"a" %></p>
            <!--<p class="p-reloj"><span id="RhActual">00:00:00</span><span id="RfActual" class="me">0 de 0 del 0</span></p>-->
            
            <nav class="navslogo">
                <div class="logonav-slogo">
                    <a href="index"><img src="Estilos/img/PapeleriaCorporativaSucco/Nombre/Marca SUCCO COREL (Nombre-Blanco-Transparente).png" alt="Logo"></a>
                </div>
                <div class="menuprin-slogo">
                    <ul>
                        <li><a href="index"><span class="icon-office"></span><span class="me">Inicio</span></a></li>
                        <li><a href="interccoAdminS.jsp"><span class="icon-rocket"></span><span class="me">INTERCCO</span></a></li>
                        <li><a href="Sedes"><span class="glyphicon glyphicon-globe"></span><span class="me">Sedes</span></a></li>
                        <li><a href="Auditoria"><span class="icon-stats-dots"></span><span class="me">Auditoría</span></a></li>
                        <li><a href="Parametros"><span class="icon-cog"></span><span class="me">Parámetros</span></a></li>
                    </ul>
                </div>
                <div class="singup">
                    <ul>
                        <li><a title="Mi Perfil" style="cursor:pointer;" id="AbrirPerfil" onclick="verModalPerfil('<%= cA.CifrarASCII(String.valueOf(idUsuario)) %>', '<%= cA.CifrarASCII(nomUsuario) %>', '<%= cA.CifrarASCII(apeUsuario) %>', '<%= fotUsuario %>', '<%= cA.CifrarASCII(rolUsuario) %>', '<%= cA.CifrarASCII(tipoUsuario) %>', '<%= cA.CifrarASCII(numUsuario) %>', '<%= cA.CifrarASCII(genUsuario) %>', '<%= cA.CifrarASCII(fnaUsuario) %>', '<%= cA.CifrarASCII(emailUsuario) %>', '<%= cA.CifrarASCII(telUsuario) %>', '<%= cA.CifrarASCII(movUsuario) %>', '<%= cA.CifrarASCII(passwordUsuario) %>', '<%= cA.CifrarASCII(dirUsuario) %>', '<%= cA.CifrarASCII(String.valueOf(idSedeUsuario)) %>', '<%= cA.CifrarASCII(nomSedeUsuario) %>')"><span class="icon-user"></span><span class="me"><%= nomUsuario%></span></a></li>
                        <li><a href="Salir"><span class="icon-exit"></span><span class="me">Salir</span></a></li>
                    </ul>
                </div>
            </nav>

            <nav class="navrnlogo">

            </nav>
        </header>
    <%@include file="perfilModal.jsp" %>
    <% } %>
</body>