$(document).ready(function () {
    $('.tablaListarPedidosMesero').DataTable({
        "order": [[3, "desc"],[0, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de pedidos por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún pedido disponible en esta tabla.",
            "sInfo": "Mostrando pedidos del _START_ al _END_ de un total de _TOTAL_ pedidos",
            "sInfoEmpty": "Mostrando pedidos del 0 al 0 de un total de 0 pedidos",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ pedidos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarPedidosGerente').DataTable({
        "order": [[5, "desc"],[0, "desc"],[1, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de pedidos por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún pedido disponible en esta tabla.",
            "sInfo": "Mostrando pedidos del _START_ al _END_ de un total de _TOTAL_ pedidos",
            "sInfoEmpty": "Mostrando pedidos del 0 al 0 de un total de 0 pedidos",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ pedidos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.regTablaListarProductosPedido').DataTable({
        "order": [[2, "desc"],[0, "asc"],[1, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de productos del pedido por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún producto del pedido disponible en esta tabla.",
            "sInfo": "Mostrando productos del _START_ al _END_ de un total de _TOTAL_ productos del pedido",
            "sInfoEmpty": "Mostrando productos del 0 al 0 de un total de 0 productos del pedido",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ productos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.actuaTablaListarProductosPedido').DataTable({
        "order": [[2, "desc"],[0, "asc"],[1, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de productos del pedido por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún producto del pedido disponible en esta tabla.",
            "sInfo": "Mostrando productos del _START_ al _END_ de un total de _TOTAL_ productos del pedido",
            "sInfoEmpty": "Mostrando productos del 0 al 0 de un total de 0 productos del pedido",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ productos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarFacturas').DataTable({
        "order": [[0, "desc"],[1, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de facturas por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna factura disponible en esta tabla.",
            "sInfo": "Mostrando facturas del _START_ al _END_ de un total de _TOTAL_ facturas",
            "sInfoEmpty": "Mostrando facturas del 0 al 0 de un total de 0 facturas",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ facturas).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarPedidosFacturar').DataTable({
        "order": [[4, "desc"],[0, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de pedidos por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún pedido disponible en esta tabla.",
            "sInfo": "Mostrando pedidos del _START_ al _END_ de un total de _TOTAL_ pedidos",
            "sInfoEmpty": "Mostrando pedidos del 0 al 0 de un total de 0 pedidos",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ pedidos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarComandas').DataTable({
        "order": [[1, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de comandas por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna comanda disponible en esta tabla.",
            "sInfo": "Mostrando comandas del _START_ al _END_ de un total de _TOTAL_ comandas",
            "sInfoEmpty": "Mostrando comandas del 0 al 0 de un total de 0 comandas",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ comandas).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarInsumos').DataTable({
        "order": [[4, "desc"],[1, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de insumos por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún insumo disponible en esta tabla.",
            "sInfo": "Mostrando insumos del _START_ al _END_ de un total de _TOTAL_ insumos",
            "sInfoEmpty": "Mostrando insumos del 0 al 0 de un total de 0 insumos",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ insumos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarInsumosProductosReg').DataTable({
        "order": [[0, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de insumos por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún insumo disponible en esta tabla.",
            "sInfo": "Insumos del _START_ al _END_ de un total de _TOTAL_",
            "sInfoEmpty": "Insumos del 0 al 0 de un total de 0",
            "sInfoFiltered": "(De un total de _MAX_ insumos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarInsumosProductosActua').DataTable({
        "order": [[0, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de insumos por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún insumo disponible en esta tabla.",
            "sInfo": "Mostrando insumos del _START_ al _END_ de un total de _TOTAL_ insumos",
            "sInfoEmpty": "Mostrando insumos del 0 al 0 de un total de 0 insumos",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ insumos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarProveedores').DataTable({
        "order": [[1, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de proveedores por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún proveedor disponible en esta tabla.",
            "sInfo": "Mostrando proveedores del _START_ al _END_ de un total de _TOTAL_ proveedores",
            "sInfoEmpty": "Mostrando proveedores del 0 al 0 de un total de 0 proveedores",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ proveedores).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarUsuarios').DataTable({
//        "ajax": '../ajax/data/arrays.txt',
        "order": [[5, "desc"],[0, "asc"],[1, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de usuarios por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún usuario disponible en esta tabla.",
            "sInfo": "Mostrando usuarios del _START_ al _END_ de un total de _TOTAL_ usuarios",
            "sInfoEmpty": "Mostrando usuarios del 0 al 0 de un total de 0 usuarios",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ usuarios).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarSedes').DataTable({
        "order": [[2, "asc"],[1, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de sedes por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna sede disponible en esta tabla.",
            "sInfo": "Mostrando sedes del _START_ al _END_ de un total de _TOTAL_ sedes",
            "sInfoEmpty": "Mostrando sedes del 0 al 0 de un total de 0 sedes",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ sedes).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarLogs').DataTable({
        "order": [[0, "desc"],[1, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de logs por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún log disponible en esta tabla.",
            "sInfo": "Mostrando logs del _START_ al _END_ de un total de _TOTAL_ logs",
            "sInfoEmpty": "Mostrando logs del 0 al 0 de un total de 0 logs",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ logs).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarPQRSF').DataTable({
        "order": [[5, "desc"],[0, "desc"],[1, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de solicitudes por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna solicitud disponible en esta tabla.",
            "sInfo": "Mostrando solicitudes del _START_ al _END_ de un total de _TOTAL_ solicitudes",
            "sInfoEmpty": "Mostrando solicitudes del 0 al 0 de un total de 0 solicitudes",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ solicitudes).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarPublicidad').DataTable({
        "order": [[0, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de publicidades por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna publicidad disponible en esta tabla.",
            "sInfo": "Mostrando publicidades del _START_ al _END_ de un total de _TOTAL_ publicidades",
            "sInfoEmpty": "Mostrando publicidades del 0 al 0 de un total de 0 publicidades",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ publicidades).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarSoportes').DataTable({
        "order": [[2, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de soportes por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún soporte disponible en esta tabla.",
            "sInfo": "Mostrando soportes del _START_ al _END_ de un total de _TOTAL_ soportes",
            "sInfoEmpty": "Mostrando soportes del 0 al 0 de un total de 0 soportes",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ soportes).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarResPQRSF').DataTable({
        "order": [[5, "desc"],[0, "desc"],[1, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de solicitudes por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna solicitud disponible en esta tabla.",
            "sInfo": "Mostrando solicitudes del _START_ al _END_ de un total de _TOTAL_ solicitudes",
            "sInfoEmpty": "Mostrando solicitudes del 0 al 0 de un total de 0 solicitudes",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ solicitudes).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarCategorias').DataTable({
        "order": [[0, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de categorias por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna categoría disponible en esta tabla.",
            "sInfo": "Mostrando categorias del _START_ al _END_ de un total de _TOTAL_ categorias",
            "sInfoEmpty": "Mostrando categorias del 0 al 0 de un total de 0 categorias",
            "sInfoFiltered": "(Filtrado de _MAX_ categorias).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarProductos').DataTable({
        "order": [[0, "asc"],[2, "asc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de productos por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ningún producto disponible en esta tabla.",
            "sInfo": "Mostrando productos del _START_ al _END_ de un total de _TOTAL_ productos",
            "sInfoEmpty": "Mostrando productos del 0 al 0 de un total de 0 productos",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ productos).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarPromociones').DataTable({
        "order": [[5, "desc"],[0, "desc"],[1, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de promociones por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna promoción disponible en esta tabla.",
            "sInfo": "Mostrando promociones del _START_ al _END_ de un total de _TOTAL_ promociones",
            "sInfoEmpty": "Mostrando promociones del 0 al 0 de un total de 0 promociones",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ promociones).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
    
    $('.tablaListarPromocionesAdminS').DataTable({
        "order": [[6, "desc"],[1, "desc"],[2, "desc"]],
        "pageLength": 5,
        language: {
            "sProcessing": "Procesando...",
            "sLengthMenu": "Límite de promociones por página: _MENU_",
            "sZeroRecords": "No se encontraron resultados.",
            "sEmptyTable": "Ninguna promoción disponible en esta tabla.",
            "sInfo": "Mostrando promociones del _START_ al _END_ de un total de _TOTAL_ promociones",
            "sInfoEmpty": "Mostrando promociones del 0 al 0 de un total de 0 promociones",
            "sInfoFiltered": "(Filtrado de un total de _MAX_ promociones).",
            "sInfoPostFix": "",
            "sSearch": "Buscar:",
            "sUrl": "",
            "sInfoThousands": ",",
            "sLoadingRecords": "Cargando...",
            "oPaginate": {
                "sFirst": "Primero",
                "sLast": "Último",
                "sNext": "Siguiente",
                "sPrevious": "Anterior"
            },
            "oAria": {
                "sSortAscending": ": Activar para ordenar la columna de manera ascendente.",
                "sSortDescending": ": Activar para ordenar la columna de manera descendente."
            }
        }
    });
});