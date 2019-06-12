package com.INTERCCO.controlador.CRUDPedidos;

import com.INTERCCO.modelo.Beans.DetallesProductos;
import com.INTERCCO.modelo.Beans.Insumos;
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

public class PEDProductoDisponibleAJAX extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            int idProducto = Integer.parseInt(request.getParameter("idProducto"));
            
            ArrayList<Insumos> listaInsu = new ArrayList<>();
            ArrayList<DetallesProductos> listaDetaProductos = new ArrayList<>();
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            
            HttpSession session = request.getSession();
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            
            ps = con.prepareStatement("SELECT idInsumos,cantidad FROM insumos WHERE existencia!=? AND idSede=?;");
            ps.setString(1, "N");
            ps.setInt(2, idSedeUsuario);
            rs = ps.executeQuery();
            while (rs.next()){
                Insumos ins = new Insumos();
                
                ins.setIdInsumos(rs.getInt("idInsumos"));
                ins.setCantidad(rs.getInt("cantidad"));
                
                listaInsu.add(ins);
            }
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * FROM detalles_productos WHERE existencia=? AND idProducto=?;");
            ps.setString(1, "Y");
            ps.setInt(2, idProducto);
            rs = ps.executeQuery();
            while (rs.next()){
                DetallesProductos dep = new DetallesProductos();
                
                dep.setIdDetallesProductos(rs.getInt("idDetalles_Productos"));
                dep.setIdProducto(rs.getInt("idProducto"));
                dep.setIdInsumoNecesario(rs.getInt("idInsumoNecesario"));
                dep.setCantidadInsumo(rs.getInt("cantidad_insumo"));
                
                listaDetaProductos.add(dep);
            }
            
            JSONArray jsonArray = new JSONArray();
            
            JSONObject jsonObject = new JSONObject();
            jsonObject.put("insumos", listaInsu);
            jsonObject.put("detallesProductos", listaDetaProductos);
            jsonArray.put(jsonObject);
            
            String jsonArrayString = jsonArray.toString();
	    response.getWriter().print(jsonArrayString);
                
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de INSUMOS Y DETALLESPRODUCTOS.");
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
