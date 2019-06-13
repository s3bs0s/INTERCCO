package com.INTERCCO.controlador.CRUDUsuarios;

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

public class RegistrarUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nombres = request.getParameter("regNombresUsuario");
            String apellidos = request.getParameter("regApellidosUsuario");
            String rol = request.getParameter("regRolUsuario");
            String tipoiden = request.getParameter("regTipoIdentiUsuario");
            String numiden = request.getParameter("regNumIdentiUsuario");
            String email = request.getParameter("regEmailUsuario");
            String password = request.getParameter("regContraUsuario");
            String telef_fijo = request.getParameter("regTelefonoUsuario");
            String telef_movil = request.getParameter("regMovilUsuario");
            String genero = request.getParameter("regGeneroUsuario");
            String fchnaci = request.getParameter("regFechaNacimientoUsuario");
            String sede = request.getParameter("regSedeUsuario");
            String direccion = request.getParameter("regDireccionUsuario");

            int idSedeUsuario = 0;
            HttpSession session = request.getSession();
            if (session.getAttribute("idSedeUsuario") != null) {
                idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            }
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            ResultSet rs;
            Date date = new Date();
            
            ps = con.prepareStatement("SELECT * FROM usuarios WHERE email=? AND existencia=?;");
            ps.setString(1, cA.CifrarASCII(email));
            ps.setString(2, "Y");
            rs = ps.executeQuery();

            if (rs.next()){
                if (rol == null){
                    request.getRequestDispatcher("index?mensaje=Nee&emailUsu="+email).forward(request, response);
                    System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                } else {
                    System.out.println(email);
                    request.getRequestDispatcher("Usuarios?mensaje=Nee&emailusu="+email).forward(request, response);
                    System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                }
            } else {
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM info_usuarios WHERE num_i=? AND existencia=?;");
                ps.setString(1, numiden);
                ps.setString(2, "Y");
                rs = ps.executeQuery();

                if (rs.next()){
                    if (rol == null){
                        request.getRequestDispatcher("index?mensaje=Neni&numUsu="+numiden).forward(request, response);
                        System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                    } else {
                        request.getRequestDispatcher("Usuarios?mensaje=Neni&numi="+numiden).forward(request, response);
                        System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                    }
                } else {
                    
                    ps = con.prepareStatement("SELECT * FROM usuarios WHERE email=?;");
                    ps.setString(1, cA.CifrarASCII(email));
                    rs = ps.executeQuery();

                    if (rs.next()){
                        
                        
                        ps.close();
                        ps = con.prepareStatement("UPDATE usuarios SET email=?,password=?,rol=?,nombres=?,idSede=?,verificado=?,existencia=? WHERE email=?;");
                        ps.setString(1, cA.CifrarASCII(email));
                        ps.setString(2, cA.CifrarASCII(password));
                        if (rol == null){
                            ps.setString(3, "Cliente");
                        } else {
                            ps.setString(3, rol);
                        }
                        ps.setString(4, nombres);
                        if (sede == null){
                            ps.setInt(5, idSedeUsuario);
                        } else {
                            ps.setInt(5, Integer.parseInt(sede));
                        }
                        ps.setString(6, "N");
                        ps.setString(7, "Y");
                        ps.setString(8, cA.CifrarASCII(email));
                        int res = ps.executeUpdate();

                        if (res > 0){
                            ps.close();
                            rs.close();
                            ps = con.prepareStatement("SELECT idUsuarios FROM usuarios WHERE email=? AND existencia=?;");
                            ps.setString(1, cA.CifrarASCII(email));
                            ps.setString(2, "Y");
                            rs = ps.executeQuery();
                            
                            if (rs.next()){
                                int idusu = rs.getInt("idUsuarios");
                                ps.close();
                                ps = con.prepareStatement("UPDATE info_usuarios SET fch_registro=?,hora_registro=?,nombre_img=?,apellidos=?,tipo_i=?,num_i=?,telefono=?,movil=?,genero=?,fch_naci=?,direccion=?,existencia=? WHERE idUsuario=?;");
                                DateFormat hourFormat = new SimpleDateFormat("H:mm:ss");
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                ps.setString(1, dateFormat.format(date));
                                ps.setString(2, hourFormat.format(date));
                                ps.setString(3, "86S97S99S105S111");
                                ps.setString(4, apellidos);
                                ps.setString(5, tipoiden);
                                ps.setString(6, numiden);
                                ps.setString(7, telef_fijo);
                                ps.setString(8, telef_movil);
                                ps.setString(9, genero);
                                ps.setString(10, fchnaci);
                                ps.setString(11, direccion);
                                ps.setString(12, "Y");
                                ps.setInt(13, idusu);
                                int res2 = ps.executeUpdate();

                                if (res2 > 0){
                                    if (rol == null){
                                        request.getRequestDispatcher("UsuarioCV?verifEmailUsuario="+email+"&verifNombresUsuario="+nombres).forward(request, response);
                                    } else {
                                        request.getRequestDispatcher("Usuarios?mensaje=Y&nomusu="+nombres).forward(request, response);
                                        System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                    }
                                } else {
                                    if (rol == null){
                                        request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                                        System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                    } else {
                                        request.getRequestDispatcher("Usuarios?mensaje=Ne&nomusu="+nombres).forward(request, response);
                                        System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                    }
                                }
                            } else {
                                if (rol == null){
                                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                                    System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                } else {
                                    request.getRequestDispatcher("Usuarios?mensaje=Ne&nomusu="+nombres).forward(request, response);
                                    System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                }
                            }
                        } else {
                            if (rol == null){
                                request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                                System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                            } else {
                                request.getRequestDispatcher("Usuarios?mensaje=Ne&nomusu="+nombres).forward(request, response);
                                System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                            }
                        }
                        
                        
                    } else {
                        
                        
                        ps.close();
                        ps = con.prepareStatement("INSERT INTO usuarios (email,password,rol,nombres,idSede,verificado,existencia) VALUES (?,?,?,?,?,?,?);");
                        ps.setString(1, cA.CifrarASCII(email));
                        ps.setString(2, cA.CifrarASCII(password));
                        if (rol == null){
                            ps.setString(3, "Cliente");
                        } else {
                            ps.setString(3, rol);
                        }
                        ps.setString(4, nombres);
                        if (sede == null){
                            ps.setInt(5, idSedeUsuario);
                        } else {
                            ps.setInt(5, Integer.parseInt(sede));
                        }
                        ps.setString(6, "N");
                        ps.setString(7, "Y");
                        int res = ps.executeUpdate();

                        if (res > 0){
                            ps.close();
                            rs.close();
                            ps = con.prepareStatement("SELECT idUsuarios FROM usuarios WHERE email=? AND existencia=?;");
                            ps.setString(1, cA.CifrarASCII(email));
                            ps.setString(2, "Y");
                            rs = ps.executeQuery();

                            if (rs.next()){
                                int idusu = rs.getInt("idUsuarios");
                                ps.close();
                                ps = con.prepareStatement("INSERT INTO info_usuarios (idUsuario,fch_registro,hora_registro,nombre_img,apellidos,tipo_i,num_i,telefono,movil,genero,fch_naci,direccion,existencia) VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?);");
                                ps.setInt(1, idusu);
                                DateFormat hourFormat = new SimpleDateFormat("H:mm:ss");
                                DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
                                ps.setString(2, dateFormat.format(date));
                                ps.setString(3, hourFormat.format(date));
                                ps.setString(4, "86S97S99S105S111");
                                ps.setString(5, apellidos);
                                ps.setString(6, tipoiden);
                                ps.setString(7, numiden);
                                ps.setString(8, telef_fijo);
                                ps.setString(9, telef_movil);
                                ps.setString(10, genero);
                                ps.setString(11, fchnaci);
                                ps.setString(12, direccion);
                                ps.setString(13, "Y");
                                int res2 = ps.executeUpdate();

                                if (res2 > 0){
                                    if (rol == null){
                                        request.getRequestDispatcher("UsuarioCV?verifEmailUsuario="+email+"&verifNombresUsuario="+nombres).forward(request, response);
                                    } else {
                                        request.getRequestDispatcher("Usuarios?mensaje=Y&nomusu="+nombres).forward(request, response);
                                        System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                    }
                                } else {
                                    if (rol == null){
                                        request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                                        System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                    } else {
                                        request.getRequestDispatcher("Usuarios?mensaje=Ne&nomusu="+nombres).forward(request, response);
                                        System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                    }
                                }
                            } else {
                                if (rol == null){
                                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                                    System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                } else {
                                    request.getRequestDispatcher("Usuarios?mensaje=Ne&nomusu="+nombres).forward(request, response);
                                    System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                                }
                            }
                        } else {
                            if (rol == null){
                                request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                                System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                            } else {
                                request.getRequestDispatcher("Usuarios?mensaje=Ne&nomusu="+nombres).forward(request, response);
                                System.out.println("ERROR de REGISTRAR el dato de USUARIO.");
                            }
                        }
                        
                        
                    }
                }
            }
            cdb.cierraConexion();

        } catch (SQLException sql) {
            request.getRequestDispatcher("Usuarios?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de USUARIOS.");
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
