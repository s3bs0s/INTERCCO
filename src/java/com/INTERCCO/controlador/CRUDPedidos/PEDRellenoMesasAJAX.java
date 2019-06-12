package com.INTERCCO.controlador.CRUDPedidos;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class PEDRellenoMesasAJAX extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            String mesaActualizar = request.getParameter("mesaActua");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            HttpSession session = request.getSession();
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            

            String mesasDisponibles = "";
            ps = con.prepareStatement("SELECT num_mesas FROM sedes WHERE idSedes=?;");
            ps.setInt(1, idSedeUsuario);
            rs = ps.executeQuery();
            while (rs.next()){
                int mesasSede = rs.getInt("num_mesas");


                for (int i = 1; i <= mesasSede; i++) {
                    ps2 = con.prepareStatement("SELECT * FROM pedidos WHERE idSede=? AND existencia=? AND num_mesa=? AND fch_registro=?;");
                    ps2.setInt(1, idSedeUsuario);
                    ps2.setString(2, "Y");
                    ps2.setInt(3, i);
                    ps2.setString(4, dateFormat.format(date));
                    rs2 = ps2.executeQuery();
                    if (!rs2.next()) {
                        mesasDisponibles += i+";";
                    } else {
                        if (!mesaActualizar.equals("N")){
                            if (Integer.parseInt(mesaActualizar) == i){
                                mesasDisponibles += i+";";
                            }
                        }
                    }
                    ps2.close();
                    rs2.close();
                }

                if (mesasDisponibles.length() > 0){
                    mesasDisponibles = mesasDisponibles.substring(0, mesasDisponibles.length() - 1);
                } else {
                    for (int i = 1; i <= mesasSede; i++) {
                        mesasDisponibles += i+";";
                    }
                    mesasDisponibles = mesasDisponibles.substring(0, mesasDisponibles.length() - 1);
                }
            }
            
	    response.getWriter().print(mesasDisponibles);
                
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de MESAS DISPONIBLES.");
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
