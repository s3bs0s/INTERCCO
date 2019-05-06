package com.INTERCCO.controlador.CRUDUsuarios;

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

public class MayorEdadUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("meIDUsuario");
            String tipoIdenti = request.getParameter("meTipoIdentiUsuario");
            String numIdenti = request.getParameter("meNumIdentiUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            
            ps = con.prepareStatement("SELECT * FROM info_usuarios WHERE num_i=? AND existencia=?;");
            ps.setString(1, numIdenti);
            ps.setString(2, "Y");
            rs = ps.executeQuery();

            if (rs.next()){
                request.getRequestDispatcher("index?mensaje=NActualizarME&numIdenti="+numIdenti).forward(request, response);
                System.out.println("ERROR de ACTUALIZAR CEDULA el dato de USUARIO.");
            } else {
                ps.close();
                ps = con.prepareStatement("UPDATE info_usuarios SET tipo_i=?,num_i=? WHERE idUsuario=?;");
                ps.setString(1, tipoIdenti);
                ps.setString(2, numIdenti);
                ps.setInt(3, Integer.parseInt(id));
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Salir?mensaje=YActualizarME").forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR CEDULA el dato de USUARIO.");
                } else {
                    request.getRequestDispatcher("Salir?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR CEDULA el dato de USUARIO.");
                }
            }
            cdb.cierraConexion();

        } catch (SQLException sql) {
            request.getRequestDispatcher("Salir?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO CEDULA los datos de USUARIOS.");
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
