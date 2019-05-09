package com.INTERCCO.controlador.General;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Salir extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        String mensaje = request.getParameter("mensaje");
        HttpSession session = request.getSession();
        session.setAttribute("idUsuario", null);
        session.setAttribute("verificadoUsuario", null);
        session.setAttribute("emailUsuario", null);
        session.setAttribute("passwordUsuario", null);
        session.setAttribute("nomUsuario", null);
        session.setAttribute("apeUsuario", null);
        session.setAttribute("fotUsuario", null);
        session.setAttribute("rolUsuario", "Usuario");
        session.setAttribute("tipoUsuario", null);
        session.setAttribute("numUsuario", null);
        session.setAttribute("telUsuario", null);
        session.setAttribute("movUsuario", null);
        session.setAttribute("genUsuario", null);
        session.setAttribute("fnaUsuario", null);
        session.setAttribute("dirUsuario", null);
        session.setAttribute("idSedeUsuario", null);
        session.setAttribute("nomSedeUsuario", null);
        session.setAttribute("rolSedeUsuario", null);
        session.setAttribute("idCiudadUsuario", null);
        session.setAttribute("nomCiudadUsuario", null);
        session.setAttribute("elijaSede", null);
        session.setAttribute("elijaNomSede", null);
        session.setAttribute("elijaRolSede", null);
        if (mensaje == null){
            request.getRequestDispatcher("index").forward(request, response);
        } else {
            request.getRequestDispatcher("index?mensaje="+mensaje).forward(request, response);
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
