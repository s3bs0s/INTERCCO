<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.INTERCCO.modelo.Beans.Promociones"%>
<%@page import="com.INTERCCO.modelo.Beans.Productos"%>
<%@page import="com.INTERCCO.modelo.Beans.Categorias"%>
<%@page import="com.INTERCCO.modelo.Beans.Sedes"%>
<%@page import="java.util.ArrayList"%>
<section class="sectionCarta">
    <div class="scCajaBtn" id="BotonesSedesCarta">
        <div class="scBtnTitulo">
            <p>Carta</p>
            <p>Elija su Sede</p>
        </div>
        <div class="scBtnSedes">
            <% ArrayList<Sedes> listaSedeIndex = (ArrayList) request.getAttribute("listaSedeIndex"); %>
            <% ArrayList<Categorias> listaCateIndex = (ArrayList) request.getAttribute("listaCateIndex"); %>
            <% ArrayList<Productos> listaProdIndex = (ArrayList) request.getAttribute("listaProdIndex"); %>
            <% ArrayList<Promociones> listaPromIndex = (ArrayList) request.getAttribute("listaPromIndex"); %>
            
            <%for (Sedes sedeIndex : listaSedeIndex) {
                String cadenaCate = "";
                String cadenaProd = "";
                String cadenaProm = "";
                Date date = new Date();
                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                CifradoASCII cAIndex = new CifradoASCII();
                for (Categorias cateIndex : listaCateIndex) {
                    if (cateIndex.getIdSede() == sedeIndex.getIdSedes()){
                        cadenaCate += cateIndex.getIdCategorias()+"Æ"+cateIndex.getNombre()+"Ø";
                    }
                }
                if (cadenaCate.length() > 0){
                    cadenaCate = cadenaCate.substring(0, cadenaCate.length() - 1);
                }
                for (Productos prodIndex : listaProdIndex) {
                    if (prodIndex.getIdSede() == sedeIndex.getIdSedes()){
                        cadenaProd += prodIndex.getIdProductos()+"Æ"+prodIndex.getIdCategoria()+"Æ"+prodIndex.getNombre()+"Æ"+prodIndex.getDescripcion()+"Æ"+prodIndex.getPrecio()+"Ø";
                    }
                }
                if (cadenaProd.length() > 0){
                    cadenaProd = cadenaProd.substring(0, cadenaProd.length() - 1);
                }
                for (Promociones promIndex : listaPromIndex) {
                    if (promIndex.getIdSede() == sedeIndex.getIdSedes()){
                        if (!promIndex.getFchCaducidad().before(dateFormat.parse(dateFormat.format(date)))){
                            cadenaProm += promIndex.getIdProducto()+"Æ"+promIndex.getPorcentajePromo()+"Ø";
                        }
                    }
                }
                if (cadenaProm.length() > 0){
                    cadenaProm = cadenaProm.substring(0, cadenaProm.length() - 1);
                }
                if (sedeIndex.getRango().equals("Principal")){ %>
                    <button type="button" onclick="verCartaSede('<%= cAIndex.CifrarASCII(sedeIndex.getNombre()) %>', '<%= sedeIndex.getRango()%>', '<%= cAIndex.CifrarASCII(cadenaCate) %>', '<%= cAIndex.CifrarASCII(cadenaProd) %>', '<%= cAIndex.CifrarASCII(cadenaProm) %>')" class="btn">SEDE Principal <%= sedeIndex.getNombre() %></button>
                <% } else { %>
                    <button type="button" onclick="verCartaSede('<%= cAIndex.CifrarASCII(sedeIndex.getNombre()) %>', '<%= sedeIndex.getRango()%>', '<%= cAIndex.CifrarASCII(cadenaCate) %>', '<%= cAIndex.CifrarASCII(cadenaProd) %>', '<%= cAIndex.CifrarASCII(cadenaProm) %>')" class="btn">SEDE <%= sedeIndex.getNombre() %></button>
                <% } %>
            <% }%>
        </div>
    </div>
</section>


<div id="ModalCarta" class="modal-carta s-aye">
    <div class="flex-carta" id="FlexCarta">
        <div class="contenido-modal-carta">
            <div class="modal-header-carta">
                <p id="TituloCarta">Carta de la SEDE</p>
                <span class="cerrar-carta" id="CerrarHeaderCarta">&times;</span>
                <!--<span class="cerrar-carta"><p id="CerrarHeaderCarta">&times;</p></span>-->
            </div>
            <hr>
            <div id="CJAccordion" class="modal-body-carta">
                <div class="modal-body-carta-info">
                    <p id="PdeInfo">No ha seleccionado una SEDE...</p>
                </div>
                <div class="panel-group" id="accordionCarta"></div>
            </div>
            <div class="modal-footer-carta">
                <button type="button" id="CerrarBodyCarta" class="btn-modal btn">Cerrar</button>
            </div>
        </div>
    </div>
</div>