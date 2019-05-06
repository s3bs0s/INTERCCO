package com.INTERCCO.controlador.CRUDProveedores;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizarProveedor extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("actuaIDProveedor");
            String nombreCOE = request.getParameter("actuaNombreCOEProveedor");
            String tipoIdentiFiscal = request.getParameter("actuaTipoIdentiFiscalCOEProveedor");
            String numIdentiTributaria = request.getParameter("actuaNumIdentiTribuCOEProveedor");
            String telefonoCOE = request.getParameter("actuaTelefonoCOEProveedor");
            String extenTeleCOE = request.getParameter("actuaExtTelefonoCOEProveedor");
            String movilCOE = request.getParameter("actuaMovilCOEProveedor");
            String faxCOE = request.getParameter("actuaFaxCOEProveedor");
            String extenFaxCOE = request.getParameter("actuaExtFaxCOEProveedor");
            String ciudad = request.getParameter("actuaCiudadCOEProveedor");
            String direccion = request.getParameter("actuaDireccionCOEProveedor");
            
            String nombrePC = request.getParameter("actuaNombrePCProveedor");
            String cargoPC = request.getParameter("actuaCargoPCProveedor");
            String tipoIdenti = request.getParameter("actuaTipoIdentiPCProveedor");
            String numIdenti = request.getParameter("actuaNumIdentiPCProveedor");
            String email = request.getParameter("actuaEmailPCProveedor");
            String faxPC = request.getParameter("actuaFaxPCProveedor");
            String extenFaxPC = request.getParameter("actuaExtFaxPCProveedor");
            String telefonoPC = request.getParameter("actuaTelefonoPCProveedor");
            String movilPC = request.getParameter("actuaMovilPCProveedor");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            
            if (telefonoCOE.length() > 0 || movilCOE.length() > 0 || faxCOE.length() > 0){
                if (email.length() > 0 || faxPC.length() > 0 || telefonoPC.length() > 0 || movilPC.length() > 0){
                    ps = con.prepareStatement("UPDATE proveedores SET nombre_coe=?,tipo_if=?,num_it=?,telefono_coe=?,extension_tel_coe=?,movil_coe=?,fax_coe=?,extension_fax_coe=?,idCiudad=?,direccion=?,nombre_pc=?,cargo_pc=?,tipo_i=?,num_i=?,email=?,fax_pc=?,extension_fax_pc=?,telefono_pc=?,movil_pc=? WHERE idProveedores=?;");
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
                    ps.setInt(20, Integer.parseInt(id));
                    int res = ps.executeUpdate();

                    if (res > 0){
                        request.getRequestDispatcher("Proveedores?mensaje=YActualizar&nomCOE="+nombreCOE).forward(request, response);
                    } else {
                        request.getRequestDispatcher("Proveedores?mensaje=Ne").forward(request, response);
                        System.out.println("ERROR de ACTUALIZAR el dato de PROVEEDOR.");
                    }
                } else {
                    request.getRequestDispatcher("Proveedores?mensaje=NcontPC&nomPC="+nombrePC).forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR el dato de PROVEEDOR.");
                }
            } else {
                request.getRequestDispatcher("Proveedores?mensaje=NcontCOE&NIT="+numIdentiTributaria).forward(request, response);
                System.out.println("ERROR de ACTUALIZAR el dato de PROVEEDOR.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Proveedores?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de PROVEEDORES.");
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
