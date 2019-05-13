package com.INTERCCO.controlador.CRUDPqrsf;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.controlador.General.EstructuraFYH;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Properties;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class RegistrarPqrsf extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            final String usuarioEmailSUCCO = "contacto.succo@gmail.com";
            final String passEmailSUCCO = "succo12345";
            String subject = "";
            String dest = "";
            String[] vect;
            
            String sede = request.getParameter("regSedePqrsf");
            String tipoSoli = request.getParameter("regTipoSolicitudPqrsf");
            String dirigidoA = request.getParameter("regDirigidoAPqrsf");
            String consulta = request.getParameter("regConsultaPqrsf");
            
            if (tipoSoli.equals("Queja") || tipoSoli.equals("Reclamo")){
                subject = "¡Ha llegado una solicitud de "+tipoSoli+" a su SEDE!";
            }
            
            HttpSession session = request.getSession();
            int idUsuario = (int) session.getAttribute("idUsuario");
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            EstructuraFYH eFYH = new EstructuraFYH();
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat hourFormat = new SimpleDateFormat("H:mm:ss");
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String hoy = dateFormat.format(date);
            
            if (consulta.length() == 0){
                request.getRequestDispatcher("index?mensaje=NeC").forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de PQRSF.");
            } else {
                
                if (tipoSoli.equals("Queja") || tipoSoli.equals("Reclamo")){
                    ps = con.prepareStatement("SELECT * FROM usuarios WHERE rol=? AND idSede=? AND existencia=?;");
                    ps.setString(1, "Gerente");
                    ps.setInt(2, Integer.parseInt(sede));
                    ps.setString(3, "Y");
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        dest = dest + rs.getString("email")+";";
                    }
                    dest = dest.substring(0, dest.length() - 1);
                    vect = dest.split(";");
                    
                    
                    Properties props = new Properties();

                    props.put("mail.smtp.host", "smtp.gmail.com");
                    props.put("mail.smtp.starttls.enable", "true");
                    props.put("mail.smtp.port", "587");
                    props.put("mail.smtp.auth", "true");

                    Session sessionM = Session.getInstance(props,
                            new javax.mail.Authenticator() {
                                protected PasswordAuthentication getPasswordAuthentication() {
                                    return new PasswordAuthentication(usuarioEmailSUCCO, passEmailSUCCO);
                                }
                            });
                    sessionM.setDebug(false);
                    
                    BodyPart textHtml = new MimeBodyPart();
                    textHtml.setContent("<div style=\"font-family:Arial; width:90%; margin:auto; padding:10px; border-radius:15px; background:#C1D0E7; \"><div style=\"width:100%; \"><div style=\"width:100%; padding:12px 0; background:#446EB6; border-top-left-radius:18px; border-top-right-radius:18px; \"><a target=\"_blank\" href=\"https://www.google.com/\" style=\"width:30%; display:inline-block; margin-left:30px; \"><img alt=\"FSUCCO\" style=\"width:100%; \" src=\"https://i.imgur.com/u2GoMPN.png\"></a></div><div style=\"width:92%; padding:18px 4%; background:#fff; \"><div style=\"display:flex; \"><p style=\"display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; \">Señor(a) Gerente,</p><p style=\"display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; \">Día "+eFYH.estFecha(hoy, "dd")+" del mes "+eFYH.estFecha(hoy, "mm")+" de "+eFYH.estFecha(hoy, "aa")+"</p></div><div style=\"font-size:17px; \"><p style=\"text-align:justify; \">Su sede ha recibido una solicitud PQRSF de <span style=\"color:#446EB6; \">\""+tipoSoli+"\"</span>, se pide que la revise inmediatamente.</p></div><div style=\"margin-top:40px; \"><p style=\"font-size:18px; \">Gracias por la atención prestada, feliz día.</p></div></div><div style=\"width:100%; padding:15px 0; background:#446EB6; border-bottom-left-radius:18px; border-bottom-right-radius:18px; \"><div style=\"width:100%; text-align:center; \"><p style=\"color:#fff; font-size:19px; margin:0; letter-spacing:1pt; \">tel. 01 8055 44 69 22</p><p style=\"color:#fff; font-size:19px; margin:0; text-decoration:none; letter-spacing:1pt; \">contacto.succo@gmail.com</p><a target=\"_blank\" style=\"color:#fff; font-size:19px; letter-spacing:1pt; text-decoration:none; \" href=\"https://www.google.com/\">www.succo.com.co</a></div><div style=\"width:100%; padding:10px 0; margin-top:12px; display:flex; \"><div style=\"width:25%; \"></div><div style=\"width:50%; display:flex; \"><a target=\"_blank\" style=\"width:50%; text-align:center; \" href=\"https://www.facebook.com/\"><img alt=\"Facebook\" style=\"width:50%; \" src=\"https://i.imgur.com/1Y79eZu.png\"></a><a target=\"_blank\" style=\"width:50%; text-align:center; \" href=\"https://www.instagram.com/\"><img alt=\"Instagram\" style=\"width:50%; \" src=\"https://i.imgur.com/m7Ruie1.png\"></a><a target=\"_blank\" style=\"width:50%; text-align:center; \" href=\"https://www.twitter.com/\"><img alt=\"Twitter\" style=\"width:50%; \" src=\"https://i.imgur.com/aeXEkNV.png\"></a><a target=\"_blank\" style=\"width:50%; text-align:center; \" href=\"https://plus.google.com/discover\"><img alt=\"Google Plus\" style=\"width:50%; \" src=\"https://i.imgur.com/0uNWCEw.png\"></a></div><div style=\"width:25%; \"></div></div><div style=\"width:100%; text-align:center; margin-top:12px; \"><p style=\"margin:0; color:#fff; letter-spacing:1pt; \">&copy; 2004-2019 National Restaurant SUCCO.</p></div></div></div></div>","text/html");
                    MimeMultipart multiPart = new MimeMultipart();
                    multiPart.addBodyPart(textHtml);
                    
                    for (int i = 0; i < vect.length; i++) {
                        Message message = new MimeMessage(sessionM);
                        message.setFrom(new InternetAddress(usuarioEmailSUCCO));
                        message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(cA.DescifrarASCII(vect[i])));
                        message.setSubject(subject);
                        message.setContent(multiPart);
                        Transport.send(message);
                    }
                    
                }
                
                
                
                
                
                
                
                
                
                ps = con.prepareStatement("INSERT INTO pqrsf (idCliente,idSedeCliente,fch_registro,hora_registro,tipo_solicitud,dirigido_a,consulta,respuesta,estado,idSedeDirigido) VALUES (?,?,?,?,?,?,?,?,?,?);");
                ps.setInt(1, idUsuario);
                ps.setInt(2, idSedeUsuario);
                ps.setString(3, dateFormat.format(date));
                ps.setString(4, hourFormat.format(date));
                ps.setString(5, tipoSoli);
                ps.setString(6, dirigidoA);
                String consultaCifrada = cA.CifrarASCII(consulta);
                ps.setString(7, consultaCifrada);
                ps.setString(8, "83S105S110S32S114S101S115S112S117S101S115S116S97");
                ps.setString(9, "Vacio");
                ps.setInt(10, Integer.parseInt(sede));
                int res = ps.executeUpdate();

                if (res > 0){
                    request.getRequestDispatcher("index?mensaje=YPQRSF").forward(request, response);
                } else {
                    request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                    System.out.println("ERROR de REGISTRAR el dato de PQRSF.");
                }
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de PQRSF.");
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
