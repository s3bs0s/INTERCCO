package com.INTERCCO.controlador.CRUDPedidos;

import com.INTERCCO.modelo.Beans.Categorias;
import com.INTERCCO.modelo.Beans.Pedidos;
import com.INTERCCO.modelo.Beans.Productos;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class ListarPedidos extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            HttpSession session = request.getSession();
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario"); 
            String rolUsuario = (String) session.getAttribute("rolUsuario");
            
            
            // Listar de TABLAS //
            
            ArrayList<Pedidos> listaPed = new ArrayList<>();
            
            ps = con.prepareStatement("SELECT * FROM pedidos;");
            rs = ps.executeQuery();
            while (rs.next()){
                Pedidos pd = new Pedidos();
                pd.setIdPedidos(rs.getInt("idPedidos"));
                pd.setFchRegistro(rs.getDate("fch_registro"));
                pd.setHoraRegistro(rs.getTime("hora_registro"));
                pd.setTipoPedido(rs.getString("tipo_pedido"));
                pd.setNumMesa(rs.getInt("num_mesa"));
                pd.setSubTotal(rs.getInt("sub_total"));
                pd.setEstado(rs.getString("estado"));
                pd.setExistencia(rs.getString("existencia"));
                pd.setIdSede(rs.getInt("idSede"));
                pd.setIdMeseroODomiciliario(rs.getInt("idMeseroODomiciliario"));
                
                
                ps2 = con.prepareStatement("SELECT nombres FROM usuarios WHERE idUsuarios=?;");
                ps2.setInt(1, rs.getInt("idMeseroODomiciliario"));
                rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    String nombresUMoD = rs2.getString("nombres");
                    
                    ps2.close();
                    rs2.close();
                    ps2 = con.prepareStatement("SELECT apellidos FROM info_usuarios WHERE idUsuario=?;");
                    ps2.setInt(1, rs.getInt("idMeseroODomiciliario"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        pd.setNomMeseroODomiciliario(nombresUMoD+" "+rs2.getString("apellidos"));
                    }
                }
                ps2.close();
                rs2.close();

                
                ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    pd.setNomSede(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();

                    
                listaPed.add(pd);
            }
            
            // --------------------- //
            
            
            
            // Listar de SELECTS //
            
            ArrayList<Categorias> listaCatSPed = new ArrayList<>();
            
            ps.close();
            rs.close();
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
            
            // --------------------- //
            
            ArrayList<Productos> listaProSPed = new ArrayList<>();
            
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
            
            // --------------------- //
            
            String mesasDisponibles = "";
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT num_mesas FROM sedes WHERE idSedes=?;");
            ps.setInt(1, idSedeUsuario);
            rs = ps.executeQuery();
            while (rs.next()){
                int contMesas = 1;
                int mesasSede = rs.getInt("num_mesas");
                
                
                for (int i = 1; i <= mesasSede; i++) {
                    ps2 = con.prepareStatement("SELECT * FROM pedidos WHERE idSede=? AND existencia=? AND tipo_pedido=? AND num_mesa=? AND fch_registro=?;");
                    ps2.setInt(1, idSedeUsuario);
                    ps2.setString(2, "Y");
                    ps2.setString(3, "Restaurante");
                    ps2.setInt(4, i);
                    ps2.setString(5, dateFormat.format(date));
                    rs2 = ps2.executeQuery();
                    if (!rs2.next()) {
                        mesasDisponibles += i+";";
                    }
                    ps2.close();
                    rs2.close();
                }
                
                if (mesasDisponibles.length() > 0){
                    mesasDisponibles = mesasDisponibles.substring(0, mesasDisponibles.length() - 1);
                } else {
                    for (int i = 1; i <= mesasSede; i++) {
                        mesasDisponibles += i+";";
                    }
                    mesasDisponibles = mesasDisponibles.substring(0, mesasDisponibles.length() - 1);
                }
            }
            
            
            request.setAttribute("listaPed", listaPed);
            request.setAttribute("listaCatSPed", listaCatSPed);
            request.setAttribute("listaProSPed", listaProSPed);
            request.setAttribute("listaMesasDispo", mesasDisponibles);
            request.getRequestDispatcher("pedidosListar.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de PEDIDOS.");
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
