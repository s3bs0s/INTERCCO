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
            <li><a class="siBNavBtns" href="#siBArticulo1"><span class="icon-info"></span><span class="me">Información</span></a></li>
            <li><a class="siBNavBtns" href="#siBArticulo2"><span class="icon-tree"></span><span class="me">Historia</span></a></li>
            <li><a class="siBNavBtns" href="#siBArticulo3"><span class="icon-alarm"></span><span class="me">Misión</span></a></li>
            <li><a class="siBNavBtns" href="#siBArticulo4"><span class="icon-stopwatch"></span><span class="me">Visión</span></a></li>
            <li><a class="siBNavBtns" href="#siBArticulo5"><span class="icon-binoculars"></span><span class="me">Política de Calidad</span></a></li>
        </ul>
        <div class="siBArticulos">
            <article id="siBArticulo1">
                <div class="siBArticulosT">
                    <p>I</p><p>N</p><p>F</p><p>O</p><p>R</p><p>M</p><p>A</p><p>C</p><p>I</p><p>Ó</p><p>N</p>
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
                                <p>Dirección de la SEDE <%= sedeIndexAD.getRango().equals("Principal")?"Principal "+sedeIndexAD.getNombre():""+sedeIndexAD.getNombre() %></p>
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
                        <p>En 1995, Jamith Alexey Castillo se dispuso a cumplir su sueño de convertirse en médico. Buscando una manera de pagar su educación, un amigo de Calatra le sugirió abrir una tienda de comida rápida con un nombre en idioma italiano.</p>
                        <p>Con un préstamo de 3.500.000 COP, su amigo, el Dr. Sebastian Sossa, le ofreció a Jamith ser su socio y así fue que comenzó la relación comercial que cambió el panorama de la industria de comida rápida.</p>
                        <p>El primer establecimiento se abrió en septiembre de 1995 en Boca Grande, Cartagena. Ellos se fijaron como objetivo, abrir 12 restaurantes en un periodo de 5 años. En el transcurso del tiempo, Jamith aprendió los conceptos básicos del manejo de una compañía, así como la importancia de servir un producto bien preparado y de alta calidad, el brindar un servicio al cliente excelente, de mantener bajos costos de operación y de buscar las mejores ubicaciones. Estas primeras lecciones continúan siendo la base para los restaurantes SUCCO® exitosos en todo Colombia.</p>
                    </div>
                </div>
            </article>
            <article id="siBArticulo3">
                <div class="siBArticulosT">
                    <p>M</p><p>I</p><p>S</p><p>I</p><p>Ó</p><p>N</p>
                </div>
                <div class="siBArticulosC">
                    <div class="siBArticulosCTexto">
                        <p>Nuesta misión es brindar una experiencia excepcional, ofreciendo productos saludables de la más alta calidad, en un ambiente limpio, cómodo, agradable y servidos por un motivado equipo de trabajo que exceda las expectativas de nuestros clientes.</p>
                    </div>
                </div>
            </article>
            <article id="siBArticulo4">
                <div class="siBArticulosT">
                    <p>V</p><p>I</p><p>S</p><p>I</p><p>Ó</p><p>N</p>
                </div>
                <div class="siBArticulosC">
                    <div class="siBArticulosCTexto">
                        <p>Nuestra visión es hacer que los restaurantes SUCCO® y sus operaciones sean lo más responsable posible tanto ambiental como socialmente, cada día nos esforzamos por trabajar de una manera que tenga un impacto positivo sobre el medio ambiente, mejorando al mismo tiempo las vidas de nuestros clientes, franquiciados, empleados, proveedores y comunidades en todo el mundo.</p>
                    </div>
                </div>
            </article>
            <article id="siBArticulo5">
                <div class="siBArticulosTPC">
                    <di class="siBArticulosTPCColum">
                        <p>P</p><p>O</p><p>L</p><p>Í</p><p>T</p><p>I</p><p>C</p><p>A</p>
                    </di>
                    <di class="siBArticulosTPCColum">
                        <p>D</p><p>E</p><p>C</p><p>A</p><p>L</p><p>I</p><p>D</p><p>A</p><p>D</p>
                    </di>
                </div>
                <div class="siBArticulosC">
                    <div class="siBArticulosCTexto">
                        <p>En SUCCO nos dedicamos a comercializar los mejores productos gastronómicos con la mejor relación precio/calidad, elaborados bajo estrictas normas de higiene, que aseguran la inocuidad de ellos, con la certeza de que las materias primas que utilizamos tienen el mejor origen y resguardo para su salud.</p>
                        <p>Nos comprometemos con las normas de calidad, validamos y acotamos al pie de la letra la CERTIFICACION 360° DE PROTECCION, cada una de nuestras dependencias y empleados utiliza soluciones y servicios de limpieza y desinfección de la más alta calidad para asegurar los procesos de aseo y manipulación de alimentos.</p>
                        <p>USTED NOS IMPORTA, es por ello que nos esforzamos en ofrecer siempre SALMON DE CULTIVO PREMIUM SIEMPRE FRESCO, producto despachado a diario por empresas con certificación, al igual que el resto de los insumos que se utilizan para la elaboración y preparación de nuestra carta.</p>
                        <p>Nos capacitamos Permanentemente en adoptar buenas prácticas para entregar el mejor servicio al cliente.<br/>Nuestra POLITICA DE CALIDAD se manifiesta mediante nuestro firme compromiso con ustedes, en satisfacer plenamente sus requerimientos y expectativas, para ello, garantizamos impulsar una cultura de calidad basada en los principios de liderazgo e innovación, compromiso de mejora y seguridad en nuestras operaciones, que sin duda, el cliente lo notara en la entrega de nuestros servicios y en su paladar.</p>
                    </div>
                </div>
            </article>
        </div>
    </div>
</section>