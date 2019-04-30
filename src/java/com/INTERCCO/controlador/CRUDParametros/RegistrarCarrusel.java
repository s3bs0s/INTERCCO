package com.INTERCCO.controlador.CRUDParametros;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
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
                 maxFileSize=1024*1024*4,       // 4MB Maximo para un archivo
                 maxRequestSize=1024*1024*4)    // 4MB Maximo para la solicitud de archivos
public class RegistrarCarrusel extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String tipo = request.getParameter("regTipoCarrusel");
            String dirigidoAEmpresarial = request.getParameter("regDirigidoAEmpresarialCarrusel");
            String dirigidoAPublico = request.getParameter("regDirigidoAPublicoCarrusel");
            Part img = request.getPart("regArchivoCarrusel");
            
            HttpSession session = request.getSession();
            String nomSedeUsuario = (String) session.getAttribute("nomSedeUsuario");
            int idSedeUsuario = (int) session.getAttribute("idSedeUsuario");
            
            String SAVE_DIR = "ArchivosSistema" + File.separator + "Carruseles" + File.separator + nomSedeUsuario;
            String appPath = request.getServletContext().getRealPath("");
            String savePath = appPath + SAVE_DIR;
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            CifradoASCII cA = new CifradoASCII();
            Date date = new Date();
            DateFormat hourFormat = new SimpleDateFormat("hhmmss");
            DateFormat dateFormat = new SimpleDateFormat("ddMMyyyy");
            String code = "f"+dateFormat.format(date)+"h"+hourFormat.format(date);
            
            File fileSaveDir = new File(savePath);
            if (!fileSaveDir.exists()) {
                fileSaveDir.mkdir();
            }

            String fileName = "";
            String contentDisp = img.getHeader("content-disposition");
            String[] items = contentDisp.split(";");
            for (String s : items) {
                if (s.trim().startsWith("filename")) {
                    fileName = s.substring(s.indexOf("=") + 2, s.length()-1);
                }
            }
            fileName = new File(fileName).getName();
            
            File f1 = new File(savePath + File.separator + fileName);
            int e = fileName.lastIndexOf('.');
            String extension = fileName.substring(e+1);
            File f2 = new File(savePath + File.separator + code + "." + extension);
            
            ps = con.prepareStatement("INSERT INTO carruseles (idSede,tipo,dirigido_a,nombre_img,existencia) VALUES (?,?,?,?,?);");
            ps.setInt(1, idSedeUsuario);
            ps.setString(2, tipo);
            if (tipo.equals("Empresarial")){
                ps.setString(3, dirigidoAEmpresarial);
            } else {
                ps.setString(3, dirigidoAPublico);
            }
            ps.setString(4, cA.CifrarASCII(code + "." + extension));
            ps.setString(5, "Y");
            int res = ps.executeUpdate();

            if (res > 0){
                img.write(savePath + File.separator + fileName);
            
                f1.renameTo(f2);
                request.getRequestDispatcher("Parametros?mensaje=YCarrusel").forward(request, response);
            } else {
                request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=El carrusel&accMod=registrar").forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de CARRUSEL.");
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Parametros?mensaje=Ne&nomMod=El carrusel&accMod=registrar").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de CARRUSELES.");
            sql.getStackTrace();
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
