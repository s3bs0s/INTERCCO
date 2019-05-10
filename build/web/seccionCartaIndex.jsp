<%@page import="com.INTERCCO.controlador.General.DecoracionPesos"%>
<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.INTERCCO.modelo.Beans.Promociones"%>
<%@page import="com.INTERCCO.modelo.Beans.Productos"%>
<%@page import="com.INTERCCO.modelo.Beans.Categorias"%>
<%@page import="java.util.ArrayList"%>
<section class="sectionCarta">
    <div class="sectionCartaC">
        <div class="sectionCartaCHeader">
            <p>Carta de la SEDE <%= session.getAttribute("elijaRolSede").equals("Principal")?"Principal "+session.getAttribute("elijaNomSede"):""+session.getAttribute("elijaNomSede") %></p>
        </div>
        <hr>
        <% ArrayList<Categorias> listaCateIndex = (ArrayList) request.getAttribute("listaCateIndex");
        ArrayList<Productos> listaProdIndex = (ArrayList) request.getAttribute("listaProdIndex");
        ArrayList<Promociones> listaPromIndex = (ArrayList) request.getAttribute("listaPromIndex"); 
        Date date = new Date();
        DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        CifradoASCII cAIndex = new CifradoASCII();
        DecoracionPesos dPIndex = new DecoracionPesos();%>
        <div class="sectionCartaCBody">
            <% if (listaCateIndex.size() == 0){ %>
                <div class="sectionCartaCBodyInfoSC">
                    <p>¡Esta SEDE no tiene carta!</p>
                </div>
            <% } else { %>
                <div class="sectionCartaCBodyInfo">
                    <p>Presióne una de las siguientes categorías, para ver sus productos en oferta.</p>
                </div>
                <div class="panel-group" id="accordionCarta">
                <% int posicion = 1; 
                for (Categorias cateIndex : listaCateIndex) { 
                    String nomCateSEspacios = cateIndex.getNombre().replace(" ", "_");
                    if (posicion == 1 ){ %>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionCarta" data-target="#<%= nomCateSEspacios %>">Categoria <%= cateIndex.getNombre() %><span class="glyphicon glyphicon-minus btn-collap"></span></button>
                            </div>
                            <div id="<%= nomCateSEspacios %>" class="panel-collapse collapse in">
                                <div class="panel-body">

                    <% } else { %>

                        <div class="panel panel-default">
                            <div class="panel-heading">
                                <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionCarta" data-target="#<%= nomCateSEspacios %>">Categoria <%= cateIndex.getNombre() %><span class="glyphicon glyphicon-plus btn-collap"></span></button>
                            </div>
                            <div id="<%= nomCateSEspacios %>" class="panel-collapse collapse">
                                <div class="panel-body">

                    <% } 
                    for (Productos prodIndex : listaProdIndex) {
                        if (prodIndex.getIdCategoria() == cateIndex.getIdCategorias()){
                            float porcentaje = 0;
                            for (Promociones promIndex : listaPromIndex) { 
                                if (promIndex.getIdProducto() == prodIndex.getIdProductos()){
                                    if (!promIndex.getFchCaducidad().before(dateFormat.parse(dateFormat.format(date)))){
                                        porcentaje = promIndex.getPorcentajePromo();
                                    }
                                }
                            } 
                            if (porcentaje == 0){
                                if (prodIndex.getDescripcion().equals("86S97S99S105S111")){ %>

                                    <div class="panelBCartaCJProd">
                                        <div class="panelBCartaNomProd"><p><%= prodIndex.getNombre() %></p></div>
                                        <div class="panelBCartaPreProd"><p>$ <%= dPIndex.formatNumber(prodIndex.getPrecio()) %></p></div>
                                    </div>

                                <% } else { %>

                                    <div class="panelBCartaCJProd">
                                        <div class="panelBCartaNomProd"><p><%= prodIndex.getNombre() %></p></div>
                                        <div class="panelBCartaPreProd"><p>$ <%= dPIndex.formatNumber(prodIndex.getPrecio()) %></p></div>
                                    </div>
                                    <div class="panelBCartaCJDescrip">
                                        <div class="panelBCartaDescrip"><p><%= cAIndex.DescifrarASCII(prodIndex.getDescripcion()) %></p></div>
                                    </div>

                            <%  }
                            } else {
                                if (prodIndex.getDescripcion().equals("86S97S99S105S111")){ %>

                                    <div class="panelBCartaCJProd">
                                        <div class="panelBCartaNomProd"><p><%= prodIndex.getNombre() %></p></div>
                                        <div class="panelBCartaPreProd"><p>$ <%= dPIndex.formatNumber(prodIndex.getPrecio()) %></p></div>
                                    </div>
                                    <div class="panelBCartaCJDesc">
                                        <div class="panelBCartaCanDesc"><p>Descuento de <%= porcentaje %>%</p></div>
                                        <% float precioDesc = prodIndex.getPrecio() * porcentaje; %>
                                        <div class="panelBCartaPreDesc"><p>$ <%= dPIndex.formatNumber(prodIndex.getPrecio() - ( ( (int)precioDesc ) / 100 )) %></p></div>
                                    </div>

                                <% } else { %>

                                    <div class="panelBCartaCJProd">
                                        <div class="panelBCartaNomProd"><p><%= prodIndex.getNombre() %></p></div>
                                        <div class="panelBCartaPreProd"><p>$ <%= dPIndex.formatNumber(prodIndex.getPrecio()) %></p></div>
                                    </div>
                                    <div style="margin-bottom:0;" class="panelBCartaCJDesc">
                                        <div class="panelBCartaCanDesc"><p>Descuento de <%= porcentaje %>%</p></div>
                                        <% float precioDesc = prodIndex.getPrecio() * porcentaje; %>
                                        <div class="panelBCartaPreDesc"><p>$ <%= dPIndex.formatNumber(prodIndex.getPrecio() - ( ( (int)precioDesc ) / 100 )) %></p></div>
                                    </div>
                                    <div class="panelBCartaCJDescrip">
                                        <div class="panelBCartaDescrip"><p><%= cAIndex.DescifrarASCII(prodIndex.getDescripcion()) %></p></div>
                                    </div>

                                <% }
                            }
                        }
                    }
                        posicion++; %>
                                </div>
                            </div>
                        </div>
                <% } %>
                </div>
            <% } %>
        </div>
        <div class="sectionCartaCFooter">
            <% if (session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("Usuario")){ %>
                <button type="button" id="elijaOtraSede" class="btnFooterCarta btn">Cambiar Sede</button>
            <% } %>
        </div>
    </div>
</section>