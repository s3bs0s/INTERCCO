<%@page import="com.INTERCCO.modelo.Beans.Sedes"%>
<%@page import="java.util.ArrayList"%>
<section class="sectionElijaSede">
    <article>
        <div class="sesTitulo">
            <p>Elija una Sede para ver la Informaci�n</p>
            <p class="me">Al escojer una sede, nos permit� usar cookies para una mejor la interacci�n.</p>
        </div>
        <div class="sesSelect">
            <div class="input-group">
                <% ArrayList<Sedes> listaSedSIndexES = (ArrayList) request.getAttribute("listaSedSIndex"); %>
                <select required onchange="window.location = 'index?elijaIdSede='+this.value" class="form-control" title="Seleccione una sede para ver su informaci�n." id="indexElijaSedeUsuario">
                    <% for (Sedes  sedeSIndexES: listaSedSIndexES) { %>
                        <option value="<%= sedeSIndexES.getIdSedes()%>"><%= sedeSIndexES.getNombre()%></option>
                    <% } %>
                </select>
            </div>
        </div>
    </article>
</section>