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

public class VerificandoUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String emailUsuario = request.getParameter("emailUsuarioV");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            ResultSet rs;
            
            ps = con.prepareStatement("SELECT * FROM usuarios WHERE email=? AND existencia=?;");
            ps.setString(1, cA.CifrarASCII(emailUsuario));
            ps.setString(2, "Y");
            rs = ps.executeQuery();

            if (rs.next()){
                int idU = rs.getInt("idUsuarios");
                String pass = cA.DescifrarASCII(rs.getString("password"));
                ps.close();
                ps = con.prepareStatement("UPDATE usuarios SET verificado=? WHERE idUsuarios=?;");
                ps.setString(1, "Y");
                ps.setInt(2, idU);
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Acceder?accederEmail="+emailUsuario+"&accederPassword="+pass).forward(request, response);
                } else {
                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de VERIFICAR el dato de USUARIO.");
                }
            } else {
                request.getRequestDispatcher("index?mensaje=NeEV").forward(request, response);
                System.out.println("ERROR de VERIFICAR el dato de USUARIO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL VERIFICANDO los datos de USUARIOS.");
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
