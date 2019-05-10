// <editor-fold defaultstate="collapsed" desc="Header"> 
/* Header */
$(document).ready(function () {
    /* Inicio de hover de los elementos ocultos en el Nav */
    $('.logonaviu').hide();
    $('#share-social ul').hide();
    $('.menuperfil .caj-menuperfil ul').hide();
    
    $("#accBtnAcceder").attr('disabled','');
    
    if (document.getElementById("accederEmail") !== null){
        var lSt = localStorage;
        if (lSt.getItem("rEyP") !== null && lSt.getItem("rEyP") !== "null"){
            var arrRec = lSt.getItem("rEyP").split(";");
            document.getElementById("accederEmail").value = DescifrarASCII(arrRec[0]);
            document.getElementById("InpMOPasswordAcceder").value = DescifrarASCII(arrRec[1]);
            $("#accederRecordar").attr('checked','');

            $('#accBtnAcceder').removeAttr('disabled');
        }

        var inpE = document.getElementById("accederEmail");
        var inpP = document.getElementById("InpMOPasswordAcceder");
        inpE.addEventListener("keyup", function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById("accBtnAcceder").click();
            }
        });
        inpP.addEventListener("keyup", function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById("accBtnAcceder").click();
            }
        });
    }
    
    /* Redirección de botones en el Nav */
    $('.menupriniu ul li #Acceder').click(function(){
        var accederAltura = $('.sectionAcceso').offset().top;
        $('body, html').animate({
            scrollTop: accederAltura+'px'
        }, 600);
        document.getElementById("accederEmail").focus();
    });
    
    $('#InicioCliente').click(function(){
        var carruselAltura = $('.sectionCarrusel').offset().top - 43;
        $('body, html').animate({
            scrollTop: carruselAltura+'px'
        }, 600);
    });
    
    $('.menupriniu ul li #Carta').click(function(){
        var cartaAltura = $('.sectionCarta').offset().top - 42;
        $('body, html').animate({
            scrollTop: cartaAltura+'px'
        }, 600);
    });
    
    $('.menupriniu ul li #Domicilios').click(function(){
        var cartaAltura = $('.sectionDomicilios').offset().top - 42;
        $('body, html').animate({
            scrollTop: cartaAltura+'px'
        }, 600);
    });
    
    $('.menupriniu ul li #Acercade').click(function(){
        var acercadeAltura = $('.sectionInformacion').offset().top - 42;
        $('body, html').animate({
            scrollTop: acercadeAltura+'px'
        }, 600);
    });
    
    $('.menupriniu ul li #PQRSF').click(function(){
        var pqrsfAltura = $('.sectionPqrsf').offset().top - 42;
        $('body, html').animate({
            scrollTop: pqrsfAltura+'px'
        }, 600);
    });
});

function btnAcceder(){
    var lSt = localStorage;
    if (document.getElementById("accederRecordar").checked === true){
        var valE = document.getElementById("accederEmail").value;
        var valP = document.getElementById("InpMOPasswordAcceder").value;
        lSt.setItem("rEyP", CifrarASCII(valE)+";"+CifrarASCII(valP));
    } else {
        lSt.removeItem("rEyP");
    }
    document.getElementById("accederForm").submit();
}

/* Hover de los elementos ocultos en el Nav */
$('.naviu').hover(
    function () {
        $('.logonaviu').show();
    },
    function () {
        $('.logonaviu').hide();
    }
);

$('.menuperfil .caj-menuperfil').hover(
    function () {
        $('.menuperfil .caj-menuperfil ul').show(10, function(){});
    },
    function () {
        $('.menuperfil .caj-menuperfil ul').hide(10, function(){});
    }
);

