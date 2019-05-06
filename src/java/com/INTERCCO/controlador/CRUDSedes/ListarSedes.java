package com.INTERCCO.controlador.CRUDSedes;

import com.INTERCCO.modelo.Beans.Ciudades;
import com.INTERCCO.modelo.Beans.Sedes;
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

public class ListarSedes extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            
            ArrayList<Sedes> listaSedes = new ArrayList<>();
            ArrayList<Ciudades> listaCiuSSedes = new ArrayList<>();
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            
            ps = con.prepareStatement("SELECT * FROM sedes;");
            rs = ps.executeQuery();
            while (rs.next()){
                Sedes sd = new Sedes();
                sd.setIdSedes(rs.getInt("idSedes"));
                sd.setNombre(rs.getString("nombre"));
                sd.setRango(rs.getString("rango"));
                sd.setDireccion(rs.getString("direccion"));
                sd.setNumMesas(rs.getInt("num_mesas"));
                sd.setSrcMapa(rs.getString("src_mapa"));
                sd.setDiasHorario(rs.getString("dias_horario"));
                sd.setHorasHorario(rs.getString("horas_horario"));
                sd.setIdCiudad(rs.getInt("idCiudad"));
                
                
                ps2 = con.prepareStatement("SELECT * FROM ciudades WHERE idCiudades=?;");
                ps2.setInt(1, rs.getInt("idCiudad"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    sd.setNombreCiudad(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();
                
                
                ps2 = con.prepareStatement("SELECT * FROM sedes WHERE rango=? AND idCiudad=?;");
                ps2.setString(1, "Principal");
                ps2.setInt(2, rs.getInt("idCiudad"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    sd.setTienePrincipal("Y");
                } else {
                    sd.setTienePrincipal("N");
                }
                ps2.close();
                rs2.close();
                
                
                listaSedes.add(sd);
            }
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT idCiudades,nombre FROM ciudades ORDER BY idCiudades DESC;");
            rs = ps.executeQuery();
            while (rs.next()){
                Ciudades cd = new Ciudades();
                cd.setIdCiudades(rs.getInt("idCiudades"));
                cd.setNombre(rs.getString("nombre"));
                
                listaCiuSSedes.add(cd);
            }
            
            request.setAttribute("listaSedes", listaSedes);
            request.setAttribute("listaCiuSSedes", listaCiuSSedes);
            request.getRequestDispatcher("sedesListarAdminS.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de SEDES.");
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
