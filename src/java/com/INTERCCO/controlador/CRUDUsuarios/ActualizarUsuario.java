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

public class ActualizarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("actuaIDUsuario");
            String nombres = request.getParameter("actuaNombresUsuario");
            String apellidos = request.getParameter("actuaApellidosUsuario");
            String rol = request.getParameter("actuaRolUsuario");
            String password = request.getParameter("actuaContraUsuario");
            String telef_fijo = request.getParameter("actuaTelefonoUsuario");
            String telef_movil = request.getParameter("actuaMovilUsuario");
            String genero = request.getParameter("actuaGeneroUsuario");
            String fchnaci = request.getParameter("actuaFechaNacimientoUsuario");
            String direccion = request.getParameter("actuaDireccionUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            
            ps = con.prepareStatement("UPDATE usuarios SET password=?,rol=?,nombres=? WHERE idUsuarios=?;");
            ps.setString(1, cA.CifrarASCII(password));
            ps.setString(2, rol);
            ps.setString(3, nombres);
            ps.setInt(4, Integer.parseInt(id));
            int res = ps.executeUpdate();

            if (res > 0){
                ps.close();
                ps = con.prepareStatement("UPDATE info_usuarios SET apellidos=?,telefono=?,movil=?,genero=?,fch_naci=?,direccion=? WHERE idUsuario=?;");
                ps.setString(1, apellidos);
                ps.setString(2, telef_fijo);
                ps.setString(3, telef_movil);
                ps.setString(4, genero);
                ps.setString(5, fchnaci);
                ps.setString(6, direccion);
                ps.setInt(7, Integer.parseInt(id));
                int res2 = ps.executeUpdate();

                if (res2 > 0){
                    request.getRequestDispatcher("Usuarios?mensaje=YActualizar&nomusu="+nombres).forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR el dato de USUARIO.");
                } else {
                    request.getRequestDispatcher("Usuarios?mensaje=Ne&nomusu="+nombres).forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR el dato de USUARIO.");
                }
            } else {
                request.getRequestDispatcher("Usuarios?mensaje=Ne&nomusu="+nombres).forward(request, response);
                System.out.println("ERROR de ACTUALIZAR el dato de USUARIO.");
            }
            cdb.cierraConexion();

        } catch (SQLException sql) {
            request.getRequestDispatcher("Usuarios?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de USUARIOS.");
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
