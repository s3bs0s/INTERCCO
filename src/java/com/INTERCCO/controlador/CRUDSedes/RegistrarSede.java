package com.INTERCCO.controlador.CRUDSedes;

import com.INTERCCO.controlador.General.CifradoASCII;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class RegistrarSede extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        try {
            String nomSede = request.getParameter("regNombreSedes");
            String rango = request.getParameter("regRangoSedes");
            String ciudad = request.getParameter("regCiudadSedes");
            String direccion = request.getParameter("regDireccionSedes");
            int numMesas = Integer.parseInt(request.getParameter("regMesasSedes"));
            String mapaSrc = request.getParameter("regSrcSedes");
            int numeroHorarios = Integer.parseInt(request.getParameter("regNumInpSedes"));
            String diasHorario = "";
            String horasHorario = "";
            
            for (int i = 1; i <= numeroHorarios; i++) {
                String dH = request.getParameter("regDias"+i+"Sedes");
                dH = dH.replace("Æ", "");
                dH = dH.replace("Ø", "");
                dH = dH.replace(";", "");
                diasHorario += dH + ";";
                String hH = request.getParameter("regHoras"+i+"Sedes");
                hH = hH.replace("Æ", "");
                hH = hH.replace("Ø", "");
                hH = hH.replace(";", "");
                horasHorario += hH + ";";
            }
            diasHorario = diasHorario.substring(0, diasHorario.length() - 1);
            horasHorario = horasHorario.substring(0, horasHorario.length() - 1);
            
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            CifradoASCII cA = new CifradoASCII();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            
            if (numeroHorarios < 1){
                request.getRequestDispatcher("Sedes?mensaje=Ne").forward(request, response);
                System.out.println("ERROR de REGISTRAR el dato de SEDE.");
            } else {
                ps = con.prepareStatement("SELECT * FROM sedes WHERE nombre=?;");
                ps.setString(1, nomSede);
                rs = ps.executeQuery();

                if (rs.next()){
                    request.getRequestDispatcher("Sedes?mensaje=NeSed&nomSed="+nomSede).forward(request, response);
                    System.out.println("ERROR de REGISTRAR el dato de SEDE.");
                } else {
                    if (rango.equals("Principal")){
                        ps.close();
                        rs.close();
                        ps = con.prepareStatement("SELECT * FROM sedes WHERE rango=? AND idCiudad=?;");
                        ps.setString(1, "Principal");
                        ps.setInt(2, Integer.parseInt(ciudad));
                        rs = ps.executeQuery();

                        if (rs.next()){
                            String nomCiudad = "Vacio";

                            ps2 = con.prepareStatement("SELECT nombre FROM ciudades WHERE idCiudades=?;");
                            ps2.setInt(1, Integer.parseInt(ciudad));
                            rs2 = ps2.executeQuery();
                            if (rs2.next()){
                                nomCiudad = rs2.getString("nombre");
                            }
                            ps2.close();
                            rs2.close();

                            request.getRequestDispatcher("Sedes?mensaje=NeSedP&nomCiu="+nomCiudad).forward(request, response);
                            System.out.println("ERROR de REGISTRAR el dato de SEDE.");
                        } else {
                            ps.close();
                            ps = con.prepareStatement("INSERT INTO sedes (nombre,rango,direccion,num_mesas,src_mapa,dias_horario,horas_horario,idCiudad) VALUES (?,?,?,?,?,?,?,?);");
                            ps.setString(1, nomSede);
                            ps.setString(2, "Principal");
                            ps.setString(3, direccion);
                            if (numMesas < 1){
                                ps.setInt(4, 1);
                            } else {
                                ps.setInt(4, numMesas);
                            }
                            String mapaSCifrada = cA.CifrarASCII(mapaSrc);
                            ps.setString(5, mapaSCifrada);
                            String diasHCifrada = cA.CifrarASCII(diasHorario);
                            ps.setString(6, diasHCifrada);
                            String horasHCifrada = cA.CifrarASCII(horasHorario);
                            ps.setString(7, horasHCifrada);
                            ps.setInt(8, Integer.parseInt(ciudad));
                            int res = ps.executeUpdate();

                            if (res > 0){
                                request.getRequestDispatcher("Sedes?mensaje=YP&nomSed="+nomSede).forward(request, response);
                            } else {
                                request.getRequestDispatcher("Sedes?mensaje=Ne").forward(request, response);
                                System.out.println("ERROR de REGISTRAR el dato de SEDE.");
                            }
                        }
                    } else {
                        ps.close();
                        ps = con.prepareStatement("INSERT INTO sedes (nombre,rango,direccion,num_mesas,src_mapa,dias_horario,horas_horario,idCiudad) VALUES (?,?,?,?,?,?,?,?);");
                        ps.setString(1, nomSede);
                        ps.setString(2, "Secundaria");
                        ps.setString(3, direccion);
                        if (numMesas < 1){
                                ps.setInt(4, 1);
                            } else {
                                ps.setInt(4, numMesas);
                            }
                        String mapaSCifrada = cA.CifrarASCII(mapaSrc);
                        ps.setString(5, mapaSCifrada);
                        String diasHCifrada = cA.CifrarASCII(diasHorario);
                        ps.setString(6, diasHCifrada);
                        String horasHCifrada = cA.CifrarASCII(horasHorario);
                        ps.setString(7, horasHCifrada);
                        ps.setInt(8, Integer.parseInt(ciudad));
                        int res = ps.executeUpdate();

                        if (res > 0){
                            request.getRequestDispatcher("Sedes?mensaje=YS&nomSed="+nomSede).forward(request, response);
                        } else {
                            request.getRequestDispatcher("Sedes?mensaje=Ne").forward(request, response);
                            System.out.println("ERROR de REGISTRAR el dato de SEDE.");
                        }
                    }
                }
            }
            cdb.cierraConexion();
            
        } catch (SQLException sql) {
            request.getRequestDispatcher("Sedes?mensaje=Ne").forward(request, response);
            System.out.println("ERROR en MySQL REGISTRANDO los datos de SEDES.");
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
