package com.INTERCCO.controlador.CRUDInsumos;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizarInsumo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("actuaIDInsumo");
            String nomInsumo = request.getParameter("actuaNombreInsumo");
            String proveedorInsumo = request.getParameter("actuaProveedorInsumo");
            String fechaCaducidad = request.getParameter("actuaFechaCaducidadInsumo");
            String precioUnitario = request.getParameter("actuaPrecioUnitarioInsumo");
            String unidadMedida = request.getParameter("actuaUnidadMedidaInsumo");
            String cantidadInsumo = request.getParameter("actuaCantidadInsumo");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            if (dateFormat.parse(fechaCaducidad).after(dateFormat.parse(dateFormat.format(date)))){
                ps = con.prepareStatement("UPDATE insumos SET nombre=?,fch_caducidad=?,unidad_medida=?,cantidad=?,precio_unitario=?,idProveedor=? WHERE idInsumos=?;");
                ps.setString(1, nomInsumo);
                ps.setString(2, fechaCaducidad);
                ps.setString(3, unidadMedida);
                ps.setInt(4, Integer.parseInt(cantidadInsumo));
                ps.setInt(5, Integer.parseInt(precioUnitario.replace(".", "")));
                ps.setInt(6, Integer.parseInt(proveedorInsumo));
                ps.setInt(7, Integer.parseInt(id));
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Insumos?mensaje=YActualizar&nomIns="+nomInsumo).forward(request, response);
                } else {
                    request.getRequestDispatcher("Insumos?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR el dato de INSUMO.");
                }
            } else {
                request.getRequestDispatcher("Insumos?mensaje=NfcIoA&nomIns="+nomInsumo).forward(request, response);
                System.out.println("ERROR de ACTUALIZAR el dato de INSUMO.");
            }
            cdb.cierraConexion();

        } catch (SQLException sql) {
            request.getRequestDispatcher("Insumos?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de INSUMOS.");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ActualizarInsumo.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(ActualizarInsumo.class.getName()).log(Level.SEVERE, null, ex);
        }
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
