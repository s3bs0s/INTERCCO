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

public class PEDGastoInsumosAJAX extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            int cantidadProductos = Integer.parseInt(request.getParameter("cantidadProductos"));
            String operacion = request.getParameter("operacion");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            String validacion = "success";
            
            if (operacion.equals("-")){
                ps = con.prepareStatement("SELECT idInsumoNecesario,cantidad_insumo FROM detalles_productos WHERE existencia=? AND idProducto=?;");
                ps.setString(1, "Y");
                ps.setInt(2, idProducto);
                rs = ps.executeQuery();
                while (rs.next()){
                    ps2 = con.prepareStatement("SELECT cantidad FROM insumos WHERE idInsumos=?;");
                    ps2.setInt(1, rs.getInt("idInsumoNecesario"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        if (rs2.getInt("cantidad") < (rs.getInt("cantidad_insumo")*cantidadProductos)){
                            validacion = "danger";
                            break;
                        }
                    }
                    ps2.close();
                    rs2.close();

                }
                ps.close();
                rs.close();
            }
            
            if (validacion.equals("success")){
                ps = con.prepareStatement("SELECT cantidad_insumo,idInsumoNecesario FROM detalles_productos WHERE existencia=? AND idProducto=?;");
                ps.setString(1, "Y");
                ps.setInt(2, idProducto);
                rs = ps.executeQuery();
                while (rs.next()){
                    
                    ps2 = con.prepareStatement("UPDATE insumos SET cantidad=(cantidad"+operacion+"?) WHERE idInsumos=?;");
                    ps2.setInt(1, rs.getInt("cantidad_insumo")*cantidadProductos);
                    ps2.setInt(2, rs.getInt("idInsumoNecesario"));
                    ps2.executeUpdate();
                    
                }
            }
            
	    response.getWriter().print(validacion);
                
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de INSUMOS.");
            sql.printStackTrace();
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
