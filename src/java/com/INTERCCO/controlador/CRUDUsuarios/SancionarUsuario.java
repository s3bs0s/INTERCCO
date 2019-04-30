package com.INTERCCO.controlador.CRUDUsuarios;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class SancionarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        request.setCharacterEncoding("UTF-8");
        try {
            
            String idUsuario = request.getParameter("sanIDUsuario");
            String email = request.getParameter("sanEmailOcultoUsuario");
            String limiteTiempo = request.getParameter("sanFchLimiteUsuario");
            String justificacion = request.getParameter("sanJustificacionUsuario");
            
            HttpSession session = request.getSession();
            int idModerador = (int) session.getAttribute("idUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String hoy = dateFormat.format(date);
            
            ps = con.prepareStatement("SELECT * FROM sanciones WHERE idUsuario=? AND existencia=?;");
            ps.setInt(1, 1);
            ps.setString(2, "Y");
            rs = ps.executeQuery();
            if (rs.next()){
                request.getRequestDispatcher("Usuarios?mensaje=NeS").forward(request, response);
                System.out.println("ERROR de SANCIONAR el dato de USUARIO.");
            } else {
                ps.close();
                ps = con.prepareStatement("INSERT INTO sanciones (idUsuario,justificacion,fch_limite,idModerador,existencia) VALUES (?,?,?,?,?);");
                ps.setInt(1, Integer.parseInt(idUsuario));
                String justificacionCifrada = cA.CifrarASCII(justificacion);
                ps.setString(2, justificacionCifrada);
                
                Calendar calendar = Calendar.getInstance();
                calendar.setTime(dateFormat.parse(hoy));
                calendar.add(Calendar.DAY_OF_YEAR, Integer.parseInt(limiteTiempo));
                Date dateLimite = calendar.getTime();
                ps.setString(3, dateFormat.format(dateLimite));
                
                ps.setInt(4, idModerador);
                ps.setString(5, "Y");
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("Usuarios?mensaje=YSancionar&emailusu="+email+"&sandias="+limiteTiempo).forward(request, response);
                } else {
                    request.getRequestDispatcher("Usuarios?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de SANCIONAR el dato de USUARIO.");
                }
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Pqrsf?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL SANCIONANDO los datos de USUARIOS.");
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
            Logger.getLogger(SancionarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(SancionarUsuario.class.getName()).log(Level.SEVERE, null, ex);
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
