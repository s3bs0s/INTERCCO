package com.INTERCCO.controlador.CRUDProveedores;

import com.INTERCCO.modelo.Beans.Ciudades;
import com.INTERCCO.modelo.Beans.Proveedores;
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

public class ListarProveedores extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            
            ArrayList<Proveedores> listaPro = new ArrayList<>();
            ArrayList<Ciudades> listaCiuSPro = new ArrayList<>();
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            
            ps = con.prepareStatement("SELECT * FROM proveedores WHERE existencia=?;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Proveedores pr = new Proveedores();
                pr.setIdProveedores(rs.getInt("idProveedores"));
                pr.setNombreCoe(rs.getString("nombre_coe"));
                pr.setTipoIf(rs.getString("tipo_if"));
                pr.setNumIt(rs.getString("num_it"));
                pr.setTelefonoCoe(rs.getString("telefono_coe"));
                pr.setExtensionTelCoe(rs.getString("extension_tel_coe"));
                pr.setMovilCoe(rs.getString("movil_coe"));
                pr.setFaxCoe(rs.getString("fax_coe"));
                pr.setExtensionFaxCoe(rs.getString("extension_fax_coe"));
                pr.setDireccion(rs.getString("direccion"));
                pr.setNombrePc(rs.getString("nombre_pc"));
                pr.setCargoPc(rs.getString("cargo_pc"));
                pr.setTipoI(rs.getString("tipo_i"));
                pr.setNumI(rs.getString("num_i"));
                pr.setEmail(rs.getString("email"));
                pr.setFaxPc(rs.getString("fax_pc"));
                pr.setExtensionFaxPc(rs.getString("extension_fax_pc"));
                pr.setTelefonoPc(rs.getString("telefono_pc"));
                pr.setMovilPc(rs.getString("movil_pc"));
                pr.setExistencia(rs.getString("existencia"));
                pr.setIdCiudad(rs.getString("idCiudad"));
                
                
                ps2 = con.prepareStatement("SELECT nombre FROM ciudades WHERE idCiudades=?;");
                ps2.setInt(1, rs.getInt("idCiudad"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pr.setNombreCiudad(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();

                    
                listaPro.add(pr);
            }
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT idCiudades,nombre FROM ciudades ORDER BY idCiudades DESC;");
            rs = ps.executeQuery();
            while (rs.next()){
                Ciudades cd = new Ciudades();
                cd.setIdCiudades(rs.getInt("idCiudades"));
                cd.setNombre(rs.getString("nombre"));
                
                listaCiuSPro.add(cd);
            }
            
            request.setAttribute("listaPro", listaPro);
            request.setAttribute("listaCiuSPro", listaCiuSPro);
            request.getRequestDispatcher("proveedoresListarGerente.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de PROVEEDORES.");
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
