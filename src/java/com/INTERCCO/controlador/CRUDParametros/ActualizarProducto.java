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

public class ActualizarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idProd = request.getParameter("actuaIDProducto");
            String nombreProd = request.getParameter("actuaNombreProducto");
            String categoria = request.getParameter("actuaCategoriaProducto");
            String precio = request.getParameter("actuaPrecioProducto");
            String descripcion = request.getParameter("actuaDescripcionProducto");
            nombreProd = nombreProd.replace("Ø", "");
            nombreProd = nombreProd.replace("Æ", "");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            
            ps = con.prepareStatement("UPDATE productos SET idCategoria=?,nombre=?,descripcion=?,precio=? WHERE idProductos=?;");
            ps.setInt(1, Integer.parseInt(categoria));
            ps.setString(2, nombreProd);
            if (descripcion.length() == 0 || descripcion.equals(" ") || cA.CifrarASCII(descripcion).equals("13S10")){
                ps.setString(3, "86S97S99S105S111");
            } else {
                ps.setString(3, cA.CifrarASCII(descripcion));
            }
            ps.setInt(4, Integer.parseInt(precio.replace(".", "")));
            ps.setInt(5, Integer.parseInt(idProd));
            int res = ps.executeUpdate();

            if (res > 0){
                request.getRequestDispatcher("Parametros?mensaje=YActualizarProducto").forward(request, response);
            } else {
                request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=El producto&accMod=actualizar").forward(request, response);
                System.out.println("ERROR de ACTUALIZAR el dato de PRODUCTO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=El producto&accMod=actualizar").forward(request, response);
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de PRODUCTOS.");
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
