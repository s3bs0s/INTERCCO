package com.INTERCCO.controlador.CRUDProveedores;

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

public class EliminarProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idProveedor = request.getParameter("elimIDProveedor");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            
            ps = con.prepareStatement("SELECT * FROM proveedores WHERE idProveedores=?;");
            ps.setInt(1, Integer.parseInt(idProveedor));
            rs = ps.executeQuery();

            if (rs.next()){
                String nombreProv = rs.getString("nombre_coe");
                ps.close();
                rs.close();
                ps = con.prepareStatement("UPDATE proveedores SET existencia=? WHERE idProveedores=?;");
                ps.setString(1, "N");
                ps.setInt(2, Integer.parseInt(idProveedor));
                int res = ps.executeUpdate();

                if (res > 0){
                    ps.close();
                    ps = con.prepareStatement("UPDATE insumos SET existencia=? WHERE idProveedor=? AND existencia!=?;");
                    ps.setString(1, "N");
                    ps.setInt(2, Integer.parseInt(idProveedor));
                    ps.setString(3, "N");
                    ps.executeUpdate();
                    
                    request.getRequestDispatcher("Proveedores?mensaje=YEliminar&nomCOE="+nombreProv).forward(request, response);
                } else {
                    request.getRequestDispatcher("Proveedores?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de ELIMINAR el dato de PROVEEDOR.");
                }
            } else {
                request.getRequestDispatcher("Proveedores?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de ELIMINAR el dato de PROVEEDOR.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Proveedores?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ELIMINANDO los datos de PROVEEDORES.");
            sql.getStackTrace();
        } catch (NullPointerException npe){
            request.getRequestDispatcher("Error404.jsp?mensaje="+npe.toString()).forward(request, response);
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
