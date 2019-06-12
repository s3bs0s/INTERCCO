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
            String insumosGasta = request.getParameter("actuaInsumosPProducto");
            insumosGasta = insumosGasta.substring(0, insumosGasta.length() - 1);
            
            
            String[] cantInsumos = insumosGasta.split(";");
            int contInsumosProducto = cantInsumos.length;
            
            String[][] insumosProducto = new String[contInsumosProducto][5];
            // idDetallesP, idInsumo, cantidad, existencia, INSERT TO ó UPDATE (Nuevo o Viejo)
            
            for (int i = 0; i < cantInsumos.length; i++) {
                String[] arrayInfoInsumo = cantInsumos[i].split("-");
                insumosProducto[i][0] = arrayInfoInsumo[0];
                insumosProducto[i][1] = arrayInfoInsumo[1];
                insumosProducto[i][2] = arrayInfoInsumo[4];
                insumosProducto[i][3] = arrayInfoInsumo[5];
                insumosProducto[i][4] = arrayInfoInsumo[6];
            }
            
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
                for (int i = 0; i < insumosProducto.length; i++) {
                    if (insumosProducto[i][4].equals("Viejo")){
                        ps.close();
                        ps = con.prepareStatement("UPDATE detalles_productos SET cantidad_insumo=?,existencia=? WHERE idDetalles_Productos=?;");
                        ps.setInt(1, Integer.parseInt(insumosProducto[i][2]));
                        ps.setString(2, insumosProducto[i][3]);
                        ps.setInt(3, Integer.parseInt(insumosProducto[i][0]));
                        ps.executeUpdate();
                    } else {
                        if (insumosProducto[i][3].equals("Y")){
                            ps.close();
                            ps = con.prepareStatement("INSERT INTO detalles_productos (idProducto,idInsumoNecesario,cantidad_insumo,existencia) VALUES (?,?,?,?);");
                            ps.setInt(1, Integer.parseInt(idProd));
                            ps.setInt(2, Integer.parseInt(insumosProducto[i][1]));
                            ps.setInt(3, Integer.parseInt(insumosProducto[i][2]));
                            ps.setString(4, "Y");
                            ps.executeUpdate();
                        }
                    }
                }
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
