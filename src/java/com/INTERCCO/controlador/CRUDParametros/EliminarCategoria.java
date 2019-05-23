package com.INTERCCO.controlador.CRUDParametros;

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

public class EliminarCategoria extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idCategoria = request.getParameter("elimIDCategoria");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            PreparedStatement ps2;
            ResultSet rs;
            
            ps = con.prepareStatement("SELECT * FROM categorias WHERE idCategorias=?;");
            ps.setInt(1, Integer.parseInt(idCategoria));
            rs = ps.executeQuery();

            if (rs.next()){
                String nombreCate = rs.getString("nombre");
                
                ps.close();
                rs.close();
                ps = con.prepareStatement("UPDATE categorias SET existencia=? WHERE idCategorias=?;");
                ps.setString(1, "N");
                ps.setInt(2, Integer.parseInt(idCategoria));
                int res = ps.executeUpdate();

                if (res > 0){
                    ps.close();
                    rs.close();
                    ps = con.prepareStatement("SELECT idProductos FROM productos WHERE idCategoria=? AND existencia=?;");
                    ps.setInt(1, Integer.parseInt(idCategoria));
                    ps.setString(2, "Y");
                    rs = ps.executeQuery();

                    while (rs.next()){
                        
                        ps2 = con.prepareStatement("UPDATE promociones SET existencia=? WHERE idProducto=? AND existencia=?;");
                        ps2.setString(1, "N");
                        ps2.setInt(2, rs.getInt("idProductos"));
                        ps2.setString(3, "Y");
                        ps2.executeUpdate();
                        ps2.close();
                        
                        ps2 = con.prepareStatement("UPDATE detalles_productos SET existencia=? WHERE idProducto=? AND existencia=?;");
                        ps2.setString(1, "N");
                        ps2.setInt(2, rs.getInt("idProductos"));
                        ps2.setString(3, "Y");
                        ps2.executeUpdate();
                        ps2.close();
                        
                    }
                    
                    ps.close();
                    ps = con.prepareStatement("UPDATE productos SET existencia=? WHERE idCategoria=? AND existencia=?;");
                    ps.setString(1, "N");
                    ps.setInt(2, Integer.parseInt(idCategoria));
                    ps.setString(3, "Y");
                    ps.executeUpdate();

                    request.getRequestDispatcher("Parametros?mensaje=YEliminarCategoria&nomCateg="+nombreCate).forward(request, response);
                } else {
                    request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La categoría&accMod=eliminar").forward(request, response);
                    System.out.println("ERROR de ELIMINAR el dato de CATEGORIA.");
                }
            } else {
                request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La categoría&accMod=eliminar").forward(request, response);
                System.out.println("ERROR de ELIMINAR el dato de CATEGORIA.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=La categoría&accMod=eliminar").forward(request, response);
            System.out.println("ERROR en MySQL ELIMINANDO los datos de CATEGORIAS.");
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
