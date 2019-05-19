package com.INTERCCO.controlador.CRUDSedes;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ActualizarSede extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String id = request.getParameter("actuaIDSedes");
            String nomSede = request.getParameter("actuaNombreSedes");
            String ciudad = request.getParameter("actuaCiudadSedes");
            String direccion = request.getParameter("actuaDireccionSedes");
            int numMesas = Integer.parseInt(request.getParameter("actuaMesasSedes"));
            String mapaSrc = request.getParameter("actuaSrcSedes");
            String diasHorario = "";
            String horasHorario = "";
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            
            for (int i = 1; i <= 3; i++) {
                String dH = request.getParameter("actuaOpcion"+i+"Sedes");
                if (dH.length() > 0){
                    String hDesdeH = request.getParameter("actuaDesdeOpcion"+i+"Sedes");
                    String hHastaH = request.getParameter("actuaHastaOpcion"+i+"Sedes");
                    diasHorario += cA.CifrarASCII(dH) + ";";
                    horasHorario += cA.CifrarASCII(hDesdeH) + "-" + cA.CifrarASCII(hHastaH) + ";";
                } else {
                    diasHorario += cA.CifrarASCII("Vacio") + ";";
                    horasHorario += cA.CifrarASCII("Vacio") + ";";
                }
            }
            diasHorario = diasHorario.substring(0, diasHorario.length() - 1);
            horasHorario = horasHorario.substring(0, horasHorario.length() - 1);
            
            ps = con.prepareStatement("UPDATE sedes SET nombre=?,direccion=?,num_mesas=?,src_mapa=?,dias_horario=?,horas_horario=?,idCiudad=? WHERE idSedes=?;");
            ps.setString(1, nomSede);
            ps.setString(2, direccion);
            if (numMesas < 1){
                ps.setInt(3, 1);
            } else {
                ps.setInt(3, numMesas);
            }
            String mapaSCifrada = cA.CifrarASCII(mapaSrc);
            ps.setString(4, mapaSCifrada);
            ps.setString(5, diasHorario);
            ps.setString(6, horasHorario);
            ps.setInt(7, Integer.parseInt(ciudad));
            ps.setInt(8, Integer.parseInt(id));
            int res = ps.executeUpdate();

            if (res > 0){
                request.getRequestDispatcher("Sedes?mensaje=YActualizar&nomSed="+nomSede).forward(request, response);
            } else {
                request.getRequestDispatcher("Sedes?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de ACTUALIZAR el dato de SEDE.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Sedes?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de SEDES.");
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
