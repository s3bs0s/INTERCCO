package com.INTERCCO.controlador.CRUDUsuarios;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.File;
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

public class EliminarImagenUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idUsuario = request.getParameter("perfilIDUsuario");
            
            HttpSession session = request.getSession();
            String nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            ResultSet rs;
            
            ps = con.prepareStatement("SELECT * FROM info_usuarios WHERE idUsuario=?;");
            ps.setInt(1, Integer.parseInt(idUsuario));
            rs = ps.executeQuery();

            if (rs.next()){
                String nombreImg = cA.DescifrarASCII(rs.getString("nombre_img"));
                
                String SAVE_DIR = "ArchivosSistema" + File.separator + "Usuarios" + File.separator + nomSedeUsuario;
                String appPath = request.getServletContext().getRealPath("");
                String savePath = appPath + SAVE_DIR + File.separator + nombreImg;
                
                File img = new File(savePath);
                if (img.exists()) {
                    img.delete();
                }
                
                ps.close();
                rs.close();
                ps = con.prepareStatement("UPDATE info_usuarios SET nombre_img=? WHERE idUsuario=?;");
                ps.setString(1, "86S97S99S105S111");
                ps.setInt(2, Integer.parseInt(idUsuario));
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Salir?mensaje=YEliminarImg").forward(request, response);
                } else {
                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de ELIMINAR IMG el dato de USUARIO.");
                }
            } else {
                request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de ELIMINAR IMG el dato de USUARIO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ELIMINANDO IMG los datos de USUARIOS.");
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
