package com.INTERCCO.controlador.CRUDUsuarios;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizarPerfilUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("perfilIDUsuario");
            String nombres = request.getParameter("perfilNombresUsuario");
            String apellidos = request.getParameter("perfilApellidosUsuario");
            String rol = request.getParameter("perfilRolOcultoUsuario");
            String telef_fijo = request.getParameter("perfilTelefonoUsuario");
            String telef_movil = request.getParameter("perfilMovilUsuario");
            String genero = request.getParameter("perfilGeneroUsuario");
            String fchnaci = request.getParameter("perfilFechaNacimientoUsuario");
            String direccion = request.getParameter("perfilDireccionUsuario");
            String sede = request.getParameter("perfilSedeCliente");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            if (rol.equals("Cliente")){
                ps = con.prepareStatement("UPDATE usuarios SET nombres=?,idSede=? WHERE idUsuarios=?;");
                ps.setString(1, nombres);
                ps.setInt(2, Integer.parseInt(sede));
                ps.setInt(3, Integer.parseInt(id));
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
                        ps = con.prepareStatement("UPDATE pqrsf SET idSedeCliente=? WHERE idCliente=?;");
                        ps.setInt(1, Integer.parseInt(sede));
                        ps.setInt(2, Integer.parseInt(id));
                        int res3 = ps.executeUpdate();

                        if (res3 > 0){
                            request.getRequestDispatcher("Salir?mensaje=YActualizarPerfil").forward(request, response);
                            System.out.println("ERROR de ACTUALIZAR PERFIL el dato de USUARIO.");
                        } else {
                            request.getRequestDispatcher("index?mensaje=NeAP").forward(request, response);
                            System.out.println("ERROR de ACTUALIZAR PERFIL el dato de USUARIO.");
                        }
                    } else {
                        request.getRequestDispatcher("index?mensaje=NeAP").forward(request, response);
                        System.out.println("ERROR de ACTUALIZAR PERFIL el dato de USUARIO.");
                    }
                } else {
                    request.getRequestDispatcher("index?mensaje=NeAP").forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR PERFIL el dato de USUARIO.");
                }
            } else {
                ps = con.prepareStatement("UPDATE usuarios SET nombres=? WHERE idUsuarios=?;");
                ps.setString(1, nombres);
                ps.setInt(2, Integer.parseInt(id));
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
                        request.getRequestDispatcher("Salir?mensaje=YActualizarPerfil").forward(request, response);
                        System.out.println("ERROR de ACTUALIZAR PERFIL el dato de USUARIO.");
                    } else {
                        request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                        System.out.println("ERROR de ACTUALIZAR PERFIL el dato de USUARIO.");
                    }
                } else {
                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR PERFIL el dato de USUARIO.");
                }
            }
            cdb.cierraConexion();

        } catch (SQLException sql) {
            String rol = request.getParameter("perfilRolOcultoUsuario");
            if (rol.equals("Cliente")){
                request.getRequestDispatcher("index?mensaje=NeAP").forward(request, response);
            } else {
                request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            }
            System.out.println("ERROR en MySQL ACTUALIZANDO PERFIL los datos de USUARIOS.");
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
