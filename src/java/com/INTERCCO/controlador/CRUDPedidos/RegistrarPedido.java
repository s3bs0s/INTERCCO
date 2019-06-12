package com.INTERCCO.controlador.CRUDPedidos;

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

public class RegistrarPedido extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            int mesa = Integer.parseInt(request.getParameter("regMesaPedidos"));
            int subTotalGlobal = Integer.parseInt(request.getParameter("regSubtotalPedidos").replace(".", ""));
            int numsInputPP = Integer.parseInt(request.getParameter("regNumsInputPP"));
            
            int contProductosPedido = 0;
            for (int i = 1; i <= numsInputPP; i++) {
                if (request.getParameter("reg"+i+"InputPP") != null){
                    contProductosPedido++;
                }
            }
            
            String[][] productosPedido = new String[contProductosPedido][6];
            
            contProductosPedido = 0;
            for (int i = 0; i < numsInputPP; i++) {
                if (request.getParameter("reg"+(i+1)+"InputPP") != null){
                    String[] arrInputH = request.getParameter("reg"+(i+1)+"InputPP").split(";");
                    for (int j = 0; j < arrInputH.length; j++) {
                        productosPedido[contProductosPedido][j] = arrInputH[j];
                    }
                    contProductosPedido++;
                }
            }
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            Date date = new Date();
            DateFormat hourFormat = new SimpleDateFormat("H:mm:ss");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            DateFormat hourFormatC = new SimpleDateFormat("hhmmss");
            DateFormat dateFormatC = new SimpleDateFormat("ddMMyyyy");
            String code = "f"+dateFormatC.format(date)+"h"+hourFormatC.format(date);
            
            HttpSession session = request.getSession();
            int idUsuario = (int) session.getAttribute("idUsuario");
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            
            ps = con.prepareStatement("INSERT INTO pedidos (codigo,fch_registro,hora_registro,num_mesa,sub_total,idMesero,idSede,estado,existencia) VALUES (?,?,?,?,?,?,?,?,?);");
            ps.setString(1, code);
            ps.setString(2, dateFormat.format(date));
            ps.setString(3, hourFormat.format(date));
            ps.setInt(4, mesa);
            ps.setInt(5, subTotalGlobal);
            ps.setInt(6, idUsuario);
            ps.setInt(7, idSedeUsuario);
            ps.setString(8, "En espera");
            ps.setString(9, "Y");
            int res = ps.executeUpdate();

            if (res > 0){
                ps.close();
                ps = con.prepareStatement("SELECT idPedidos FROM pedidos WHERE codigo=?;");
                ps.setString(1, code);
                rs = ps.executeQuery();

                if (rs.next()){
                    int idPedidos = rs.getInt("idPedidos");
                    
                    for (int i = 0; i < productosPedido.length; i++) {
                        ps = con.prepareStatement("INSERT INTO detalles_pedidos (idPedido,idProducto,cantidad,observacion,sub_total,existencia) VALUES (?,?,?,?,?,?);");
                        ps.setInt(1, idPedidos);
                        ps.setInt(2, Integer.parseInt(productosPedido[i][0]));
                        ps.setInt(3, Integer.parseInt(productosPedido[i][3]));
                        ps.setString(4, productosPedido[i][4]);
                        ps.setInt(5, Integer.parseInt(productosPedido[i][5]));
                        ps.setString(6, "Y");
                        int res2 = ps.executeUpdate();

                        if (res2 < 1){
                            request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
                            System.out.println("ERROR de REGISTRAR el dato de PEDIDO.");
                        }
                    }
                    
                    request.getRequestDispatcher("Pedidos?mensaje=Y").forward(request, response);
                }
            } else {
                request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de PEDIDO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Pedidos?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de PEDIDOS.");
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
