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

public class PEDBusquedaClienteAJAX extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String cedula = request.getParameter("cedula");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
           
            String nombresCliente = "";
            String apellidosCliente = "";
            ps = con.prepareStatement("SELECT * FROM info_usuarios WHERE num_i=? AND existencia=?;");
            ps.setString(1, cedula);
            ps.setString(2, "Y");
            rs = ps.executeQuery();
            if (rs.next()){
                int idUsuario = rs.getInt("idUsuario");
                apellidosCliente = rs.getString("apellidos");
                
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM usuarios WHERE idUsuarios=?;");
                ps.setInt(1, idUsuario);
                rs = ps.executeQuery();
                if (rs.next()){
                    nombresCliente = rs.getString("nombres");
                }
                
                response.getWriter().print(nombresCliente+" "+apellidosCliente+";"+idUsuario);
            } else {
                response.getWriter().print("no");
            }
                
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL BUSCANDO los datos de CLIENTE.");
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
