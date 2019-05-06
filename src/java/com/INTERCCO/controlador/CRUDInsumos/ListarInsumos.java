package com.INTERCCO.controlador.CRUDInsumos;

import com.INTERCCO.modelo.Beans.Insumos;
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

public class ListarInsumos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            
            ArrayList<Insumos> listaInsu = new ArrayList<>();
            ArrayList<Proveedores> listaProSInsu = new ArrayList<>();
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            
            ps = con.prepareStatement("SELECT * FROM insumos WHERE existencia!=?;");
            ps.setString(1, "N");
            rs = ps.executeQuery();
            while (rs.next()){
                Insumos ins = new Insumos();
                ins.setIdInsumos(rs.getInt("idInsumos"));
                ins.setReferencia(rs.getString("referencia"));
                ins.setNombre(rs.getString("nombre"));
                ins.setFchIngreso(rs.getDate("fch_ingreso"));
                ins.setFchCaducidad(rs.getDate("fch_caducidad"));
                ins.setUnidadMedida(rs.getString("unidad_medida"));
                ins.setCantidad(rs.getInt("cantidad"));
                ins.setPrecioUnitario(rs.getInt("precio_unitario"));
                ins.setExistencia(rs.getString("existencia"));
                ins.setIdProveedor(rs.getInt("idProveedor"));
                
                
                ps2 = con.prepareStatement("SELECT * FROM proveedores WHERE idProveedores=? AND existencia=?;");
                ps2.setInt(1, rs.getInt("idProveedor"));
                ps2.setString(2, "Y");
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    ins.setNombreProveedor(rs2.getString("nombre_coe"));
                    ins.setTipoIf(rs2.getString("tipo_if"));
                    ins.setNumIt(rs2.getString("num_it"));
                    ins.setNombrePc(rs2.getString("nombre_pc"));
                    ins.setCargoPc(rs2.getString("cargo_pc"));
                    ins.setTipoI(rs2.getString("tipo_i"));
                    ins.setNumI(rs2.getString("num_i"));
                    ins.setEmail(rs2.getString("email"));
                    ins.setFaxPc(rs2.getString("fax_pc"));
                    ins.setExtensionFaxPc(rs2.getString("extension_fax_pc"));
                    ins.setTelefonoPc(rs2.getString("telefono_pc"));
                    ins.setMovilPc(rs2.getString("movil_pc"));
                }
                ps2.close();
                rs2.close();

                
                ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    ins.setIdSede(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();

                
                listaInsu.add(ins);
            }
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT idProveedores,nombre_coe FROM proveedores WHERE existencia=? ORDER BY idProveedores DESC;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Proveedores pr = new Proveedores();
                pr.setIdProveedores(rs.getInt("idProveedores"));
                pr.setNombreCoe(rs.getString("nombre_coe"));
                
                listaProSInsu.add(pr);
            }
            
            request.setAttribute("listaInsu", listaInsu);
            request.setAttribute("listaProSInsu", listaProSInsu);
            request.getRequestDispatcher("insumosListarGerente.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de INSUMOS.");
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
