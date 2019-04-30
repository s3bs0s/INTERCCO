package com.INTERCCO.controlador.CRUDAuditoria;

import com.INTERCCO.modelo.Beans.Logs;
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

public class ListarAuditoria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            
            ArrayList<Logs> listaLogs = new ArrayList<>();
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            
            ps = con.prepareStatement("SELECT * FROM logs;");
            rs = ps.executeQuery();
            while (rs.next()){
                Logs ls = new Logs();
                ls.setIdLogs(rs.getInt("idLogs"));
                ls.setFchRegistro(rs.getDate("fch_registro"));
                ls.setHoraRegistro(rs.getTime("hora_registro"));
                ls.setTabla(rs.getString("tabla"));
                ls.setAccion(rs.getString("accion"));
                
                if (rs.getInt("idUsuario") != 0){
                    ps2 = con.prepareStatement("SELECT * FROM usuarios WHERE idUsuarios=? AND existencia=?;");
                    ps2.setInt(1, rs.getInt("idUsuario"));
                    ps2.setString(2, "Y");
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        ls.setIdUsuario(rs2.getString("email"));
                    }
                    ps2.close();
                    rs2.close();
                } else {
                    ls.setIdUsuario("Sistema");
                }
                
                if (rs.getInt("idSede") != 0 ){
                    ps2 = con.prepareStatement("SELECT * FROM sedes WHERE idSedes=?;");
                    ps2.setInt(1, rs.getInt("idSede"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        ls.setIdSede(rs2.getString("nombre"));
                    }
                    ps2.close();
                    rs2.close();
                } else {
                    ls.setIdSede("Sin Sede");
                }
                listaLogs.add(ls);
            }
            
            request.setAttribute("listaLogs", listaLogs);
            request.getRequestDispatcher("auditoria.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de AUDITORIA.");
            sql.printStackTrace();
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
