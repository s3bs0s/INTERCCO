package com.INTERCCO.controlador.CRUDParametros;

import com.INTERCCO.controlador.General.CifradoASCII;
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

public class ActualizarSoporte extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("actuaIDSoportes");
            String ruta = request.getParameter("actuaRoMSoportes");
            String descripcion = request.getParameter("actuaDescripcionSoportes");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            CifradoASCII cA = new CifradoASCII();
            
            ps = con.prepareStatement("SELECT * FROM soportes WHERE idSoportes=? AND estado=?;");
            ps.setInt(1, Integer.parseInt(id));
            ps.setString(2, "C");
            rs = ps.executeQuery();

            if (rs.next()){
                request.getRequestDispatcher("Parametros?mensaje=NeSCorregido").forward(request, response);
                System.out.println("ERROR de ACTUALIZAR el dato de SOPORTE.");
            } else {
                ps = con.prepareStatement("UPDATE soportes SET ruta=?,descripcion=? WHERE idSoportes=?;");
                String rutaCifrada = cA.CifrarASCII(ruta);
                ps.setString(1, rutaCifrada);
                String descripcionCifrada = cA.CifrarASCII(descripcion);
                ps.setString(2, descripcionCifrada);
                ps.setInt(3, Integer.parseInt(id));
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Parametros?mensaje=YActualizarSoporte").forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR el dato de SOPORTE.");
                } else {
                    request.getRequestDispatcher("Parametros?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de ACTUALIZAR el dato de SOPORTE.");
                }
            }
            
            
            cdb.cierraConexion();

        } catch (SQLException sql) {
            request.getRequestDispatcher("Parametros?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de SOPORTES.");
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
