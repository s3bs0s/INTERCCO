package com.INTERCCO.controlador.CRUDParametros;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrarPromocion extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String porcentaje = request.getParameter("regPorcentajePromocion");
            String producto = request.getParameter("regProductoPromocion");
            String fechaCadu = request.getParameter("regFechaCaducidadPromocion");
            String nomProd = "Desconocido";
            porcentaje = porcentaje.replace("Ø", "");
            porcentaje = porcentaje.replace("Æ", "");
            
            HttpSession session = request.getSession();
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            Date date = new Date();
            DateFormat hourFormat = new SimpleDateFormat("H:mm:ss");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            int numPuntos = 0;
            for (int i = 0; i < porcentaje.length(); i++) {
                char cp = porcentaje.charAt(i);
                if (cp == '.'){
                    numPuntos ++;
                }
            }
            
            ps = con.prepareStatement("SELECT * FROM productos WHERE idProductos=? AND existencia=?;");
            ps.setInt(1, Integer.parseInt(producto));
            ps.setString(2, "Y");
            rs = ps.executeQuery();

            if (rs.next()){
                nomProd = rs.getString("nombre");
            }
            
            if (numPuntos > 1){
                request.getRequestDispatcher("Parametros?mensaje=NptMP").forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de PROMOCION.");
            } else {
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM promociones WHERE idProducto=? AND existencia=?;");
                ps.setInt(1, Integer.parseInt(producto));
                ps.setString(2, "Y");
                rs = ps.executeQuery();

                if (rs.next()){
                    request.getRequestDispatcher("Parametros?mensaje=Nepr&nomProd="+nomProd).forward(request, response);
                    System.out.println("ERROR de REGISTRAR el dato de PROMOCION.");
                } else {
                    if (dateFormat.parse(fechaCadu).after(dateFormat.parse(dateFormat.format(date))) || dateFormat.parse(fechaCadu).equals(dateFormat.parse(dateFormat.format(date)))){
                        ps.close();
                        ps = con.prepareStatement("INSERT INTO promociones (fch_registro,hora_registro,idProducto,porcentaje_promo,fch_caducidad,idSede,existencia) VALUES (?,?,?,?,?,?,?);");
                        ps.setString(1, dateFormat.format(date));
                        ps.setString(2, hourFormat.format(date));
                        ps.setInt(3, Integer.parseInt(producto));
                        ps.setFloat(4, Float.parseFloat(porcentaje));
                        ps.setString(5, fechaCadu);
                        ps.setInt(6, idSedeUsuario);
                        ps.setString(7, "Y");
                        int res = ps.executeUpdate();

                        if (res > 0){
                            request.getRequestDispatcher("Parametros?mensaje=YPromocion").forward(request, response);
                        } else {
                            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La promoción&accMod=registrar").forward(request, response);
                            System.out.println("ERROR de REGISTRAR el dato de PROMOCION.");
                        }
                    } else {
                        request.getRequestDispatcher("Parametros?mensaje=NfcA").forward(request, response);
                        System.out.println("ERROR de REGISTRAR el dato de PROMOCION.");
                    }
                }
            }
            
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La promoción&accMod=registrar").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de PROMOCIONES.");
            sql.getStackTrace();
        } catch (ParseException pe) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La fecha de la promoción&accMod=registrar").forward(request, response);
            System.out.println("ERROR de REGISTRANDO el dato de PROMOCIONES.");
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
