package com.INTERCCO.controlador.CRUDParametros;

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
import javax.servlet.http.HttpSession;

public class RegistrarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nombreProd = request.getParameter("regNombreProducto");
            String precio = request.getParameter("regPrecioProducto");
            String categoria = request.getParameter("regCategoriaProducto");
            String descripcion = request.getParameter("regDescripcionProducto");
            nombreProd = nombreProd.replace("Ø", "");
            nombreProd = nombreProd.replace("Æ", "");
            
            HttpSession session = request.getSession();
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");

            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            CifradoASCII cA = new CifradoASCII();

            
            ps = con.prepareStatement("INSERT INTO productos (idCategoria,nombre,descripcion,precio,idSede,existencia) VALUES (?,?,?,?,?,?);");
            ps.setInt(1, Integer.parseInt(categoria));
            ps.setString(2, nombreProd);
            if (descripcion.length() == 0 || descripcion.equals(" ") || cA.CifrarASCII(descripcion).equals("13S10")){
                ps.setString(3, "86S97S99S105S111");
            } else {
                ps.setString(3, cA.CifrarASCII(descripcion));
            }
            ps.setInt(4, Integer.parseInt(precio.replace(".", "")));
            ps.setInt(5, idSedeUsuario);
            ps.setString(6, "Y");
            int res = ps.executeUpdate();

            if (res > 0){
                request.getRequestDispatcher("Parametros?mensaje=YProducto&nomProd="+nombreProd).forward(request, response);
            } else {
                request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=El producto&accMod=registrar").forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de CATEGORIA.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=El producto&accMod=registrar").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de CATEGORIAS.");
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
