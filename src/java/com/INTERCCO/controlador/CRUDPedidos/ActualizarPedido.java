package com.INTERCCO.controlador.CRUDPedidos;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizarPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int idPedido = Integer.parseInt(request.getParameter("actuaIDPedido"));
            int mesa = Integer.parseInt(request.getParameter("actuaMesaPedidos"));
            int subTotalGlobal = Integer.parseInt(request.getParameter("actuaSubtotalPedidos").replace(".", ""));
            int numsInputPP = Integer.parseInt(request.getParameter("actuaNumsInputPP"));
            
            String[][] productosPedido = new String[numsInputPP][7];
            // idDetallesP, idProducto, Cantidad, Observacion, Subtotal, Nuevo o Viejo, Existencia
            for (int i = 0; i < numsInputPP; i++) {
                String[] arregloInputPP = request.getParameter("actua"+(i+1)+"InputPP").split(";");
                productosPedido[i][0] = arregloInputPP[6];
                productosPedido[i][1] = arregloInputPP[0];
                productosPedido[i][2] = arregloInputPP[3];
                productosPedido[i][3] = arregloInputPP[4];
                productosPedido[i][4] = arregloInputPP[5];
                productosPedido[i][5] = arregloInputPP[7];
                productosPedido[i][6] = arregloInputPP[8];
            }
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            
            ps = con.prepareStatement("UPDATE pedidos SET num_mesa=?,sub_total=? WHERE idPedidos=?;");
            ps.setInt(1, mesa);
            ps.setInt(2, subTotalGlobal);
            ps.setInt(3, idPedido);
            int res = ps.executeUpdate();

            if (res > 0){   
                for (int i = 0; i < productosPedido.length; i++) {
                    if (productosPedido[i][5].equals("Viejo")){
                        ps.close();
                        ps = con.prepareStatement("UPDATE detalles_pedidos SET cantidad=?,observacion=?,sub_total=?,existencia=? WHERE idDetalles_Pedidos=?;");
                        ps.setInt(1, Integer.parseInt(productosPedido[i][2]));
                        ps.setString(2, productosPedido[i][3]);
                        ps.setInt(3, Integer.parseInt(productosPedido[i][4]));
                        ps.setString(4, productosPedido[i][6]);
                        ps.setInt(5, Integer.parseInt(productosPedido[i][0]));
                        ps.executeUpdate();
                    } else {
                        if (productosPedido[i][6].equals("Y")){
                            ps.close();
                            ps = con.prepareStatement("INSERT INTO detalles_pedidos (idPedido,idProducto,cantidad,observacion,sub_total,existencia) VALUES (?,?,?,?,?,?);");
                            ps.setInt(1, idPedido);
                            ps.setInt(2, Integer.parseInt(productosPedido[i][1]));
                            ps.setInt(3, Integer.parseInt(productosPedido[i][2]));
                            ps.setString(4, productosPedido[i][3]);
                            ps.setInt(5, Integer.parseInt(productosPedido[i][4]));
                            ps.setString(6, "Y");
                            ps.executeUpdate();
                        }
                    }
                }

                request.getRequestDispatcher("Pedidos?mensaje=YActualizar").forward(request, response);
            } else {
                request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de ACTUALIZAR el dato de PEDIDO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de PEDIDOS.");
            sql.getStackTrace();
        } catch (Exception alle){
            request.getRequestDispatcher("Error404.jsp?mensaje="+alle.toString()).forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
