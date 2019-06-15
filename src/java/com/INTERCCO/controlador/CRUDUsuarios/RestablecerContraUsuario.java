package com.INTERCCO.controlador.CRUDUsuarios;

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
import java.util.Random;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
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

public class RestablecerContraUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            final String usuarioEmailSUCCO = "contacto.succo@gmail.com";
            final String passEmailSUCCO = "succo12345";
            String subject = "¡Código para Recuperar Contraseña!";
            
            String emailUsu = request.getParameter("recupEmailUsuario");
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            EstructuraFYH eFYH = new EstructuraFYH();
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            String hoy = dateFormat.format(date);
            
            ps = con.prepareStatement("SELECT * FROM usuarios WHERE email=? AND existencia=?;");
            ps.setString(1, cA.CifrarASCII(emailUsu));
            ps.setString(2, "Y");
            rs = ps.executeQuery();

            if (rs.next()){
                String nomUsuario = rs.getString("nombres");
                String verificacion = rs.getString("verificado");
                
                if (verificacion.equals("N")){
                    request.getRequestDispatcher("index?mensaje=NeERC&emailUsu="+emailUsu).forward(request, response);
                    System.out.println("ERROR en MySQL ENVIANDO CODIGO los datos de USUARIO.");
                } else {
                    Random num = new Random();
                    String codigo = "RC"+String.valueOf(1+num.nextInt(999999999));

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
                    textHtml.setContent("<div style=\"font-family:Arial; width:90%; margin:auto; padding:10px; background:#C1D0E7; \"><div style=\"width:100%; \"><div style=\"width:100%; padding:12px 0; background:#446EB6; \"><a target=\"_blank\" href=\"https://www.google.com/\" style=\"width:20%; display:inline-block; margin-left:30px; \"><img alt=\"FSUCCO\" style=\"width:100%; \" src=\"https://i.imgur.com/u2GoMPN.png\"></a></div><div style=\"width:92%; padding:18px 4%; background:#fff; \"><div style=\"display:flex; \"><p style=\"display:inline-block; padding-left:10px; width:70%; font-size:23px; color:#446EB6; \">Señor(a) "+nomUsuario+",</p><p style=\"display:inline-block; text-align:right; padding-right:25px; width:70%; font-size:16px; \">Día "+eFYH.estFecha(hoy, "dd")+" del mes "+eFYH.estFecha(hoy, "mm")+" de "+eFYH.estFecha(hoy, "aa")+"</p></div><div style=\"font-size:17px; \"><p style=\"text-align:justify; margin-bottom:5px; \">Su código de recuperación es:</p><p style=\" padding-left:10px; display:inline-block; font-size:20px; color:#446EB6; \">"+codigo+"</p></div><div style=\"margin-top:40px; \"><p style=\"font-size:18px; \">Gracias por la atención prestada, feliz día.</p></div></div><div style=\"width:100%; padding:15px 0; background:#446EB6; \"><div style=\"width:100%; text-align:center; \"><p style=\"color:#fff; font-size:19px; margin:0; letter-spacing:1pt; \">tel. 01 8055 44 69 22</p><p style=\"color:#fff; font-size:19px; margin:0; text-decoration:none; letter-spacing:1pt; \">contacto.succo@gmail.com</p><a target=\"_blank\" style=\"color:#fff; font-size:19px; letter-spacing:1pt; text-decoration:none; \" href=\"https://www.google.com/\">www.succo.com.co</a></div><div style=\"width:100%; padding:10px 0; margin-top:12px; display:flex; \"><div style=\"width:25%; \"></div><div style=\"width:50%; display:flex; \"><a target=\"_blank\" style=\"width:50%; text-align:center; \" href=\"https://www.facebook.com/\"><img alt=\"Facebook\" style=\"width:50%; \" src=\"https://i.imgur.com/1Y79eZu.png\"></a><a target=\"_blank\" style=\"width:50%; text-align:center; \" href=\"https://www.instagram.com/\"><img alt=\"Instagram\" style=\"width:50%; \" src=\"https://i.imgur.com/m7Ruie1.png\"></a><a target=\"_blank\" style=\"width:50%; text-align:center; \" href=\"https://www.twitter.com/\"><img alt=\"Twitter\" style=\"width:50%; \" src=\"https://i.imgur.com/aeXEkNV.png\"></a><a target=\"_blank\" style=\"width:50%; text-align:center; \" href=\"https://plus.google.com/discover\"><img alt=\"Google Plus\" style=\"width:50%; \" src=\"https://i.imgur.com/0uNWCEw.png\"></a></div><div style=\"width:25%; \"></div></div><div style=\"width:100%; text-align:center; margin-top:12px; \"><p style=\"margin:0; color:#fff; letter-spacing:1pt; \">&copy; 2004-2019 National Restaurant SUCCO.</p></div></div></div></div>","text/html");
                    MimeMultipart multiPart = new MimeMultipart();
                    multiPart.addBodyPart(textHtml);

                    Message message = new MimeMessage(sessionM);
                    message.setFrom(new InternetAddress(usuarioEmailSUCCO));
                    message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(emailUsu));
                    message.setSubject(subject);
                    message.setContent(multiPart);
                    Transport.send(message);

                    String codigoCifrado = cA.CifrarASCII(codigo);
                    String emailCifrado = cA.CifrarASCII(emailUsu);
                    request.getRequestDispatcher("codigo-recuperarContra.jsp?codigo="+codigoCifrado+"&emailU="+emailCifrado).forward(request, response);
                }
            } else {
                request.getRequestDispatcher("index?mensaje=NeEmail&emailUsu="+emailUsu).forward(request, response);
                System.out.println("ERROR en MySQL ENVIANDO CODIGO los datos de USUARIO.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ENVIANDO CODIGO los datos de USUARIOS.");
            sql.getStackTrace();
        } catch (MessagingException e) {
            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL ENVIANDO CORREO A EL USUARIO los datos de USUARIOS.");
            e.getStackTrace();
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
