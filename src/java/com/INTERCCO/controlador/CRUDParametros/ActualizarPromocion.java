package com.INTERCCO.controlador.CRUDParametros;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizarPromocion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idPromocion = request.getParameter("actuaIDPromocion");
            String porcentaje = request.getParameter("actuaPorcentajePromocion");
            String fechaCadu = request.getParameter("actuaFechaCaducidadPromocion");
            porcentaje = porcentaje.replace("Ø", "");
            porcentaje = porcentaje.replace("Æ", "");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            int numPuntos = 0;
            for (int i = 0; i < porcentaje.length(); i++) {
                char cp = porcentaje.charAt(i);
                if (cp == '.'){
                    numPuntos ++;
                }
            }
            
            if (numPuntos > 1){
                request.getRequestDispatcher("Parametros?mensaje=NptMP").forward(request, response);
                System.out.println("ERROR de ACTUALIZAR el dato de PROMOCION.");
            } else {
                if (dateFormat.parse(fechaCadu).after(dateFormat.parse(dateFormat.format(date))) || dateFormat.parse(fechaCadu).equals(dateFormat.parse(dateFormat.format(date)))){
                    ps = con.prepareStatement("UPDATE promociones SET porcentaje_promo=?,fch_caducidad=? WHERE idPromociones=?;");
                    ps.setFloat(1, Float.parseFloat(porcentaje));
                    ps.setString(2, fechaCadu);
                    ps.setInt(3, Integer.parseInt(idPromocion));
                    int res = ps.executeUpdate();

                    if (res > 0){
                        request.getRequestDispatcher("Parametros?mensaje=YActualizarPromocion").forward(request, response);
                    } else {
                        request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La promoción&accMod=actualizar").forward(request, response);
                        System.out.println("ERROR de ACTUALIZAR el dato de PROMOCION.");
                    }
                } else {
                    request.getRequestDispatcher("Parametros?mensaje=NfcA").forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR el dato de PROMOCION.");
                }
            }
            
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La promoción&accMod=registrar").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de PROMOCIONES.");
            sql.getStackTrace();
        } catch (ParseException pe) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La fecha de la promoción&accMod=registrar").forward(request, response);
            System.out.println("ERROR de ACTUALIZANDO el dato de PROMOCIONES.");
            pe.getStackTrace();
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
