package com.INTERCCO.controlador.CRUDPedidos;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EstadosCocineroPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idPedido = request.getParameter("idPed");
            String estado = request.getParameter("estado");
            
            HttpSession session = request.getSession();
            String rolUsuario = (String) session.getAttribute("rolUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            
            ps = con.prepareStatement("UPDATE pedidos SET estado=? WHERE idPedidos=?;");
            if (estado.equals("R")){
                ps.setString(1, "En espera");
            } else if (estado.equals("L")) {
                ps.setString(1, "Entregado");
            } else {
                ps.setString(1, "En produccion");
            }
            ps.setInt(2, Integer.parseInt(idPedido));
            int res = ps.executeUpdate();

            if (res > 0){
                if (estado.equals("R")){
                    request.getRequestDispatcher("index").forward(request, response);
                } else {
                    if (rolUsuario.equals("Gerente")){
                        request.getRequestDispatcher("Pedidos?mensaje="+(estado.equals("L")?"YEntregado":"YProduccion")).forward(request, response);
                    } else {
                        request.getRequestDispatcher("Pedidos").forward(request, response);
                    }
                }
            } else {
                if (estado.equals("R")){
                    request.getRequestDispatcher("Pedidos?mensaje=NeR").forward(request, response);
                    System.out.println("ERROR de RETIRARSE el dato de PEDIDO.");
                } else {
                    if (rolUsuario.equals("Gerente")){
                        request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
                        System.out.println("ERROR de LISTO el dato de PEDIDO.");
                    } else {
                        request.getRequestDispatcher("Pedidos?mensaje=NeL").forward(request, response);
                        System.out.println("ERROR de LISTO el dato de PEDIDO.");
                    }
                }
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            HttpSession session = request.getSession();
            String rolUsuario = (String) session.getAttribute("rolUsuario");
            String estado = request.getParameter("estado");
            if (estado.equals("R")){
                request.getRequestDispatcher("Pedidos?mensaje=NeR").forward(request, response);
                System.out.println("ERROR en MySQL RETIRANDOSE los datos de PEDIDOS.");
            } else {
                if (rolUsuario.equals("Gerente")){
                    request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR en MySQL LISTO los datos de PEDIDOS.");
                } else {
                    request.getRequestDispatcher("Pedidos?mensaje=NeL").forward(request, response);
                    System.out.println("ERROR en MySQL LISTO los datos de PEDIDOS.");
                }
            }
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
