<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page import="com.INTERCCO.modelo.Beans.Sedes"%>
<%@page import="java.util.ArrayList"%>
<section class="sectionElijaSede">
    <article>
        <div class="sesTitulo">
            <p>Elija una Sede para ver la Información</p>
            <p class="me">Al escojer una sede, nos permité usar cookies para una mejor la interacción.</p>
        </div>
        <div class="sesSelect">
            <div class="input-group">
                <% ArrayList<Sedes> listaSedSIndexES = (ArrayList) request.getAttribute("listaSedSIndex");
                    CifradoASCII cAIndexES = new CifradoASCII();
                    String cadenaArraySedes = ""; %>
                <select required onchange="window.location = 'index?elijaIdSede='+this.value" class="form-control" title="Seleccione una sede para ver su información." id="indexElijaSedeUsuario">
                    <% for (Sedes  sedeSIndexES: listaSedSIndexES) {
                        cadenaArraySedes += sedeSIndexES.getIdSedes()+"-"+cAIndexES.CifrarASCII(sedeSIndexES.getNombre())+";"; %>
                        <option value="<%= sedeSIndexES.getIdSedes()%>"><%= sedeSIndexES.getNombre()%></option>
                    <% }
                    cadenaArraySedes = cadenaArraySedes.substring(0, cadenaArraySedes.length() - 1); %>
                </select>
            </div>
        </div>
        <input type="text" id="cadenaArraySedesES" value="<%= cadenaArraySedes %>" class="inpDesa">
    </article>
</section>