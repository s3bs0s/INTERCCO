package com.INTERCCO.controlador.CRUDFacturas;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Beans.Facturas;
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

public class ListarFacturas extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            ArrayList<Facturas> listaFact = new ArrayList<>();
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            PreparedStatement ps3;
            ResultSet rs3;
            PreparedStatement ps4;
            ResultSet rs4;

            ps = con.prepareStatement("SELECT * FROM facturas;");
            rs = ps.executeQuery();
            while (rs.next()){
                Facturas ft = new Facturas();
                ft.setIdFacturas(rs.getInt("idFacturas"));
                ft.setFchRegistro(rs.getDate("fch_registro"));
                ft.setHoraRegistro(rs.getTime("hora_registro"));
                ft.setImporte(rs.getInt("importe"));
                ft.setTotal(rs.getInt("total"));
                ft.setIdSede(rs.getInt("idSede"));
                ft.setIdCajero(rs.getInt("idCajero"));
                ft.setIdCliente(rs.getInt("idCliente"));

//                ps2 = con.prepareStatement("SELECT * FROM detalles_pedidos WHERE idPedido=? AND existencia=?;");
//                ps2.setInt(1, rs.getInt("idPedidos"));
//                ps2.setString(2, "Y");
//                rs2 = ps2.executeQuery();
//                String cadenaDetallesP = "";
//                while (rs2.next()) {
//                    ps3 = con.prepareStatement("SELECT * FROM productos WHERE idProductos=?;");
//                    ps3.setInt(1, rs2.getInt("idProducto"));
//                    rs3 = ps3.executeQuery();
//                    if (rs3.next()) {
//                        ps4 = con.prepareStatement("SELECT * FROM categorias WHERE idCategorias=?;");
//                        ps4.setInt(1, rs3.getInt("idCategoria"));
//                        rs4 = ps4.executeQuery();
//                        if (rs4.next()) {
//
//                            cadenaDetallesP += rs4.getInt("idCategorias")+";"+cA.CifrarASCII(rs4.getString("nombre"))+"-"+
//                                    rs3.getInt("idProductos")+";"+cA.CifrarASCII(rs3.getString("nombre"))+";"+rs3.getString("descripcion")+";"+rs3.getInt("precio")+"-"+
//                                    rs2.getInt("idDetalles_Pedidos")+";"+rs2.getInt("cantidad")+";"+rs2.getString("observacion")+";"+rs2.getInt("sub_total")+":";
//                            // Categorias: id, nombre -
//                            // Productos: id, nombre, descripcion, precio -
//                            // DetallesPedido: id, cantidad, observacion, subtotal :
//
//                        }
//                        ps4.close();
//                        rs4.close();
//                    }
//                    ps3.close();
//                    rs3.close();
//                }
//                cadenaDetallesP = cadenaDetallesP.substring(0, cadenaDetallesP.length() - 1);
//                pd.setDetallesPedidos(cadenaDetallesP);
//                ps2.close();
//                rs2.close();


                ps2 = con.prepareStatement("SELECT nombres FROM usuarios WHERE idUsuarios=?;");
                ps2.setInt(1, rs.getInt("idCajero"));
                rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    String nombresUCajero = rs2.getString("nombres");

                    ps2.close();
                    rs2.close();
                    ps2 = con.prepareStatement("SELECT apellidos FROM info_usuarios WHERE idUsuario=?;");
                    ps2.setInt(1, rs.getInt("idCajero"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        ft.setNomCajero(nombresUCajero+" "+rs2.getString("apellidos"));
                    }
                }
                ps2.close();
                rs2.close();

                
//                ps2 = con.prepareStatement("SELECT nombres FROM usuarios WHERE idUsuarios=?;");
//                ps2.setInt(1, rs.getInt("idCliente"));
//                rs2 = ps2.executeQuery();
//                if (rs2.next()) {
//                    String nombresCliente = rs2.getString("nombres");
//
//                    ps2.close();
//                    rs2.close();
//                    ps2 = con.prepareStatement("SELECT apellidos FROM info_usuarios WHERE idUsuario=?;");
//                    ps2.setInt(1, rs.getInt("idCliente"));
//                    rs2 = ps2.executeQuery();
//                    if (rs2.next()) {
//                        ft.setNomCliente(nombresCliente+" "+rs2.getString("apellidos"));
//                    }
//                }
//                ps2.close();
//                rs2.close();


                ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    ft.setNomSede(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();


                listaFact.add(ft);
            }

            request.setAttribute("listaFact", listaFact);
            request.getRequestDispatcher("facturasListar.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de FACTURAS.");
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
