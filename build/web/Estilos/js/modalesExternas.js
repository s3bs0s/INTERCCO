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

// <editor-fold defaultstate="collapsed" desc="MOPass">
function MOPassME (mod, id) {
    var typeInp = document.getElementById(id).type;
    if (typeInp === "password"){
        document.getElementById(id).type = 'text';
        document.getElementById('BtnMOPassword'+mod).innerText = "Ocultar";
    } else {
        document.getElementById(id).type = 'password';
        document.getElementById('BtnMOPassword'+mod).innerText = "Mostrar";
    }
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Validación de Códigos">
function CodigoCorrecto(codigoCorrecto, email){
    var codigoUsuario = document.getElementById("recupCodigo").value;
    var codigoCDescifrado = DescifrarASCII(codigoCorrecto);
    
    if(codigoUsuario.length < 11 || codigoUsuario.length > 11){
        document.getElementById("recupCodigo").value = "Solo 10 caracteres!";
        document.getElementById("recupCodigo").style.color = "#E06666";
        $("#BtnConfirmarRC").attr("disabled","");
        alert("Aja");
    } else {
        alert("Aja2");
        if(codigoCDescifrado === codigoUsuario){
            window.location = "codigo-nuevaContra.jsp?emailU="+email;
        } else {
            document.getElementById("recupCodigo").value = "Código incorrecto!";
            document.getElementById("recupCodigo").style.color = "#E06666";
            $("#BtnConfirmarRC").attr("disabled","");
        }
    }
}
function CodigoCorrectoV(codigoCorrecto, email){
    var codigoUsuario = document.getElementById("verifCodigo").value;
    var codigoCDescifrado = DescifrarASCII(codigoCorrecto);
    var emailDescifrado = DescifrarASCII(email);
    
    if(codigoUsuario.length < 10 || codigoUsuario.length > 10){
        document.getElementById("verifCodigo").value = "Solo 10 caracteres!";
        document.getElementById("verifCodigo").style.color = "#E06666";
        $("#BtnConfirmarRC").attr("disabled","");
    } else {
        if(codigoCDescifrado === codigoUsuario){
            window.location = "UsuarioV?emailUsuarioV="+emailDescifrado;
        } else {
            document.getElementById("verifCodigo").value = "Código incorrecto!";
            document.getElementById("verifCodigo").style.color = "#E06666";
            $("#BtnConfirmarRC").attr("disabled","");
        }
    }
}
function HayCodigo(input){
    if (input.value.length === 0){
        $('#BtnConfirmarRC').attr('disabled','');
    } else {
        $('#BtnConfirmarRC').removeAttr('disabled');
    }
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Validación de Contraseñas">
function ContrasIguales(){
    if (document.getElementById('recupRepitaNuevaContra').value !== document.getElementById('recupNuevaContra').value){
        $('#recupCambiarContra').attr('disabled','');
        document.getElementById('recupRepitaNuevaContra').style.color= '#E06666';
        document.getElementById('recupNuevaContra').style.color= '#E06666';
    } else {
        $('#recupCambiarContra').removeAttr('disabled');
        document.getElementById('recupRepitaNuevaContra').style.color= '#555555';
        document.getElementById('recupNuevaContra').style.color= '#555555';
    }
}
// </editor-fold>