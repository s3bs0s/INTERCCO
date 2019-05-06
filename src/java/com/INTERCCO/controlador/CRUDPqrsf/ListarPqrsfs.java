package com.INTERCCO.controlador.CRUDPqrsf;

import com.INTERCCO.modelo.Beans.Pqrsf;
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

public class ListarPqrsfs extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            
            ArrayList<Pqrsf> listaPqrsf = new ArrayList<>();
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            
            ps = con.prepareStatement("SELECT * FROM pqrsf WHERE estado!=?;");
            ps.setString(1, "Cancelado");
            rs = ps.executeQuery();
            while (rs.next()){
                Pqrsf pq = new Pqrsf();
                pq.setIdPqrsf(rs.getInt("idPqrsf"));
                pq.setFchRegistro(rs.getDate("fch_registro"));
                pq.setHoraRegistro(rs.getTime("hora_registro"));
                pq.setTipoSolicitud(rs.getString("tipo_solicitud"));
                pq.setDirigidoA(rs.getString("dirigido_a"));
                pq.setConsulta(rs.getString("consulta"));
                pq.setRespuesta(rs.getString("respuesta"));
                pq.setEstado(rs.getString("estado"));
                
                
                ps2 = con.prepareStatement("SELECT * FROM usuarios WHERE idUsuarios=? AND existencia=?;");
                ps2.setInt(1, rs.getInt("idCliente"));
                ps2.setString(2, "Y");
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pq.setIdCliente(rs2.getString("email"));
                    pq.setNombreCliente(rs2.getString("nombres"));
                }
                ps2.close();
                rs2.close();


                ps2 = con.prepareStatement("SELECT * FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSedeCliente"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pq.setIdSedeCliente(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();


                ps2 = con.prepareStatement("SELECT * FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSedeDirigido"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pq.setIdSedeDirigido(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();


                ps2 = con.prepareStatement("SELECT * FROM usuarios WHERE idUsuarios=? AND rol=?;");
                ps2.setInt(1, rs.getInt("idInterlocutor"));
                ps2.setString(2, "Gerente");
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pq.setIdInterlocutor(rs2.getString("email"));
                    pq.setNombreInterlocutor(rs2.getString("nombres"));
                } else {
                    pq.setIdInterlocutor("");
                }
                ps2.close();
                rs2.close();

                    
                listaPqrsf.add(pq);
            }
            
            request.setAttribute("listaPqrsf", listaPqrsf);
            request.getRequestDispatcher("resPqrsfListarGerente.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de PQRSF.");
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
