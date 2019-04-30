package com.INTERCCO.controlador.CRUDUsuarios;

import com.INTERCCO.controlador.General.CifradoASCII;
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

public class EliminarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idUsuario = request.getParameter("idUsua");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            ResultSet rs;
            
            ps = con.prepareStatement("SELECT * FROM usuarios WHERE idUsuarios=?;");
            ps.setInt(1, Integer.parseInt(idUsuario));
            rs = ps.executeQuery();

            if (rs.next()){
                String emailUsua = cA.DescifrarASCII(rs.getString("email"));
                ps.close();
                rs.close();
                ps = con.prepareStatement("UPDATE usuarios SET existencia=? WHERE idUsuarios=?;");
                ps.setString(1, "N");
                ps.setInt(2, Integer.parseInt(idUsuario));
                int res = ps.executeUpdate();

                if (res > 0){
                    ps.close();
                    rs.close();
                    ps = con.prepareStatement("UPDATE info_usuarios SET existencia=? WHERE idUsuario=?;");
                    ps.setString(1, "N");
                    ps.setInt(2, Integer.parseInt(idUsuario));
                    int res2 = ps.executeUpdate();

                    if (res2 > 0){
                        request.getRequestDispatcher("Usuarios?mensaje=YEliminar&emailusu="+emailUsua).forward(request, response);
                    } else {
                        request.getRequestDispatcher("Usuarios?mensaje=Ne").forward(request, response);
                        System.out.println("ERROR de ELIMINAR el dato de USUARIO.");
                    }
                } else {
                    request.getRequestDispatcher("Usuarios?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de ELIMINAR el dato de USUARIO.");
                }
            } else {
                request.getRequestDispatcher("Usuarios?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de ELIMINAR el dato de USUARIO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Usuarios?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ELIMINANDO los datos de USUARIOS.");
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