function validacionAcceder(inpActual,idInpContrario){
    if (idInpContrario === "InpMOPasswordAcceder"){
        if (!inpActual.value.includes('@succo.com')){
            if (inpActual.value.includes('@s')){
                inpActual.value = inpActual.value +'ucco.com';
            }
        }
    }
    
    if (idInpContrario === "InpMOPasswordAcceder"){
        var inpC = document.getElementById(idInpContrario);
        if((inpActual.value.includes("@") && (inpActual.value.length >= 10 && inpActual.value.length <= 150)) && (inpC.value.length >= 3 && inpC.value.length <= 20)){
            $('#accBtnAcceder').removeAttr('disabled');
        } else {
            $('#accBtnAcceder').attr('disabled','');
        }
    } else {
        var inpC = document.getElementById(idInpContrario);
        if((inpActual.value.length >= 3 && inpActual.value.length <= 20) && (inpC.value.includes("@") && (inpC.value.length >= 10 && inpC.value.length <= 150))){
            $('#accBtnAcceder').removeAttr('disabled');
        } else {
            $('#accBtnAcceder').attr('disabled','');
        }
    }
}

function calcularEdad(fecha) {
    var hoy = new Date();
    var cumpleanos = new Date(fecha);
    var edad = hoy.getFullYear() - cumpleanos.getFullYear();
    var m = hoy.getMonth() - cumpleanos.getMonth();

    if (m < 0 || (m === 0 && hoy.getDate() < cumpleanos.getDate())) {
        edad--;
    }

    return edad;
}

function mayorEdad(idUsuario,
        fchNaci,
        tipoIdenti){
    if (tipoIdenti === "TI"){
        var edadUsuario = calcularEdad(fchNaci);
        if (edadUsuario => 18){
            document.getElementById("meIDUsuario").value = idUsuario;
            document.getElementById("meFormUsuario").action = "UsuarioME";
            document.getElementById("meEdadUsuario").innerText = edadUsuario;
            var sPath = window.location.pathname;
            var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
            if (sPage === "UsuarioME"){
                var segundos = 0;
                var si = setInterval(function(){
                    if(segundos === 3){
                        $('#mayorEdadAModal').modal('toggle');
                        clearInterval(si);
                    } else {
                        segundos++;
                    }
                },1000);
            } else {
                $('#mayorEdadAModal').modal('toggle');
            }
        } else {
            document.getElementById("meFormUsuario").action = "#";
        }
    }
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Redes Sociales">
$(document).ready(function () {
    /* Instalación de border cuando lo necesite */
    var alturaRS = 45;
    $('#share-social p').css('border', 'solid .5px #9aafd3');
    $('#share-social p').css('border-bottom', 'none');
    $('#share-social ul li a.icon-facebook').css('border-left', 'solid .5px #9aafd3');
    $('#share-social ul li a.icon-google-plus').css('border-right', 'solid .5px #9aafd3');
    
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > alturaRS) {
            /* Se fue de la sección Acceder */
            $('#share-social p').css('border', 'none');
            $('#share-social ul li a.icon-facebook').css('border-left', 'none');
            $('#share-social ul li a.icon-google-plus').css('border-right', 'none');
        } else {
            /* Esta en la sección Acceder */
            $('#share-social p').css('border', 'solid .5px #9aafd3');
            $('#share-social p').css('border-bottom', 'none');
            $('#share-social ul li a.icon-facebook').css('border-left', 'solid .5px #9aafd3');
            $('#share-social ul li a.icon-google-plus').css('border-right', 'solid .5px #9aafd3');
        }
    });
});

/* Hover para mostrar redes sociales */
$('#share-social').hover(
    function () {
        $('#share-social ul').show();
    },
    function () {
        $('#share-social ul').hide();
    }
);
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Botón Subir">
$(document).ready(function () {
    /* Desaparición del botón subir cuando esta en el acceder */
    var alturaBS = 45;
    if ($(window).scrollTop() > alturaBS) {
        $('#btn-subir').show();
    } else {
        $('#btn-subir').hide();
    }
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > alturaBS) {
            /* Se fue de la sección Acceder */
            $('#btn-subir').show(100, function(){});
        } else {
            /* Esta en la sección Acceder */
            $('#btn-subir').hide(100, function(){});
        }
    });
    
    /* Redirección del botón subir */
    $('#btn-subir').click(function(){
        var accederAlturaBS = 0;
        $('body, html').animate({
            scrollTop: accederAlturaBS+'px'
        }, 600);
        var inpAcc = document.getElementById("accederEmail");
        if (inpAcc ===  null){
            inpAcc.focus();
        }
    });
});
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Sección Acceder">
$(document).ready(function () {
    /* Redirección de boton flecha al carrusel */
    $('.sectionAcceso .saABtnFlecha #BotonFlecha').click(function(){
        var carruselAltura = $('.sectionCarrusel').offset().top - 43;
        $('body, html').animate({
            scrollTop: carruselAltura+'px'
        }, 600);
    });
});

