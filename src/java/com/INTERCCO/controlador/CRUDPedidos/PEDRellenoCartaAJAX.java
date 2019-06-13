package com.INTERCCO.controlador.CRUDPedidos;

import com.INTERCCO.modelo.Beans.Categorias;
import com.INTERCCO.modelo.Beans.Productos;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

public class PEDRellenoCartaAJAX extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            ArrayList<Categorias> listaCatSPed = new ArrayList<>();
            ArrayList<Productos> listaProSPed = new ArrayList<>();
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            
            HttpSession session = request.getSession();
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            String rolUsuario = (String) session.getAttribute("rolUsuario");
            

            ps = con.prepareStatement("SELECT idCategorias,nombre,idSede FROM categorias WHERE existencia=? ORDER BY idCategorias DESC;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                if (!rolUsuario.equals("AdminS")){
                    if (rs.getInt("idSede") == idSedeUsuario){
                        Categorias ct = new Categorias();
                        ct.setIdCategorias(rs.getInt("idCategorias"));
                        ct.setNombre(rs.getString("nombre"));
                        listaCatSPed.add(ct);
                    }
                } else {
                    Categorias ct = new Categorias();
                    ct.setIdCategorias(rs.getInt("idCategorias"));
                    ct.setNombre(rs.getString("nombre"));
                    listaCatSPed.add(ct);
                }
            }

            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * FROM productos WHERE existencia=? ORDER BY idProductos DESC;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){

                if (!rolUsuario.equals("AdminS")){
                    if (rs.getInt("idSede") == idSedeUsuario){
                        Productos pd = new Productos();
                        pd.setIdProductos(rs.getInt("idProductos"));
                        pd.setIdCategoria(rs.getInt("idCategoria"));
                        pd.setNombre(rs.getString("nombre"));
                        pd.setDescripcion(rs.getString("descripcion"));
                        pd.setPrecio(rs.getInt("precio"));
                        listaProSPed.add(pd);
                    }
                } else {
                    Productos pd = new Productos();
                    pd.setIdProductos(rs.getInt("idProductos"));
                    pd.setIdCategoria(rs.getInt("idCategoria"));
                    pd.setNombre(rs.getString("nombre"));
                    pd.setDescripcion(rs.getString("descripcion"));
                    pd.setPrecio(rs.getInt("precio"));
                    listaProSPed.add(pd);
                }
            }
            
            
            JSONArray jsonArray = new JSONArray();
            
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("categorias", listaCatSPed);
            jsonObject.put("productos", listaProSPed);
            jsonArray.put(jsonObject);
            
            String jsonArrayString = jsonArray.toString();
	    response.getWriter().print(jsonArrayString);
                
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de CATEGORIAS Y PRODUCTOS.");
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
