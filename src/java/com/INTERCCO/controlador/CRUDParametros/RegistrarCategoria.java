package com.INTERCCO.controlador.CRUDParametros;

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
import javax.servlet.http.HttpSession;

public class RegistrarCategoria extends HttpServlet {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nombreCateg = request.getParameter("regNombreCategoria");
            nombreCateg = nombreCateg.replace("Ø", "");
            nombreCateg = nombreCateg.replace("Æ", "");
            
            HttpSession session = request.getSession();
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            
            ps = con.prepareStatement("SELECT * FROM categorias WHERE nombre=? AND existencia=?;");
            ps.setString(1, nombreCateg);
            ps.setString(2, "Y");
            rs = ps.executeQuery();

            if (rs.next()){
                request.getRequestDispatcher("Parametros?mensaje=Nec&nomCateg="+nombreCateg).forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de CATEGORIA.");
            } else {
                ps = con.prepareStatement("INSERT INTO categorias (nombre,idSede,existencia) VALUES (?,?,?);");
                ps.setString(1, nombreCateg);
                ps.setInt(2, idSedeUsuario);
                ps.setString(3, "Y");
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Parametros?mensaje=YCategoria&nomCateg="+nombreCateg).forward(request, response);
                } else {
                    request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La categoría&accMod=registrar").forward(request, response);
                    System.out.println("ERROR de REGISTRAR el dato de CATEGORIA.");
                }
            }
            
            cdb.cierraConexion();
        } catch (SQLException sql) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La categoría&accMod=registrar").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de CATEGORIAS.");
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
