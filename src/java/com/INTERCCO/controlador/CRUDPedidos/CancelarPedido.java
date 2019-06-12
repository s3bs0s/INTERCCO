package com.INTERCCO.controlador.CRUDPedidos;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CancelarPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idPedido = request.getParameter("idPed");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            PreparedStatement ps3;
            ResultSet rs3;
            PreparedStatement ps4;
            ResultSet rs4;
            
            ps = con.prepareStatement("UPDATE pedidos SET estado=?,existencia=? WHERE idPedidos=?;");
            ps.setString(1, "Cancelado");
            ps.setString(2, "N");
            ps.setInt(3, Integer.parseInt(idPedido));
            int res = ps.executeUpdate();

            if (res > 0){
                ps = con.prepareStatement("SELECT * FROM pedidos WHERE idPedidos=?;");
                ps.setInt(1, Integer.parseInt(idPedido));
                rs = ps.executeQuery();
                if (rs.next()){
                    ps2 = con.prepareStatement("SELECT * FROM detalles_pedidos WHERE idPedido=?;");
                    ps2.setInt(1, Integer.parseInt(idPedido));
                    rs2 = ps2.executeQuery();
                    while (rs2.next()){
                        ps3 = con.prepareStatement("SELECT cantidad_insumo,idInsumoNecesario FROM detalles_productos WHERE existencia=? AND idProducto=?;");
                        ps3.setString(1, "Y");
                        ps3.setInt(2, rs2.getInt("idProducto"));
                        rs3 = ps3.executeQuery();
                        while (rs3.next()){

                            ps4 = con.prepareStatement("UPDATE insumos SET cantidad=(cantidad+?) WHERE idInsumos=?;");
                            ps4.setInt(1, rs3.getInt("cantidad_insumo")*rs2.getInt("cantidad"));
                            ps4.setInt(2, rs3.getInt("idInsumoNecesario"));
                            ps4.executeUpdate();

                        }
                    }
                }
                
                request.getRequestDispatcher("Pedidos?mensaje=YCancelar").forward(request, response);
            } else {
                request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de CANCELAR el dato de PEDIDO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL CANCELANDO los datos de PEDIDOS.");
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
