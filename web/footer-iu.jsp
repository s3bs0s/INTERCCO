<footer class="footiu">
    <div class="infofooter-is">
        <div>
            <p class="infofooter-is-tp">N�mero Nacional:</p>
            <p>01 8055 44 69 22</p>
        </div>
        <div>
            <p class="infofooter-is-tp">Fundadores:</p>
            <p>Sebastian Sossa Vasquez</p>
            <p>Jamith Alexey Castillo</p>
        </div>
        <div>
            <p class="infofooter-is-tp">E-mail Nacional:</p>
            <p>contacto.succo@gmail.com</p>
        </div>
    </div>
    <div class="infofooter-da">
        <p>Powered by <a target="_blank" href="http://www.facebook.com">JAN Developers</a> 2018 - 2019 &copy;</p>
    </div>
</footer>


<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script type="text/javascript" src="http://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>

<script type="text/javascript" src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<% if (session.getAttribute("rolUsuario") == null || session.getAttribute("rolUsuario").equals("Usuario")){ %>
    <script src="Estilos/js/indexUsuario.js"></script>
<% } else { %>
    <script type="text/javascript" src="Estilos/js/dataTables.bootstrap.js"></script>
    <script type="text/javascript" src="Estilos/js/dataTablesRUN.js"></script>
    <script src="Estilos/js/indexUsuario.js"></script>
    <script src="Estilos/js/modalPerfil.js"></script>
<% } %>