/* Transición de boton flecha para indicar abajo */
if (document.getElementById("BotonFlecha") !== null){
    window.setInterval (BotonFlecha, 700);
    var marginBottom = "0px";

    function BotonFlecha () {
        marginBottom = (marginBottom === "10px")? "0px" : "10px";
        document.getElementById("BotonFlecha").style.marginBottom = marginBottom;
        document.getElementById("BotonFlecha").style.transition = "all 200ms ease";
    }
}

function MOPass (mod) {
    var typeInp = document.getElementById('InpMOPassword'+mod).type;
    if (typeInp === "password"){
        document.getElementById('InpMOPassword'+mod).type = 'text';
        document.getElementById('BtnMOPassword'+mod).innerText = "Ocultar";
    } else {
        document.getElementById('InpMOPassword'+mod).type = 'password';
        document.getElementById('BtnMOPassword'+mod).innerText = "Mostrar";
    }
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Sección Elija Sede">
function validacionSedeElejida(idSede) {
    document.getElementById("indexElijaSedeUsuario").value = idSede;
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Sección Carta">
$(document).ready(function(){
    $('.sectionCartaCBody .bc').hover(
        function () {
            var dataTargetAcc = this.dataset.target;
            $(dataTargetAcc+" .panel-body").css('border', 'solid 2px #fff');
            $(dataTargetAcc+" .panel-body").css('border-top', 'none');
        },
        function () {
            var dataTargetAcc = this.dataset.target;
            $(dataTargetAcc+" .panel-body").css('border', 'solid 2px #365892');
            $(dataTargetAcc+" .panel-body").css('border-top', 'none');
        }
    );
    $('#elijaOtraSede').click(function(){
        var elijaSedeAltura = $('.sectionElijaSede').offset().top - 43;
        $('body, html').animate({
            scrollTop: elijaSedeAltura+'px'
        }, 600);
    });
});
function formatNumberReturn(numero) {
    // Variable que contendra el resultado final
    var resultado = "";
    var nuevoNumero;

    // Cogemos el numero eliminando los posibles puntos que tenga
    nuevoNumero = numero.toString().replace(/\./g, '');

    // Ponemos un punto cada 3 caracteres
    for (var j, i = nuevoNumero.length - 1, j = 0; i >= 0; i--, j++) {
        resultado = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 === 0) ? "." : "") + resultado;
    }
    
    return resultado;
}
// <editor-fold defaultstate="collapsed" desc="Version Botones (Desactivado)">
/*function verCartaSede(nombreSede,
        rangoSede,
        cadenaCate,
        cadenaProd,
        cadenaProm){
    
    if (rangoSede === "Principal"){
        document.getElementById("TituloCarta").innerText = "Carta de la SEDE Principal "+DescifrarASCII(nombreSede);
    } else {
        document.getElementById("TituloCarta").innerText = "Carta de la SEDE "+DescifrarASCII(nombreSede);
    }
    var cadenaCateDescifrado = DescifrarASCII(cadenaCate);
    if (cadenaCateDescifrado.length > 0){
        var arrayCategorias = cadenaCateDescifrado.split("Ø");
        var posicion = 1;

        var allTemplates = ``;
        for (var i = 0; i < arrayCategorias.length; i++) {
            var arrayPosicionesCate = arrayCategorias[i].split("Æ"); // ID y NOMBRE
            var nombreCateSEspacios = arrayPosicionesCate[1].replace(" ", "_");
            if (posicion > 1){
                var templateTaskHeader = `
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionCarta" data-target="#${nombreCateSEspacios}">Categoria ${arrayPosicionesCate[1]}<span class="glyphicon glyphicon-plus btn-collap"></span></button>
                        </div>
                        <div id="${nombreCateSEspacios}" class="panel-collapse collapse">
                            <div class="panel-body">`;
            } else {
                var templateTaskHeader = `
                    <div class="panel panel-default">
                        <div class="panel-heading">
                            <button type="button" class="bc" data-toggle="collapse" data-parent="#accordionCarta" data-target="#${nombreCateSEspacios}">Categoría ${arrayPosicionesCate[1]}<span class="glyphicon glyphicon-minus btn-collap"></span></button>
                        </div>
                        <div id="${nombreCateSEspacios}" class="panel-collapse collapse in">
                            <div class="panel-body">`;
            }
            var templateTaskFooter = `
                            </div>
                        </div>
                    </div>`;

            var cadenaProdDescifrado = DescifrarASCII(cadenaProd);
            var arrayProductos = cadenaProdDescifrado.split("Ø");
            var templateTaskBody = ``;
            for (var e = 0; e < arrayProductos.length; e++) {
                var arrayPosicionesProd = arrayProductos[e].split("Æ"); // ID, IDCATE, NOMBRE, DESCRIPCION y PRECIO
                if (arrayPosicionesProd[1] === arrayPosicionesCate[0]){
                    var cadenaPromDescifrado = DescifrarASCII(cadenaProm);
                    var arrayPromociones = cadenaPromDescifrado.split("Ø");
                    var porcentaje = "Vacio";
                    for (var s = 0; s < arrayPromociones.length; s++) {
                        var arrayPosicionesProm = arrayPromociones[s].split("Æ"); // IDPROD, PORCENTAJE
                        if (arrayPosicionesProm[0] === arrayPosicionesProd[0]){
                            porcentaje = arrayPosicionesProm[1];
                        }
                    }
                    if (porcentaje === "Vacio"){

                        if (arrayPosicionesProd[3] === "86S97S99S105S111"){
                            templateTaskBody += `
                                <div class="panelBCartaCJProd">
                                    <div class="panelBCartaNomProd"><p>${arrayPosicionesProd[2]}</p></div>
                                    <div class="panelBCartaPreProd"><p>$ ${formatNumberReturn(arrayPosicionesProd[4])}</p></div>
                                </div>`;
                        } else {
                            templateTaskBody += `
                                <div class="panelBCartaCJProd">
                                    <div class="panelBCartaNomProd"><p>${arrayPosicionesProd[2]}</p></div>
                                    <div class="panelBCartaPreProd"><p>$ ${formatNumberReturn(arrayPosicionesProd[4])}</p></div>
                                </div>
                                <div class="panelBCartaCJDescrip">
                                    <div class="panelBCartaDescrip"><p>${DescifrarASCII(arrayPosicionesProd[3])}</p></div>
                                </div>`;
                        }

                    } else {

                        if (arrayPosicionesProd[3] === "86S97S99S105S111"){
                            templateTaskBody += `
                                <div class="panelBCartaCJProd">
                                    <div class="panelBCartaNomProd"><p>${arrayPosicionesProd[2]}</p></div>
                                    <div class="panelBCartaPreProd"><p><del>$ ${formatNumberReturn(arrayPosicionesProd[4])}</del></p></div>
                                </div>
                                <div class="panelBCartaCJDesc">
                                    <div class="panelBCartaCanDesc"><p>Descuento de ${porcentaje}%</p></div>
                                    <div class="panelBCartaPreDesc"><p>$ ${formatNumberReturn(arrayPosicionesProd[4]-((arrayPosicionesProd[4]*porcentaje)/100.0))}</p></div>
                                </div>`;
                        } else {
                            templateTaskBody += `
                                <div class="panelBCartaCJProd">
                                    <div class="panelBCartaNomProd"><p>${arrayPosicionesProd[2]}</p></div>
                                    <div class="panelBCartaPreProd"><p><del>$ ${formatNumberReturn(arrayPosicionesProd[4])}</del></p></div>
                                </div>
                                <div style="margin-bottom:0;" class="panelBCartaCJDesc">
                                    <div class="panelBCartaCanDesc"><p>Descuento de ${porcentaje}%</p></div>
                                    <div class="panelBCartaPreDesc"><p>$ ${formatNumberReturn(arrayPosicionesProd[4]-((arrayPosicionesProd[4]*porcentaje)/100.0))}</p></div>
                                </div>
                                <div class="panelBCartaCJDescrip">
                                    <div class="panelBCartaDescrip"><p>${DescifrarASCII(arrayPosicionesProd[3])}</p></div>
                                </div>`;
                        }

                    }
                }
            }
            if (templateTaskBody.length > 0){
                allTemplates += templateTaskHeader+templateTaskBody+templateTaskFooter;
                posicion++;
            }
        }
        if (allTemplates.length > 0){
            document.getElementById("PdeInfo").innerText = "Presióne una de las siguientes categorías, para ver sus productos en oferta.";
            $("#PdeInfo").css('font-size', '18px');
            $(".modal-body-carta-info").css('margin-top', '0');
            $(".modal-body-carta-info").css('margin-bottom', '10px');
            document.getElementById("CJAccordion").lastElementChild.remove();
            document.getElementById("CJAccordion").insertAdjacentHTML("beforeend",`<div class="panel-group" id="accordionCarta">`+allTemplates+`</div>`);

            $('.modal-body-carta .bc').hover(
                function () {
                    var dataTargetAcc = this.dataset.target;
                    $(dataTargetAcc+" .panel-body").css('border', 'solid 2px #fff');
                    $(dataTargetAcc+" .panel-body").css('border-top', 'none');
                },
                function () {
                    var dataTargetAcc = this.dataset.target;
                    $(dataTargetAcc+" .panel-body").css('border', 'solid 2px #365892');
                    $(dataTargetAcc+" .panel-body").css('border-top', 'none');
                }
            );
            $('.collapse').on('shown.bs.collapse', function(){ 
                $(this).parent().find(".bc .glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus"); 
            }).on('hidden.bs.collapse', function(){ 
                $(this).parent().find(".bc .glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus"); 
            });
        } else {
            document.getElementById("PdeInfo").innerText = "¡Esta SEDE no tiene carta!";
            $("#PdeInfo").css('font-size', '23px');
            $(".modal-body-carta-info").css('margin-top', '10px');
            $(".modal-body-carta-info").css('margin-bottom', '0');
            document.getElementById("CJAccordion").lastElementChild.remove();
            document.getElementById("CJAccordion").insertAdjacentHTML("beforeend",`<div class="panel-group" id="accordionCarta"></div>`);
        }
        
    } else {
        document.getElementById("PdeInfo").innerText = "¡Esta SEDE no tiene carta!";
        $("#PdeInfo").css('font-size', '23px');
        $(".modal-body-carta-info").css('margin-top', '10px');
        $(".modal-body-carta-info").css('margin-bottom', '0');
        document.getElementById("CJAccordion").lastElementChild.remove();
        document.getElementById("CJAccordion").insertAdjacentHTML("beforeend",`<div class="panel-group" id="accordionCarta"></div>`);
    }
    document.getElementById('ModalCarta').style.display = 'block';
}*/
// </editor-fold>
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Sección Domicilios">
$(document).ready(function () {
    /* Inicio Listar y Registrar ocultando uno*/
    $('#DomiListar').hide();
    $('#DomiRegistrar').show();
    
    /* Redirección de boton Acceder para indexUsuario */
    $('.mainiu .section4-domi .section4-domiRegistrar .div-content .section4-domiR-Desactivado #Acceder').click(function(){
        var accederAltura = $('.mainiu .section1-acc').offset().top;
        $('body, html').animate({
            scrollTop: accederAltura+'px'
        }, 600);
        document.getElementById("accederEmail").focus();
    });
});

