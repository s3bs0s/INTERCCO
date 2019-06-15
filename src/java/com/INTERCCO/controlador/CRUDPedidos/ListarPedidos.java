package com.INTERCCO.controlador.CRUDPedidos;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Beans.Pedidos;
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
            HttpSession session = request.getSession();
            String rolUsuario = "Usuario";
            int idSedeUsuario = 0;
            if (session.getAttribute("rolUsuario") != null){
                rolUsuario = (String) session.getAttribute("rolUsuario");
                idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            }
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            PreparedStatement ps3;
            ResultSet rs3;
            PreparedStatement ps4;
            ResultSet rs4;
            PreparedStatement ps5;
            ResultSet rs5;
            
            if (rolUsuario.equals("AdminS") || rolUsuario.equals("Gerente") || rolUsuario.equals("Cajero") || rolUsuario.equals("Mesero")){
                
                ArrayList<Pedidos> listaPed = new ArrayList<>();

                ps = con.prepareStatement("SELECT * FROM pedidos;");
                rs = ps.executeQuery();
                while (rs.next()){
                    Pedidos pd = new Pedidos();
                    pd.setIdPedidos(rs.getInt("idPedidos"));
                    pd.setFchRegistro(rs.getDate("fch_registro"));
                    pd.setHoraRegistro(rs.getTime("hora_registro"));
                    pd.setNumMesa(rs.getInt("num_mesa"));
                    pd.setSubTotal(rs.getInt("sub_total"));
                    pd.setEstado(rs.getString("estado"));
                    pd.setExistencia(rs.getString("existencia"));
                    pd.setIdSede(rs.getInt("idSede"));
                    pd.setIdMesero(rs.getInt("idMesero"));
                    pd.setIdCliente(rs.getInt("idCliente"));
                    
                    if (rs.getString("idFactura") != null){
                        pd.setIdFactura(rs.getInt("idFactura"));
                    }
                    
                    ps2 = con.prepareStatement("SELECT porcentaje FROM iva;");
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        float baseIva = rs.getInt("sub_total") * rs2.getFloat("porcentaje");
                        pd.setTotal(rs.getInt("sub_total") + ( (int)baseIva / 100));
                    }
                    ps2.close();
                    rs2.close();

                    ps2 = con.prepareStatement("SELECT * FROM detalles_pedidos WHERE idPedido=? AND existencia=?;");
                    ps2.setInt(1, rs.getInt("idPedidos"));
                    ps2.setString(2, "Y");
                    rs2 = ps2.executeQuery();
                    String cadenaDetallesP = "";
                    while (rs2.next()) {
                        ps3 = con.prepareStatement("SELECT * FROM productos WHERE idProductos=?;");
                        ps3.setInt(1, rs2.getInt("idProducto"));
                        rs3 = ps3.executeQuery();
                        if (rs3.next()) {
                            ps4 = con.prepareStatement("SELECT * FROM categorias WHERE idCategorias=?;");
                            ps4.setInt(1, rs3.getInt("idCategoria"));
                            rs4 = ps4.executeQuery();
                            if (rs4.next()) {
                                
                                cadenaDetallesP += rs4.getInt("idCategorias")+";"+cA.CifrarASCII(rs4.getString("nombre"))+"-"+rs3.getInt("idProductos")+";"+cA.CifrarASCII(rs3.getString("nombre"))+";"+rs3.getString("descripcion")+";";
                                
                                ps5 = con.prepareStatement("SELECT * FROM promociones WHERE idProducto=? AND existencia=?;");
                                ps5.setInt(1, rs2.getInt("idProducto"));
                                ps5.setString(2, "Y");
                                rs5 = ps5.executeQuery();
                                if (rs5.next()) {
                                    float precioDescuento = rs3.getInt("precio") * rs5.getFloat("porcentaje_promo");
                                    int precioDescuentoFinal = rs3.getInt("precio") - ( (int)precioDescuento / 100 );
                                    
                                    cadenaDetallesP += precioDescuentoFinal+"-";
                                } else {
                                    cadenaDetallesP += rs3.getInt("precio")+"-";
                                }
                                ps5.close();
                                rs5.close();

                                cadenaDetallesP += rs2.getInt("idDetalles_Pedidos")+";"+rs2.getInt("cantidad")+";"+rs2.getString("observacion")+";"+rs2.getInt("sub_total")+":";
                                // Categorias: id, nombre -
                                // Productos: id, nombre, descripcion, precio -
                                // DetallesPedido: id, cantidad, observacion, subtotal :

                            }
                            ps4.close();
                            rs4.close();
                        }
                        ps3.close();
                        rs3.close();
                    }
                    cadenaDetallesP = cadenaDetallesP.substring(0, cadenaDetallesP.length() - 1);
                    pd.setDetallesPedidos(cadenaDetallesP);
                    ps2.close();
                    rs2.close();


                    ps2 = con.prepareStatement("SELECT nombres FROM usuarios WHERE idUsuarios=?;");
                    ps2.setInt(1, rs.getInt("idMesero"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        String nombresUMesero = rs2.getString("nombres");

                        ps2.close();
                        rs2.close();
                        ps2 = con.prepareStatement("SELECT apellidos FROM info_usuarios WHERE idUsuario=?;");
                        ps2.setInt(1, rs.getInt("idMesero"));
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            pd.setNomMesero(nombresUMesero+" "+rs2.getString("apellidos"));
                        }
                    }
                    ps2.close();
                    rs2.close();


                    ps2 = con.prepareStatement("SELECT nombres FROM usuarios WHERE idUsuarios=?;");
                    ps2.setInt(1, rs.getInt("idCliente"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        String nombresCliente = rs2.getString("nombres");

                        ps2.close();
                        rs2.close();
                        ps2 = con.prepareStatement("SELECT apellidos FROM info_usuarios WHERE idUsuario=?;");
                        ps2.setInt(1, rs.getInt("idCliente"));
                        rs2 = ps2.executeQuery();
                        if (rs2.next()) {
                            pd.setNomCliente(nombresCliente+" "+rs2.getString("apellidos"));
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

                request.setAttribute("listaPed", listaPed);
                request.getRequestDispatcher("pedidosListar.jsp").forward(request, response);
                cdb.cierraConexion();
                
            } else if (rolUsuario.equals("Cocinero")){
                
                ArrayList<Pedidos> listaPed = new ArrayList<>();

                ps = con.prepareStatement("SELECT * FROM pedidos WHERE fch_registro=? AND (estado=? OR estado=?) AND idSede=?;");
                ps.setString(1, dateFormat.format(date));
                ps.setString(2, "En espera");
                ps.setString(3, "En produccion");
                ps.setInt(4, idSedeUsuario);
                rs = ps.executeQuery();
                if (rs.next()){
                    Pedidos pd = new Pedidos();
                    pd.setIdPedidos(rs.getInt("idPedidos"));
                    pd.setNumMesa(rs.getInt("num_mesa"));

                    ps2 = con.prepareStatement("SELECT * FROM detalles_pedidos WHERE idPedido=? AND existencia=?;");
                    ps2.setInt(1, rs.getInt("idPedidos"));
                    ps2.setString(2, "Y");
                    rs2 = ps2.executeQuery();
                    String cadenaDetallesP = "";
                    while (rs2.next()) {
                        ps3 = con.prepareStatement("SELECT * FROM productos WHERE idProductos=?;");
                        ps3.setInt(1, rs2.getInt("idProducto"));
                        rs3 = ps3.executeQuery();
                        if (rs3.next()) {
                            cadenaDetallesP += rs3.getInt("idProductos")+";"+cA.CifrarASCII(rs3.getString("nombre"))+";"+rs2.getString("cantidad")+"-";
                        }
                        ps3.close();
                        rs3.close();
                        
                        // Productos: id, nombre -
                        // DetallesProductos: nombre insumo; cantidad; unidad medida ! ... :
                        
                        ps3 = con.prepareStatement("SELECT * FROM detalles_productos WHERE idProducto=? AND existencia=?;");
                        ps3.setInt(1, rs2.getInt("idProducto"));
                        ps3.setString(2, "Y");
                        rs3 = ps3.executeQuery();
                        while (rs3.next()) {
                            
                            ps4 = con.prepareStatement("SELECT * FROM insumos WHERE idInsumos=?;");
                            ps4.setInt(1, rs3.getInt("idInsumoNecesario"));
                            rs4 = ps4.executeQuery();
                            if (rs4.next()) {

                                cadenaDetallesP += cA.CifrarASCII(rs4.getString("nombre"))+";"+rs3.getInt("cantidad_insumo")+";"+rs4.getString("unidad_medida")+"!";

                            }
                            ps4.close();
                            rs4.close();
                            
                        }
                        ps3.close();
                        rs3.close();
                        
                        cadenaDetallesP = cadenaDetallesP.substring(0, cadenaDetallesP.length() - 1)+":";
                    }
                    cadenaDetallesP = cadenaDetallesP.substring(0, cadenaDetallesP.length() - 1);
                    pd.setDetallesPedidos(cadenaDetallesP);
                    ps2.close();
                    rs2.close();
                    

                    ps2 = con.prepareStatement("UPDATE pedidos SET estado=? WHERE idPedidos=?;");
                    ps2.setString(1, "En produccion");
                    ps2.setInt(2, rs.getInt("idPedidos"));
                    ps2.executeUpdate();
                    ps2.close();


                    listaPed.add(pd);
                }

                request.setAttribute("listaPed", listaPed);
                request.getRequestDispatcher("pedidosListar.jsp").forward(request, response);
                cdb.cierraConexion();
                
            } else {
                request.getRequestDispatcher("Salir").forward(request, response);
            }

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
