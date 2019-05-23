package com.INTERCCO.controlador.CRUDParametros;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Beans.Carruseles;
import com.INTERCCO.modelo.Beans.Soportes;
import com.INTERCCO.modelo.Beans.Categorias;
import com.INTERCCO.modelo.Beans.Insumos;
import com.INTERCCO.modelo.Beans.Productos;
import com.INTERCCO.modelo.Beans.Promociones;
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

public class ListarParametros extends HttpServlet {

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
            PreparedStatement ps3;
            ResultSet rs3;
            CifradoASCII cA = new CifradoASCII();
            
            
            // Listar de TABLAS //
            
            ArrayList<Soportes> listaSop = new ArrayList<>();
            
            ps = con.prepareStatement("SELECT * FROM soportes;");
            rs = ps.executeQuery();
            while (rs.next()){
                Soportes sp = new Soportes();
                sp.setIdSoportes(rs.getInt("idSoportes"));
                sp.setFchSolicitud(rs.getDate("fch_solicitud"));
                sp.setFchResuelto(rs.getDate("fch_resuelto"));
                sp.setDescripcion(rs.getString("descripcion"));
                sp.setRuta(rs.getString("ruta"));
                sp.setEstado(rs.getString("estado"));
                sp.setIdUsuario(rs.getInt("idUsuario"));
                
                
                ps2 = con.prepareStatement("SELECT email FROM usuarios WHERE idUsuarios=? AND rol!=?;");
                ps2.setInt(1, rs.getInt("idUsuario"));
                ps2.setString(2, "Cliente");
                rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    sp.setEmailUsuario(rs2.getString("email"));
                }
                ps2.close();
                rs2.close();

                
                ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()) {
                    sp.setIdSede(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();

                    
                listaSop.add(sp);
            }
            
            // --------------------- //
            
            ArrayList<Categorias> listaCat = new ArrayList<>();
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * FROM categorias WHERE existencia=?;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Categorias ct = new Categorias();
                ct.setIdCategorias(rs.getInt("idCategorias"));
                ct.setNombre(rs.getString("nombre"));
                ct.setExistencia(rs.getString("existencia"));
                ct.setIdSede(rs.getInt("idSede"));
                
                
                ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    ct.setNombreSede(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();

                    
                listaCat.add(ct);
            }
            
            // --------------------- //
            
            ArrayList<Productos> listaProd = new ArrayList<>();
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * FROM productos WHERE existencia=?;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Productos pd = new Productos();
                pd.setIdProductos(rs.getInt("idProductos"));
                pd.setNombre(rs.getString("nombre"));
                pd.setDescripcion(rs.getString("descripcion"));
                pd.setPrecio(rs.getInt("precio"));
                pd.setExistencia(rs.getString("existencia"));
                pd.setIdCategoria(rs.getInt("idCategoria"));
                pd.setIdSede(rs.getInt("idSede"));
                
                
                ps2 = con.prepareStatement("SELECT nombre FROM categorias WHERE idCategorias=?;");
                ps2.setInt(1, rs.getInt("idCategoria"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pd.setNombreCategoria(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();
                
                
                ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pd.setNombreSede(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();
                
                ps2 = con.prepareStatement("SELECT * FROM detalles_productos WHERE idProducto=? AND existencia=?;");
                ps2.setInt(1, rs.getInt("idProductos"));
                ps2.setString(2, "Y");
                rs2 = ps2.executeQuery();
                String cadenaInsumos = "";
                while (rs2.next()){
                    ps3 = con.prepareStatement("SELECT nombre,unidad_medida FROM insumos WHERE idInsumos=?;");
                    ps3.setInt(1, rs2.getInt("idInsumoNecesario"));
                    rs3 = ps3.executeQuery();
                    String nombreInsumo = "Insumo";
                    String unidadMedida = "";
                    if (rs3.next()){
                        nombreInsumo = rs3.getString("nombre");
                        unidadMedida = rs3.getString("unidad_medida");
                    }
                    ps3.close();
                    rs3.close();
                    
                    cadenaInsumos += rs2.getInt("idDetalles_Productos")+"-"+rs2.getInt("idInsumoNecesario")+"-"+cA.CifrarASCII(nombreInsumo)+"-"+unidadMedida+"-"+rs2.getInt("cantidad_insumo")+"-Y-Viejo;";
                }
                pd.setInsumosGasta(cadenaInsumos.substring(0, cadenaInsumos.length() - 1));
                ps2.close();
                rs2.close();

                    
                listaProd.add(pd);
            }
            
            // --------------------- //
            
            ArrayList<Promociones> listaProm = new ArrayList<>();
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * FROM promociones WHERE existencia=?;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Promociones pm = new Promociones();
                pm.setIdPromociones(rs.getInt("idPromociones"));
                pm.setFchRegistro(rs.getDate("fch_registro"));
                pm.setHoraRegistro(rs.getTime("hora_registro"));
                pm.setIdProducto(rs.getInt("idProducto"));
                pm.setPorcentajePromo(rs.getFloat("porcentaje_promo"));
                pm.setFchCaducidad(rs.getDate("fch_caducidad"));
                pm.setExistencia(rs.getString("existencia"));
                pm.setIdSede(rs.getInt("idSede"));
                
                
                ps2 = con.prepareStatement("SELECT nombre,precio FROM productos WHERE idProductos=?;");
                ps2.setInt(1, rs.getInt("idProducto"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pm.setNombreProducto(rs2.getString("nombre"));
                    pm.setPrecioProducto(rs2.getInt("precio"));
                }
                ps2.close();
                rs2.close();
                
                
                ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pm.setNombreSede(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();

                    
                listaProm.add(pm);
            }
            
            // --------------------- //
            
            ArrayList<Carruseles> listaCarr = new ArrayList<>();
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * FROM carruseles WHERE existencia=?;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Carruseles cr = new Carruseles();
                cr.setIdCarruseles(rs.getInt("idCarruseles"));
                cr.setTipo(rs.getString("tipo"));
                cr.setDirigidoA(rs.getString("dirigido_a"));
                cr.setNombreImg(rs.getString("nombre_img"));
                cr.setExistencia(rs.getString("existencia"));
                cr.setIdSede(rs.getInt("idSede"));
                
                
                ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    cr.setNombreSede(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();

                    
                listaCarr.add(cr);
            }
            
            // --------------------- //
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * FROM iva;");
            rs = ps.executeQuery();
            float IVA = (float) 0.0;
            if (rs.next()){
                IVA = rs.getFloat("porcentaje");
            }
            
            
            // Listar de SELECTS //
            
            ArrayList<Categorias> listaCatSPar = new ArrayList<>();
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT idCategorias,nombre,idSede FROM categorias WHERE existencia=? ORDER BY idCategorias DESC;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Categorias ct = new Categorias();
                ct.setIdCategorias(rs.getInt("idCategorias"));
                ct.setNombre(rs.getString("nombre"));
                ct.setIdSede(rs.getInt("idSede"));
                
                listaCatSPar.add(ct);
            }
            
            // --------------------- //
            
            ArrayList<Productos> listaProSPar = new ArrayList<>();
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT idProductos,nombre,idSede FROM productos WHERE existencia=? ORDER BY idProductos DESC;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Productos pd = new Productos();
                pd.setIdProductos(rs.getInt("idProductos"));
                pd.setNombre(rs.getString("nombre"));
                pd.setIdSede(rs.getInt("idSede"));
                
                listaProSPar.add(pd);
            }
            
            // --------------------- //
            
            ArrayList<Insumos> listaInsSPar = new ArrayList<>();
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT idInsumos,nombre,unidad_medida,idSede FROM insumos WHERE existencia=? ORDER BY idInsumos DESC;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                Insumos in = new Insumos();
                in.setIdInsumos(rs.getInt("idInsumos"));
                in.setNombre(rs.getString("nombre"));
                in.setUnidadMedida(rs.getString("unidad_medida"));
                in.setIdSede(rs.getInt("idSede"));
                
                listaInsSPar.add(in);
            }
            
            
            request.setAttribute("listaSop", listaSop);
            request.setAttribute("listaCat", listaCat);
            request.setAttribute("listaProd", listaProd);
            request.setAttribute("listaProm", listaProm);
            request.setAttribute("listaCarr", listaCarr);
            request.setAttribute("listaCatSPar", listaCatSPar);
            request.setAttribute("listaProSPar", listaProSPar);
            request.setAttribute("listaInsSPar", listaInsSPar);
            request.setAttribute("IVA", IVA);
            request.getRequestDispatcher("parametros.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de PARAMETROS.");
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