/* Redirección para mostrar o ocultar Listar o Registrar */
$("#MisPedidos").on("click", function(){
    $("#DomiListar").show(200, function(){});
    $("#DomiRegistrar").hide(200, function(){});
});

$(".mainiu .section4-domi .section4-domiListar .tabla-reg button").on("click", function(){
    $("#DomiRegistrar").show(200, function(){});
    $("#DomiListar").hide(200, function(){});
});
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Sección Acerca de">
$(document).ready(function () {
    /* Inicio de tabs(Articulos) ocultos */
    $('.sectionInformacion .siBody .siBodyNav li:first a').addClass('active');
    $('.sectionInformacion .siBody .siBArticulos article').hide();
    $('.sectionInformacion .siBody .siBArticulos article:first').show();
    
    /* Navegación en los botones de Acerca de */
    $('.sectionInformacion .siBody .siBodyNav li a').click(function(){
        $('.sectionInformacion .siBody .siBodyNav li a').removeClass('active');
        $('.sectionInformacion .siBody .siBArticulos article').hide();
        $(this).addClass('active');
        
        var activeTab = $(this).attr('href');
        $(activeTab).show();
        return false;
    });
});

// <editor-fold defaultstate="collapsed" desc="Version Botones (Desactivado)">
//function verInfoAD(nombreSede,
//        rangoSede,
//        horarios,
//        direccion,
//        SRC){
//    
//    var horariosDescifrado = DescifrarASCII(horarios);
//    var arrayHyD = horariosDescifrado.split("Æ");
//    var arrayDias = arrayHyD[0].split(";");
//    var arrayHoras = arrayHyD[1].split(";");
//    var templateTitulo = `
//        <div class="siBArticulosLIzq">
//            <div>
//                <p>Horarios</p>
//            </div>`;
//    var templateContenido = ``;
//    for (var i = 0; i < arrayDias.length; i++) {
//        templateContenido += `
//            <div>
//                <p>${arrayDias[i]}</p>
//                <p>${arrayHoras[i]}</p>
//            </div>`;
//    }
//    
//    var templateLDerecho = `
//        <div class="siBArticulosLDch">
//            <div>
//                <p>Dirección de la SEDE ${rangoSede==="Principal"?`Principal `+DescifrarASCII(nombreSede):DescifrarASCII(nombreSede)}</p>
//                <p>${DescifrarASCII(direccion)}</p>
//            </div>
//            <div>
//                <iframe src="${DescifrarASCII(SRC)}" width="75%" height="300" frameborder="0" allowfullscreen></iframe>
//            </div>
//            <button type="button" id="ADRegreso" class="btn">Atrás</button>
//        </div>`;
//    
//    document.getElementById("ADInformacion").lastElementChild.remove();
//    document.getElementById("ADInformacion").firstElementChild.remove();
//    document.getElementById("ADInformacion").insertAdjacentHTML("beforeend",templateTitulo+templateContenido+`</div>`+templateLDerecho);
//    /* Redirección para mostrar o ocultar Botones o ContBotones */
//    $("#ADRegreso").on("click", function(){
//        $("#BotonesSedesADInformacion").show(200, function(){});
//        $("#ADInformacion").hide(200, function(){});
//    });
//
//    
//    $("#ADInformacion").show(100, function(){});
//    $("#BotonesSedesADInformacion").hide(100, function(){});
//}
// </editor-fold>
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Sección PQRSF">
$(document).ready(function () {
    /* Inicio Listar y Registrar ocultando uno*/
    $('#PqrsfListar').show();
    $('#PqrsfRegistrar').hide();
    
    if (document.getElementById("regBtnPqrsf") !== null){
        var validacion = document.getElementById("perfilIDUsuario");
        if (validacion === null){
            document.getElementById("regBtnPqrsf").type = "button";
        } else {
            document.getElementById("regBtnPqrsf").type = "submit";
        }
    }
    
    /* Redirección de boton Acceder para indexUsuario */
    $('.sectionPqrsf .sectionPqrsfR .sectionPqrsfRContent .sectionPqrsfRContentDtdo #Acceder').click(function(){
        var accederAltura = $('.sectionAcceso').offset().top;
        $('body, html').animate({
            scrollTop: accederAltura+'px'
        }, 600);
        document.getElementById("accederEmail").focus();
    });
});

