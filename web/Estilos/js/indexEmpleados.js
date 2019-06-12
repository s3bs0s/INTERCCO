// <editor-fold defaultstate="collapsed" desc="Header"> 
$(document).ready(function () {
    var sPath = window.location.pathname;
    var sPage = sPath.substring(sPath.lastIndexOf('/') + 1);
    if (sPage === "Acceder"){
        $('a[href="index"]').addClass("header-active");
    } else {
        $('a[href="'+sPage+'"]').addClass("header-active");
    }
    
    var altura = $('.navslogo').offset().top;
    if ($(window).scrollTop() > altura) {
        $('.navslogo').addClass('navclogo');
        $('.logonav-slogo').addClass('logonav-clogo');
        $('.menuprin-slogo').addClass('menuprin-clogo');

        $('.navrnlogo').addClass('navrlogo');
    } else {
        $('.navslogo').removeClass('navclogo');
        $('.logonav-slogo').removeClass('logonav-clogo');
        $('.menuprin-slogo').removeClass('menuprin-clogo');

        $('.navrnlogo').removeClass('navrlogo');
    }
    $(window).on('scroll', function () {
        if ($(window).scrollTop() > altura) {
            $('.navslogo').addClass('navclogo');
            $('.logonav-slogo').addClass('logonav-clogo');
            $('.menuprin-slogo').addClass('menuprin-clogo');
            
            $('.navrnlogo').addClass('navrlogo');
        } else {
            $('.navslogo').removeClass('navclogo');
            $('.logonav-slogo').removeClass('logonav-clogo');
            $('.menuprin-slogo').removeClass('menuprin-clogo');
            
            $('.navrnlogo').removeClass('navrlogo');
        }
    });
});

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

// <editor-fold defaultstate="collapsed" desc="Modulos">
// <editor-fold defaultstate="collapsed" desc="Herramientas">
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
function MOPass (mod) {
    var typeInp = document.getElementById('InpMOPassword'+mod).type;
    if (typeInp === "password"){
        document.getElementById('InpMOPassword'+mod).type = 'text';
        document.getElementById('InpMOPassword'+mod).focus();
        document.getElementById('BtnMOPassword'+mod).innerText = "Ocultar";
    } else {
        document.getElementById('InpMOPassword'+mod).type = 'password';
        document.getElementById('InpMOPassword'+mod).focus();
        document.getElementById('BtnMOPassword'+mod).innerText = "Mostrar";
    }
}
$('.collapse').on('shown.bs.collapse', function(){ 
    $(this).parent().find(".bc .glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus"); 
}).on('hidden.bs.collapse', function(){ 
    $(this).parent().find(".bc .glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus"); 
});
$(".alert").delay(10000).slideUp(200, function() {
    $(this).alert('close');
});
var nav1 = window.Event ? true : false; 
function acceptNum(evt){
    var key1 = nav1 ? evt.which : evt.keyCode;
    return key1 >= 48 && key1 <= 57;
}
var nav2 = window.Event ? true : false; 
function acceptNP(evt){
    var key2 = nav2 ? evt.which : evt.keyCode;
    return key2 === 46 || (key2 >= 48 && key2 <= 57);
}
var nav3 = window.Event ? true : false; 
function refuseCPyP(evt){
    var key3 = nav3 ? evt.which : evt.keyCode;
    return ((key3 <= 156 || key3 >= 158) && (key3 <= 145 || key3 >= 147));
}
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
function formatNumber(numero, idElem, tipoModal) {
    // Variable que contendra el resultado final
    var resultado = "";
    var nuevoNumero;

    // Cogemos el numero eliminando los posibles puntos que tenga
    nuevoNumero = numero.replace(/\./g, '');

    // Ponemos un punto cada 3 caracteres
    for (var j, i = nuevoNumero.length - 1, j = 0; i >= 0; i--, j++) {
        resultado = nuevoNumero.charAt(i) + ((j > 0) && (j % 3 === 0) ? "." : "") + resultado;
    }
    
    if (tipoModal === "ver"){
        document.getElementById(idElem).innerText = resultado;
    } else {
        document.getElementById(idElem).value = resultado;
    }
}
function horaMilitarANormal(hora){
    var horaLimpia = hora.replace(":", "");
    var milTime = parseInt(horaLimpia);
    var pm;

    /* Se determina si es AM o PM y se convierte de hora militar a normal */
    if (milTime > 1159) {
        pm = true;
        milTime = (milTime - 1200);
    } else {
        pm = false;
    }

    /* Estructuración de la hora normal */
    var fourthDigit = parseInt(milTime % 10);
    milTime = parseInt(milTime / 10);
    var thirdDigit = parseInt(milTime % 10);
    milTime = parseInt(milTime / 10);
    var secondDigit = parseInt(milTime % 10);
    milTime = parseInt(milTime / 10);
    var firstDigit = parseInt(milTime % 10);

    var minutesString = thirdDigit + "" + fourthDigit;
    var hoursString = firstDigit + "" + secondDigit;

    /* Se determina si es 00 para modificarlo por 12 en hor */
    if (firstDigit === 0 && secondDigit === 0) {
        hoursString = "12";
    }

    /* Fin */
    if (pm === true) {
        return hoursString + ":" + minutesString + " p.m.";
    } else {
        return hoursString + ":" + minutesString + " a.m.";
    }
}
// </editor-fold>


