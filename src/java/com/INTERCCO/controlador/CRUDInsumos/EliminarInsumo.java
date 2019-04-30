package com.INTERCCO.controlador.CRUDInsumos;

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

public class EliminarInsumo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idInsumo = request.getParameter("idIns");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            
            ps = con.prepareStatement("SELECT * FROM insumos WHERE idInsumos=?;");
            ps.setString(1, idInsumo);
            rs = ps.executeQuery();

            if (rs.next()){
                String nombreIns = rs.getString("nombre");
                ps.close();
                rs.close();
                ps = con.prepareStatement("UPDATE insumos SET existencia=? WHERE idInsumos=?;");
                ps.setString(1, "N");
                ps.setInt(2, Integer.parseInt(idInsumo));
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Insumos?mensaje=YEliminar&nomIns="+nombreIns).forward(request, response);
                } else {
                    request.getRequestDispatcher("Insumos?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de ELIMINAR el dato de INSUMO.");
                }
            } else {
                request.getRequestDispatcher("Insumos?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de ELIMINAR el dato de INSUMO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Insumos?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ELIMINANDO los datos de INSUMOS.");
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
