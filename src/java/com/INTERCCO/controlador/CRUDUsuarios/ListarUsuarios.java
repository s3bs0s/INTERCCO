package com.INTERCCO.controlador.CRUDUsuarios;

import com.INTERCCO.modelo.Beans.InfoUsuarios;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ListarUsuarios extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            
            ArrayList<InfoUsuarios> listaInfUsu = new ArrayList<>();
            
            ps = con.prepareStatement("SELECT * FROM info_usuarios WHERE existencia=?;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                InfoUsuarios ifus = new InfoUsuarios();
                ifus.setIdInfoUsuarios(rs.getInt("idInfo_Usuarios"));
                ifus.setFchRegistro(rs.getDate("fch_registro"));
                ifus.setHoraRegistro(rs.getTime("hora_registro"));
                ifus.setApellidos(rs.getString("apellidos"));
                ifus.setTipoI(rs.getString("tipo_i"));
                ifus.setNumI(rs.getString("num_i"));
                ifus.setTelefono(rs.getString("telefono"));
                ifus.setMovil(rs.getString("movil"));
                ifus.setGenero(rs.getString("genero"));
                ifus.setFchNaci(rs.getDate("fch_naci"));
                ifus.setDireccion(rs.getString("direccion"));
                ifus.setIdUsuario(rs.getInt("idUsuario"));
                
                
                ps2 = con.prepareStatement("SELECT * FROM usuarios WHERE idUsuarios=? AND existencia=?;");
                ps2.setInt(1, rs.getInt("idUsuario"));
                ps2.setString(2, "Y");
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    ifus.setEmail(rs2.getString("email"));
                    ifus.setPassword(rs2.getString("password"));
                    ifus.setRol(rs2.getString("rol"));
                    ifus.setNombres(rs2.getString("nombres"));
                    ifus.setVerificado(rs2.getString("verificado"));
                    int iSe = rs2.getInt("idSede");

                    ps2.close();
                    rs2.close();
                    ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                    ps2.setInt(1, iSe);
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        ifus.setSede(rs2.getString("nombre"));
                    } else {
                        ifus.setSede("Sin Sede");
                    }
                }
                ps2.close();
                rs2.close();
                
                
                ps2 = con.prepareStatement("SELECT * FROM sanciones WHERE idUsuario=? AND existencia=?;");
                ps2.setInt(1, rs.getInt("idUsuario"));
                ps2.setString(2, "Y");
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    ifus.setJustificacion(rs2.getString("justificacion"));
                    ifus.setIdModerador(rs2.getInt("idModerador"));
                    ifus.setFchLimite(rs2.getDate("fch_limite"));
                    ifus.setExistenciaSancion(rs2.getString("existencia"));
                    int iModer = rs2.getInt("idModerador");

                    ps2.close();
                    rs2.close();
                    ps2 = con.prepareStatement("SELECT email FROM usuarios WHERE idUsuarios=?;");
                    ps2.setInt(1, iModer);
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        ifus.setEmailModerador(rs2.getString("email"));
                    }
                } else {
                    ifus.setExistenciaSancion("N");
                }
                ps2.close();
                rs2.close();

                
                listaInfUsu.add(ifus);
            }
            
            request.setAttribute("listaInfUsu", listaInfUsu);
            request.getRequestDispatcher("usuariosListarGerente.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de USUARIOS.");
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
