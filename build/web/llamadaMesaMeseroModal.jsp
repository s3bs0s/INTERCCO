<div class="modal fade" id="llamadaMesaMeseroModal" role="dialog">
    <div class="modal-dialog">

        <div class="modal-content">
            <div class="modal-header" id="header">
                <button type="button" class="close" id="header-close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title" id="header-text"><span class="icon-phone" id="phone"></span><label for="#" class="me">¡Llamada de la Mesa 4!</label></h4>
            </div>
            <div class="mb-textaling modal-body" id="body">
                <form>
                    <div class="input-group cont-btn">
                        <div class="cont-btn-principal">
                            <button type="button" onClick="window.open('pedidosListar.jsp', '_self')" class="btn-modal btn btn-principal" id="body-btn1">¡Voy en Camino!</button>
                        </div>
                        <div class="cont-btns-secundario">
                            <button type="button" onClick="window.open('index', '_self')" class="btn-modal btn btn-secundario" id="body-btn2">Estoy Ocupad@</button>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer-lm" id="footer">
                <h4 class="modal-title" id="footer-text"><label for="#">Razón: Cuenta</label></h4>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    window.setInterval (BlinkIt, 1100);
    var backgroundH = "#fff";
    var backgroundF = "#fff";
    var backgroundB = "#446EB6";
    var backgroundBB1 = "#fff";
    var backgroundBB2 = "#fff";
    var colorH = "#446EB6";
    var colorHC = "0 1px 0 #446EB6";
    var colorF = "#446EB6";
    var colorBB1 = "#446EB6";
    var colorBB2 = "#446EB6";
    var borderBB1 = "solid 1px #446EB6";
    var borderBB2 = "solid 1px #446EB6";
    var opacityHC = "1";
    var transform = "rotate(90deg)";

    function BlinkIt () {
        backgroundH = (backgroundH === "#446EB6")? "#fff" : "#446EB6";
        document.getElementById("header").style.background = backgroundH;

        transform = (transform === "rotate(0deg)")? "rotate(90deg)" : "rotate(0deg)";
        document.getElementById("phone").style.transform = transform;

        colorH = (colorH === "#fff")? "#446EB6" : "#fff";
        document.getElementById("header-text").style.color = colorH;

        colorHC = (colorHC === "0 1px 0 #fff")? "0 1px 0 #446EB6" : "0 1px 0 #fff";
        opacityHC = (opacityHC === ".5")? "1" : ".5";
        document.getElementById("header-close").style.textShadow = colorHC;
        document.getElementById("header-close").style.opacity = opacityHC;

        backgroundB = (backgroundB === "#fff")? "#446EB6" : "#fff";
        document.getElementById("body").style.background = backgroundB;

        backgroundBB1 = (backgroundBB1 === "#446EB6")? "#fff" : "#446EB6";
        colorBB1 = (colorBB1 === "#fff")? "#446EB6" : "#fff";
        borderBB1 = (borderBB1 === "solid 1px #fff")? "solid 1px #446EB6" : "solid 1px #fff";
        document.getElementById("body-btn1").style.background = backgroundBB1;
        document.getElementById("body-btn1").style.color = colorBB1;
        document.getElementById("body-btn1").style.border = borderBB1;

        backgroundBB2 = (backgroundBB2 === "#446EB6")? "#fff" : "#446EB6";
        colorBB2 = (colorBB2 === "#fff")? "#446EB6" : "#fff";
        borderBB2 = (borderBB2 === "solid 1px #fff")? "solid 1px #446EB6" : "solid 1px #fff";
        document.getElementById("body-btn2").style.background = backgroundBB2;
        document.getElementById("body-btn2").style.color = colorBB2;
        document.getElementById("body-btn2").style.border = borderBB2;

        backgroundF = (backgroundF === "#446EB6")? "#fff" : "#446EB6";
        document.getElementById("footer").style.background = backgroundF;

        colorF = (colorF === "#fff")? "#446EB6" : "#fff";
        document.getElementById("footer-text").style.color = colorF;
    }
</script>
