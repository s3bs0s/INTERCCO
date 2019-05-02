package com.INTERCCO.controlador.General;

import com.INTERCCO.modelo.Beans.Carruseles;
import com.INTERCCO.modelo.Beans.Categorias;
import com.INTERCCO.modelo.Beans.InfoUsuarios;
import com.INTERCCO.modelo.Beans.Pqrsf;
import com.INTERCCO.modelo.Beans.Productos;
import com.INTERCCO.modelo.Beans.Promociones;
import com.INTERCCO.modelo.Beans.Sedes;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class index extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        request.setCharacterEncoding("UTF-8");
        try {
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            HttpSession session = request.getSession();
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            
            // Listar de TABLAS //
            
            ArrayList<Sedes> listaSedeIndex = new ArrayList<>();
            
            int contSedeExistentes = 0;
            int contSedePExistentes = 0;
            ps = con.prepareStatement("SELECT * FROM sedes;");
            rs = ps.executeQuery();
            while (rs.next()){
                Sedes sd = new Sedes();
                sd.setIdSedes(rs.getInt("idSedes"));
                sd.setNombre(rs.getString("nombre"));
                sd.setRango(rs.getString("rango"));
                sd.setDireccion(rs.getString("direccion"));
                sd.setSrcMapa(rs.getString("src_mapa"));
                sd.setHorariosSede(cA.DescifrarASCII(rs.getString("dias_horario"))+"Æ"+cA.DescifrarASCII(rs.getString("horas_horario")));
                sd.setIdCiudad(rs.getInt("idCiudad"));
                
                
                ps2 = con.prepareStatement("SELECT * FROM ciudades WHERE idCiudades=?;");
                ps2.setInt(1, rs.getInt("idCiudad"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    sd.setNombreCiudad(rs2.getString("nombre"));
                }
                ps2.close();
                rs2.close();
                
                
                listaSedeIndex.add(sd);
                if (rs.getString("rango").equals("Principal")){
                    contSedePExistentes++;
                }
                contSedeExistentes++;
            }
            
            // --------------------- //
            
            ArrayList<Categorias> listaCateIndex = new ArrayList<>();
            
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

                    
                listaCateIndex.add(ct);
            }
            
            // --------------------- //
            
            ArrayList<Productos> listaProdIndex = new ArrayList<>();
            
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

                    
                listaProdIndex.add(pd);
            }
            
            // --------------------- //
            
            ArrayList<Promociones> listaPromIndex = new ArrayList<>();
            
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
                
                
                ps2 = con.prepareStatement("SELECT nombre FROM productos WHERE idProductos=?;");
                ps2.setInt(1, rs.getInt("idProducto"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    pm.setNombreProducto(rs2.getString("nombre"));
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

                    
                listaPromIndex.add(pm);
            }
            
            // --------------------- //
            
            ArrayList<Carruseles> listaCarrIndex = new ArrayList<>();
            
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
                
                
                ps2 = con.prepareStatement("SELECT nombre,idCiudad FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, rs.getInt("idSede"));
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    cr.setNombreSede(rs2.getString("nombre"));
                    cr.setIdCiudad(rs2.getInt("idCiudad"));
                }
                ps2.close();
                rs2.close();

                    
                listaCarrIndex.add(cr);
            }
            
            // --------------------- //
            
            ArrayList<Pqrsf> listaPqrsfIndex = new ArrayList<>();
            if (session.getAttribute("idUsuario") != null){
                int idUsuario = (int) session.getAttribute("idUsuario");
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM pqrsf WHERE idCliente=?;");
                ps.setInt(1, idUsuario);
                rs = ps.executeQuery();
                while (rs.next()){
                    Pqrsf pq = new Pqrsf();
                    pq.setIdPqrsf(rs.getInt("idPqrsf"));
                    pq.setFchRegistro(rs.getDate("fch_registro"));
                    pq.setHoraRegistro(rs.getTime("hora_registro"));
                    pq.setTipoSolicitud(rs.getString("tipo_solicitud"));
                    pq.setDirigidoA(rs.getString("dirigido_a"));
                    pq.setConsulta(rs.getString("consulta"));
                    pq.setRespuesta(rs.getString("respuesta"));
                    pq.setEstado(rs.getString("estado"));


                    ps2 = con.prepareStatement("SELECT * FROM sedes WHERE idSedes=?;");
                    ps2.setInt(1, rs.getInt("idSedeDirigido"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        pq.setIdSedeDirigido(rs2.getString("nombre"));
                    }
                    ps2.close();
                    rs2.close();


                    ps2 = con.prepareStatement("SELECT * FROM usuarios WHERE idUsuarios=? AND existencia=?;");
                    ps2.setInt(1, rs.getInt("idInterlocutor"));
                    ps2.setString(2, "Y");
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        pq.setIdInterlocutor(rs2.getString("email"));
                        String nombreInter = rs2.getString("nombres");
                        
                        ps2.close();
                        rs2.close();
                        ps2 = con.prepareStatement("SELECT * FROM info_usuarios WHERE idUsuario=? AND existencia=?;");
                        ps2.setInt(1, rs.getInt("idInterlocutor"));
                        ps2.setString(2, "Y");
                        rs2 = ps2.executeQuery();
                        if (rs2.next()){
                            pq.setNombreInterlocutor(nombreInter+" "+rs2.getString("apellidos"));
                        }
                    } else {
                        pq.setIdInterlocutor("");
                    }
                    ps2.close();
                    rs2.close();


                    listaPqrsfIndex.add(pq);
                }
            }
            
            // --------------------- //
            
            ArrayList<InfoUsuarios> listaUsuaIndex = new ArrayList<>();
            ps = con.prepareStatement("SELECT * FROM info_usuarios WHERE existencia=?;");
            ps.setString(1, "Y");
            rs = ps.executeQuery();
            while (rs.next()){
                InfoUsuarios ifus = new InfoUsuarios();
                ifus.setIdInfoUsuarios(rs.getInt("idInfo_Usuarios"));
                ifus.setApellidos(rs.getString("apellidos"));
                ifus.setNombreImg(rs.getString("nombre_img"));
                ifus.setGenero(rs.getString("genero"));
                ifus.setIdUsuario(rs.getInt("idUsuario"));
                
                
                ps2 = con.prepareStatement("SELECT * FROM usuarios WHERE idUsuarios=? AND existencia=?;");
                ps2.setInt(1, rs.getInt("idUsuario"));
                ps2.setString(2, "Y");
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    ifus.setEmail(rs2.getString("email"));
                    ifus.setPassword(rs2.getString("password"));
                    ifus.setRol(rs2.getString("rol"));
                    ifus.setNombres(rs2.getString("nombres"));
                    int iSe = rs2.getInt("idSede");

                    ps2.close();
                    rs2.close();
                    ps2 = con.prepareStatement("SELECT nombre FROM sedes WHERE idSedes=?;");
                    ps2.setInt(1, iSe);
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        ifus.setSede(rs2.getString("nombre"));
                    } else {
                        ifus.setSede("Sin Sede");
                    }
                }
                ps2.close();
                rs2.close();

                
                listaUsuaIndex.add(ifus);
            }
            
            
            // Listar de SELECTS //
            
            ArrayList<Sedes> listaSedSIndex = new ArrayList<>();
            
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT idSedes,nombre FROM sedes ORDER BY idSedes DESC;");
            rs = ps.executeQuery();
            while (rs.next()){
                Sedes sd = new Sedes();
                sd.setIdSedes(rs.getInt("idSedes"));
                sd.setNombre(rs.getString("nombre"));
                
                listaSedSIndex.add(sd);
            }
            
            // --------------------- //
            
