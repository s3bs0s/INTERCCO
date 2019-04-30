package com.INTERCCO.controlador.CRUDProveedores;

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

public class RegistrarProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nombreCOE = request.getParameter("regNombreCOEProveedor");
            String tipoIdentiFiscal = request.getParameter("regTipoIdentiFiscalCOEProveedor");
            String numIdentiTributaria = request.getParameter("regNumIdentiTribuCOEProveedor");
            String telefonoCOE = request.getParameter("regTelefonoCOEProveedor");
            String extenTeleCOE = request.getParameter("regExtTelefonoCOEProveedor");
            String movilCOE = request.getParameter("regMovilCOEProveedor");
            String faxCOE = request.getParameter("regFaxCOEProveedor");
            String extenFaxCOE = request.getParameter("regExtFaxCOEProveedor");
            String ciudad = request.getParameter("regCiudadCOEProveedor");
            String direccion = request.getParameter("regDireccionCOEProveedor");
            
            String nombrePC = request.getParameter("regNombrePCProveedor");
            String cargoPC = request.getParameter("regCargoPCProveedor");
            String tipoIdenti = request.getParameter("regTipoIdentiPCProveedor");
            String numIdenti = request.getParameter("regNumIdentiPCProveedor");
            String email = request.getParameter("regEmailPCProveedor");
            String faxPC = request.getParameter("regFaxPCProveedor");
            String extenFaxPC = request.getParameter("regExtFaxPCProveedor");
            String telefonoPC = request.getParameter("regTelefonoPCProveedor");
            String movilPC = request.getParameter("regMovilPCProveedor");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            
            if (telefonoCOE.length() > 0 || movilCOE.length() > 0 || faxCOE.length() > 0){
                if (email.length() > 0 || faxPC.length() > 0 || telefonoPC.length() > 0 || movilPC.length() > 0){
                    ps = con.prepareStatement("SELECT * FROM proveedores WHERE nombre_coe=? AND existencia=?;");
                    ps.setString(1, nombreCOE);
                    ps.setString(2, "Y");
                    rs = ps.executeQuery();

                    if (rs.next()){
                        request.getRequestDispatcher("Proveedores?mensaje=NeNomCOE&nomCOE="+nombreCOE).forward(request, response);
                        System.out.println("ERROR de REGISTRAR el dato de PROVEEDOR.");
                    } else {
                        ps.close();
                        rs.close();
                        ps = con.prepareStatement("SELECT * FROM proveedores WHERE num_it=? AND existencia=?;");
                        ps.setString(1, numIdentiTributaria);
                        ps.setString(2, "Y");
                        rs = ps.executeQuery();

                        if (rs.next()){
                            request.getRequestDispatcher("Proveedores?mensaje=NeNIT&NIT="+numIdentiTributaria).forward(request, response);
                            System.out.println("ERROR de REGISTRAR el dato de PROVEEDOR.");
                        } else {
                            ps.close();
                            rs.close();
                            ps = con.prepareStatement("INSERT INTO proveedores (nombre_coe,tipo_if,num_it,telefono_coe,extension_tel_coe,movil_coe,fax_coe,extension_fax_coe,idCiudad,direccion,nombre_pc,cargo_pc,tipo_i,num_i,email,fax_pc,extension_fax_pc,telefono_pc,movil_pc,existencia) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?);");
                            ps.setString(1, nombreCOE);
                            ps.setString(2, tipoIdentiFiscal);
                            ps.setString(3, numIdentiTributaria);
                            ps.setString(4, telefonoCOE);
                            ps.setString(5, extenTeleCOE);
                            ps.setString(6, movilCOE);
                            ps.setString(7, faxCOE);
                            ps.setString(8, extenFaxCOE);
                            ps.setInt(9, Integer.parseInt(ciudad));
                            ps.setString(10, direccion);
                            ps.setString(11, nombrePC);
                            ps.setString(12, cargoPC);
                            ps.setString(13, tipoIdenti);
                            ps.setString(14, numIdenti);
                            ps.setString(15, email);
                            ps.setString(16, faxPC);
                            ps.setString(17, extenFaxPC);
                            ps.setString(18, telefonoPC);
                            ps.setString(19, movilPC);
                            ps.setString(20, "Y");
                            int res = ps.executeUpdate();

                            if (res > 0){
                                request.getRequestDispatcher("Proveedores?mensaje=Y&nomCOE="+nombreCOE).forward(request, response);
                            } else {
                                request.getRequestDispatcher("Proveedores?mensaje=Ne").forward(request, response);
                                System.out.println("ERROR de REGISTRAR el dato de PROVEEDOR.");
                            }
                        }
                    }
                } else {
                    request.getRequestDispatcher("Proveedores?mensaje=NcontPC&nomPC="+nombrePC).forward(request, response);
                    System.out.println("ERROR de REGISTRAR el dato de PROVEEDOR.");
                }
            } else {
                request.getRequestDispatcher("Proveedores?mensaje=NcontCOE&NIT="+numIdentiTributaria).forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de PROVEEDOR.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Proveedores?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de PROVEEDORES.");
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
