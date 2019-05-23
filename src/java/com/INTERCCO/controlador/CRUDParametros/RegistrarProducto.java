package com.INTERCCO.controlador.CRUDParametros;

import com.INTERCCO.controlador.General.CifradoASCII;
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

public class RegistrarProducto extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nombreProd = request.getParameter("regNombreProducto");
            String precio = request.getParameter("regPrecioProducto");
            String categoria = request.getParameter("regCategoriaProducto");
            String descripcion = request.getParameter("regDescripcionProducto");
            String insumosGasta = request.getParameter("regInsumosPProducto");
            insumosGasta = insumosGasta.substring(0, insumosGasta.length() - 1);
            
            int contInsumosProducto = 0;
            String[] cantInsumos = insumosGasta.split(";");
            for (int i = 0; i < cantInsumos.length; i++) {
                if (!cantInsumos[i].equals("86S97S99S105S111")){
                    contInsumosProducto++;
                }
            }
            
            String[][] insumosProducto = new String[contInsumosProducto][2];
            
            contInsumosProducto = 0;
            for (int i = 0; i < cantInsumos.length; i++) {
                if (!cantInsumos[i].equals("86S97S99S105S111")){
                    String[] arrayInfoInsumo = cantInsumos[i].split("-");
                    insumosProducto[contInsumosProducto][0] = arrayInfoInsumo[0];
                    insumosProducto[contInsumosProducto][1] = arrayInfoInsumo[3];
                    contInsumosProducto++;
                }
            }
            
            HttpSession session = request.getSession();
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");

            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat hourFormatC = new SimpleDateFormat("hhmmss");
            DateFormat dateFormatC = new SimpleDateFormat("ddMMyyyy");
            String code = "f"+dateFormatC.format(date)+"h"+hourFormatC.format(date);
            
            ps = con.prepareStatement("INSERT INTO productos (idCategoria,codigo,nombre,descripcion,precio,idSede,existencia) VALUES (?,?,?,?,?,?,?);");
            ps.setInt(1, Integer.parseInt(categoria));
            ps.setString(2, code);
            ps.setString(3, nombreProd);
            if (descripcion.length() == 0 || descripcion.equals(" ") || cA.CifrarASCII(descripcion).equals("13S10")){
                ps.setString(4, "86S97S99S105S111");
            } else {
                ps.setString(4, cA.CifrarASCII(descripcion));
            }
            ps.setInt(5, Integer.parseInt(precio.replace(".", "")));
            ps.setInt(6, idSedeUsuario);
            ps.setString(7, "Y");
            int res = ps.executeUpdate();

            if (res > 0){
                ps.close();
                ps = con.prepareStatement("SELECT idProductos FROM productos WHERE codigo=?;");
                ps.setString(1, code);
                rs = ps.executeQuery();

                if (rs.next()){
                    int idProductos = rs.getInt("idProductos");
                    
                    for (int i = 0; i < insumosProducto.length; i++) {
                        ps = con.prepareStatement("INSERT INTO detalles_productos (idProducto,idInsumoNecesario,cantidad_insumo,existencia) VALUES (?,?,?,?);");
                        ps.setInt(1, idProductos);
                        ps.setInt(2, Integer.parseInt(insumosProducto[i][0]));
                        ps.setInt(3, Integer.parseInt(insumosProducto[i][1]));
                        ps.setString(4, "Y");
                        int res2 = ps.executeUpdate();

                        if (res2 < 1){
                            request.getRequestDispatcher("Productos?mensaje=Ne").forward(request, response);
                            System.out.println("ERROR de REGISTRAR el dato de PRODUCTO.");
                        }
                    }
                    
                    request.getRequestDispatcher("Parametros?mensaje=YProducto&nomProd="+nombreProd).forward(request, response);
                }
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
