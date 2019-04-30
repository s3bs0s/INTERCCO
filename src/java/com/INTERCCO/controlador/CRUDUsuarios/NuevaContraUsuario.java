package com.INTERCCO.controlador.CRUDUsuarios;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class NuevaContraUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String validacion = request.getParameter("perfilContraActualUsuario");

        if (validacion == null){
            try {
                CifradoASCII cA = new CifradoASCII();
                String email = cA.DescifrarASCII(request.getParameter("recupEmail"));
                String contra = request.getParameter("recupNuevaContra");
                
                ConectaDB cdb = new ConectaDB();
                Connection con = cdb.conectar();
                PreparedStatement ps;

                ps = con.prepareStatement("UPDATE usuarios SET password=? WHERE email=? AND existencia=?;");
                ps.setString(1, cA.CifrarASCII(contra));
                ps.setString(2, cA.CifrarASCII(email));
                ps.setString(3, "Y");
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("index?mensaje=YCambioContra").forward(request, response);
                } else {
                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de RECUPERANDO CONTRASEÑA el dato de USUARIO.");
                }
                cdb.cierraConexion();

            } catch (SQLException sql) {
                request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                System.out.println("ERROR en MySQL RECUPERANDO CONTRASEÑA los datos de USUARIOS.");
                sql.getStackTrace();
            } catch (NullPointerException npe){
                request.getRequestDispatcher("Error404.jsp?mensaje="+npe.toString()).forward(request, response);
            }
            
        } else {
            
            try {
                String idU = request.getParameter("perfilIDUsuario");
                String contra = request.getParameter("perfilContraNuevaUsuario");
                String rol = request.getParameter("perfilRolOcultoUsuario");

                ConectaDB cdb = new ConectaDB();
                Connection con = cdb.conectar();
                CifradoASCII cA = new CifradoASCII();
                PreparedStatement ps;

                ps = con.prepareStatement("UPDATE usuarios SET password=? WHERE idUsuarios=? AND existencia=?;");
                ps.setString(1, cA.CifrarASCII(contra));
                ps.setString(2, idU);
                ps.setString(3, "Y");
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Salir?mensaje=YCambioContraPerfil").forward(request, response);
                } else {
                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de CAMBIANDO CONTRASEÑA el dato de USUARIO.");
                }
                cdb.cierraConexion();

            } catch (SQLException sql) {
                String rol = request.getParameter("perfilRolOcultoUsuario");
                request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                System.out.println("ERROR en MySQL CAMBIANDO CONTRASEÑA los datos de USUARIOS.");
                sql.getStackTrace();
            } catch (NullPointerException npe){
                request.getRequestDispatcher("Error404.jsp?mensaje="+npe.toString()).forward(request, response);
            }
            
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
