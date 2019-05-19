<%@page import="com.INTERCCO.controlador.General.EstructuraFYH"%>
<%@page import="com.INTERCCO.controlador.General.CifradoASCII"%>
<%@page import="com.INTERCCO.modelo.Beans.Sedes"%>
<%@page import="java.util.ArrayList"%>
<section class="sectionInformacion">
    <div class="siBody">
        <div class="siBodyTitulo">
            <p>Acerca de</p>
        </div>
        <ul class="siBodyNav">
            <li><a class="siBNavBtns" href="#siBArticulo1"><span class="icon-info"></span><span class="me">Informaci�n</span></a></li>
            <li><a class="siBNavBtns" href="#siBArticulo2"><span class="icon-tree"></span><span class="me">Historia</span></a></li>
            <li><a class="siBNavBtns" href="#siBArticulo3"><span class="icon-alarm"></span><span class="me">Misi�n</span></a></li>
            <li><a class="siBNavBtns" href="#siBArticulo4"><span class="icon-stopwatch"></span><span class="me">Visi�n</span></a></li>
            <li><a class="siBNavBtns" href="#siBArticulo5"><span class="icon-binoculars"></span><span class="me">Pol�tica de Calidad</span></a></li>
        </ul>
        <div class="siBArticulos">
            <article id="siBArticulo1">
                <div class="siBArticulosT">
                    <p>I</p><p>N</p><p>F</p><p>O</p><p>R</p><p>M</p><p>A</p><p>C</p><p>I</p><p>�</p><p>N</p>
                </div>
                <% ArrayList<Sedes> listaSedeIndexAD = (ArrayList) request.getAttribute("listaSedeIndex");
                    CifradoASCII cAIndexAD = new CifradoASCII();
                    EstructuraFYH eFYHIndexAD = new EstructuraFYH(); %>
                <div class="siBArticulosC" id="ADInformacion">
                    <div class="siBArticulosLIzq">
                        <div>
                            <p>Horarios</p>
                        </div>
                    <% for (Sedes sedeIndexAD : listaSedeIndexAD) {
                        String[] arrayD = sedeIndexAD.getDiasHorario().split(";");
                        String[] arrayH = sedeIndexAD.getHorasHorario().split(";"); 
                        for (int i = 0; i < 3; i++) { 
                            String diaDescifrado = cAIndexAD.DescifrarASCII(arrayD[i]);
                            if (!diaDescifrado.equals("Vacio")){
                                String[] arrayDesdeYHasta = arrayH[i].split("-");
                                String horaDesdeDescifrada = cAIndexAD.DescifrarASCII(arrayDesdeYHasta[0]);
                                String horaHastaDescifrada = cAIndexAD.DescifrarASCII(arrayDesdeYHasta[1]); %>
                                <div>
                                    <p><%= diaDescifrado %></p>
                                    <p><%= eFYHIndexAD.horaMilitarANormal(horaDesdeDescifrada) %> hasta las <%= eFYHIndexAD.horaMilitarANormal(horaHastaDescifrada) %></p>
                                </div>
                            <% }
                        } %>
                        </div>
                        <div class="siBArticulosLDch">
                            <div>
                                <p>Direcci�n de la SEDE <%= sedeIndexAD.getRango().equals("Principal")?"Principal "+sedeIndexAD.getNombre():""+sedeIndexAD.getNombre() %></p>
                                <p><%= sedeIndexAD.getDireccion() %></p>
                            </div>
                            <div>
                                <iframe src="<%= cAIndexAD.DescifrarASCII(sedeIndexAD.getSrcMapa()) %>" width="75%" height="300" frameborder="0" allowfullscreen></iframe>
                            </div>
                        </div>
                    <% } %>
                </div>
            </article>
            <article id="siBArticulo2">
                <div class="siBArticulosT">
                    <p>H</p><p>I</p><p>S</p><p>T</p><p>O</p><p>R</p><p>I</p><p>A</p>
                </div>
                <div class="siBArticulosC">
                    <div class="siBArticulosCTexto">
                        <p>En 1995, Jamith Alexey Castillo se dispuso a cumplir su sue�o de convertirse en m�dico. Buscando una manera de pagar su educaci�n, un amigo de Calatra le sugiri� abrir una tienda de comida r�pida con un nombre en idioma italiano.</p>
                        <p>Con un pr�stamo de 3.500.000 COP, su amigo, el Dr. Sebastian Sossa, le ofreci� a Jamith ser su socio y as� fue que comenz� la relaci�n comercial que cambi� el panorama de la industria de comida r�pida.</p>
                        <p>El primer establecimiento se abri� en septiembre de 1995 en Boca Grande, Cartagena. Ellos se fijaron como objetivo, abrir 12 restaurantes en un periodo de 5 a�os. En el transcurso del tiempo, Jamith aprendi� los conceptos b�sicos del manejo de una compa��a, as� como la importancia de servir un producto bien preparado y de alta calidad, el brindar un servicio al cliente excelente, de mantener bajos costos de operaci�n y de buscar las mejores ubicaciones. Estas primeras lecciones contin�an siendo la base para los restaurantes SUCCO� exitosos en todo Colombia.</p>
                    </div>
                </div>
            </article>
            <article id="siBArticulo3">
                <div class="siBArticulosT">
                    <p>M</p><p>I</p><p>S</p><p>I</p><p>�</p><p>N</p>
                </div>
                <div class="siBArticulosC">
                    <div class="siBArticulosCTexto">
                        <p>Nuesta misi�n es brindar una experiencia excepcional, ofreciendo productos saludables de la m�s alta calidad, en un ambiente limpio, c�modo, agradable y servidos por un motivado equipo de trabajo que exceda las expectativas de nuestros clientes.</p>
                    </div>
                </div>
            </article>
            <article id="siBArticulo4">
                <div class="siBArticulosT">
                    <p>V</p><p>I</p><p>S</p><p>I</p><p>�</p><p>N</p>
                </div>
                <div class="siBArticulosC">
                    <div class="siBArticulosCTexto">
                        <p>Nuestra visi�n es hacer que los restaurantes SUCCO� y sus operaciones sean lo m�s responsable posible tanto ambiental como socialmente, cada d�a nos esforzamos por trabajar de una manera que tenga un impacto positivo sobre el medio ambiente, mejorando al mismo tiempo las vidas de nuestros clientes, franquiciados, empleados, proveedores y comunidades en todo el mundo.</p>
                    </div>
                </div>
            </article>
            <article id="siBArticulo5">
                <div class="siBArticulosTPC">
                    <di class="siBArticulosTPCColum">
                        <p>P</p><p>O</p><p>L</p><p>�</p><p>T</p><p>I</p><p>C</p><p>A</p>
                    </di>
                    <di class="siBArticulosTPCColum">
                        <p>D</p><p>E</p><p>C</p><p>A</p><p>L</p><p>I</p><p>D</p><p>A</p><p>D</p>
                    </di>
                </div>
                <div class="siBArticulosC">
                    <div class="siBArticulosCTexto">
                        <p>En SUCCO nos dedicamos a comercializar los mejores productos gastron�micos con la mejor relaci�n precio/calidad, elaborados bajo estrictas normas de higiene, que aseguran la inocuidad de ellos, con la certeza de que las materias primas que utilizamos tienen el mejor origen y resguardo para su salud.</p>
                        <p>Nos comprometemos con las normas de calidad, validamos y acotamos al pie de la letra la CERTIFICACION 360� DE PROTECCION, cada una de nuestras dependencias y empleados utiliza soluciones y servicios de limpieza y desinfecci�n de la m�s alta calidad para asegurar los procesos de aseo y manipulaci�n de alimentos.</p>
                        <p>USTED NOS IMPORTA, es por ello que nos esforzamos en ofrecer siempre SALMON DE CULTIVO PREMIUM SIEMPRE FRESCO, producto despachado a diario por empresas con certificaci�n, al igual que el resto de los insumos que se utilizan para la elaboraci�n y preparaci�n de nuestra carta.</p>
                        <p>Nos capacitamos Permanentemente en adoptar buenas pr�cticas para entregar el mejor servicio al cliente.<br/>Nuestra POLITICA DE CALIDAD se manifiesta mediante nuestro firme compromiso con ustedes, en satisfacer plenamente sus requerimientos y expectativas, para ello, garantizamos impulsar una cultura de calidad basada en los principios de liderazgo e innovaci�n, compromiso de mejora y seguridad en nuestras operaciones, que sin duda, el cliente lo notara en la entrega de nuestros servicios y en su paladar.</p>
                    </div>
                </div>
            </article>
        </div>
    </div>
</section>