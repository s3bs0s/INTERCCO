<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page import="com.INTERCCO.modelo.Beans.Carruseles"%>
<%@page import="java.util.ArrayList"%>
<section class="sectionCarrusel">
    <div id="CarruselUsuario" class="carousel slide" data-ride="carousel">
        <% ArrayList<Carruseles> listaCarruselesIndex = (ArrayList) request.getAttribute("listaCarrIndex");
        CifradoASCII cAIndexCarr = new CifradoASCII(); %>
        
        <!-- Circulos Indicadores -->
        <ol class="carousel-indicators">
            <% int contPublicos = 0;
            int contActives = 0;
            if (listaCarruselesIndex.size() > 0){
                for (Carruseles carrIndex : listaCarruselesIndex) {
                    if (carrIndex.getTipo().equals("Publico")){
                        if (carrIndex.getDirigidoA().equals("Nacional")){ 
                            contPublicos++;
                            //Solo los que son Nacionales
                            if (contActives<1){ %>
                                <li data-target="#CarruselUsuario" data-slide-to="<%= contActives %>" class="active"></li>
                            <% } else { %>
                                <li data-target="#CarruselUsuario" data-slide-to="<%= contActives %>"></li>
                        <%  } contActives++;
                        } else {
                            if ((int) session.getAttribute("elijaCiuSede") == carrIndex.getIdCiudad()){ 
                                contPublicos++;
                                //Solo los de su Ciudad
                                if (contActives<1){ %>
                                    <li data-target="#CarruselUsuario" data-slide-to="<%= contActives %>" class="active"></li>
                                <% } else { %>
                                    <li data-target="#CarruselUsuario" data-slide-to="<%= contActives %>"></li>
                            <%  } contActives++;
                            }
                        }
                    }
                }
                if (contPublicos < 1){ %>
                    <!--No hay ningun carrusel publico, foto sin informacion-->
                    <li data-target="#CarruselUsuario" data-slide-to="0" class="active"></li>
                <% }
            } else { %>
                <!--No hay ningun carrusel, foto sin informacion-->
                <li data-target="#CarruselUsuario" data-slide-to="0" class="active"></li>
            <% } %>
        </ol>

        <!-- Imagenes Carrusel -->
        <div class="carousel-inner">
            <% contPublicos = 0;
            contActives = 1;
            if (listaCarruselesIndex.size() > 0){
                for (Carruseles carrIndex : listaCarruselesIndex) {
                    if (carrIndex.getTipo().equals("Publico")){
                        if (carrIndex.getDirigidoA().equals("Nacional")){ 
                            contPublicos++;
                            //Solo los que son Nacionales
                            if (contActives<2){ %>
                                <div class="item active">
                                    <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexCarr.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                </div>
                            <% } else { %>
                                <div class="item">
                                    <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexCarr.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                </div>
                        <%  } contActives++;
                        } else {
                            if ((int) session.getAttribute("elijaCiuSede") == carrIndex.getIdCiudad()){ 
                                contPublicos++;
                                //Solo los de su Ciudad
                                if (contActives<2){ %>
                                    <div class="item active">
                                        <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexCarr.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                    </div>
                                <% } else { %>
                                    <div class="item">
                                        <img src="ArchivosSistema/Carruseles/<%= carrIndex.getNombreSede() %>/<%= cAIndexCarr.DescifrarASCII(carrIndex.getNombreImg()) %>" alt="N<%= contActives %>" style="width:100%;">
                                    </div>
                            <%  } contActives++;
                            }
                        }
                    }
                }
                if (contPublicos < 1){ %>
                    <!--No hay ningun carrusel publico, foto sin informacion-->
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
        <a class="left carousel-control" href="#CarruselUsuario" data-slide="prev">
            <span class="glyphicon glyphicon-chevron-left"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="right carousel-control" href="#CarruselUsuario" data-slide="next">
            <span class="glyphicon glyphicon-chevron-right"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
</section>