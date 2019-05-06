package com.INTERCCO.controlador.CRUDPqrsf;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class DyCPqrsf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idPqrsf = request.getParameter("idPqrsf");
            String mensa = request.getParameter("mensa");
            
            HttpSession session = request.getSession();
            String rolUsuario = (String) session.getAttribute("rolUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            
            ps = con.prepareStatement("UPDATE pqrsf SET estado=? WHERE idPqrsf=?;");
            ps.setString(1, mensa);
            ps.setInt(2, Integer.parseInt(idPqrsf));
            int res = ps.executeUpdate();

            if (res > 0){
                if (rolUsuario.equals("Cliente")){
                    request.getRequestDispatcher("index?mensaje=YCancelar").forward(request, response);
                } else {
                    request.getRequestDispatcher("Pqrsfs?mensaje=YEliminar").forward(request, response);
                }
            } else {
                if (rolUsuario.equals("Cliente")){
                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de CANCELAR el dato de PQRSF.");
                } else {
                    request.getRequestDispatcher("Pqrsfs?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de DESCARTAR el dato de PQRSF.");
                }
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            HttpSession session = request.getSession();
            String rolUsuario = (String) session.getAttribute("rolUsuario");
            if (rolUsuario.equals("Cliente")){
                request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                System.out.println("ERROR en MySQL CANCELANDO los datos de PQRSF.");
            } else {
                request.getRequestDispatcher("Pqrsfs?mensaje=Ne").forward(request, response);
                System.out.println("ERROR en MySQL DESCARTANDO los datos de PQRSF.");
            }
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
