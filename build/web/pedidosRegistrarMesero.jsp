<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registrar Pedido INTERCCO</title>
    </head>
    <%@include file="header.jsp" %>
    <body>
        <ul class="breadcrumb">
            <li><a href="index">Inicio</a></li>
            <li><a href="pedidosListar.jsp">Pedidos</a></li>
            <li class="active">Registrar</li>
        </ul>
        <section class="section-rp">
            <form action="#" method="POST">
                <article>
                    
                    <div class="srpIG">
                        <h1>Información General</h1>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Número de mesa:</span>
                                <select required class="form-control" name="">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                </select>
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Subtotal:</span>
                                <input disabled type="text" class="form-control" name="">
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="button" class="btn-rp btn btn-principal">Registrar Pedido</button>
                            </div>
                        </div>
                    </div>
                    
                    <div class="srpAPP">
                        <h1>Agregar producto al pedido</h1>
                        <div class="filas-i">
                            <div class="input-group" style="width:33.3%;">
                                <span class="input-group-addon">Categoría:</span>
                                <select required class="form-control" name="">
                                    <option value="Combos">Combos</option>
                                </select>
                            </div>
                            <div class="input-group" style="width:33.3%;">
                                <span class="input-group-addon">Producto:</span>
                                <select required class="form-control" name="">
                                    <option value="Combo Familiar">Combo Familiar</option>
                                </select>
                            </div>
                            <div class="input-group" style="width:33.3%;">
                                <span class="input-group-addon">Cantidad:</span>
                                <input required type="text" class="form-control" name="" placeholder="Cantidad.">
                            </div>
                        </div>
                        <div class="filas-i">
                            <div class="input-group" style="width:100%;">
                                <span class="input-group-addon">Observación:</span>
                                <textarea required class="form-control" placeholder="¿Alguna observación para el producto pedido?" name=""></textarea>
                            </div>
                        </div>

                        <div class="input-group cont-btn">
                            <div class="cont-btn-principal">
                                <button type="button" class="btn-rp btn btn-principal">Agregar Producto</button>
                            </div>
                        </div>
                    </div>
                    
                </article>
                
                <h1>Lista de Productos del Pedido</h1>
                <div class="table-responsive">
                    <table class="tablaListarProductosPedido table-bordered table">
                        <thead>
                            <tr>
                                <th>Categoría</th>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tfoot>
                            <tr>
                                <th>Categoría</th>
                                <th>Producto</th>
                                <th>Cantidad</th>
                                <th>Acciones</th>
                            </tr>
                        </tfoot>
                        <tbody>
                            <tr>
                                <td>Combos</td>
                                <td>Combo Familiar</td>
                                <td>
                                    <div class="td-espaciado">
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                                        2
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
                                    </div>
                                </td>
                                <td>
                                    <div class="td-espaciado">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#usuariosVerModal"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Sacar</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Combos</td>
                                <td>Combo Personal</td>
                                <td>
                                    <div class="td-espaciado">
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                                        1
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
                                    </div>
                                </td>
                                <td>
                                    <div class="td-espaciado">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#usuariosVerModal"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Sacar</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Hamburguesas</td>
                                <td>Hamburguesa Mexicana</td>
                                <td>
                                    <div class="td-espaciado">
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                                        5
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
                                    </div>
                                </td>
                                <td>
                                    <div class="td-espaciado">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#usuariosVerModal"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Sacar</button>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td>Bebidas</td>
                                <td>Jugo de Mora</td>
                                <td>
                                    <div class="td-espaciado">
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-minus"></span></button>
                                        3
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-plus"></span></button>
                                    </div>
                                </td>
                                <td>
                                    <div class="td-espaciado">
                                        <button type="button" class="btn btn-info" data-toggle="modal" data-target="#usuariosVerModal"><span class="glyphicon glyphicon-eye-open"></span> Ver</button>
                                        <button type="button" class="btn btn-warning"><span class="glyphicon glyphicon-edit"></span> Editar</button>
                                        <button type="button" class="btn btn-danger"><span class="glyphicon glyphicon-remove"></span> Sacar</button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </form>
        </section>
    </body>
    <%@include file="footer.jsp" %>
</html>
