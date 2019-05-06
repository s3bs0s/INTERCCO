package com.INTERCCO.controlador.General;

import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Acceder extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ParseException {
        request.setCharacterEncoding("UTF-8");
        try {
            String emailUsuario = request.getParameter("accederEmail");
            String passUsuario = request.getParameter("accederPassword");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            
            ps = con.prepareStatement("SELECT * FROM usuarios WHERE email=? AND password=? AND existencia=?;");
            ps.setString(1, cA.CifrarASCII(emailUsuario));
            ps.setString(2, cA.CifrarASCII(passUsuario));
            ps.setString(3, "Y");
            rs = ps.executeQuery();

            if (rs.next()){
                String verificacion = rs.getString("verificado");
                int idusu = rs.getInt("idUsuarios");
                String nomusu = rs.getString("nombres");
                String apeusu = "";
                String fotusu = "";
                String rolusu = rs.getString("rol");
                String tipousu = "";
                String numiusu = "";
                String telusu = "";
                String movilusu = "";
                String generousu = "";
                String fchnaciusu = "";
                String direcusu = "";
                int idsede = rs.getInt("idSede");
                String nomsede;
                String rolsede;
                int idciud = 0;
                String nomciud = "";
                
                
                ps2 = con.prepareStatement("SELECT * FROM sedes WHERE idSedes=?;");
                ps2.setInt(1, idsede);
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    nomsede = rs2.getString("nombre");
                    rolsede = rs2.getString("rango");
                    idciud = rs2.getInt("idCiudad");
                    
                    ps2.close();
                    rs2.close();
                    ps2 = con.prepareStatement("SELECT * FROM ciudades WHERE idCiudades=?;");
                    ps2.setInt(1, idciud);
                    rs2 = ps2.executeQuery();
                    if (rs2.next()){
                        nomciud = rs2.getString("nombre");
                    }
                } else {
                    nomsede = "Sin Sede";
                    rolsede = "Principal";
                }
                ps2.close();
                rs2.close();
                
                
                ps2 = con.prepareStatement("SELECT * FROM info_usuarios WHERE idUsuario=?;");
                ps2.setInt(1, idusu);
                rs2 = ps2.executeQuery();
                if (rs2.next()){
                    apeusu = rs2.getString("apellidos");
                    fotusu = rs2.getString("nombre_img");
                    tipousu = rs2.getString("tipo_i");
                    numiusu = rs2.getString("num_i");
                    telusu = rs2.getString("telefono");
                    movilusu = rs2.getString("movil");
                    generousu = rs2.getString("genero");
                    fchnaciusu = rs2.getString("fch_naci");
                    direcusu = rs2.getString("direccion");
                }
                ps2.close();
                rs2.close();
                
                
                ps.close();
                rs.close();
                ps = con.prepareStatement("SELECT * FROM sanciones WHERE idUsuario=? AND existencia=?;");
                ps.setInt(1, idusu);
                ps.setString(2, "Y");
                rs = ps.executeQuery();

                if (rs.next()){
                    String razon = cA.DescifrarASCII(rs.getString("justificacion"));
                    Date fchLimite = dateFormat.parse(rs.getString("fch_limite"));
                    if (fchLimite.before(dateFormat.parse(dateFormat.format(date)))){
                        ps.close();
                        ps = con.prepareStatement("UPDATE sanciones SET existencia=? WHERE idUsuario=? AND existencia=?;");
                        ps.setString(1, "N");
                        ps.setInt(2, idusu);
                        ps.setString(3, "Y");
                        int res = ps.executeUpdate();

                        if (res > 0){
                            if (verificacion.equals("N")){
                                request.getRequestDispatcher("UsuarioCV?verifEmailUsuario="+emailUsuario+"&verifNombresUsuario="+nomusu).forward(request, response);
                            } else {
                                HttpSession session = request.getSession(true);
                                session.setAttribute("idUsuario", idusu);
                                session.setAttribute("verificadoUsuario", verificacion);
                                session.setAttribute("emailUsuario", emailUsuario);
                                session.setAttribute("passwordUsuario", passUsuario);
                                session.setAttribute("nomUsuario", nomusu);
                                session.setAttribute("apeUsuario", apeusu);
                                session.setAttribute("fotUsuario", fotusu);
                                session.setAttribute("rolUsuario", rolusu);
                                session.setAttribute("tipoUsuario", tipousu);
                                session.setAttribute("numUsuario", numiusu);
                                session.setAttribute("telUsuario", telusu);
                                session.setAttribute("movUsuario", movilusu);
                                session.setAttribute("genUsuario", generousu);
                                session.setAttribute("fnaUsuario", fchnaciusu);
                                session.setAttribute("dirUsuario", direcusu);
                                session.setAttribute("idSedeUsuario", idsede);
                                session.setAttribute("nomSedeUsuario", nomsede);
                                session.setAttribute("rolSedeUsuario", rolsede);
                                session.setAttribute("idCiudadUsuario", idciud);
                                session.setAttribute("nomCiudadUsuario", nomciud);

                                request.getRequestDispatcher("index").forward(request, response);
                            }
                        } else {
                            HttpSession session = request.getSession(true);
                            session.setAttribute("rolUsuario", "Usuario");
                            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                            System.out.println("ERROR de ACCEDER el dato de USUARIO.");
                        }
                    } else {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("rolUsuario", "Usuario");
                        Calendar calendar = Calendar.getInstance();
                        boolean sonDias = false;
                        int dias = 0;
                        do{
                            calendar = Calendar.getInstance();           
                            calendar.add(Calendar.DAY_OF_YEAR, dias);
                            date = calendar.getTime();
                            if(dateFormat.format(date).equals(dateFormat.format(fchLimite)))
                                sonDias = true;
                            else
                                dias++;
                        }while(sonDias != true);
                        request.getRequestDispatcher("index?mensaje=NSancionado&razonS="+razon+"&diasS="+dias).forward(request, response);
                    }
                } else {
                    if (verificacion.equals("N")){
                        request.getRequestDispatcher("UsuarioCV?verifEmailUsuario="+emailUsuario+"&verifNombresUsuario="+nomusu).forward(request, response);
                    } else {
                        HttpSession session = request.getSession(true);
                        session.setAttribute("idUsuario", idusu);
                        session.setAttribute("verificadoUsuario", verificacion);
                        session.setAttribute("emailUsuario", emailUsuario);
                        session.setAttribute("passwordUsuario", passUsuario);
                        session.setAttribute("nomUsuario", nomusu);
                        session.setAttribute("apeUsuario", apeusu);
                        session.setAttribute("fotUsuario", fotusu);
                        session.setAttribute("rolUsuario", rolusu);
                        session.setAttribute("tipoUsuario", tipousu);
                        session.setAttribute("numUsuario", numiusu);
                        session.setAttribute("telUsuario", telusu);
                        session.setAttribute("movUsuario", movilusu);
                        session.setAttribute("genUsuario", generousu);
                        session.setAttribute("fnaUsuario", fchnaciusu);
                        session.setAttribute("dirUsuario", direcusu);
                        session.setAttribute("idSedeUsuario", idsede);
                        session.setAttribute("nomSedeUsuario", nomsede);
                        session.setAttribute("rolSedeUsuario", rolsede);
                        session.setAttribute("idCiudadUsuario", idciud);
                        session.setAttribute("nomCiudadUsuario", nomciud);

                        request.getRequestDispatcher("index").forward(request, response);
                    }
                }
            } else {
                HttpSession session = request.getSession(true);
                session.setAttribute("rolUsuario", "Usuario");
                request.getRequestDispatcher("index?mensaje=NuAcc").forward(request, response);
            }
            cdb.cierraConexion();
        } catch (SQLException sql) {
            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ACCEDIENDO los datos de USUARIOS.");
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
        try {
            processRequest(request, response);
        } catch (ParseException ex) {
            Logger.getLogger(Acceder.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Acceder.class.getName()).log(Level.SEVERE, null, ex);
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
