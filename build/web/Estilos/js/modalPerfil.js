// <editor-fold defaultstate="collapsed" desc="Cifrado ASCII">
function CifrarASCII(texto){
    if (texto === null){
        return "";
    } else {
        if (texto.length > 0){
            var cifrado = "";
//            if (texto.includes("\n")){
//                texto = texto.replace("\n", "Ø");
//            }
            for (var i = 0; i < texto.length; i++) {
//                var character = texto.charAt(i);
//                if (character === 'Ø'){
//                    cifrado = cifrado + "13"+"S";
//                } else {
//                    cifrado = cifrado + texto.charCodeAt(i)+"S";
//                }
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
//            var ascii;
            for (var i = 0; i < vect.length; i++) {
//                if (vect[i] === "13"){
//                    descifrado = descifrado+"\n";
//                } else {
//                    descifrado = descifrado + String.fromCharCode(vect[i]);
//                }
                descifrado = descifrado + String.fromCharCode(vect[i]);
            }
            return descifrado;
        } else {
            return "";
        }
    }
}
// </editor-fold>

// <editor-fold defaultstate="collapsed" desc="Metodos para listar">
function verModalPerfil(idusu,
        nom,
        ape,
        fot,
        rol,
        tipo,
        num,
        gen,
        fna,
        email,
        tel,
        movil,
        pass,
        dir,
        idsede,
        nomsede){
            
    $("#ModalPerfil input,select,textarea").css('color', '#555555');
    document.getElementById("perfilIDUsuario").value = DescifrarASCII(idusu);
    document.getElementById("perfilRolOcultoUsuario").value = DescifrarASCII(rol);
    document.getElementById("perfilNombresUsuario").value = DescifrarASCII(nom);
    document.getElementById("perfilApellidosUsuario").value = DescifrarASCII(ape);
    if (DescifrarASCII(rol) === "AdminS"){
        document.getElementById("perfilRolUsuario").value = "Administrador";
    } else {
        document.getElementById("perfilRolUsuario").value = DescifrarASCII(rol);
    }
    if (DescifrarASCII(tipo) === "TI") {
        document.getElementById('perfilTipoIdentiUsuario').value = "Tarjeta de Identidad";
    } else if (DescifrarASCII(tipo) === "CC") {
        document.getElementById('perfilTipoIdentiUsuario').value = "Cédula de Ciudadanía";
    } else if (DescifrarASCII(tipo) === "TP") {
        document.getElementById('perfilTipoIdentiUsuario').value = "Tarjeta de Pasaporte";
    } else if (DescifrarASCII(tipo) === "CE") {
        document.getElementById('perfilTipoIdentiUsuario').value = "Cédula de Extranjería";
    }
    document.getElementById("perfilNumIdentiUsuario").value = DescifrarASCII(num);
    document.getElementById("perfilGeneroUsuario").value = DescifrarASCII(gen);
    document.getElementById("perfilFechaNacimientoUsuario").value = DescifrarASCII(fna);
    document.getElementById("perfilEmailUsuario").value = DescifrarASCII(email);
    document.getElementById("perfilTelefonoUsuario").value = DescifrarASCII(tel);
    document.getElementById("perfilMovilUsuario").value = DescifrarASCII(movil);
    document.getElementById("perfilContraActualOcultoUsuario").value = pass;
    document.getElementById("perfilDireccionUsuario").value = DescifrarASCII(dir);
   
    if (DescifrarASCII(rol) === "Cliente") {
        $("#perfilCajSedeUsuario").hide();
        $("#perfilCajSedeCliente").show();
        $("#perfilPanelFotoUsuario").hide();
        document.getElementById("perfilSedeUsuario").value = "";
        document.getElementById("perfilSedeCliente").value = DescifrarASCII(idsede);
        $("#perfilSedeCliente").attr('required','');
        $("#perfilSedeUsuario").removeAttr('required');
    } else {
        $("#perfilCajSedeUsuario").show();
        $("#perfilCajSedeCliente").hide();
        if (DescifrarASCII(rol) === "AdminS"){
            $("#perfilPanelFotoUsuario").hide();
        } else {
            var img = document.getElementById("perfilNombreImagenUsuario");
            img.value = fot;
            if (img.value === "86S97S99S105S111"){
                $("#perfilEliminarFoto").hide();
            } else {
                $("#perfilEliminarFoto").show();
            }
            $("#perfilPanelFotoUsuario").show();
            if (fot === "86S97S99S105S111"){
                if (DescifrarASCII(gen) === "Masculino"){
                    $("#perfilCajFotoUsuario img").attr('src', 'Estilos/img/FotoPerfilEmpleados/PerfilAnonimoH.jpg');
                    $("#perfilCajFotoUsuario img").attr('alt', 'PerfilAnonimoH.jpg');
                } else {
                    $("#perfilCajFotoUsuario img").attr('src', 'Estilos/img/FotoPerfilEmpleados/PerfilAnonimoM.jpg');
                    $("#perfilCajFotoUsuario img").attr('alt', 'PerfilAnonimoM.jpg');
                }
            } else {
                $("#perfilCajFotoUsuario img").attr('src', 'ArchivosSistema/Usuarios/'+DescifrarASCII(nomsede)+'/'+DescifrarASCII(fot));
                $("#perfilCajFotoUsuario img").attr('alt', DescifrarASCII(fot));
            }
        }
        document.getElementById("perfilSedeUsuario").value = DescifrarASCII(nomsede);
        document.getElementById("perfilSedeCliente").value = "";
        $("#perfilSedeCliente").removeAttr('required');
    }
}

function ContrasIgualesPerfil(){
    if (document.getElementById('perfilContraNuevaUsuario').value !== document.getElementById('perfilRepitaContraNuevaUsuario').value){
        $('#perfilCambiarContras').attr('disabled','');
        document.getElementById('perfilRepitaContraNuevaUsuario').style.color= '#E06666';
        document.getElementById('perfilContraNuevaUsuario').style.color= '#E06666';
    } else {
        $('#perfilCambiarContras').removeAttr('disabled');
        document.getElementById('perfilRepitaContraNuevaUsuario').style.color= '#555555';
        document.getElementById('perfilContraNuevaUsuario').style.color= '#555555';
    }
}

function EnviarFormContras(){
    var contraActualDescifrada = DescifrarASCII(document.getElementById('perfilContraActualOcultoUsuario').value);
    if (contraActualDescifrada !== document.getElementById('perfilContraActualUsuario').value){
        document.getElementById('perfilContraActualUsuario').style.color = '#E06666';
        document.getElementById('perfilContraActualUsuario').value = "Contraseña Actual Incorrecta!";
    } else {
        if (document.getElementById('perfilContraNuevaUsuario').value === "" || document.getElementById('perfilContraNuevaUsuario').value === "Falta nueva contraseña!"){
            document.getElementById('perfilContraNuevaUsuario').value = "Falta nueva contraseña!";
            document.getElementById('perfilContraNuevaUsuario').style.color = '#E06666';
        } else {
            if (document.getElementById('perfilContraNuevaUsuario').value.length < 3 || document.getElementById('perfilContraNuevaUsuario').value.length > 20){
                document.getElementById('perfilContraNuevaUsuario').value = "Entre 3 y 20 caracteres!";
                document.getElementById('perfilContraNuevaUsuario').style.color = '#E06666';
            } else {
                document.getElementById('FormPerfil').action = 'UsuarioNC';
                document.getElementById('FormPerfil').submit();
            }
        }
    }
}

function EnviarFormFoto(mod, nomSede){
    if (mod === "AI"){
        if (document.getElementById('perfilRolOcultoUsuario').value !== "AdminS" && document.getElementById('perfilRolOcultoUsuario').value !== "Cliente"){
            document.getElementById('FormPerfil').action = 'Usuario'+mod;
            document.getElementById('FormPerfil').enctype = "multipart/form-data";
            document.getElementById('FormPerfil').submit();
        }
    } else {
        var img = document.getElementById("perfilNombreImagenUsuario").value;
        if (img === "86S97S99S105S111"){
            $("#perfilEliminarFoto").hide();
        } else {
            var rolOculto = document.getElementById('perfilRolOcultoUsuario').value;
            if ( rolOculto !== "AdminS" && rolOculto !== "Cliente"){
                $("#perfilCajFotoUsuario img").attr('src', 'ArchivosSistema/Usuarios/'+DescifrarASCII(nomSede)+'/'+DescifrarASCII(img));
                $("#perfilCajFotoUsuario img").attr('alt', DescifrarASCII(img));
                document.getElementById('FormPerfil').action = 'Usuario'+mod;
                document.getElementById('FormPerfil').submit();
            }
        }
    }
}

$(document).ready(function () {
    var pHIu = document.getElementById("perfilHayImagenUsuario");
    if (pHIu !== null){
        pHIu.value = "N";
        $("#perfilCambiarFoto").attr('disabled','');
    }
});
function validarFilePerfil(all){
    var extensiones_permitidas = [".png", ".bmp", ".jpg", ".jpeg", ".svg"];
    var tamano = 6; // EXPRESADO EN MB.
    var rutayarchivo = all.value;
    var ultimo_punto = all.value.lastIndexOf(".");
    var extension = rutayarchivo.slice(ultimo_punto, rutayarchivo.length);
    if (all.files.length > 0){
        if((all.files[0].size / 1048576) > tamano){
            document.getElementById("perfilHayImagenUsuario").value = "N";
            document.getElementById(all.id).value = "";
            document.getElementById(all.id).style.background = "#E06666";
            document.getElementById(all.id).style.color = "#fff";
            $("#perfilCambiarFoto").attr('disabled','');
        } else {
            if(extensiones_permitidas.indexOf(extension) === -1){
                document.getElementById("perfilHayImagenUsuario").value = "N";
                document.getElementById(all.id).value = "";
                document.getElementById(all.id).style.background = "#E06666";
                document.getElementById(all.id).style.color = "#fff";
                $("#perfilCambiarFoto").attr('disabled','');
            } else {
                $("#perfilCambiarFoto").removeAttr('disabled');
                document.getElementById(all.id).style.background = "#fff";
                document.getElementById(all.id).style.color = "#555";
                document.getElementById("perfilHayImagenUsuario").value = "Y";

                var preview = document.querySelector('#perfilCajFotoUsuario img');
                var file = document.querySelector('#perfilArchivoUsuario').files[0];

                var reader = new FileReader();
                reader.onloadend = function() {
                    preview.src = reader.result;
                };

                reader.readAsDataURL(file);
            }
        }
    } else {
        document.getElementById("perfilHayImagenUsuario").value = "N";
        document.getElementById(all.id).value = "";
        document.getElementById(all.id).style.background = "#E06666";
        document.getElementById(all.id).style.color = "#fff";
        $("#perfilCambiarFoto").attr('disabled','');
    }
}

$('#accordionPerfil .collapse').on('shown.bs.collapse', function(){
    var seccion = $(this);
    if (seccion.hasClass('seccionFotoPerfil') || seccion.hasClass('seccionPasswordPerfil')){
        $("#BtnActuaPerfil").hide();
    }
}).on('hidden.bs.collapse', function(){ 
    var seccion = $(this);
    if (seccion.hasClass('seccionFotoPerfil') || seccion.hasClass('seccionPasswordPerfil')){
        $("#BtnActuaPerfil").show();
    }
});
// </editor-fold>

$(document).ready(function(){
    document.getElementById("perfilContraActualUsuario").addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("perfilCambiarContras").click();
        }
    });
    document.getElementById("perfilContraNuevaUsuario").addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("perfilCambiarContras").click();
        }
    });
    document.getElementById("perfilRepitaContraNuevaUsuario").addEventListener("keyup", function (event) {
        if (event.keyCode === 13) {
            event.preventDefault();
            document.getElementById("perfilCambiarContras").click();
        }
    });
});

var modal = document.getElementById('ModalPerfil');
var flex = document.getElementById('FlexPerfil');
var abrir = document.getElementById('AbrirPerfil');
var cerrarH = document.getElementById('CerrarHeaderPerfil');
var cerrarB = document.getElementById('CerrarBodyPerfil');

if (modal !== null){
    abrir.addEventListener('click', function () {
        modal.style.display = 'block';
        $('html,body').css('overflow', 'hidden');
    });

    cerrarH.addEventListener('click', function () {
        modal.style.display = 'none';
        $('html,body').css('overflow', 'auto');
    });

    cerrarB.addEventListener('click', function () {
        modal.style.display = 'none';
        $('html,body').css('overflow', 'auto');
    });

    window.addEventListener('click', function (e) {
        if (e.target === flex) {
            modal.style.display = 'none';
            $('html,body').css('overflow', 'auto');
        }
    });
}