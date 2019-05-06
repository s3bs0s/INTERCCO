package com.INTERCCO.controlador.CRUDUsuarios;

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
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig(fileSizeThreshold=1024*1024*1, // 1MB Minimo para escribir directo al disco
                 maxFileSize=1024*1024*6,       // 6MB Maximo para un archivo
                 maxRequestSize=1024*1024*6)    // 6MB Maximo para la solicitud de archivos
public class ActualizarImagenUsuario extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String idUsu = request.getParameter("perfilIDUsuario");
            Part img = request.getPart("perfilArchivoUsuario");
            
            HttpSession session = request.getSession();
            String nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario");
            
            String SAVE_DIR = "ArchivosSistema" + File.separator + "Usuarios" + File.separator + nomSedeUsuario;
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + SAVE_DIR;
            
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat hourFormat = new SimpleDateFormat("hhmmss");
            DateFormat dateFormat = new SimpleDateFormat("ddMMyyyy");
            String code = "f"+dateFormat.format(date)+"h"+hourFormat.format(date);

            String fileName = "";
            String contentDisp = img.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                if (s.trim().startsWith("filename")) {
                    fileName = s.substring(s.indexOf("=") + 2, s.length()-1);
                }
            }
            fileName = new File(fileName).getName();
            img.write(savePath + File.separator + fileName);
            
            ps = con.prepareStatement("SELECT * FROM info_usuarios WHERE idUsuario=?;");
            ps.setInt(1, Integer.parseInt(idUsu));
            rs = ps.executeQuery();

            if (rs.next()){
                String nomImg = cA.DescifrarASCII(rs.getString("nombre_img"));
                
                if (nomImg.equals("Vacio")){
                    File f1 = new File(savePath + File.separator + fileName);
                    int e = fileName.lastIndexOf('.');
                    String extensionActual = fileName.substring(e+1);

                    File f2 = new File(savePath + File.separator + code + "." + extensionActual);
                    
                    f1.renameTo(f2);
                    
                    ps.close();
                    ps = con.prepareStatement("UPDATE info_usuarios SET nombre_img=? WHERE idUsuario=?;");
                    ps.setString(1, cA.CifrarASCII(code + "." + extensionActual));
                    ps.setInt(2, Integer.parseInt(idUsu));
                    int res = ps.executeUpdate();

                    if (res > 0){
                        request.getRequestDispatcher("Salir?mensaje=YCambioN").forward(request, response);
                    } else {
                        request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                        System.out.println("ERROR de CAMBIAR IMG el dato de USUARIO.");
                    }
                } else {
                    File f1 = new File(savePath + File.separator + fileName);
                    int e = fileName.lastIndexOf('.');
                    String extensionActual = fileName.substring(e+1);

                    String nombreViejo = nomImg.substring(0, nomImg.length() - 4);
                    File f2 = new File(savePath + File.separator + nombreViejo + "." + extensionActual);
                    
                    File imgG = new File(savePath + File.separator + nomImg);
                    if (imgG.exists()) {
                        imgG.delete();
                    }
                    
                    f1.renameTo(f2);
                    
                    ps.close();
                    ps = con.prepareStatement("UPDATE info_usuarios SET nombre_img=? WHERE idUsuario=?;");
                    ps.setString(1, cA.CifrarASCII(nombreViejo + "." + extensionActual));
                    ps.setInt(2, Integer.parseInt(idUsu));
                    int res = ps.executeUpdate();

                    if (res > 0){
                        request.getRequestDispatcher("Salir?mensaje=YCambio").forward(request, response);
                    } else {
                        request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                        System.out.println("ERROR de CAMBIAR IMG el dato de USUARIO.");
                    }
                }
            } else {
                request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de CAMBIAR IMG el dato de USUARIO.");
            }
            
            cdb.cierraConexion();
            
        }catch (SQLException sql) {
            request.getRequestDispatcher("index?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL CAMBIANDO IMG los datos de USUARIOS.");
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
