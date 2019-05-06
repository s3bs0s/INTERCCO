package com.INTERCCO.controlador.CRUDPqrsf;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrarPqrsf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String sede = request.getParameter("regSedePqrsf");
            String tipoSoli = request.getParameter("regTipoSolicitudPqrsf");
            String dirigidoA = request.getParameter("regDirigidoAPqrsf");
            String consulta = request.getParameter("regConsultaPqrsf");
            
            HttpSession session = request.getSession();
            int idUsuario = (int) session.getAttribute("idUsuario");
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat hourFormat = new SimpleDateFormat("H:mm:ss");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            if (consulta.length() == 0){
                request.getRequestDispatcher("index?mensaje=NeC").forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de PQRSF.");
            } else {
                ps = con.prepareStatement("INSERT INTO pqrsf (idCliente,idSedeCliente,fch_registro,hora_registro,tipo_solicitud,dirigido_a,consulta,respuesta,estado,idSedeDirigido) VALUES (?,?,?,?,?,?,?,?,?,?);");
                ps.setInt(1, idUsuario);
                ps.setInt(2, idSedeUsuario);
                ps.setString(3, dateFormat.format(date));
                ps.setString(4, hourFormat.format(date));
                ps.setString(5, tipoSoli);
                ps.setString(6, dirigidoA);
                String consultaCifrada = cA.CifrarASCII(consulta);
                ps.setString(7, consultaCifrada);
                ps.setString(8, "83S105S110S32S114S101S115S112S117S101S115S116S97");
                ps.setString(9, "Vacio");
                ps.setInt(10, Integer.parseInt(sede));
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("index?mensaje=YPQRSF").forward(request, response);
                } else {
                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de REGISTRAR el dato de PQRSF.");
                }
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de PQRSF.");
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