//            ArrayList<Productos> listaProSPar = new ArrayList<>();
//            
//            ps.close();
//            rs.close();
//            ps = con.prepareStatement("SELECT idProductos,nombre FROM productos WHERE existencia=? ORDER BY idProductos DESC;");
//            ps.setString(1, "Y");
//            rs = ps.executeQuery();
//            while (rs.next()){
//                Productos pd = new Productos();
//                pd.setIdProductos(rs.getInt("idProductos"));
//                pd.setNombre(rs.getString("nombre"));
//                
//                listaProSPar.add(pd);
//            }
            

            // Listar de Estados //
            
            int contInsuAgotados = 0;
            int contInsuCaducados = 0;
            if (session.getAttribute("idSedeUsuario") != null){
                int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM insumos WHERE idSede=? AND existencia=?;");
                ps.setInt(1, idSedeUsuario);
                ps.setString(2, "Y");
                rs = ps.executeQuery();
                while (rs.next()){
                    if(rs.getDate("fch_caducidad").before(dateFormat.parse(dateFormat.format(date))) || rs.getDate("fch_caducidad").equals(dateFormat.parse(dateFormat.format(date)))){
                        contInsuCaducados++;
                    } else if (rs.getInt("cantidad") < 1){
                        contInsuAgotados++;
                    }
                }
            }
            
            // --------------------- //
            
            int contUsuaEmpleados = 0;
            if (session.getAttribute("idSedeUsuario") != null){
                int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM usuarios WHERE idSede=? AND rol!=? AND rol!=? AND existencia=?;");
                ps.setInt(1, idSedeUsuario);
                ps.setString(2, "Cliente");
                ps.setString(3, "AdminS");
                ps.setString(4, "Y");
                rs = ps.executeQuery();
                while (rs.next()){
                    contUsuaEmpleados++;
                }
            }
            
            // --------------------- //
            
            int contPqrsfSResponder = 0;
            if (session.getAttribute("idSedeUsuario") != null){
                int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM pqrsf WHERE idSedeDirigido=? AND respuesta=? AND estado=?;");
                ps.setInt(1, idSedeUsuario);
                ps.setString(2, "83S105S110S32S114S101S115S112S117S101S115S116S97");
                ps.setString(3, "Vacio");
                rs = ps.executeQuery();
                while (rs.next()){
                    contPqrsfSResponder++;
                }
            }
            
            // --------------------- //
            
            int contSopoPendientes = 0;
            if (session.getAttribute("idUsuario") != null){
                int idUsuario = (int) session.getAttribute("idUsuario");
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM soportes WHERE idUsuario=? AND estado=?;");
                ps.setInt(1, idUsuario);
                ps.setString(2, "P");
                rs = ps.executeQuery();
                while (rs.next()){
                    contSopoPendientes++;
                }
            }
            
            // --------------------- //
            
            int contSopoPendientesAdmin = 0;
            ps.close();
            rs.close();
            ps = con.prepareStatement("SELECT * FROM soportes WHERE estado=?;");
            ps.setString(1, "P");
            rs = ps.executeQuery();
            while (rs.next()){
                contSopoPendientesAdmin++;
            }
            
            // --------------------- //
            
            int contUsuaSancionados = 0;
            if (session.getAttribute("idSedeUsuario") != null){
                int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM usuarios WHERE idSede=? AND existencia=?;");
                ps.setInt(1, idSedeUsuario);
                ps.setString(2, "Y");
                rs = ps.executeQuery();
                while (rs.next()){
                    
                    ps2 = con.prepareStatement("SELECT * FROM sanciones WHERE idUsuario=? AND existencia=?;");
                    ps2.setInt(1, rs.getInt("idUsuarios"));
                    ps2.setString(2, "Y");
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        contUsuaSancionados++;
                    }
                    ps2.close();
                    rs2.close();
                    
                }
            }
            
            // --------------------- //
            
            
            request.setAttribute("listaSedeIndex", listaSedeIndex);
            request.setAttribute("listaCateIndex", listaCateIndex);
            request.setAttribute("listaProdIndex", listaProdIndex);
            request.setAttribute("listaPromIndex", listaPromIndex);
            request.setAttribute("listaCarrIndex", listaCarrIndex);
            request.setAttribute("listaPqrsfIndex", listaPqrsfIndex);
            request.setAttribute("listaUsuaIndex", listaUsuaIndex);
            
            request.setAttribute("listaSedSIndex", listaSedSIndex);
//            request.setAttribute("listaProSPar", listaProSPar);

            request.setAttribute("estadoInsuAgotados", contInsuAgotados);
            request.setAttribute("estadoInsuCaducados", contInsuCaducados);
            request.setAttribute("estadoUsuaEmpleados", contUsuaEmpleados);
            request.setAttribute("estadoUsuaSancionados", contUsuaSancionados);
            request.setAttribute("estadoPqrsfSResponder", contPqrsfSResponder);
            request.setAttribute("estadoSopoPendientes", contSopoPendientes);
            request.setAttribute("estadoSedeExistentes", contSedeExistentes);
            request.setAttribute("estadoSedePExistentes", contSedePExistentes);
            request.setAttribute("estadoSopoPendientesAdmin", contSopoPendientesAdmin);
            request.getRequestDispatcher("index.jsp").forward(request, response);
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de PARAMETROS.");
            sql.printStackTrace();
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(index.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(index.class.getName()).log(Level.SEVERE, null, ex);
        }
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