/* Redirección para mostrar o ocultar Listar o Registrar */
$(".sectionPqrsf .sectionPqrsfL .tabla-reg button").on("click", function(){
    $("#PqrsfRegistrar").show(200, function(){});
    $("#PqrsfListar").hide(200, function(){});
});

$("#MisSolis").on("click", function(){
    $("#PqrsfListar").show(200, function(){});
    $("#PqrsfRegistrar").hide(200, function(){});
});

function estructurarFecha(whatNeed, fecha){
    var adr = "";
    var mdr = "";
    var ddr = "";
    var yheq = 1;
    for (var n = 0; n < fecha.length; n++) {
        var c = fecha.charAt(n);
        if (c !== '-'){
            if (yheq === 1){
                adr = adr + c;
            } else if (yheq === 2){
                mdr = mdr+ c;
            } else if (yheq === 3){
                ddr = ddr + c;
            }
        } else {
            yheq = yheq + 1;
        }
    }
    yheq = 1;
    
    if (whatNeed === "dd"){
        return ddr;
    } else if (whatNeed === "mm"){
        return mdr;
    } else {
        return adr;
    }
}
function estructurarHora(whatNeed, hora){
    var hhdr = "";
    var mhdr = "";
    var shdr = "";
    var yheq = 1;
    for (var n = 0; n < hora.length; n++) {
        var c = hora.charAt(n);
        if (c !== ':'){
            if (yheq === 1){
                hhdr = hhdr + c;
            } else if (yheq === 2){
                mhdr = mhdr+ c;
            } else if (yheq === 3){
                shdr = shdr + c;
            }
        } else {
            yheq = yheq + 1;
        }
    }
    yheq = 1;
    
    if (whatNeed === "h"){
        return hhdr;
    } else if (whatNeed === "m"){
        return mhdr;
    } else {
        return shdr;
    }
}

