package com.INTERCCO.controlador.CRUDFacturas;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.File;
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

public class GenerarFactura extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html;charset=UTF-8");
        try {
            CifradoASCII cA = new CifradoASCII();
            String numMesa = request.getParameter("numMesa");
            System.out.println(numMesa);
            String nomMesero = cA.DescifrarASCII(request.getParameter("nomMesero"));
            System.out.println(nomMesero);
            int idPedido = Integer.parseInt(request.getParameter("idPedido"));
            System.out.println(idPedido);
            int idCliente = Integer.parseInt(request.getParameter("idCliente"));
            System.out.println(idCliente);
            String nomCliente = request.getParameter("nomCliente");
            String cedulaCliente = request.getParameter("cedulaCliente");
            String finalCliente;
            int importe = Integer.parseInt(request.getParameter("importe").replace(".", ""));
            System.out.println(importe);
            String direccionSede = "";
            String numFactura = "";
            float iva = 0;
            
            HttpSession session = request.getSession();
            int idUsuario = (int) session.getAttribute("idUsuario");
            String nomUsuario = (String) session.getAttribute("nomUsuario") + " " + (String) session.getAttribute("apeUsuario");
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            String rolSedeUsuario = (String) session.getAttribute("rolSedeUsuario");
            String nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario");
            String nomCiudadUsuario = (String) session.getAttribute("nomCiudadUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            Date date = new Date();
            DateFormat dateFormatFinal = new SimpleDateFormat("MM/dd/yyyy");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            DateFormat hourFormat = new SimpleDateFormat("H:mm:ss");
            String hoyFecha = dateFormat.format(date);
            String hoyHora = hourFormat.format(date);
            
            
            String query;
            if (idCliente == 0){
                query = "INSERT INTO facturas (fch_registro,hora_registro,identi_cliente,importe,idCajero,idSede) VALUES (?,?,?,?,?,?);";
                finalCliente = cedulaCliente;
            } else {
                query = "INSERT INTO facturas (fch_registro,hora_registro,idCliente,importe,idCajero,idSede) VALUES (?,?,?,?,?,?);";
                finalCliente = nomCliente;
            }
            ps = con.prepareStatement(query);
            ps.setString(1, hoyFecha);
            ps.setString(2, hoyHora);
            if (idCliente == 0){
                ps.setString(3, cedulaCliente);
            } else {
                ps.setInt(3, idCliente);
            }
            ps.setInt(4, importe);
            ps.setInt(5, idUsuario);
            ps.setInt(6, idSedeUsuario);
            int res = ps.executeUpdate();

            if (res > 0){
                ps = con.prepareStatement("SELECT * FROM sedes WHERE idSedes=?;");
                ps.setInt(1, idSedeUsuario);
                rs = ps.executeQuery();
                if (rs.next()){
                    direccionSede = rs.getString("direccion");
                }
                
                ps = con.prepareStatement("SELECT porcentaje FROM iva;");
                rs = ps.executeQuery();
                if (rs.next()){
                    iva = rs.getFloat("porcentaje");
                }
                
                ps = con.prepareStatement("SELECT * FROM facturas WHERE fch_registro=? AND hora_registro=?;");
                ps.setString(1, hoyFecha);
                ps.setString(2, hoyHora);
                rs = ps.executeQuery();
                if (rs.next()){
                    numFactura = String.valueOf(rs.getInt("idFacturas"));
                }
                
                String SAVE_DIR = "ArchivosSistema" + File.separator + "Facturas";
                String appPath = request.getServletContext().getRealPath("");
                String savePath = appPath + SAVE_DIR + File.separator + numFactura + ".pdf";
                
                GenerarPDFFactura gPDF = new GenerarPDFFactura();
                gPDF.generarFactura(savePath,
                        direccionSede,
                        nomCiudadUsuario,
                        nomSedeUsuario,
                        rolSedeUsuario,
                        numFactura,
                        dateFormatFinal.format(date),
                        hoyHora,
                        nomMesero,
                        nomUsuario,
                        finalCliente,
                        numMesa,
                        idPedido,
                        iva,
                        importe);

                if (idCliente == 0){
                    ps = con.prepareStatement("UPDATE pedidos SET idFactura=?,estado=?,existencia=? WHERE idPedidos=?;");
                    ps.setInt(1, Integer.parseInt(numFactura));
                    ps.setString(2, "Facturado");
                    ps.setString(3, "N");
                    ps.setInt(4, idPedido);
                    ps.executeUpdate();
                } else {
                    ps = con.prepareStatement("UPDATE pedidos SET idCliente=?,idFactura=?,estado=?,existencia=? WHERE idPedidos=?;");
                    ps.setInt(1, idCliente);
                    ps.setInt(2, Integer.parseInt(numFactura));
                    ps.setString(3, "Facturado");
                    ps.setString(4, "N");
                    ps.setInt(5, idPedido);
                    ps.executeUpdate();
                }
                
                response.getWriter().print(numFactura+".pdf");
                
            } else {
                request.getRequestDispatcher("Insumos?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de GENERAR el dato de FACTURA.");
            }
                
            cdb.cierraConexion();

        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL GENERANDo los datos de FACTURAS.");
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
