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

// <editor-fold defaultstate="collapsed" desc="Metodos de las Modales">
// <editor-fold defaultstate="collapsed" desc="Metodos de Utilidad">
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
var nav1 = window.Event ? true : false; 
function acceptNum(evt){
    var key1 = nav1 ? evt.which : evt.keyCode;
    return (key1 >= 48 && key1 <= 57);
}
var nav2 = window.Event ? true : false; 
function refusePC(evt){
    var key2 = nav2 ? evt.which : evt.keyCode;
    return (key2 <= 58 || key2 >= 60);
}
var nav3 = window.Event ? true : false; 
function acceptNP(evt){
    var key3 = nav3 ? evt.which : evt.keyCode;
    return key3 === 46 || (key3 >= 48 && key3 <= 57);
}
var nav4 = window.Event ? true : false; 
function refuseCPyP(evt){
    var key4 = nav4 ? evt.which : evt.keyCode;
    return ((key4 <= 156 || key4 >= 158) && (key4 <= 145 || key4 >= 147));
}
var nav5 = window.Event ? true : false; 
function acceptNumCant(evt){
    var key5 = nav5 ? evt.which : evt.keyCode;
    return key5 >= 48 && key5 <= 57;
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
// </editor-fold>


// <editor-fold defaultstate="collapsed" desc="pedidosRModal">
$(document).ready(function () {
    var bdListarP = document.getElementById("pedidosListar");
    if (bdListarP !== null){
        $("#pedidosRegistrar").hide();
        $("#regSpanWarningPedidos").hide();
        document.getElementById("regSubtotalPedidos").value = 0;
        document.getElementById("regCantidadPedidos").value = 1;
        var lSt = localStorage;
        lSt.setItem("cantProductosP", "0");
        
        $('#btnRegistrarPedidos').click(function(){
            $('#pedidosRegistrar').show();
            $('#pedidosListar').hide();
        });
        
        $('#btnListarPedidos').click(function(){
            $('#pedidosRegistrar').hide();
            $('#pedidosListar').show();
        });
        
        $('#btnListarRutaPedidos').click(function(){
            $('#pedidosRegistrar').hide();
            $('#pedidosListar').show();
        });
        
        $("#regCJSProductosPedidos select").hide();
        $("#regCJSProductosPedidos #"+document.getElementById("regCategoriaPedidos").value+"C").show();
    }
});
function cambioCategoria(idcate){
    $("#regCJSProductosPedidos select").hide();
    $("#regCJSProductosPedidos #"+idcate+"C").show();
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
function agregarProductoPedido(btnAgregar){
    var lSt = localStorage;
    
    var numProductoAGGPedido = parseInt(lSt.getItem("cantProductosP"))+1;
    var selectCategorias = document.getElementById("regCategoriaPedidos");
    var idCategoria = selectCategorias.value;
    var nomCategoria = selectCategorias.options[selectCategorias.selectedIndex].text;
    var selectProductos = document.getElementById(idCategoria+"C");
    var infoProducto = selectProductos.value.split(";");
    
    if (selectProductos.value.length > 0){
        var nomProducto = selectProductos.options[selectProductos.selectedIndex].text;
        var optionProducto = selectProductos.options[selectProductos.selectedIndex];
        var cantidad = document.getElementById("regCantidadPedidos").value;
        var subTotalProductos = parseInt(infoProducto[2])*cantidad;
        var observacion = document.getElementById("regObservacionPedidos").value;
        if (observacion.length === 0){
            observacion = "Vacio";
        }
        
        lSt.setItem("cantProductosP", numProductoAGGPedido);
        var campoSubtotal = document.getElementById("regSubtotalPedidos");
        campoSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campoSubtotal.value))+parseInt(subTotalProductos));

        var templateInptHide = `
            <div class="input-group inpDesa">
                <input type="text" class="form-control" name="${numProductoAGGPedido}InputPP" id="${numProductoAGGPedido}InputPP">
            </div>`;

        document.getElementById("regCAJProductosPedidos").insertAdjacentHTML("beforeend",templateInptHide);
        $('.tablaListarProductosPedido').DataTable().row.add( [
            nomCategoria,
            nomProducto,
            `<div class="td-espaciado">
                <button type="button" id="${numProductoAGGPedido}BtnMenosRowPP" onclick="cantProductoPedido('resta', '${numProductoAGGPedido}')" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                    <span id="${numProductoAGGPedido}CantRowPP">${cantidad}</span>
                <button type="button" id="${numProductoAGGPedido}BtnMasRowPP" onclick="cantProductoPedido('suma', '${numProductoAGGPedido}')" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
            </div>`,
            `<span id="${numProductoAGGPedido}SubtotalRowPP">`+formatNumberReturn(subTotalProductos)+`</span>`,
            `<div class="td-espaciado">
                <button type="button" class="btn btn-info" data-toggle="modal" data-target="#productoPedidoVerModal" onClick="productoPedidoVerModal('${CifrarASCII(nomCategoria)}', '${CifrarASCII(nomProducto)}', '${cantidad}', '${subTotalProductos}', '${CifrarASCII(observacion)}', '${infoProducto[2]}', '${infoProducto[1]}')"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                <button type="button" onclick="sacarProductoPedido(this, '${numProductoAGGPedido}', '${idCategoria}C', '${CifrarASCII(nomProducto)}')" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Sacar</button>
            </div>`
        ] ).draw();
        document.getElementById("regCantidadPedidos").value = 1;
        document.getElementById("regObservacionPedidos").value = "";
        optionProducto.remove();
        document.getElementById(numProductoAGGPedido+"InputPP").value = infoProducto[0]+";"+infoProducto[1]+";"+infoProducto[2]+";"+cantidad+";"+CifrarASCII(observacion)+";"+subTotalProductos;
    } else {
        $("#regBtnAgregarPedidos").attr('disabled', '');
    }
}
function sacarProductoPedido(numPP, numRow, idSelectProd, nomProducto){
    var infoProductoPPArr = document.getElementById(numRow+"InputPP").value.split(";");
    var templateOption = '<option value="'+infoProductoPPArr[0]+';'+infoProductoPPArr[1]+';'+infoProductoPPArr[2]+'">'+DescifrarASCII(nomProducto)+'</option>';
    document.getElementById(idSelectProd).insertAdjacentHTML("beforeend",templateOption);
    var campSubtotal = document.getElementById("regSubtotalPedidos");
    campSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campSubtotal.value))-parseInt(infoProductoPPArr[5]));
    $("#"+numRow+"InputPP").parent('div').remove();
    $('.tablaListarProductosPedido').DataTable().row($(numPP).parents('tr')).remove().draw(false);
}
function cantProductoPedido(tipoOpe, numRow){
    var inpProductoArr = document.getElementById(numRow+"InputPP").value.split(";");
    if (tipoOpe === "resta"){
        if (parseInt(inpProductoArr[3]) > 1){
            var infoNuevaInp = inpProductoArr[0]+";"+inpProductoArr[1]+";"+inpProductoArr[2]+";"+(parseInt(inpProductoArr[3])-1)+";"+inpProductoArr[4]+";"+(parseInt(inpProductoArr[5])-parseInt(inpProductoArr[2]));
            var campSubtotal = document.getElementById("regSubtotalPedidos");
            campSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campSubtotal.value))-parseInt(inpProductoArr[2]));
            document.getElementById(numRow+"CantRowPP").innerText = parseInt(inpProductoArr[3])-1;
            document.getElementById(numRow+"InputPP").value = infoNuevaInp;
            document.getElementById(numRow+"SubtotalRowPP").innerText = formatNumberReturn(parseInt(inpProductoArr[5])-parseInt(inpProductoArr[2]));
            $("#"+numRow+"BtnMasRowPP").removeAttr('disabled');
        } else {
            $("#"+numRow+"BtnMenosRowPP").attr('disabled','');
        }
    } else {
        if (parseInt(inpProductoArr[3]) < 99){
            var infoNuevaInp = inpProductoArr[0]+";"+inpProductoArr[1]+";"+inpProductoArr[2]+";"+(parseInt(inpProductoArr[3])+1)+";"+inpProductoArr[4]+";"+(parseInt(inpProductoArr[5])+parseInt(inpProductoArr[2]));
            var campSubtotal = document.getElementById("regSubtotalPedidos");
            campSubtotal.value = formatNumberReturn(parseInt(resetNumberReturn(campSubtotal.value))+parseInt(inpProductoArr[2]));
            document.getElementById(numRow+"CantRowPP").innerText = parseInt(inpProductoArr[3])+1;
            document.getElementById(numRow+"InputPP").value = infoNuevaInp;
            document.getElementById(numRow+"SubtotalRowPP").innerText = formatNumberReturn(parseInt(inpProductoArr[5])+parseInt(inpProductoArr[2]));
            $("#"+numRow+"BtnMenosRowPP").removeAttr('disabled');
        } else {
            $("#"+numRow+"BtnMasRowPP").attr('disabled','');
        }
    }
}
function validacionCantidad(input,content){
    if (content === "0" || content === 0){
        input.value = 1;
    } else {
        if (content.length > 2){
            input.value = content.substring(0,content.length-1);
        }
    }
}
function registrarPedido(){
    var validarProductos = document.getElementById("regCAJProductosPedidos").innerHTML;
    if (validarProductos.includes("input-group")){
        var lSt = localStorage;
        $("#regSubtotalPedidos").removeAttr("disabled");
        var templateInptHide = `
            <div class="input-group inpDesa">
                <input type="text" class="form-control" name="NumsInputPP" id="NumsInputPP">
            </div>`;
        document.getElementById("regCAJProductosPedidos").insertAdjacentHTML("beforeend",templateInptHide);
        document.getElementById("NumsInputPP").value = lSt.getItem("cantProductosP");
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
function resetNumberReturn(numero) {
    // Variable que contendra el resultado final
    var nuevoNumero = numero.toString().replace(/\./g, '');
    
    return nuevoNumero;
}
function productoPedidoVerModal(nomCate,
        nomProd,
        cant,
        subtotal,
        observ,
        precio,
        descri) {
    
    $(".collapse").collapse("hide");
    document.getElementById("verCategoriaProductoPedido").innerText = DescifrarASCII(nomCate);
    document.getElementById("verProductoProductoPedido").innerText = DescifrarASCII(nomProd);
    document.getElementById("verCantidadProductoPedido").innerText = cant;
    document.getElementById("verSubtotalProductoPedido").innerText = formatNumberReturn(subtotal);
    if (DescifrarASCII(observ) === "Vacio"){
        document.getElementById("verObservacionProductoPedido").innerText = "Sin observación.";
    } else {
        document.getElementById("verObservacionProductoPedido").innerText = DescifrarASCII(observ);
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
function productoPedidoActualizarModal(idcarr,
        tipo,
        diriA) {
            
    $("#carruselesAGerenteModal input,select,textarea").css('color', '#555555');
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="carruselesRGerenteModal, carruselesVerModal y carruselesActualizarModal">
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

// <editor-fold defaultstate="collapsed" desc="promocionesActualizarModal y promocionesVerModal">
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

// <editor-fold defaultstate="collapsed" desc="productosVerModal, productosActualizarModal, productosEliminarModal">
function productosVerModal(cate,
        nombre,
        descrip,
        precio) {
            
    document.getElementById('verNombreProducto').innerText = DescifrarASCII(nombre);
    document.getElementById('verCategoriaProducto').innerText = DescifrarASCII(cate);
    formatNumber(precio, "verPrecioProducto", "ver");
    if (descrip === "86S97S99S105S111"){
        document.getElementById('verDescripcionProducto').innerText = "Sin descripción.";
    } else {
        document.getElementById('verDescripcionProducto').innerText = DescifrarASCII(descrip);
    }
}
function productosActualizarModal(idprod,
        cate,
        nombre,
        descri,
        precio) {
            
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
}
function productosEliminarModal(idprod,
        nombre) {
            
    document.getElementById('elimIDProducto').value = idprod;
    document.getElementById('elimNombreProducto').innerText = DescifrarASCII(nombre);
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="categoriasActualizarModal y categoriasEliminarModal">
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

// <editor-fold defaultstate="collapsed" desc="sedesVerModal y sedesRegistrar">
$(document).ready(function () {
    var rNIs = document.getElementById("regNumInpSedes");
    var aNIs = document.getElementById("actuaNumInpSedes");
    if (rNIs !== null){
        rNIs.value = 1;
        $('.regHorarioSedes').hide();
        $('.regFormSedes #1').show();
        aNIs.value = 1;
        $('.actuaHorarioSedes').hide();
        $('.actuaFormSedes #1A').show();
    }
});
function validacionSedes(input, metodo){
    var textoInput = input.value;
    var contienePyC = textoInput.indexOf(";");
    if (contienePyC !== -1){
        input.value = "Evite usar punto y coma!";
        input.style.color = "#E06666";
        $('.'+metodo+'FormSedes #'+metodo+'BtnSedes').attr('disabled','');
    } else {
        if (metodo === "actua"){
            input.style.color = "#87A2D1";
        } else {
            input.style.color = "#555555";
        }
        $('.'+metodo+'FormSedes #'+metodo+'BtnSedes').removeAttr('disabled');
    }
}
function eliminarHSedes(metodo){
    var valueInpNumero = Number(document.getElementById(metodo+"NumInpSedes").value);
    if (valueInpNumero !== 1){
        if (metodo === "actua"){
            $('.actuaFormSedes #'+(valueInpNumero)+'A').hide();
            document.getElementById("actuaNumInpSedes").value = valueInpNumero - 1;
            $('.actuaFormSedes #'+valueInpNumero+'A #actuaDias'+valueInpNumero+'Sedes').removeAttr('required');
            $('.actuaFormSedes #'+valueInpNumero+'A #actuaHoras'+valueInpNumero+'Sedes').removeAttr('required');
        } else {
            $('.regFormSedes #'+(valueInpNumero)).hide();
            document.getElementById("regNumInpSedes").value = valueInpNumero - 1;
            $('.regFormSedes #'+valueInpNumero+' #regDias'+valueInpNumero+'Sedes').removeAttr('required');
            $('.regFormSedes #'+valueInpNumero+' #regHoras'+valueInpNumero+'Sedes').removeAttr('required');
        }
    }
}
function agregarHSedes(metodo){
    var valueInpNumero = Number(document.getElementById(metodo+"NumInpSedes").value);
    if (valueInpNumero !== 5){
        if (metodo === "actua"){
            $('.actuaFormSedes #'+(valueInpNumero + 1)+'A').show();
            document.getElementById("actuaNumInpSedes").value = valueInpNumero + 1;
            $('.actuaFormSedes #'+(valueInpNumero + 1)+'A #actuaDias'+(valueInpNumero + 1)+'Sedes').attr('required','');
            $('.actuaFormSedes #'+(valueInpNumero + 1)+'A #actuaHoras'+(valueInpNumero + 1)+'Sedes').attr('required','');
        } else {
            $('.regFormSedes #'+(valueInpNumero + 1)).show();
            document.getElementById("regNumInpSedes").value = valueInpNumero + 1;
            $('.regFormSedes #'+(valueInpNumero + 1)+' #regDias'+(valueInpNumero + 1)+'Sedes').attr('required','');
            $('.regFormSedes #'+(valueInpNumero + 1)+' #regHoras'+(valueInpNumero + 1)+'Sedes').attr('required','');
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
    var horasDescifrado = DescifrarASCII(horas);
    var diasDescifrado = DescifrarASCII(dias);
    var arrayHH = horasDescifrado.split(";");
    var arrayDH = diasDescifrado.split(";");
    var cadeHS = "";
    for (var i = 0; i < arrayHH.length; i++) {
        cadeHS += "Los días <b>"+arrayDH[i]+"</b>, abren entre <b>"+arrayHH[i]+"</b><br>";
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
    $('.actuaHorarioSedes').hide();
    for (var e = 2; e <= 5; e++) {
        $('.actuaFormSedes #'+e+'A #actuaDias'+e+'Sedes').removeAttr('required');
        $('.actuaFormSedes #'+e+'A #actuaHoras'+e+'Sedes').removeAttr('required');
    }
    var horasDescifrado = DescifrarASCII(horas);
    var diasDescifrado = DescifrarASCII(dias);
    var arrayHH = horasDescifrado.split(";");
    var arrayDH = diasDescifrado.split(";");
    var cadeHS = "";
    for (var i = 1; i <= arrayHH.length; i++) {
        $('.actuaFormSedes #'+i+'A').show();
        document.getElementById("actuaNumInpSedes").value = i;
        if (i !== 1){
            $('.actuaFormSedes #'+i+'A #actuaDias'+i+'Sedes').attr('required','');
            $('.actuaFormSedes #'+i+'A #actuaHoras'+i+'Sedes').attr('required','');
        }
        $('.actuaFormSedes #'+i+'A #actuaDias'+i+'Sedes').val(arrayDH[i-1]);
        $('.actuaFormSedes #'+i+'A #actuaHoras'+i+'Sedes').val(arrayHH[i-1]);
    }
//    cadeHS = cadeHS.substring(0,cadeHS.length-2);
//    document.getElementById('verHorariosSedes').innerHTML = cadeHS;
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="soportesVerModal y soportesActualizarModal"> 
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

// <editor-fold defaultstate="collapsed" desc="resPqrsfVerModal y resPqrsfResponderModal"> 
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

// <editor-fold defaultstate="collapsed" desc="usuarioVerModal, usuarioActualizarModal y usuariosSGerenteModal"> 
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

// <editor-fold defaultstate="collapsed" desc="proveedorVerModal, proveedorActualizarModal y proveedorEliminarModal"> 
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

// <editor-fold defaultstate="collapsed" desc="insumoVerModal, insumoActualizarModal y insumoDevolverModal"> 
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
// </editor-fold>
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="MOPass">
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

// <editor-fold defaultstate="collapsed" desc="Estado de Acordeones">
$('.collapse').on('shown.bs.collapse', function(){ 
    $(this).parent().find(".bc .glyphicon-plus").removeClass("glyphicon-plus").addClass("glyphicon-minus"); 
}).on('hidden.bs.collapse', function(){ 
    $(this).parent().find(".bc .glyphicon-minus").removeClass("glyphicon-minus").addClass("glyphicon-plus"); 
});
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

// <editor-fold defaultstate="collapsed" desc="AutoClose de Alertas">
$(".alert").delay(10000).slideUp(200, function() {
    $(this).alert('close');
});
// </editor-fold>