function pqrsfVerModal(fechingr,
        horaingr,
        tiposoli,
        diri,
        consulta,
        inter,
        respuesta,
        sedediri) {
            
    document.getElementById('verFechaPQRSF').innerText = estructurarFecha("dd", fechingr)+" / "+estructurarFecha("mm", fechingr)+" / "+estructurarFecha("aa", fechingr);
    document.getElementById('verHoraPQRSF').innerText = estructurarHora("h", horaingr)+" : "+estructurarHora("m", horaingr);
    document.getElementById('verTipoSolicitudPQRSF').innerText = tiposoli;
    document.getElementById('verDirigidoAPQRSF').innerText = diri;
    document.getElementById('verConsultaPQRSF').innerText = DescifrarASCII(consulta);
    document.getElementById('verSedePQRSF').innerText = DescifrarASCII(sedediri);
    if (inter.length === 0){
        document.getElementById('verInterlocutorPQRSF').innerText = "Sin interlocutor";
    } else {
        document.getElementById('verInterlocutorPQRSF').innerText = DescifrarASCII(inter)+"\nGerente";
    }
    if (respuesta === "83S105S110S32S114S101S115S112S117S101S115S116S97"){
        document.getElementById('verRespuestaPQRSF').innerText = "Sin respuesta";
    } else {
        document.getElementById('verRespuestaPQRSF').innerText = DescifrarASCII(respuesta);
    }
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Estado de Acordeones">
$('.collapse').on('shown.bs.collapse', function(){ 
    $(this).parent().find(".bc .glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus"); 
}).on('hidden.bs.collapse', function(){ 
    $(this).parent().find(".bc .glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus"); 
});
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Cifrado ASCII">
function CifrarASCII(texto){
    if (texto === null){
        return "";
    } else {
        if (texto.length > 0){
            var cifrado = "";
            for (var i = 0; i < texto.length; i++) {
                cifrado = cifrado + texto.charCodeAt(i)+"S";
            }
            cifrado = cifrado.substring(0, cifrado.length - 1);
            return cifrado;
        } else {
            return "";
        }
    }
}
function DescifrarASCII(texto){
    if (texto === null){
        return "";
    } else {
        if (texto.length > 0){
            var descifrado = "";
            var vect = texto.split("S");
            for (var i = 0; i < vect.length; i++) {
                descifrado = descifrado + String.fromCharCode(vect[i]);
            }
            return descifrado;
        } else {
            return "";
        }
    } 
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="AutoClose de Alertas">
$(".alert").delay(10000).slideUp(200, function() {
    $(this).alert('close');
});
// </editor-fold>