// <editor-fold defaultstate="collapsed" desc="Pedidos">
$(document).ready(function () {
    var bdListarP = document.getElementById("pedidosListar");
    if (bdListarP !== null){
        $.ajax({
            url: 'PEDRellenoCartaAJAX',
            type: 'GET',
            dataType: 'json',
            success: function(response){
                let objetoCategorias = response[0].categorias;
                let objetoProductos = response[0].productos;
                let templateOptionsCategoria = ``;
                let templateSelectsProductos = `<span class="input-group-addon">Producto:</span>`;

                for (var i = 0; i < objetoCategorias.length; i++) {
                    templateOptionsCategoria += `<option value="${objetoCategorias[i].idCategorias}">${objetoCategorias[i].nombre}</option>`;
                }
                for (var i = 0; i < objetoCategorias.length; i++) {
                    templateSelectsProductos += `<select required onchange="validacionProducto(this, 'reg'); $('#regBtnAgregarPedidos').removeAttr('disabled')" class="form-control" id="reg${objetoCategorias[i].idCategorias}C">`;
                    for (var e = 0; e < objetoProductos.length; e++) {
                        if (objetoProductos[e].idCategoria === objetoCategorias[i].idCategorias){
                            templateSelectsProductos += `<option value="${objetoProductos[e].idProductos+";"+objetoProductos[e].descripcion+";"+objetoProductos[e].precio}">${objetoProductos[e].nombre}</option>`;
                        }
                    }
                    templateSelectsProductos += `</select>`;
                }
                $('#regCategoriaPedidos').html(templateOptionsCategoria);
                $('#regCJSProductosPedidos').html(templateSelectsProductos);
                $("#regCJSProductosPedidos select").hide();
                $("#regCJSProductosPedidos #reg"+document.getElementById("regCategoriaPedidos").value+"C").show();
            }
        });
        $.ajax({
            url: 'PEDRellenoCartaAJAX',
            type: 'GET',
            dataType: 'json',
            success: function(response){
                let objetoCategorias = response[0].categorias;
                let objetoProductos = response[0].productos;
                let templateOptionsCategoria = ``;
                let templateSelectsProductos = `<span class="input-group-addon">Producto:</span>`;

                for (var i = 0; i < objetoCategorias.length; i++) {
                    templateOptionsCategoria += `<option value="${objetoCategorias[i].idCategorias}">${objetoCategorias[i].nombre}</option>`;
                }
                for (var i = 0; i < objetoCategorias.length; i++) {
                    templateSelectsProductos += `<select required onchange="validacionProducto(this, 'actua'); $('#actuaBtnAgregarPedidos').removeAttr('disabled')" class="form-control" id="actua${objetoCategorias[i].idCategorias}C">`;
                    for (var e = 0; e < objetoProductos.length; e++) {
                        if (objetoProductos[e].idCategoria === objetoCategorias[i].idCategorias){
                            templateSelectsProductos += `<option value="${objetoProductos[e].idProductos+";"+objetoProductos[e].descripcion+";"+objetoProductos[e].precio}">${objetoProductos[e].nombre}</option>`;
                        }
                    }
                    templateSelectsProductos += `</select>`;
                }
                $('#actuaCategoriaPedidos').html(templateOptionsCategoria);
                $('#actuaCJSProductosPedidos').html(templateSelectsProductos);
                $("#actuaCJSProductosPedidos select").hide();
                $("#actuaCJSProductosPedidos #actua"+document.getElementById("actuaCategoriaPedidos").value+"C").show();
            }
        });
        rellenoMesasDisponibles('reg', 'N');
        $("#pedidosActualizar").hide();
        $("#pedidosRegistrar").hide();
        $("#regSpanWarningPedidos").hide();
        document.getElementById("regSubtotalPedidos").value = 0;
        document.getElementById("regCantidadPedidos").value = 1;
        localStorage.setItem("regCantProductosP", "0");
        
        $('#btnRegistrarPedidos').click(function(){
            $("#pedidosListar").hide();
            $('#pedidosRegistrar').show();
        });
        
        $('.btnListarPedidos').click(function(){
            $("#pedidosActualizar").hide();
            $("#pedidosRegistrar").hide();
            $('#pedidosListar').show();
        });
        
        $('.btnListarRutaPedidos').click(function(){
            $("#pedidosActualizar").hide();
            $("#pedidosRegistrar").hide();
            $('#pedidosListar').show();
        });
    }
});
function rellenoMesasDisponibles(method, mesaActua){
    $.post('PEDRellenoMesasAJAX', { mesaActua }, function(response){
        let arrayMesas = response.split(";");
        let templateOptionsMesas = ``;

        for (var i = 0; i < arrayMesas.length; i++) {
            templateOptionsMesas += `<option value="${arrayMesas[i]}">Mesa ${arrayMesas[i]}</option>`;
        }
        $('#'+method+'MesaPedidos').html(templateOptionsMesas);
        if (method === "actua"){
            document.getElementById("actuaMesaPedidos").value = mesaActua;
        }
    });
}
function cambioCategoria(idcate, method){
    $("#"+method+"CJSProductosPedidos select").hide();
    var selectProductos = $("#"+method+"CJSProductosPedidos #"+method+idcate+"C");
    var selectProductosOption = document.getElementById(method+idcate+"C");
    selectProductos.show();
    validacionProducto(selectProductosOption, method);
}
function validacionProducto(producto, method){
    var selectProductosOption = producto;
    var arrayInfoProducto = selectProductosOption.value.split(';');
    
    $.ajax({
        url: 'PEDProductoDisponibleAJAX',
        type: 'POST',
        data: {idProducto : arrayInfoProducto[0]},
        dataType: 'json',
        success: function(response){
            let objetoInsumos = response[0].insumos;
            let objetoDetallesProductos = response[0].detallesProductos;
            
            let productoValido = true;
            for (var i = 0; i < objetoDetallesProductos.length; i++) {
                for (var e = 0; e < objetoInsumos.length; e++) {
                    if (objetoInsumos[e].idInsumos === objetoDetallesProductos[i].idInsumoNecesario){
                        if (objetoInsumos[e].cantidad < (objetoDetallesProductos[i].cantidadInsumo*parseInt(document.getElementById(method+"CantidadPedidos").value))){
                            productoValido = false;
                            break;
                        }
                    }
                }
                if (!productoValido){
                    break;
                }
            }

            if (!productoValido){
                if (document.getElementById(method+"CantidadPedidos").value === "1"){
                    $.confirm({
                        animation: 'rotateX',
                        closeAnimation: 'zoom',
                        title: 'Producto Agotado!',
                        content: 'El producto <b>'+selectProductosOption.options[selectProductosOption.selectedIndex].text+'</b> no tiene suficientes insumos para su producción.',
                        type: 'red',
//                        columnClass: 'col-md-6 col-md-offset-3',
                        icon: 'fa fa-warning',
                        typeAnimated: true,
                        closeIconClass: 'fa fa-close',
                        buttons: {
                            tryAgain: {
                                text: 'Entiendo',
                                btnClass: 'btn-red',
                                action: function(){
                                    selectProductosOption.options[selectProductosOption.selectedIndex].remove();
                                    document.getElementById(method+"CantidadPedidos").value = 1;
                                    document.getElementById(method+"ObservacionPedidos").value = "";
                                }
                            }
                        }
                    });
                } else {
                    $.confirm({
                        animation: 'rotateX',
                        closeAnimation: 'zoom',
                        title: 'Insumos Insuficientes!',
                        content: 'Debe ingresar una cantidad menor para el producto <b>'+selectProductosOption.options[selectProductosOption.selectedIndex].text+'</b>, porque no hay suficientes insumos para la producción.',
                        type: 'red',
                        icon: 'fa fa-warning',
                        typeAnimated: true,
                        closeIconClass: 'fa fa-close',
                        buttons: {
                            tryAgain: {
                                text: 'Entiendo',
                                btnClass: 'btn-red',
                                action: function(){
                                    document.getElementById(method+"CantidadPedidos").value = 1;
                                }
                            }
                        }
                    });
                }
            }
        }
    });
}
function validacionCantidad(input,content){
    if (content === "0" || content === 0){
        input.value = 1;
    } else {
        if (content.length > 3){
            input.value = content.substring(0,content.length-1);
        }
    }
}
function agregarProductoPedido(method){
    var lSt = localStorage;
    
    var selectCategorias = document.getElementById(method+"CategoriaPedidos");
    var idCategoria = selectCategorias.value;
    var nomCategoria = selectCategorias.options[selectCategorias.selectedIndex].text;
    var selectProductos = document.getElementById(method+idCategoria+"C");
    var infoProducto = selectProductos.value.split(";"); // ID, Descripcion, Precio
    
    if (selectProductos.value.length > 0){
        var nomProducto = selectProductos.options[selectProductos.selectedIndex].text;
        var optionProducto = selectProductos.options[selectProductos.selectedIndex];
        var cantidad = document.getElementById(method+"CantidadPedidos").value;
        var subTotalProductos = parseInt(infoProducto[2])*cantidad;
        var observacion = document.getElementById(method+"ObservacionPedidos").value;
        if (observacion.length === 0){
            observacion = "Vacio";
        }
        
        $.post('PEDGastoInsumosAJAX', {idProducto : infoProducto[0],cantidadProductos : cantidad,operacion : '-'}, function(response){
            if (response === "success"){
                
                if (method === "actua"){
                    
                    var numProductoAGGPedido = parseInt(lSt.getItem("actuaCantProductosP"));
                    var validateActua = false;
                    for (var i = 1; i <= numProductoAGGPedido; i++) {
                        var infoProductoPPArray = document.getElementById("actua"+i+"InputPP").value.split(";");
                        if (infoProductoPPArray[0] === infoProducto[0]){
                            numProductoAGGPedido = i;
                            validateActua = true;
                            break;
                        }
                    }
                    
                    if (!validateActua){
                        numProductoAGGPedido += 1;
                        lSt.setItem("actuaCantProductosP", numProductoAGGPedido);
                        var templateInptHide = `
                            <div class="input-group inpDesa">
                                <input type="text" class="form-control" name="actua${numProductoAGGPedido}InputPP" id="actua${numProductoAGGPedido}InputPP">
                            </div>`;
                        document.getElementById("actuaCAJProductosPedidos").insertAdjacentHTML("beforeend",templateInptHide);
                    }

                    var campoSubtotal = document.getElementById("actuaSubtotalPedidos");
                    campoSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campoSubtotal.value))+parseInt(subTotalProductos));

                    $('.actuaTablaListarProductosPedido').DataTable().row.add( [
                        nomCategoria,
                        nomProducto,
                        `<div class="td-espaciado">
                            <button type="button" id="${method+numProductoAGGPedido}BtnMenosRowPP" onclick="cantProductoPedido('resta', '${numProductoAGGPedido}', '${method}')" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                                <span id="${method+numProductoAGGPedido}CantRowPP">${cantidad}</span>
                            <button type="button" id="${method+numProductoAGGPedido}BtnMasRowPP" onclick="cantProductoPedido('suma', '${numProductoAGGPedido}', '${method}')" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
                        </div>`,
                        `<span id="${method+numProductoAGGPedido}SubtotalRowPP">`+formatNumberReturn(subTotalProductos)+`</span>`,
                        `<div class="td-espaciado">
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#productoPedidoVerModal" onClick="productoPedidoVerModal('${CifrarASCII(nomCategoria)}', '${CifrarASCII(nomProducto)}', '${infoProducto[2]}', '${infoProducto[1]}', '${numProductoAGGPedido}', '${method}')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#productoPedidoAModal" onClick="productoPedidoActualizarModal('${numProductoAGGPedido}', 'actuaV', '${method}')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                            <button type="button" onclick="sacarProductoPedido(this, '${numProductoAGGPedido}', '${method+idCategoria}C', '${CifrarASCII(nomProducto)}', '${method}')" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Sacar</button>
                        </div>`
                    ] ).draw();
                    
                    document.getElementById("actua"+numProductoAGGPedido+"InputPP").value = infoProducto[0]+";"+infoProducto[1]+";"+infoProducto[2]+";"+cantidad+";"+CifrarASCII(observacion)+";"+subTotalProductos+";X;Nuevo;Y";
                    
                } else {
                    
                    numProductoAGGPedido = parseInt(lSt.getItem(method+"CantProductosP"))+1;
                    
                    lSt.setItem("regCantProductosP", numProductoAGGPedido);

                    var templateInptHide = `
                        <div class="input-group inpDesa">
                            <input type="text" class="form-control" name="${method+numProductoAGGPedido}InputPP" id="${method+numProductoAGGPedido}InputPP">
                        </div>`;

                    var campoSubtotal = document.getElementById(method+"SubtotalPedidos");
                    campoSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campoSubtotal.value))+parseInt(subTotalProductos));

                    document.getElementById(method+"CAJProductosPedidos").insertAdjacentHTML("beforeend",templateInptHide);
                    $('.'+method+'TablaListarProductosPedido').DataTable().row.add( [
                        nomCategoria,
                        nomProducto,
                        `<div class="td-espaciado">
                            <button type="button" id="${method+numProductoAGGPedido}BtnMenosRowPP" onclick="cantProductoPedido('resta', '${numProductoAGGPedido}', '${method}')" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                                <span id="${method+numProductoAGGPedido}CantRowPP">${cantidad}</span>
                            <button type="button" id="${method+numProductoAGGPedido}BtnMasRowPP" onclick="cantProductoPedido('suma', '${numProductoAGGPedido}', '${method}')" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
                        </div>`,
                        `<span id="${method+numProductoAGGPedido}SubtotalRowPP">`+formatNumberReturn(subTotalProductos)+`</span>`,
                        `<div class="td-espaciado">
                            <button type="button" class="btn btn-info" data-toggle="modal" data-target="#productoPedidoVerModal" onClick="productoPedidoVerModal('${CifrarASCII(nomCategoria)}', '${CifrarASCII(nomProducto)}', '${infoProducto[2]}', '${infoProducto[1]}', '${numProductoAGGPedido}', '${method}')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                            <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#productoPedidoAModal" onClick="productoPedidoActualizarModal('${numProductoAGGPedido}', 'actuaV', '${method}')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                            <button type="button" onclick="sacarProductoPedido(this, '${numProductoAGGPedido}', '${method+idCategoria}C', '${CifrarASCII(nomProducto)}', '${method}')" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Sacar</button>
                        </div>`
                    ] ).draw();
                    
                    document.getElementById("reg"+numProductoAGGPedido+"InputPP").value = infoProducto[0]+";"+infoProducto[1]+";"+infoProducto[2]+";"+cantidad+";"+CifrarASCII(observacion)+";"+subTotalProductos;
                    
                }

                document.getElementById(method+"CantidadPedidos").value = 1;
                document.getElementById(method+"ObservacionPedidos").value = "";
                optionProducto.remove();
            } else {
                if (document.getElementById(method+"CantidadPedidos").value === "1"){
                    $.confirm({
                        animation: 'rotateX',
                        closeAnimation: 'zoom',
                        title: 'Producto Agotado!',
                        content: 'El producto <b>'+nomProducto+'</b> no tiene suficientes insumos para su producción.',
                        type: 'red',
                        icon: 'fa fa-warning',
                        typeAnimated: true,
                        closeIconClass: 'fa fa-close',
                        buttons: {
                            tryAgain: {
                                text: 'Entiendo',
                                btnClass: 'btn-red',
                                action: function(){
                                    optionProducto.remove();
                                    document.getElementById(method+"CantidadPedidos").value = 1;
                                    document.getElementById(method+"ObservacionPedidos").value = "";
                                }
                            }
                        }
                    });
                } else {
                    $.confirm({
                        animation: 'rotateX',
                        closeAnimation: 'zoom',
                        title: 'Insumos Insuficientes!',
                        content: 'Debe ingresar una cantidad menor para el producto <b>'+nomProducto+'</b>, porque no hay suficientes insumos para la producción.',
                        type: 'red',
                        icon: 'fa fa-warning',
                        typeAnimated: true,
                        closeIconClass: 'fa fa-close',
                        buttons: {
                            tryAgain: {
                                text: 'Entiendo',
                                btnClass: 'btn-red',
                                action: function(){
                                    document.getElementById(method+"CantidadPedidos").value = 1;
                                }
                            }
                        }
                    });
                }
            }
        });
        
    } else {
        $("#"+method+"BtnAgregarPedidos").attr('disabled', '');
    }
}
function sacarProductoPedido(button, numRow, idSelectProd, nomProducto, method){
    var infoProductoPPArr = document.getElementById(method+numRow+"InputPP").value.split(";");
    var templateOption = '<option value="'+infoProductoPPArr[0]+';'+infoProductoPPArr[1]+';'+infoProductoPPArr[2]+'">'+DescifrarASCII(nomProducto)+'</option>';
    $.post('PEDGastoInsumosAJAX', {idProducto : infoProductoPPArr[0],cantidadProductos : infoProductoPPArr[3],operacion : '+'});
    document.getElementById(idSelectProd).insertAdjacentHTML("beforeend",templateOption);
    var campSubtotal = document.getElementById(method+"SubtotalPedidos");
    campSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campSubtotal.value))-parseInt(infoProductoPPArr[5]));
    
    if (method === "reg"){
        $("#reg"+numRow+"InputPP").parent('div').remove();
        $('.regTablaListarProductosPedido').DataTable().row($(button).parents('tr')).remove().draw(false);
    } else {
        document.getElementById("actua"+numRow+"InputPP").value = infoProductoPPArr[0]+";"+infoProductoPPArr[1]+";"+infoProductoPPArr[2]+";"+infoProductoPPArr[3]+";"+infoProductoPPArr[4]+";"+infoProductoPPArr[5]+";"+infoProductoPPArr[6]+";"+infoProductoPPArr[7]+";N";
        $('.actuaTablaListarProductosPedido').DataTable().row($(button).parents('tr')).remove().draw(false);
    }
}
function cantProductoPedido(tipoOpe, numRow, method){
    var inpProductoArr = document.getElementById(method+numRow+"InputPP").value.split(";");
    if (tipoOpe === "resta"){
        if (parseInt(inpProductoArr[3]) > 1){
            var infoNuevaInp;
            if (method === "actua"){
                infoNuevaInp = inpProductoArr[0]+";"+inpProductoArr[1]+";"+inpProductoArr[2]+";"+(parseInt(inpProductoArr[3])-1)+";"+inpProductoArr[4]+";"+(parseInt(inpProductoArr[5])-parseInt(inpProductoArr[2]))+";"+inpProductoArr[6]+";"+inpProductoArr[7]+";"+inpProductoArr[8];
            } else {
                infoNuevaInp = inpProductoArr[0]+";"+inpProductoArr[1]+";"+inpProductoArr[2]+";"+(parseInt(inpProductoArr[3])-1)+";"+inpProductoArr[4]+";"+(parseInt(inpProductoArr[5])-parseInt(inpProductoArr[2]));
            }
            $.post('PEDGastoInsumosAJAX', {idProducto : inpProductoArr[0],cantidadProductos : '1',operacion : '+'});
            var campSubtotal = document.getElementById(method+"SubtotalPedidos");
            campSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campSubtotal.value))-parseInt(inpProductoArr[2]));
            document.getElementById(method+numRow+"CantRowPP").innerText = parseInt(inpProductoArr[3])-1;
            document.getElementById(method+numRow+"InputPP").value = infoNuevaInp;
            document.getElementById(method+numRow+"SubtotalRowPP").innerText = formatNumberReturn(parseInt(inpProductoArr[5])-parseInt(inpProductoArr[2]));
            $("#"+method+numRow+"BtnMasRowPP").removeAttr('disabled');
        } else {
            $("#"+method+numRow+"BtnMenosRowPP").attr('disabled','');
        }
    } else {
        if (parseInt(inpProductoArr[3]) < 99){
            $.post('PEDGastoInsumosAJAX', {idProducto : inpProductoArr[0],cantidadProductos : '1',operacion : '-'}, function(response){
                if (response === "success"){
                    var infoNuevaInp;
                    if (method === "actua"){
                        infoNuevaInp = inpProductoArr[0]+";"+inpProductoArr[1]+";"+inpProductoArr[2]+";"+(parseInt(inpProductoArr[3])+1)+";"+inpProductoArr[4]+";"+(parseInt(inpProductoArr[5])+parseInt(inpProductoArr[2]))+";"+inpProductoArr[6]+";"+inpProductoArr[7]+";"+inpProductoArr[8];
                    } else {
                        infoNuevaInp = inpProductoArr[0]+";"+inpProductoArr[1]+";"+inpProductoArr[2]+";"+(parseInt(inpProductoArr[3])+1)+";"+inpProductoArr[4]+";"+(parseInt(inpProductoArr[5])+parseInt(inpProductoArr[2]));
                    }
                    var campSubtotal = document.getElementById(method+"SubtotalPedidos");
                    campSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campSubtotal.value))+parseInt(inpProductoArr[2]));
                    document.getElementById(method+numRow+"CantRowPP").innerText = parseInt(inpProductoArr[3])+1;
                    document.getElementById(method+numRow+"InputPP").value = infoNuevaInp;
                    document.getElementById(method+numRow+"SubtotalRowPP").innerText = formatNumberReturn(parseInt(inpProductoArr[5])+parseInt(inpProductoArr[2]));
                    $("#"+method+numRow+"BtnMenosRowPP").removeAttr('disabled');
                } else {
                    $.confirm({
                        animation: 'rotateX',
                        closeAnimation: 'zoom',
                        title: 'Insumos Insuficientes!',
                        content: 'El producto ya no tiene más insumos para su producción.',
                        type: 'red',
                        icon: 'fa fa-warning',
                        typeAnimated: true,
                        closeIconClass: 'fa fa-close',
                        buttons: {
                            tryAgain: {
                                text: 'Entiendo',
                                btnClass: 'btn-red',
                                action: function(){
                                    $("#"+method+numRow+"BtnMasRowPP").attr('disabled','');
                                }
                            }
                        }
                    });
                }
            });
        } else {
            $("#"+method+numRow+"BtnMasRowPP").attr('disabled','');
        }
    }
}
function registrarPedido(method){
    if (method === "actua"){
        var numProductoAGGPedido = parseInt(localStorage.getItem("actuaCantProductosP"));
        var validateActua = false;
        for (var i = 1; i <= numProductoAGGPedido; i++) {
            var infoProductoPPArray = document.getElementById("actua"+i+"InputPP").value.split(";");
            if (infoProductoPPArray[8] === "Y"){
                validateActua = true;
                break;
            }
        }
        
        if (validateActua){
            $("#actuaSubtotalPedidos").removeAttr("disabled");
            var templateInptHide = `
                <div class="input-group inpDesa">
                    <input type="text" class="form-control" name="actuaNumsInputPP" id="actuaNumsInputPP">
                </div>`;
            document.getElementById("actuaCAJProductosPedidos").insertAdjacentHTML("beforeend",templateInptHide);
            document.getElementById("actuaNumsInputPP").value = localStorage.getItem("actuaCantProductosP");
            document.getElementById("actuaFormPedidos").action = "PedidoA";
            document.getElementById("actuaFormPedidos").submit();
        } else {
            console.log("Holi");
            $("#actuaSpanWarningPedidos").show();
            $("#actuaSpanWarningPedidos").css('margin-top','-2px');
            $("#actuaSpanWarningPedidos").css('display','block');
            $("#actuaSpanWarningPedidos").css('font-size','16px');
            $("#actuaSpanWarningPedidos").css('letter-spacing','.1.5pt');
            $("#actuaSpanWarningPedidos").parent("button").css('background','#E06666');
        }
    } else {
        var validarProductos = document.getElementById(method+"CAJProductosPedidos").innerHTML;
        if (validarProductos.includes("input-group")){
            $("#regSubtotalPedidos").removeAttr("disabled");
            var templateInptHide = `
                <div class="input-group inpDesa">
                    <input type="text" class="form-control" name="regNumsInputPP" id="regNumsInputPP">
                </div>`;
            document.getElementById("regCAJProductosPedidos").insertAdjacentHTML("beforeend",templateInptHide);
            document.getElementById("regNumsInputPP").value = localStorage.getItem("cantProductosP");
            document.getElementById("regFormPedidos").action = "Pedido";
            document.getElementById("regFormPedidos").submit();
        } else {
            $("#regSpanWarningPedidos").show();
            $("#regSpanWarningPedidos").css('margin-top','-2px');
            $("#regSpanWarningPedidos").css('display','block');
            $("#regSpanWarningPedidos").css('font-size','16px');
            $("#regSpanWarningPedidos").css('letter-spacing','.1.5pt');
            $("#regSpanWarningPedidos").parent("button").css('background','#E06666');
        }
    }
}
function resetNumberReturn(numero) {
    // Variable que contendra el resultado final
    var nuevoNumero = numero.toString().replace(/\./g, '');
    
    return nuevoNumero;
}
function productoPedidoVerModal(nomCate,
        nomProd,
        precio,
        descri,
        numeroRow,
        method) {
    
    $(".collapse").collapse("hide");
    var inpProductoArr = document.getElementById(method+numeroRow+"InputPP").value.split(";");
    document.getElementById("verCategoriaProductoPedido").innerText = DescifrarASCII(nomCate);
    document.getElementById("verProductoProductoPedido").innerText = DescifrarASCII(nomProd);
    document.getElementById("verCantidadProductoPedido").innerText = inpProductoArr[3];
    document.getElementById("verSubtotalProductoPedido").innerText = formatNumberReturn(inpProductoArr[5]);
    if (DescifrarASCII(inpProductoArr[4]) === "Vacio"){
        document.getElementById("verObservacionProductoPedido").innerText = "Sin observación.";
    } else {
        document.getElementById("verObservacionProductoPedido").innerText = DescifrarASCII(inpProductoArr[4]);
    }
    document.getElementById("verCateProProductoPedido").innerText = DescifrarASCII(nomCate);
    document.getElementById("verNomProProductoPedido").innerText = DescifrarASCII(nomProd);
    document.getElementById("verPreProProductoPedido").innerText = formatNumberReturn(precio);
    if (DescifrarASCII(descri) === "Vacio"){
        document.getElementById("verDesProProductoPedido").innerText = "Sin descripción.";
    } else {
        document.getElementById("verDesProProductoPedido").innerText = DescifrarASCII(descri);
    }
}
function productoPAggVerModal(method) {
    
    var selectCategorias = document.getElementById(method+"CategoriaPedidos");
    var idCategoria = selectCategorias.value;
    var nomCategoria = selectCategorias.options[selectCategorias.selectedIndex].text;
    var selectProductos = document.getElementById(method+idCategoria+"C");
    var infoProducto = selectProductos.value.split(";");
    var nomProducto = selectProductos.options[selectProductos.selectedIndex].text;
    
    document.getElementById("verCategoriaProductoPAgg").innerText = nomCategoria;
    document.getElementById("verProductoProductoPAgg").innerText = nomProducto;
    document.getElementById("verPrecioProductoPAgg").innerText = "$ "+formatNumberReturn(infoProducto[2]);
    if (DescifrarASCII(infoProducto[1]) === "Vacio"){
        document.getElementById("verDescripcionProductoPAgg").innerText = "Sin descripción.";
    } else {
        document.getElementById("verDescripcionProductoPAgg").innerText = DescifrarASCII(infoProducto[1]);
    }
}
function productoPedidoActualizarModal(numeroRow,
        tipoBtn,
        method) {
            
    var inpProductoArr = document.getElementById(method+numeroRow+"InputPP").value.split(";");
    
    if (tipoBtn === "actuaV"){
        $("#"+method+"BtnAProductoPedido").attr('onClick', 'productoPedidoActualizarModal("'+numeroRow+'", "actuaA", "'+method+'")');
        $("#productoPedidoAModal textarea").css('color', '#555555');
        if (DescifrarASCII(inpProductoArr[4]) !== "Vacio"){
            document.getElementById("actuaObservacionProductoPedido").value = DescifrarASCII(inpProductoArr[4]);
        } else {
            document.getElementById("actuaObservacionProductoPedido").value = "";
        }
    } else {
        var descripNueva;
        if (document.getElementById("actuaObservacionProductoPedido").value === ""){
            descripNueva = CifrarASCII("Vacio");
        } else {
            descripNueva = CifrarASCII(document.getElementById("actuaObservacionProductoPedido").value);
        }
        var infoNuevaInp;
        if (method === "actua"){
            infoNuevaInp = inpProductoArr[0]+";"+inpProductoArr[1]+";"+inpProductoArr[2]+";"+inpProductoArr[3]+";"+descripNueva+";"+inpProductoArr[5]+";"+inpProductoArr[6]+";"+inpProductoArr[7]+";"+inpProductoArr[8];
        } else {
            infoNuevaInp = inpProductoArr[0]+";"+inpProductoArr[1]+";"+inpProductoArr[2]+";"+inpProductoArr[3]+";"+descripNueva+";"+inpProductoArr[5];
        }
        document.getElementById(method+numeroRow+"InputPP").value = infoNuevaInp;
    }
}
function pedidosVer(rolU,
        nomMesero,
        nomCliente,
        mesa,
        subtotal,
        detallesPedido){
    
    if (rolU === "Gerente"){
        $('#cajGerentePedidos').show();
        $('#hrGerentePedidos').show();
        $('#cajClienteMeseroPedidos').hide();
        document.getElementById('verMeseroPedidos').innerText = DescifrarASCII(nomMesero);
        if (nomCliente.length > 0){
            document.getElementById('verClienteGerentePedidos').innerText = DescifrarASCII(nomCliente);
        } else {
            document.getElementById('verClienteGerentePedidos').innerText = "No tiene";
        }
    } else {
        $('#cajGerentePedidos').hide();
        $('#hrGerentePedidos').hide();
        $('#cajClienteMeseroPedidos').show();
        if (nomCliente.length > 0){
            document.getElementById('verClienteMeseroPedidos').innerText = DescifrarASCII(nomCliente);
        } else {
            document.getElementById('verClienteMeseroPedidos').innerText = "No tiene";
        }
    }
    document.getElementById('verMesaPedidos').innerText = "Mesa "+mesa;
    document.getElementById('verSubtotalPedidos').innerText = formatNumberReturn(subtotal);
    
    detallesPedido = DescifrarASCII(detallesPedido);
    var arregloDetallesPedido = detallesPedido.split(":");
    $('.tablaListarProductos').DataTable().clear().draw();
    
    for (var i = 0; i < arregloDetallesPedido.length; i++) {
        var arregloClasificacion = arregloDetallesPedido[i].split("-");
        var arregloCategoria = arregloClasificacion[0].split(";");
        var arregloProducto = arregloClasificacion[1].split(";");
        var arregloDetallePedido = arregloClasificacion[2].split(";");
        
        $('.tablaListarProductos').DataTable().row.add( [
            DescifrarASCII(arregloCategoria[1]),
            DescifrarASCII(arregloProducto[1]),
            arregloDetallePedido[1],
            DescifrarASCII(arregloDetallePedido[2])==="Vacio"?"No tiene":DescifrarASCII(arregloDetallePedido[2]),
            formatNumberReturn(arregloDetallePedido[3])
        ] ).draw();
    }
}
function pedidosActualizar(idPedido,
        numMesa,
        subtotal,
        detallesPedido){
            
    $.ajax({
        url: 'PEDRellenoCartaAJAX',
        type: 'GET',
        dataType: 'json',
        success: function(response){
            let objetoCategorias = response[0].categorias;
            let objetoProductos = response[0].productos;
            let templateOptionsCategoria = ``;
            let templateSelectsProductos = `<span class="input-group-addon">Producto:</span>`;
            
            for (var i = 0; i < objetoCategorias.length; i++) {
                templateOptionsCategoria += `<option value="${objetoCategorias[i].idCategorias}">${objetoCategorias[i].nombre}</option>`;
            }
            for (var i = 0; i < objetoCategorias.length; i++) {
                templateSelectsProductos += `<select required onchange="validacionProducto(this, 'actua'); $('#actuaBtnAgregarPedidos').removeAttr('disabled')" class="form-control" id="actua${objetoCategorias[i].idCategorias}C">`;
                for (var e = 0; e < objetoProductos.length; e++) {
                    if (objetoProductos[e].idCategoria === objetoCategorias[i].idCategorias){
                        templateSelectsProductos += `<option value="${objetoProductos[e].idProductos+";"+objetoProductos[e].descripcion+";"+objetoProductos[e].precio}">${objetoProductos[e].nombre}</option>`;
                    }
                }
                templateSelectsProductos += `</select>`;
            }
            $('#actuaCategoriaPedidos').html(templateOptionsCategoria);
            $('#actuaCJSProductosPedidos').html(templateSelectsProductos);
            $("#actuaCJSProductosPedidos select").hide();
            $("#actuaCJSProductosPedidos #actua"+document.getElementById("actuaCategoriaPedidos").value+"C").show();
        }
    });
    rellenoMesasDisponibles('actua', numMesa);
    $("#actuaSpanWarningPedidos").hide();
    document.getElementById("actuaIDPedido").value = idPedido;
    document.getElementById("actuaSubtotalPedidos").value = formatNumberReturn(subtotal);
    document.getElementById("actuaCantidadPedidos").value = 1;
    localStorage.setItem("actuaCantProductosP", "0");
    
    var lSt = localStorage;
    detallesPedido = DescifrarASCII(detallesPedido);
    var arregloDetallesPedido = detallesPedido.split(":");
    document.getElementById("actuaCAJProductosPedidos").innerHTML = "";
    $('.actuaTablaListarProductosPedido').DataTable().clear().draw();
    
    for (var i = 0; i < arregloDetallesPedido.length; i++) {
        var arregloClasificacion = arregloDetallesPedido[i].split("-");
        var arregloCategoria = arregloClasificacion[0].split(";");
        var arregloProducto = arregloClasificacion[1].split(";");
        var arregloDetallePedido = arregloClasificacion[2].split(";");
        var numProductoAGGPedido = parseInt(lSt.getItem("actuaCantProductosP"))+1;

        lSt.setItem("actuaCantProductosP", numProductoAGGPedido);
        var templateInptHide = `
            <div class="input-group inpDesa">
                <input type="text" class="form-control" name="actua${numProductoAGGPedido}InputPP" id="actua${numProductoAGGPedido}InputPP">
            </div>`;
        document.getElementById("actuaCAJProductosPedidos").insertAdjacentHTML("beforeend",templateInptHide);

        $('.actuaTablaListarProductosPedido').DataTable().row.add( [
            DescifrarASCII(arregloCategoria[1]),
            DescifrarASCII(arregloProducto[1]),
            `<div class="td-espaciado">
                <button type="button" id="actua${numProductoAGGPedido}BtnMenosRowPP" onclick="cantProductoPedido('resta', '${numProductoAGGPedido}', 'actua')" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                    <span id="actua${numProductoAGGPedido}CantRowPP">${arregloDetallePedido[1]}</span>
                <button type="button" id="actua${numProductoAGGPedido}BtnMasRowPP" onclick="cantProductoPedido('suma', '${numProductoAGGPedido}', 'actua')" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
            </div>`,
            `<span id="actua${numProductoAGGPedido}SubtotalRowPP">`+formatNumberReturn(arregloDetallePedido[3])+`</span>`,
            `<div class="td-espaciado">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#productoPedidoVerModal" onClick="productoPedidoVerModal('${arregloCategoria[1]}', '${arregloProducto[1]}', '${arregloProducto[3]}', '${arregloProducto[2]}', '${numProductoAGGPedido}', 'actua')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                <button type="button" class="btn btn-warning" data-toggle="modal" data-target="#productoPedidoAModal" onClick="productoPedidoActualizarModal('${numProductoAGGPedido}', 'actuaV', 'actua')"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                <button type="button" onclick="sacarProductoPedido(this, '${numProductoAGGPedido}', 'actua${arregloCategoria[0]}C', '${arregloProducto[1]}', 'actua')" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Sacar</button>
            </div>`
        ] ).draw();

        document.getElementById("actua"+numProductoAGGPedido+"InputPP").value = arregloProducto[0]+";"+arregloProducto[2]+";"+arregloProducto[3]+";"+arregloDetallePedido[1]+";"+arregloDetallePedido[2]+";"+arregloDetallePedido[3]+";"+arregloDetallePedido[0]+";Viejo;Y";
        
        
        var selectProductos = document.getElementById("actua"+arregloCategoria[0]+"C");
        var indexOption = $("#actua"+arregloCategoria[0]+"C").children('option[value="'+arregloProducto[0]+';'+arregloProducto[2]+';'+arregloProducto[3]+'"]').index();
        var optionProducto = selectProductos.options[indexOption];
        optionProducto.remove();
    }
    
    $("#pedidosListar").hide();
    $('#pedidosActualizar').show();
    
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Carruseles">
$(document).ready(function () {
    var rHIc = document.getElementById("regHayImagenCarrusel");
    if (rHIc !== null){
        rHIc.value = "N";
        $("#regBtnCarrusel").attr('disabled','');
        document.getElementById("cambHayImagenCarrusel").value = "N";
        $("#cambBtnCarrusel").attr('disabled','');
        $("#regDirigidoAPublicoCarrusel").hide();
    }
});
function cambioDeSelectCarrusel(select, mod){
    if (select.value !== ""){
        if (select.value === "Empresarial"){
            $("#"+mod+"DirigidoAEmpresarialCarrusel").show();
            $("#"+mod+"DirigidoAPublicoCarrusel").hide();
        } else {
            $("#"+mod+"DirigidoAEmpresarialCarrusel").hide();
            $("#"+mod+"DirigidoAPublicoCarrusel").show();
        }
    }
}
function validarFileCarrusel(all,
        mod){
    var extensiones_permitidas = [".png", ".bmp", ".jpg", ".jpeg", ".svg"];
    var tamano = 4; // EXPRESADO EN MB.
    var rutayarchivo = all.value;
    var ultimo_punto = all.value.lastIndexOf(".");
    var extension = rutayarchivo.slice(ultimo_punto, rutayarchivo.length);
    if((all.files[0].size / 1048576) > tamano){
        document.getElementById(mod+"HayImagenCarrusel").value = "N";
        document.getElementById(all.id).value = "";
        document.getElementById(all.id).style.background = "#E06666";
        document.getElementById(all.id).style.color = "#fff";
        $("#"+mod+"BtnCarrusel").attr('disabled','');
    } else {
        if(extensiones_permitidas.indexOf(extension) === -1){
            document.getElementById(mod+"HayImagenCarrusel").value = "N";
            document.getElementById(all.id).value = "";
            document.getElementById(all.id).style.background = "#E06666";
            document.getElementById(all.id).style.color = "#fff";
            $("#"+mod+"BtnCarrusel").attr('disabled','');
        } else {
            $("#"+mod+"BtnCarrusel").removeAttr('disabled');
            document.getElementById(all.id).style.background = "#fff";
            document.getElementById(all.id).style.color = "#555";
            document.getElementById(mod+"HayImagenCarrusel").value = "Y";
        }
    }
}
function carruselesVerModal(rolusu,
        tipo,
        diriA,
        nomimg,
        sede) {
            
    if (tipo === "Publico"){
        document.getElementById('verTipoCarrusel').innerText = "Público";
    } else {
        document.getElementById('verTipoCarrusel').innerText = tipo;
    }
    document.getElementById('verDirigidoACarrusel').innerText = diriA;
    
    if (rolusu === "AdminS"){
        $('#verDivAdminSCarrusel').show();
        $('#verHrAdminSCarrusel').show();
        document.getElementById('verNombreImgCarrusel').innerText = DescifrarASCII(nomimg);
        document.getElementById('verSedeCarrusel').innerText = DescifrarASCII(sede);
    } else {
        $('#verDivAdminSCarrusel').hide();
        $('#verHrAdminSCarrusel').hide();
    }
    document.getElementById('verImgCarrusel').innerHTML = "<img alt=\""+DescifrarASCII(nomimg)+"\" src=\"ArchivosSistema/Carruseles/"+DescifrarASCII(sede)+"/"+DescifrarASCII(nomimg)+"\">";
}
function carruselesActualizarModal(idcarr,
        tipo,
        diriA) {
            
    $("#carruselesAGerenteModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaIDCarrusel').value = idcarr;
    document.getElementById('actuaTipoCarrusel').value = tipo;
    if (tipo === "Empresarial"){
        $("#actuaDirigidoAEmpresarialCarrusel").show();
        $("#actuaDirigidoAPublicoCarrusel").hide();
        document.getElementById('actuaDirigidoAEmpresarialCarrusel').value = diriA;
    } else {
        $("#actuaDirigidoAEmpresarialCarrusel").hide();
        $("#actuaDirigidoAPublicoCarrusel").show();
        document.getElementById('actuaDirigidoAPublicoCarrusel').value = diriA;
    }
}
function carruselesCambioModal(idcarr) {
            
    document.getElementById("cambArchivoCarrusel").value = "";
    document.getElementById("cambArchivoCarrusel").style.background = "#fff";
    document.getElementById("cambArchivoCarrusel").style.color = "#55555";
    document.getElementById('cambIDCarrusel').value = idcarr;
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Promociones">
function promocionesVerModal(nompro,
        fchcadu,
        porc,
        precio) {
            
    document.getElementById('verProductoPromocion').innerText = DescifrarASCII(nompro);
    document.getElementById('verFchCaducidadPromocion').innerText = estructurarFecha("dd",fchcadu)+" del "+estructurarFecha("mm",fchcadu)+" de "+estructurarFecha("aa",fchcadu);
    document.getElementById('verPorcentajePromocion').innerText = porc+" %";
    var precioDesc = formatNumberReturn( precio - ( ( precio * porc ) / 100.0) );
    document.getElementById('verPrecioPorcenPromocion').innerHTML = "Precio Oficial <b>-></b> "+formatNumberReturn(precio)+"<br>Precio con Descuento <b>-></b> "+precioDesc;
}
function promocionesActualizarModal(idprom,
        porc,
        fchc) {
            
    $("#promocionesAGerenteModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaIDPromocion').value = idprom;
    document.getElementById('actuaPorcentajePromocion').value = porc;
    document.getElementById('actuaFechaCaducidadPromocion').value = fchc;
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Productos">
$(document).ready(function(){
    var validacionProducto = document.getElementById("regInsumosPProducto");
    if (validacionProducto !== null){
        validacionExistenciaInsumosP("reg");
        autocompleteInsumosProducto("reg");
        
        var inputCantidadReg = document.getElementById("regCantidadInsumosProducto");
        var inputCantidadActua = document.getElementById("actuaCantidadInsumosProducto");
        inputCantidadReg.addEventListener("keyup", function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById("regBtnAggProducto").click();
            }
        });
        inputCantidadActua.addEventListener("keyup", function (event) {
            if (event.keyCode === 13) {
                event.preventDefault();
                document.getElementById("actuaBtnAggProducto").click();
            }
        });
    }
});
function validacionExistenciaInsumosP(metodo){
    var inputInsumos = document.getElementById(metodo+"InsumosPProducto");
    if (inputInsumos.value.length > 0){
        var valueInput = inputInsumos.value.substring(0,inputInsumos.value.length-1);
        var arrayInsumos = valueInput.split(";");
        var contadorInsumos = 0;
        for (var i = 0; i < arrayInsumos.length; i++) {
            if (metodo === "actua"){
                var arrayInfoInsumo = arrayInsumos[i].split("-");
                if (arrayInfoInsumo[5] !== "N"){
                    contadorInsumos++;
                }
            } else {
                if (arrayInsumos[i] !== "86S97S99S105S111"){
                    contadorInsumos++;
                }
            }
        }
        if (contadorInsumos > 0){
            $("#"+metodo+"BtnProducto").removeAttr('disabled');
        } else {
            $("#"+metodo+"BtnProducto").attr('disabled','');
        }
    } else {
        $("#"+metodo+"BtnProducto").attr('disabled','');
    }
}
function autocompleteInsumosProducto(metodo){
    var select = document.getElementById(metodo+"InsumosProducto");
    if (select.value.length > 0){
        var arrayInfoInsumo = select.value.split(";");
        document.getElementById(metodo+"UnidadMInsumoProducto").value = arrayInfoInsumo[1];
    } else {
        document.getElementById(metodo+"UnidadMInsumoProducto").value = "Seleccioné un Insumo...";
    }
}
function agregarInsumoProducto(metodo){
    var inputInsumos = document.getElementById(metodo+"InsumosPProducto");
    var selectInsumos = document.getElementById(metodo+"InsumosProducto");
    var cantidad = document.getElementById(metodo+"CantidadInsumosProducto");
    
    if (cantidad.value.length > 0 && selectInsumos.value.length > 0){
        selectInsumos.style.background = "#fff";
        cantidad.style.background = "#fff";
        var arrayInfoInsumo = selectInsumos.value.split(";");
        var nomInsumo = selectInsumos.options[selectInsumos.selectedIndex].text;
        var optionInsumo = selectInsumos.options[selectInsumos.selectedIndex];
        
        var posicionInsumosAgg = 0;
        var valueInputInsumos;
        var arrayInputInsumos;
        var arrayInputInfoInsumo;
        if (metodo === "reg"){
            if (inputInsumos.value.length > 0){
                valueInputInsumos = inputInsumos.value.substring(0,inputInsumos.value.length-1);
                arrayInputInsumos = valueInputInsumos.split(";");
                posicionInsumosAgg = arrayInputInsumos.length;
            }
            inputInsumos.value += arrayInfoInsumo[0]+"-"+CifrarASCII(nomInsumo)+"-"+arrayInfoInsumo[1]+"-"+cantidad.value+";";
        } else {
            if (inputInsumos.value.length > 0){
                valueInputInsumos = inputInsumos.value.substring(0,inputInsumos.value.length-1);
                arrayInputInsumos = valueInputInsumos.split(";");
                var verificacionInsumo = "No";
                posicionInsumosAgg = arrayInputInsumos.length;
                
                for (var i = 0; i < arrayInputInsumos.length; i++) {
                    arrayInputInfoInsumo = arrayInputInsumos[i].split("-");
                    if (arrayInputInfoInsumo[1] === arrayInfoInsumo[0]){
                       verificacionInsumo = "Si";
                       posicionInsumosAgg = i;
                    }
                }
                
                if (verificacionInsumo === "No"){
                    inputInsumos.value += "X-"+arrayInfoInsumo[0]+"-"+CifrarASCII(nomInsumo)+"-"+arrayInfoInsumo[1]+"-"+cantidad.value+"-Y-Nuevo;";
                } else {
                    inputInsumos.value = "";
                    for (var i = 0; i < arrayInputInsumos.length; i++) {
                        if (posicionInsumosAgg === i){
                            arrayInputInfoInsumo = arrayInputInsumos[i].split("-");
                            inputInsumos.value += arrayInputInfoInsumo[0]+"-"+arrayInputInfoInsumo[1]+"-"+arrayInputInfoInsumo[2]+"-"+arrayInputInfoInsumo[3]+"-"+cantidad.value+"-Y-"+arrayInputInfoInsumo[6]+";";
                        } else {
                            inputInsumos.value += arrayInputInsumos[i]+";";
                        }
                    }
                }
            } else {
                inputInsumos.value += "0-"+arrayInfoInsumo[0]+"-"+CifrarASCII(nomInsumo)+"-"+arrayInfoInsumo[1]+"-"+cantidad.value+"-Y-Nuevo;";
            }
        }
        
        
        var metodoDT;
        metodo === "reg"? metodoDT = "Reg" : metodoDT = "Actua";
        $('.tablaListarInsumosProductos'+metodoDT).DataTable().row.add( [
            nomInsumo,
            `<div class="td-espaciado">
                <button type="button" id="${posicionInsumosAgg}BtnMenosRowIP${metodo}" onclick="cantInsumoProducto('resta', '${posicionInsumosAgg}', '${metodo}')" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                    <span>
                        <span id="${posicionInsumosAgg}CantRowIP${metodo}">${cantidad.value}</span>
                        <span>${" "+arrayInfoInsumo[1]}</span>
                    </span>
                <button type="button" id="${posicionInsumosAgg}BtnMasRowIP${metodo}" onclick="cantInsumoProducto('suma', '${posicionInsumosAgg}', '${metodo}')" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
            </div>`,
            `<div class="td-espaciado">
                <button type="button" id="${posicionInsumosAgg}BtnRemoveRowIP${metodo}" onclick="removerInsumoProducto('${posicionInsumosAgg}', '${metodo}')" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Remover</button>
            </div>`
        ] ).draw();
        
        cantidad.value = "";
        optionInsumo.remove();
        autocompleteInsumosProducto(metodo);
        validacionExistenciaInsumosP(metodo);
        selectInsumos.focus();
    } else {
        selectInsumos.style.background = "#E06666";
        cantidad.style.background = "#E06666";
    }
}
function limpiarInsumosProducto(metodo){
    var inputInsumos = document.getElementById(metodo+"InsumosPProducto");
    if (inputInsumos.value.length > 0){
        var valueInput = inputInsumos.value.substring(0,inputInsumos.value.length-1);
        var arrayInsumos = valueInput.split(";");
        var arrayInfoInsumo;
        var contadorInsumos = 0;
        for (var i = 0; i < arrayInsumos.length; i++) {
            if (metodo === "actua"){
                arrayInfoInsumo = arrayInsumos[i].split("-");
                if (arrayInfoInsumo[5] !== "N"){
                    contadorInsumos++;
                }
            } else {
                if (arrayInsumos[i] !== "86S97S99S105S111"){
                    contadorInsumos++;
                }
            }
        }
        if (contadorInsumos > 0){
            for (var i = 0; i < arrayInsumos.length; i++) {
                if (metodo === "actua"){
                    arrayInfoInsumo = arrayInsumos[i].split("-");
                    if (arrayInfoInsumo[5] !== "N"){
                        removerInsumoProducto(i, metodo);
                    }
                } else {
                    if (arrayInsumos[i] !== "86S97S99S105S111"){
                        removerInsumoProducto(i, metodo);
                    }
                }
            }
            if (metodo === "reg"){
                inputInsumos.value = "";
            }
        } else {
            document.getElementById(metodo+"InsumosProducto").style.background = "#E06666";
            document.getElementById(metodo+"CantidadInsumosProducto").style.background = "#E06666";
        }
    } else {
        document.getElementById(metodo+"InsumosProducto").style.background = "#E06666";
        document.getElementById(metodo+"CantidadInsumosProducto").style.background = "#E06666";
    }
}
function removerInsumoProducto(posicionInputI, metodo){
    var inputInsumos = document.getElementById(metodo+"InsumosPProducto");
    var valueInputInsumos = inputInsumos.value.substring(0,inputInsumos.value.length-1);
    var arrayInputInsumos = valueInputInsumos.split(";");
    var arrayPosicionInsumo = arrayInputInsumos[parseInt(posicionInputI)].split("-");
    
    var templateOption;
    if (metodo === "reg"){
        templateOption = '<option value="'+arrayPosicionInsumo[0]+';'+arrayPosicionInsumo[2]+'">'+DescifrarASCII(arrayPosicionInsumo[1])+'</option>';
    } else {
        templateOption = '<option value="'+arrayPosicionInsumo[1]+';'+arrayPosicionInsumo[3]+'">'+DescifrarASCII(arrayPosicionInsumo[2])+'</option>';
    }
    document.getElementById(metodo+"InsumosProducto").insertAdjacentHTML("beforeend",templateOption);
    
    inputInsumos.value = "";
    for (var i = 0; i < arrayInputInsumos.length; i++) {
        if (i === parseInt(posicionInputI)){
            if (metodo === "actua"){
                inputInsumos.value += arrayPosicionInsumo[0]+"-"+arrayPosicionInsumo[1]+"-"+arrayPosicionInsumo[2]+"-"+arrayPosicionInsumo[3]+"-"+arrayPosicionInsumo[4]+"-N-"+arrayPosicionInsumo[6]+";";
            } else {
                inputInsumos.value += "86S97S99S105S111;";
            }
        } else {
            inputInsumos.value += arrayInputInsumos[i]+";";
        }
    }
    validacionExistenciaInsumosP(metodo);
    autocompleteInsumosProducto(metodo);
    var metodoDT;
    metodo === "reg"? metodoDT = "Reg" : metodoDT = "Actua";
    $('.tablaListarInsumosProductos'+metodoDT).DataTable().row($("#"+posicionInputI+"BtnRemoveRowIP"+metodo).parents('tr')).remove().draw(false);
}
function cantInsumoProducto(tipoOpe, posicionInputI, metodo){
    var inputInsumos = document.getElementById(metodo+"InsumosPProducto");
    var valueInputInsumos = inputInsumos.value.substring(0,inputInsumos.value.length-1);
    var arrayInputInsumos = valueInputInsumos.split(";");
    var arrayPosicionInsumo = arrayInputInsumos[parseInt(posicionInputI)].split("-");
    var posicionCantidadValue;
    if (tipoOpe === "resta"){
        if (metodo === "reg"){
            posicionCantidadValue = arrayPosicionInsumo[3];
        } else {
            posicionCantidadValue = arrayPosicionInsumo[4];
        }
        if (parseInt(posicionCantidadValue) > 1){
            inputInsumos.value = "";
            for (var i = 0; i < arrayInputInsumos.length; i++) {
                if (i === parseInt(posicionInputI)){
                    if (metodo === "actua"){
                        inputInsumos.value += arrayPosicionInsumo[0]+"-"+arrayPosicionInsumo[1]+"-"+arrayPosicionInsumo[2]+"-"+arrayPosicionInsumo[3]+"-"+(parseInt(arrayPosicionInsumo[4])-1)+"-"+arrayPosicionInsumo[5]+"-"+arrayPosicionInsumo[6]+";";
                    } else {
                        inputInsumos.value += arrayPosicionInsumo[0]+"-"+arrayPosicionInsumo[1]+"-"+arrayPosicionInsumo[2]+"-"+(parseInt(arrayPosicionInsumo[3])-1)+";";
                    }
                } else {
                    inputInsumos.value += arrayInputInsumos[i]+";";
                }
            }
            document.getElementById(posicionInputI+"CantRowIP"+metodo).innerText = parseInt(posicionCantidadValue)-1;
            $("#"+posicionInputI+"BtnMasRowIP"+metodo).removeAttr('disabled');
        } else {
            $("#"+posicionInputI+"BtnMenosRowIP"+metodo).attr('disabled','');
        }
    } else {
        if (metodo === "reg"){
            posicionCantidadValue = arrayPosicionInsumo[3];
        } else {
            posicionCantidadValue = arrayPosicionInsumo[4];
        }
        if (parseInt(posicionCantidadValue) < 99999){
            inputInsumos.value = "";
            for (var i = 0; i < arrayInputInsumos.length; i++) {
                if (i === parseInt(posicionInputI)){
                    if (metodo === "actua"){
                        inputInsumos.value += arrayPosicionInsumo[0]+"-"+arrayPosicionInsumo[1]+"-"+arrayPosicionInsumo[2]+"-"+arrayPosicionInsumo[3]+"-"+(parseInt(arrayPosicionInsumo[4])+1)+"-"+arrayPosicionInsumo[5]+"-"+arrayPosicionInsumo[6]+";";
                    } else {
                        inputInsumos.value += arrayPosicionInsumo[0]+"-"+arrayPosicionInsumo[1]+"-"+arrayPosicionInsumo[2]+"-"+(parseInt(arrayPosicionInsumo[3])+1)+";";
                    }
                } else {
                    inputInsumos.value += arrayInputInsumos[i]+";";
                }
            }
            document.getElementById(posicionInputI+"CantRowIP"+metodo).innerText = parseInt(posicionCantidadValue)+1;
            $("#"+posicionInputI+"BtnMenosRowIP"+metodo).removeAttr('disabled');
        } else {
            $("#"+posicionInputI+"BtnMasRowIP"+metodo).attr('disabled','');
        }
    }
}
function productosVerModal(cate,
        nombre,
        descrip,
        precio,
        insumosGasta) {
            
    document.getElementById('verNombreProducto').innerText = DescifrarASCII(nombre);
    document.getElementById('verCategoriaProducto').innerText = DescifrarASCII(cate);
    formatNumber(precio, "verPrecioProducto", "ver");
    if (descrip === "86S97S99S105S111"){
        document.getElementById('verDescripcionProducto').innerText = "Sin descripción.";
    } else {
        document.getElementById('verDescripcionProducto').innerText = DescifrarASCII(descrip);
    }
    var arrayInsumos = insumosGasta.split(";");
    var templateInsumos = "";
    for (var i = 0; i < arrayInsumos.length; i++) {
        var arrayInfoInsumo = arrayInsumos[i].split("-");
        templateInsumos += (i+1)+". <b>"+DescifrarASCII(arrayInfoInsumo[2])+"</b> con una cantidad de <b>"+arrayInfoInsumo[4]+" "+(parseInt(arrayInfoInsumo[4])>1?'Unidades':'Unidad')+"</b><br>";
    }
    templateInsumos = templateInsumos.substring(0, templateInsumos.length - 4);
    document.getElementById('verInsumosGastaProducto').innerHTML = templateInsumos;
}
function productosActualizarModal(idprod,
        cate,
        nombre,
        descri,
        precio,
        insumosGasta) {
            
    $("#productosAGerenteModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaIDProducto').value = idprod;
    document.getElementById('actuaNombreProducto').value = DescifrarASCII(nombre);
    formatNumber(precio, "actuaPrecioProducto", "reg");
    document.getElementById('actuaCategoriaProducto').value = cate;
    if (descri === "86S97S99S105S111"){
        document.getElementById('actuaDescripcionProducto').value = "";
    } else {
        document.getElementById('actuaDescripcionProducto').value = DescifrarASCII(descri);
    }
    
    var valueInputInsumos = document.getElementById("actuaInsumosPProducto").value;
    var valueInputInsumosA;
    var arrayInsumos;
    var arrayInfoInsumo;
    if (valueInputInsumos.length > 0){ 
        valueInputInsumosA = valueInputInsumos.substring(0, valueInputInsumos.length - 1);
        arrayInsumos = valueInputInsumosA.split(";");
        var templateOption = "";
        for (var i = 0; i < arrayInsumos.length; i++) {
            arrayInfoInsumo = arrayInsumos[i].split("-");
            templateOption += '<option value="'+arrayInfoInsumo[1]+';'+arrayInfoInsumo[3]+'">'+DescifrarASCII(arrayInfoInsumo[2])+'</option>';
        }
        document.getElementById("actuaInsumosProducto").insertAdjacentHTML("beforeend",templateOption);
        $('.tablaListarInsumosProductosActua').DataTable().clear().draw();
    }
    document.getElementById("actuaCantidadInsumosProducto").value = "";
    document.getElementById("actuaCantidadInsumosProducto").style.background = "#fff";
    document.getElementById("actuaInsumosPProducto").value = "";
    document.getElementById("actuaInsumosProducto").style.background = "#fff";
    
    valueInputInsumos = insumosGasta.substring(0,insumosGasta.length-1);
    arrayInsumos = valueInputInsumos.split(";");

    for (var i = 0; i < arrayInsumos.length; i++) {
        arrayInfoInsumo = arrayInsumos[i].split("-");
        
        $('.tablaListarInsumosProductosActua').DataTable().row.add( [
            DescifrarASCII(arrayInfoInsumo[2]),
            `<div class="td-espaciado">
                <button type="button" id="${i}BtnMenosRowIPactua" onclick="cantInsumoProducto('resta', '${i}', 'actua')" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                    <span>
                        <span id="${i}CantRowIPactua">${arrayInfoInsumo[4]}</span>
                        <span>${" "+arrayInfoInsumo[3]}</span>
                    </span>
                <button type="button" id="${i}BtnMasRowIPactua" onclick="cantInsumoProducto('suma', '${i}', 'actua')" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
            </div>`,
            `<div class="td-espaciado">
                <button type="button" id="${i}BtnRemoveRowIPactua" onclick="removerInsumoProducto('${i}', 'actua')" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Remover</button>
            </div>`
        ] ).draw();
        
        var selectInsumos = document.getElementById("actuaInsumosProducto");
        var indexOption = $("#actuaInsumosProducto").children('option[value="'+arrayInfoInsumo[1]+';'+arrayInfoInsumo[3]+'"]').index();
        var optionInsumo = selectInsumos.options[indexOption];
        optionInsumo.remove();
    }
    
    document.getElementById("actuaInsumosPProducto").value = insumosGasta+";";
    validacionExistenciaInsumosP("actua");
    autocompleteInsumosProducto("actua");
}
function productosEliminarModal(idprod,
        nombre) {
            
    document.getElementById('elimIDProducto').value = idprod;
    document.getElementById('elimNombreProducto').innerText = DescifrarASCII(nombre);
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Categorias">
function categoriasActualizarModal(idcate,
        nombre) {
            
    $("#categoriasAGerenteModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaIDCategoria').value = idcate;
    document.getElementById('actuaNombreCategoria').value = DescifrarASCII(nombre);
}
function categoriasEliminarModal(idcate,
        nombre) {
            
    document.getElementById('elimIDCategoria').value = idcate;
    document.getElementById('elimNombreCategoria').innerText = DescifrarASCII(nombre);
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Sedes">
$(document).ready(function () {
    var validatorSedes = document.getElementById("regOpcion1Sedes");
    if (validatorSedes !== null){
        document.getElementById("regOpcion1Sedes").value = "";
        $("#regHastaOpcion1Sedes").removeAttr('required');
        $("#regDesdeOpcion1Sedes").removeAttr('required');
        
        document.getElementById("regOpcion2Sedes").value = "";
        $("#regHastaOpcion2Sedes").removeAttr('required');
        $("#regDesdeOpcion2Sedes").removeAttr('required');
        
        document.getElementById("regOpcion3Sedes").value = "";
        $("#regHastaOpcion3Sedes").removeAttr('required');
        $("#regDesdeOpcion3Sedes").removeAttr('required');

        $("#regCJOpcion1Sedes").hide();
        $("#regCJOpcion2Sedes").hide();
        $("#regCJOpcion3Sedes").hide();
        document.getElementById("regFormSedes").action = "#";
        $("#regBtnSedes").attr('disabled','');
    }
});
function validacionHorario(selectOpcion, numeroOpcion, metodo){
    if (selectOpcion.value === ""){
        $("#"+metodo+"HastaOpcion"+numeroOpcion+"Sedes").removeAttr('required');
        $("#"+metodo+"DesdeOpcion"+numeroOpcion+"Sedes").removeAttr('required');
        $("#"+metodo+"CJOpcion"+numeroOpcion+"Sedes").hide();
    } else {
        $("#"+metodo+"HastaOpcion"+numeroOpcion+"Sedes").attr('required', '');
        $("#"+metodo+"DesdeOpcion"+numeroOpcion+"Sedes").attr('required', '');
        $("#"+metodo+"CJOpcion"+numeroOpcion+"Sedes").show();
    }
    
    if (numeroOpcion === "1"){
        if (selectOpcion.value === "Viernes y Sábados"){
            $("#"+metodo+"HastaOpcion2Sedes").removeAttr('required');
            $("#"+metodo+"DesdeOpcion2Sedes").removeAttr('required');
            $("#"+metodo+"CJOpcion2Sedes").hide();
            $("#"+metodo+"CJMOpcion2Sedes").hide();
            
            var selectOpcion2 = document.getElementById(metodo+"Opcion2Sedes");
            if (selectOpcion2.value === "Sábados y Domingos" || selectOpcion2.value === "Fines de Semana y Festivos"){
                $("#"+metodo+"CJMOpcion3Sedes").show();
            }
            
            document.getElementById(metodo+"Opcion2Sedes").value = "";
        } else {
            $("#"+metodo+"CJMOpcion2Sedes").show();
        }
    } else if (numeroOpcion === "2"){
        if (selectOpcion.value === "Sábados y Domingos" || selectOpcion.value === "Fines de Semana y Festivos"){
            $("#"+metodo+"HastaOpcion3Sedes").removeAttr('required');
            $("#"+metodo+"DesdeOpcion3Sedes").removeAttr('required');
            $("#"+metodo+"CJOpcion3Sedes").hide();
            $("#"+metodo+"CJMOpcion3Sedes").hide();
            document.getElementById(metodo+"Opcion3Sedes").value = "";
        } else {
            $("#"+metodo+"CJMOpcion3Sedes").show();
        }
    }

    var opcionUno = document.getElementById(metodo+"Opcion1Sedes").value,
            opcionDos = document.getElementById(metodo+"Opcion2Sedes").value,
            opcionTres = document.getElementById(metodo+"Opcion3Sedes").value;
    if (opcionUno === "" && opcionDos === "" && opcionTres === ""){
        $("#"+metodo+"BtnSedes").attr('disabled', '');
        document.getElementById(metodo+"FormSedes").action = "#";
    } else {
        $("#"+metodo+"BtnSedes").removeAttr('disabled');
        if (metodo === "reg"){
            document.getElementById("regFormSedes").action = "Sede";
        } else {
            document.getElementById("actuaFormSedes").action = "SedeA";
        }
    }
}
function sedesVerModal(nombre,
        rango,
        ciudad,
        direccion,
        numMesas,
        src,
        horas,
        dias) {
            
    $(".collapse").collapse("hide");
    document.getElementById('verTituloNombreSedes').innerText = "Detalles de "+DescifrarASCII(nombre);
    document.getElementById('verNombreSedes').innerText = DescifrarASCII(nombre);
    document.getElementById('verRangoSedes').innerText = rango;
    document.getElementById('verCiudadSedes').innerText = DescifrarASCII(ciudad);
    document.getElementById('verDireccionSedes').innerText = DescifrarASCII(direccion);
    if (Number(numMesas) === 1){
        document.getElementById('verMesasSedes').innerText = "1 Mesa";
    } else {
        document.getElementById('verMesasSedes').innerText = numMesas+" Mesas";
    }
    document.getElementById('verSrcSedes').innerText = DescifrarASCII(src);
    $('#verMapaSedes iframe').attr("src", DescifrarASCII(src));
    
    var arrayDH = dias.split(";");
    var arrayHH = horas.split(";");
    var cadeHS = "";
    for (var i = 0; i < 3; i++) {
        var diaDescifrado = DescifrarASCII(arrayDH[i]);
        if (arrayHH[i] !== "86S97S99S105S111"){
            var arrayDesdeYHasta = arrayHH[i].split("-");
            var horaDesdeDescifrada = DescifrarASCII(arrayDesdeYHasta[0]);
            var horaHastaDescifrada = DescifrarASCII(arrayDesdeYHasta[1]);
            
            cadeHS += "Los días <b>"+diaDescifrado+"</b>, desde las <b>"+horaMilitarANormal(horaDesdeDescifrada)+"</b> hasta las <b>"+horaMilitarANormal(horaHastaDescifrada)+"</b><br>";
        }
    }
    cadeHS = cadeHS.substring(0,cadeHS.length-2);
    document.getElementById('verHorariosSedes').innerHTML = cadeHS;
}
function sedesActualizarModal(id,
        nombre,
        rango,
        ciudad,
        direccion,
        numMesas,
        src,
        horas,
        dias) {
            
    $("#sedesAGerenteModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaTituloNombreSedes').innerText = "Actualizar Información de la Sede "+DescifrarASCII(nombre);
    document.getElementById('actuaIDSedes').value = id;
    document.getElementById('actuaNombreSedes').value = DescifrarASCII(nombre);
    document.getElementById('actuaRangoSedes').value = rango;
    document.getElementById('actuaCiudadSedes').value = ciudad;
    document.getElementById('actuaDireccionSedes').value = DescifrarASCII(direccion);
    document.getElementById('actuaMesasSedes').value = numMesas;
    document.getElementById('actuaSrcSedes').value = DescifrarASCII(src);

    document.getElementById("actuaOpcion1Sedes").value = "";
    $("#actuaHastaOpcion1Sedes").removeAttr('required');
    $("#actuaDesdeOpcion1Sedes").removeAttr('required');

    document.getElementById("actuaOpcion2Sedes").value = "";
    $("#actuaHastaOpcion2Sedes").removeAttr('required');
    $("#actuaDesdeOpcion2Sedes").removeAttr('required');

    document.getElementById("actuaOpcion3Sedes").value = "";
    $("#actuaHastaOpcion3Sedes").removeAttr('required');
    $("#actuaDesdeOpcion3Sedes").removeAttr('required');
    
    $("#actuaCJMOpcion2Sedes").show();
    $("#actuaCJMOpcion3Sedes").show();
    $("#actuaCJOpcion1Sedes").hide();
    $("#actuaCJOpcion2Sedes").hide();
    $("#actuaCJOpcion3Sedes").hide();
    
    var arrayDH = dias.split(";");
    var arrayHH = horas.split(";");
    for (var i = 0; i < 3; i++) {
        var diaDescifrado = DescifrarASCII(arrayDH[i]);
        var iSumado = i + 1;
        if (arrayHH[i] !== "86S97S99S105S111"){
            var arrayDesdeYHasta = arrayHH[i].split("-");
            var horaDesdeDescifrada = DescifrarASCII(arrayDesdeYHasta[0]);
            var horaHastaDescifrada = DescifrarASCII(arrayDesdeYHasta[1]);
            
            $("#actuaHastaOpcion"+iSumado+"Sedes").attr('required', '');
            $("#actuaDesdeOpcion"+iSumado+"Sedes").attr('required', '');
            document.getElementById("actuaHastaOpcion"+iSumado+"Sedes").value = horaHastaDescifrada;
            document.getElementById("actuaDesdeOpcion"+iSumado+"Sedes").value = horaDesdeDescifrada;
            $("#actuaCJOpcion"+iSumado+"Sedes").show();
            document.getElementById("actuaOpcion"+iSumado+"Sedes").value = diaDescifrado;
            
            if (iSumado === 1){
                if (diaDescifrado === "Viernes y Sábados"){
                    $("#actuaHastaOpcion2Sedes").removeAttr('required');
                    $("#actuaDesdeOpcion2Sedes").removeAttr('required');
                    $("#actuaCJOpcion2Sedes").hide();
                    $("#actuaCJMOpcion2Sedes").hide();

                    document.getElementById("actuaOpcion2Sedes").value = "";
                }
            } else if (iSumado === 2){
                if (diaDescifrado === "Sábados y Domingos" || diaDescifrado === "Fines de Semana y Festivos"){
                    $("#actuaHastaOpcion3Sedes").removeAttr('required');
                    $("#actuaDesdeOpcion3Sedes").removeAttr('required');
                    $("#actuaCJOpcion3Sedes").hide();
                    $("#actuaCJMOpcion3Sedes").hide();
                    document.getElementById("actuaOpcion3Sedes").value = "";
                }
            }
        }
    }
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Soportes"> 
function soportesActualizarModal(idsopo,
        ruta,
        descripcion) {
            
    $("#soporteAModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaIDSoportes').value = idsopo;
    document.getElementById('actuaRoMSoportes').value = DescifrarASCII(ruta);
    document.getElementById('actuaDescripcionSoportes').value = DescifrarASCII(descripcion);
}
function soportesVerModal(rolusu,
        fechsoli,
        fechresu,
        usuario,
        sede,
        ruta,
        descripcion) {
            
    document.getElementById('verFechaSolicitudSoportes').innerText = estructurarFecha("dd", fechsoli)+" / "+estructurarFecha("mm", fechsoli)+" / "+estructurarFecha("aa", fechsoli);
    if (fechresu === "null"){
        document.getElementById('verFechaResueltoSoportes').innerText = "Aún no esta corregido.";
    } else {
        document.getElementById('verFechaResueltoSoportes').innerText = estructurarFecha("dd", fechresu)+" / "+estructurarFecha("mm", fechresu)+" / "+estructurarFecha("aa", fechresu);
    }
    if (rolusu === "AdminS"){
        $('#verDivAdminSSoportes').show();
        $('#verHrAdminSSoportes').show();
        document.getElementById('verUsuarioSoportes').innerText = DescifrarASCII(usuario);
        document.getElementById('verSedeSoportes').innerText = sede;
    } else {
        $('#verDivAdminSSoportes').hide();
        $('#verHrAdminSSoportes').hide();
    }
    document.getElementById('verRutaSoportes').innerText = DescifrarASCII(ruta);
    document.getElementById('verDescripcionSoportes').innerText = DescifrarASCII(descripcion);
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Responder PQRSF"> 
function resPqrsfResponderModal(idPqrsf,
        emailCli) {
    document.getElementById('respIDResPQRSF').value = idPqrsf;
    document.getElementById('respEmailCliOcultoResPQRSF').value = DescifrarASCII(emailCli);
    document.getElementById('respEmailCliResPQRSF').value = DescifrarASCII(emailCli);
}
function resPqrsfVerModal(emailcli,
        nomcli,
        fechingr,
        horaingr,
        tiposoli,
        diri,
        consulta,
        inter,
        respuesta,
        sedegere,
        sedecli) {
            
    document.getElementById('verTituloNombreResPQRSF').innerText = "Solicitud de "+DescifrarASCII(nomcli);
    document.getElementById('verFechaResPQRSF').innerText = estructurarFecha("dd", fechingr)+" / "+estructurarFecha("mm", fechingr)+" / "+estructurarFecha("aa", fechingr);
    document.getElementById('verHoraResPQRSF').innerText = estructurarHora("h", horaingr)+" : "+estructurarHora("m", horaingr);
    document.getElementById('verTipoSolicitudResPQRSF').innerText = tiposoli;
    document.getElementById('verDirigidoAResPQRSF').innerText = diri;
    document.getElementById('verConsultaResPQRSF').innerText = DescifrarASCII(consulta);
    if (sedegere === sedecli){
        document.getElementById('verUsuarioResPQRSF').innerText = DescifrarASCII(emailcli)+"\nde tu misma Sede";
    } else {
        document.getElementById('verUsuarioResPQRSF').innerText = DescifrarASCII(emailcli)+"\nde la Sede "+DescifrarASCII(sedecli);
    }
    if (inter.length === 0){
        document.getElementById('verInterlocutorResPQRSF').innerText = "Sin interlocutor";
    } else {
        document.getElementById('verInterlocutorResPQRSF').innerText = DescifrarASCII(inter);
    }
    if (respuesta === "83S105S110S32S114S101S115S112S117S101S115S116S97"){
        document.getElementById('verRespuestaResPQRSF').innerText = "Sin respuesta";
    } else {
        document.getElementById('verRespuestaResPQRSF').innerText = DescifrarASCII(respuesta);
    }
}
// </editor-fold> 

// <editor-fold defaultstate="collapsed" desc="Usuarios"> 
function usuarioSancionarModal(idusu,
        emusu) {
            
    document.getElementById('sanIDUsuario').value = idusu;
    document.getElementById('sanEmailOcultoUsuario').value = DescifrarASCII(emusu);
    document.getElementById('sanEmailUsuario').value = DescifrarASCII(emusu);
    document.getElementById('sanJustificacionUsuario').placeholder = "¿Porque razón desea sancionar al usuario "+DescifrarASCII(emusu)+"?";
}
function usuarioActualizarModal(idusu,
        roleusu,
        nomusu,
        apellusu,
        emusu,
        tipoidenti,
        numidenti,
        telefono,
        movil,
        genero,
        fchnaci,
        direccion) {
            
    $("#usuariosAGerenteModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaTituloNombreUsuario').innerText = "Actualizar Información de "+DescifrarASCII(nomusu);
    document.getElementById('actuaIDUsuario').value = idusu;
    document.getElementById('actuaNombresUsuario').value = DescifrarASCII(nomusu);
    document.getElementById('actuaApellidosUsuario').value = DescifrarASCII(apellusu);
    document.getElementById('actuaRolUsuario').value = DescifrarASCII(roleusu);
    document.getElementById('actuaEmailUsuario').value = DescifrarASCII(emusu);
    document.getElementById('actuaTipoIdentiUsuario').value = tipoidenti;
    document.getElementById('actuaNumIdentiUsuario').value = DescifrarASCII(numidenti);
    document.getElementById('actuaTelefonoUsuario').value = DescifrarASCII(telefono);
    document.getElementById('actuaMovilUsuario').value = DescifrarASCII(movil);
    document.getElementById('actuaGeneroUsuario').value = genero;
    document.getElementById('actuaFechaNacimientoUsuario').value = fchnaci;
    document.getElementById('actuaDireccionUsuario').value = DescifrarASCII(direccion);
}
function usuarioVerModal(roleusu,
        nomusu,
        apellusu,
        emusu,
        tipoidenti,
        numidenti,
        telefono,
        movil,
        genero,
        fchnaci,
        direccion,
        emailmoder,
        fchlimite,
        justificacion,
        existencia,
        verificado) {
            
    $(".collapse").collapse("hide");
    document.getElementById('verTituloNombreUsuario').innerText = "Ver detalles de "+DescifrarASCII(nomusu)+"..";
    document.getElementById('verNombreUsuario').innerText = DescifrarASCII(nomusu)+" "+DescifrarASCII(apellusu);
    document.getElementById('verRolUsuario').innerText = DescifrarASCII(roleusu);
    if (verificado === "Y"){
        document.getElementById('verEmailUsuario').innerHTML = DescifrarASCII(emusu)+"<br><b>Esta Verificado</b>";
    } else {
        document.getElementById('verEmailUsuario').innerHTML = DescifrarASCII(emusu)+"<br><b>No esta Verificado</b>";
    }
    if (tipoidenti === "TI"){
        document.getElementById('verTipoIdentiUsuario').innerText = "Tarjeta de Identidad:";
    } else if (tipoidenti === "CC"){
        document.getElementById('verTipoIdentiUsuario').innerText = "Cédula de Ciudadanía:";
    } else if (tipoidenti === "TP"){
        document.getElementById('verTipoIdentiUsuario').innerText = "Tarjeta de Pasaporte:";
    } else if (tipoidenti === "CE"){
        document.getElementById('verTipoIdentiUsuario').innerText = "Cédula de Extranjería:";
    }
    document.getElementById('verNumIdentiUsuario').innerText = DescifrarASCII(numidenti);
    if (telefono.length === 0){
        document.getElementById('verTelefonoUsuario').innerText = "No tiene";
    } else {
        document.getElementById('verTelefonoUsuario').innerText = DescifrarASCII(telefono);
    }
    if (movil.length === 0){
        document.getElementById('verMovilUsuario').innerText = "No tiene";
    } else {
        document.getElementById('verMovilUsuario').innerText = DescifrarASCII(movil);
    }
    document.getElementById('verGeneroUsuario').innerText = genero;
    document.getElementById('verFechaNacimientoUsuario').innerText = estructurarFecha("dd",fchnaci)+" del "+estructurarFecha("mm",fchnaci)+" de "+estructurarFecha("aa",fchnaci)+"\n"+calcularEdad(fchnaci)+" Años";
    if (direccion.length === 0){
        document.getElementById('verDireccionUsuario').innerText = "No tiene";
    } else {
        document.getElementById('verDireccionUsuario').innerText = DescifrarASCII(direccion);
    }
    
    if (existencia === "Y"){
        $('#usuariosVerModal #verTituloSancionUsuario').show();
        $('#usuariosVerModal #accordionVerUsuario').show();
        $('#usuariosVerModal #verTituloInformacionUsuario').show();
        
        document.getElementById('verEmailModeradorUsuario').innerText = DescifrarASCII(emailmoder);
        document.getElementById('verFechaLimiteUsuario').innerText = "Hasta el día "+estructurarFecha("dd",fchlimite)+" del mes "+estructurarFecha("mm",fchlimite)+" de "+estructurarFecha("aa",fchlimite);
        document.getElementById('verJustificacionUsuario').innerText = DescifrarASCII(justificacion);
    } else {
        $('#usuariosVerModal #verTituloSancionUsuario').hide();
        $('#usuariosVerModal #accordionVerUsuario').hide();
        $('#usuariosVerModal #verTituloInformacionUsuario').hide();
    }
}
function usuarioEliminarModal(idusu,
        emusu) {
            
    document.getElementById('elimIDUsuario').value = idusu;
    document.getElementById('elimEmailUsuario').innerText = DescifrarASCII(emusu);
}
// </editor-fold> 

// <editor-fold defaultstate="collapsed" desc="Proveedores"> 
function proveedorActualizarModal(idprov,
        nombreCOE,
        tipoidentifiscal,
        numidentitribu,
        telefonoCOE,
        extenTeleCOE,
        movilCOE,
        faxCOE,
        extenFaxCOE,
        ciudad,
        direccion,
        
        nombrePC,
        cargoPC,
        tipoidenti,
        numidenti,
        emailPC,
        faxPC,
        extenFaxPC,
        telefonoPC,
        movilPC) {
            
    $("#proveedoresAGerenteModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaIDProveedor').value = idprov;
    document.getElementById('actuaNombreCOEProveedor').value = DescifrarASCII(nombreCOE);
    document.getElementById('actuaTipoIdentiFiscalCOEProveedor').value = tipoidentifiscal;
    document.getElementById('actuaNumIdentiTribuCOEProveedor').value = DescifrarASCII(numidentitribu);
    document.getElementById('actuaTelefonoCOEProveedor').value = DescifrarASCII(telefonoCOE);
    document.getElementById('actuaExtTelefonoCOEProveedor').value = DescifrarASCII(extenTeleCOE);
    document.getElementById('actuaMovilCOEProveedor').value = DescifrarASCII(movilCOE);
    document.getElementById('actuaFaxCOEProveedor').value = DescifrarASCII(faxCOE);
    document.getElementById('actuaExtFaxCOEProveedor').value = DescifrarASCII(extenFaxCOE);
    document.getElementById('actuaCiudadCOEProveedor').value = ciudad;
    document.getElementById('actuaDireccionCOEProveedor').value = DescifrarASCII(direccion);

    document.getElementById('actuaNombrePCProveedor').value = DescifrarASCII(nombrePC);
    document.getElementById('actuaCargoPCProveedor').value = DescifrarASCII(cargoPC);
    document.getElementById('actuaTipoIdentiPCProveedor').value = tipoidenti;
    document.getElementById('actuaNumIdentiPCProveedor').value = DescifrarASCII(numidenti);
    document.getElementById('actuaEmailPCProveedor').value = DescifrarASCII(emailPC);
    document.getElementById('actuaFaxPCProveedor').value = DescifrarASCII(faxPC);
    document.getElementById('actuaExtFaxPCProveedor').value = DescifrarASCII(extenFaxPC);
    document.getElementById('actuaTelefonoPCProveedor').value = DescifrarASCII(telefonoPC);
    document.getElementById('actuaMovilPCProveedor').value = DescifrarASCII(movilPC);
}
function proveedorVerModal(nombreCOE,
        tipoidentifiscal,
        numidentitribu,
        telefonoCOE,
        extenTeleCOE,
        movilCOE,
        faxCOE,
        extenFaxCOE,
        ciudad,
        direccion,
        
        nombrePC,
        cargoPC,
        tipoidenti,
        numidenti,
        emailPC,
        faxPC,
        extenFaxPC,
        telefonoPC,
        movilPC) {
            
    $(".collapse").collapse("hide");
    document.getElementById('verNombreCOEProveedor').innerText = DescifrarASCII(nombreCOE);
    if (tipoidentifiscal === "A"){
        document.getElementById('verTipoIdentiFiscalCOEProveedor').innerText = "Número de identificación de empleador de los EE.UU. (EIN):";
    } else if (tipoidentifiscal === "N"){
        document.getElementById('verTipoIdentiFiscalCOEProveedor').innerText = "Número de identificación nacional:";
    } else if (tipoidentifiscal === "R"){
        document.getElementById('verTipoIdentiFiscalCOEProveedor').innerText = "RUT / RUC / RFC Número de identificación fiscal:";
    }
    document.getElementById('verNumIdentiTribuCOEProveedor').innerText = DescifrarASCII(numidentitribu);
    if (telefonoCOE.length === 0){
        document.getElementById('verTelefonoCOEProveedor').innerText = "No tiene";
    } else {
        if (extenTeleCOE.length === 0){
            document.getElementById('verTelefonoCOEProveedor').innerText = DescifrarASCII(telefonoCOE);
        } else {
            document.getElementById('verTelefonoCOEProveedor').innerText = DescifrarASCII(telefonoCOE)+" EXT. "+extenTeleCOE;
        }
    }
    if (movilCOE.length === 0){
        document.getElementById('verMovilCOEProveedor').innerText = "No tiene";
    } else {
        document.getElementById('verMovilCOEProveedor').innerText = DescifrarASCII(movilCOE);
    }
    if (faxCOE.length === 0){
        document.getElementById('verFaxCOEProveedor').innerText = "No tiene";
    } else {
        if (extenFaxCOE.length === 0){
            document.getElementById('verFaxCOEProveedor').innerText = DescifrarASCII(faxCOE);
        } else {
            document.getElementById('verFaxCOEProveedor').innerText = DescifrarASCII(faxCOE)+" EXT. "+DescifrarASCII(extenFaxCOE);
        }
    }
    document.getElementById('verCiudadCOEProveedor').innerText = DescifrarASCII(ciudad);
    document.getElementById('verDireccionCOEProveedor').innerText = DescifrarASCII(direccion);

    document.getElementById('verNombrePCProveedor').innerText = DescifrarASCII(nombrePC);
    document.getElementById('verCargoPCProveedor').innerText = DescifrarASCII(cargoPC);
    if (tipoidenti === "CE"){
        document.getElementById('verTipoIdentiPCProveedor').innerText = "Cédula de Extranjería:";
    } else if (tipoidenti === "CC"){
        document.getElementById('verTipoIdentiPCProveedor').innerText = "Cédula de Ciudadanía:";
    } else if (tipoidenti === "TP"){
        document.getElementById('verTipoIdentiPCProveedor').innerText = "Tarjeta de Pasaporte:";
    }
    document.getElementById('verNumIdentiPCProveedor').innerText = DescifrarASCII(numidenti);
    if (emailPC.length === 0){
        document.getElementById('verEmailPCProveedor').innerText = "No tiene";
    } else {
        document.getElementById('verEmailPCProveedor').innerText = DescifrarASCII(emailPC);
    }
    if (faxPC.length === 0){
        document.getElementById('verFaxPCProveedor').innerText = "No tiene";
    } else {
        if (extenFaxPC.length === 0){
            document.getElementById('verFaxPCProveedor').innerText = DescifrarASCII(faxPC);
        } else {
            document.getElementById('verFaxPCProveedor').innerText = DescifrarASCII(faxPC)+" EXT. "+DescifrarASCII(extenFaxPC);
        }
    }
    if (telefonoPC.length === 0){
        document.getElementById('verTelefonoPCProveedor').innerText = "No tiene";
    } else {
        document.getElementById('verTelefonoPCProveedor').innerText = DescifrarASCII(telefonoPC);
    }
    if (movilPC.length === 0){
        document.getElementById('verMovilPCProveedor').innerText = "No tiene";
    } else {
        document.getElementById('verMovilPCProveedor').innerText = DescifrarASCII(movilPC);
    }
}
function proveedorEliminarModal(idProveedor,
        nombreCOE) {
            
    document.getElementById('elimIDProveedor').value = idProveedor;
    document.getElementById('elimCOEProveedor').innerText = DescifrarASCII(nombreCOE);
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Insumos"> 
function insumoDevolverModal(idInsumo,
        emailpro,
        nominsu,
        nompropc) {
            
    if (emailpro.length === 0){
        $("#devoAdvertenciaInsumo").show();
        $("#devoInsumoInsumo").show();
        document.getElementById("devoFormInsumo").action = "#";
        $("#devoFormInsumo").hide();
        
        document.getElementById('devoAdvertenciaInsumo').innerText = "Lamentablemente no puede enviarle un correo de devolución al proveedor del siguiente insumo porque no existe un correo electrónico registrado en la base de datos.";
        document.getElementById('devoInsumoInsumo').innerText = DescifrarASCII(nominsu);
        document.getElementById('devoIDInsumo').value = "";
        document.getElementById('devoNomInsInsumo').value = "";
        document.getElementById('devoNomProPCInsumo').value = "";
        document.getElementById('devoEmailProOcultoInsumo').value = "";
        document.getElementById('devoEmailProInsumo').value = "";
        document.getElementById('devoRazonInsumo').placeholder = "";
    } else {
        $("#devoAdvertenciaInsumo").hide();
        $("#devoInsumoInsumo").hide();
        document.getElementById("devoFormInsumo").action = "InsumoD";
        $("#devoFormInsumo").show();
        
        document.getElementById('devoAdvertenciaInsumo').innerText = "";
        document.getElementById('devoInsumoInsumo').innerText = "";
        document.getElementById('devoIDInsumo').value = idInsumo;
        document.getElementById('devoNomInsInsumo').value = DescifrarASCII(nominsu);
        document.getElementById('devoNomProPCInsumo').value = DescifrarASCII(nompropc);
        document.getElementById('devoEmailProOcultoInsumo').value = DescifrarASCII(emailpro);
        document.getElementById('devoEmailProInsumo').value = DescifrarASCII(emailpro);
        document.getElementById('devoRazonInsumo').placeholder = "¿Que razón desea enviarle al proveedor del insumo \""+DescifrarASCII(nominsu)+"\" por su correo electrónico?";
    }
}
function insumoActualizarModal(idInsumo,
        referencia,
        nombreInsumo,
        fechaCaducidad,
        unidadMedida,
        cantidad,
        precio,
        proveedor) {
            
    $("#insumoAGerenteModal input,select,textarea").css('color', '#555555');
    document.getElementById('actuaIDInsumo').value = idInsumo;
    document.getElementById('actuaReferenciaInsumo').value = DescifrarASCII(referencia);
    document.getElementById('actuaNombreInsumo').value = DescifrarASCII(nombreInsumo);
    document.getElementById('actuaFechaCaducidadInsumo').value = fechaCaducidad;
    formatNumber(precio, "actuaPrecioUnitarioInsumo", "reg");
    document.getElementById('actuaUnidadMedidaInsumo').value = unidadMedida;
    document.getElementById('actuaCantidadInsumo').value = cantidad;
    document.getElementById('actuaProveedorInsumo').value = proveedor;
    document.getElementById('ValidacionPuntosActuaInsumos').removeAttribute("disabled");
}
function insumoVerModal(referencia,
        nombreInsumo,
        fechaIngreso,
        fechaCaducidad,
        unidadMedida,
        cantidad,
        precioUni,
        
        nombrePRO,
        tipoidentifiscal,
        numidentitribu,
        nombrePC,
        cargoPC,
        emailPC,
        faxPC,
        extenFaxPC,
        telefonoPC,
        movilPC) {
            
    $(".collapse").collapse("hide");
    document.getElementById('verReferenciaInsumo').innerText = DescifrarASCII(referencia);
    document.getElementById('verNombreInsumo').innerText = DescifrarASCII(nombreInsumo);
    document.getElementById('verFechaIngresoInsumo').innerText = "Desde el día "+estructurarFecha("dd",fechaIngreso)+" del mes "+estructurarFecha("mm",fechaIngreso)+" / "+estructurarFecha("aa",fechaIngreso);
    document.getElementById('verFechaCaducidadInsumo').innerText = "Hasta el día "+estructurarFecha("dd",fechaCaducidad)+" del mes "+estructurarFecha("mm",fechaCaducidad)+" / "+estructurarFecha("aa",fechaCaducidad);
    document.getElementById('verCantidadInsumo').innerText = cantidad+" "+unidadMedida;
    formatNumber(precioUni, "verPrecioUnitarioInsumo", "ver");

    document.getElementById('verProveedorInsumo').innerText = DescifrarASCII(nombrePRO);
    if (tipoidentifiscal === "A"){
        document.getElementById('verTipoIdentiFiscalProInsumo').innerText = "Número de identificación de empleador de los EE.UU. (EIN):";
    } else if (tipoidentifiscal === "N"){
        document.getElementById('verTipoIdentiFiscalProInsumo').innerText = "Número de identificación nacional:";
    } else if (tipoidentifiscal === "R"){
        document.getElementById('verTipoIdentiFiscalProInsumo').innerText = "RUT / RUC / RFC Número de identificación fiscal:";
    }
    document.getElementById('verNumIdentifiTribuProInsumo').innerText = DescifrarASCII(numidentitribu);
    document.getElementById('verNombrePCProInsumo').innerText = DescifrarASCII(nombrePC);
    document.getElementById('verCargoPCProInsumo').innerText = DescifrarASCII(cargoPC);
    if (emailPC.length === 0){
        document.getElementById('verEmailPCProInsumo').innerText = "No tiene";
    } else {
        document.getElementById('verEmailPCProInsumo').innerText = DescifrarASCII(emailPC);
    }
    if (faxPC.length === 0){
        document.getElementById('verFaxPCProInsumo').innerText = "No tiene";
    } else {
        if (extenFaxPC.length === 0){
            document.getElementById('verFaxPCProInsumo').innerText = DescifrarASCII(faxPC);
        } else {
            document.getElementById('verFaxPCProInsumo').innerText = DescifrarASCII(faxPC)+" EXT. "+DescifrarASCII(extenFaxPC);
        }
    }
    if (telefonoPC.length === 0){
        document.getElementById('verTelefonoPCProInsumo').innerText = "No tiene";
    } else {
        document.getElementById('verTelefonoPCProInsumo').innerText = DescifrarASCII(telefonoPC);
    }
    if (movilPC.length === 0){
        document.getElementById('verMovilPCProInsumo').innerText = "No tiene";
    } else {
        document.getElementById('verMovilPCProInsumo').innerText = DescifrarASCII(movilPC);
    }
}
function insumoEliminarModal(idinsumo,
        nombre) {
            
    document.getElementById('elimIDInsumo').value = idinsumo;
    document.getElementById('elimNombreInsumo').innerText = DescifrarASCII(nombre);
}
// </editor-fold>
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Reloj (Sin uso)">
//function mueveReloj() {
//    var meses = new Array ("Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre");
//    var momentoActual = new Date();
//
//    var horaImprimible = momentoActual.getHours() + ":" + momentoActual.getMinutes() + ":" + momentoActual.getSeconds();
//    var fechaImprimible = momentoActual.getDate() + " de " + meses[momentoActual.getMonth()] + " del " + momentoActual.getFullYear();
//
//    document.getElementById("RhActual").innerText = horaImprimible;
//    document.getElementById("RfActual").innerText = fechaImprimible;
//
//    setTimeout("mueveReloj()", 1000);
//}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Swiper">
var swiper = new Swiper('.swiper-container', {
    effect: 'coverflow',
    grabCursor: true,
    centeredSlides: true,
    slidesPerView: 'auto',
    coverflowEffect: {
        rotate: 0,
        stretch: 0,
        depth: 500,
        modifier: 1,
        slideShadows: false,
    },
    pagination: {
        el: '.swiper-pagination',
    },
    navigation: {
        nextEl: '.swiper-button-next',
        prevEl: '.swiper-button-prev',
    },
});
// </editor-fold>