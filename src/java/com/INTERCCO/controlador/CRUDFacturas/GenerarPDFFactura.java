package com.INTERCCO.controlador.CRUDFacturas;

import com.INTERCCO.controlador.General.DecoracionPesos;
import com.INTERCCO.modelo.Conexion.ConectaDB;
import com.itextpdf.text.Chunk;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Font;
import com.itextpdf.text.Image;
import com.itextpdf.text.PageSize;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfPCell;
import com.itextpdf.text.pdf.PdfPTable;
import com.itextpdf.text.pdf.PdfWriter;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GenerarPDFFactura {
    private Font fontBoldSize = new Font(Font.FontFamily.COURIER, 11, Font.BOLD);
    private Font fontBold = new Font(Font.FontFamily.COURIER, 7, Font.BOLD);
    private Font fontNormal = new Font(Font.FontFamily.COURIER, 7, Font.NORMAL);
    private Font fontDelete = new Font(Font.FontFamily.COURIER, 7, Font.STRIKETHRU);
    DecoracionPesos dP = new DecoracionPesos();
    private int subtotal = 0;
    private int total = 0;
    
    public void generarFactura(String rutaPDF,
            String direccionSede,
            String ciudadSede,
            String nomSede,
            String rangoSede,
            String numFactura,
            String fechaReg,
            String horaReg,
            String nomMesero,
            String nomCajero,
            String cliente,
            String numMesa,
            int idPedido,
            float iva,
            int importe){
        
        try {
            Document doc = new Document(PageSize.A7, 0, 0, 0, 0);
            PdfWriter.getInstance(doc, new FileOutputStream(rutaPDF));
            doc.open();
            Image img = Image.getInstance("https://i.imgur.com/8XQO0zo.png");
            img.scalePercent(10);
            img.setAlignment(Element.ALIGN_CENTER);
            doc.add(img);
            doc.add(new Paragraph("\n"));
            doc.add(getHeader(direccionSede, ciudadSede, numFactura));
            doc.add(new Paragraph("\n"));
            doc.add(getInfo(fechaReg, horaReg, nomMesero, nomCajero, cliente, numMesa));
            doc.add(new Paragraph("\n"));
            doc.add(getTablaProductos(idPedido));
            doc.add(new Paragraph("\n"));
            doc.add(getContabilidad1(iva, numFactura));
            doc.add(new Paragraph("\n"));
            doc.add(getContabilidad2(importe));
            doc.add(new Paragraph("\n"));
            doc.add(getFooter1());
            doc.add(new Paragraph("\n"));
            doc.add(getFooter2(nomSede, rangoSede));
            doc.close();
            
        } catch (Exception e) {
            System.out.println("Error...");
            System.out.println(e.toString());
        }
    }
    
    public PdfPTable getHeader(String direccionSede,
            String ciudadSede,
            String numeroFactura){
        
        PdfPTable tableHeader = new PdfPTable(1);
        tableHeader.setWidthPercentage(100);
        PdfPCell cell;
        
        // Fila #1
        
        cell = new PdfPCell(new Paragraph(new Chunk("SUCCO S.A.", fontBoldSize)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #2
        
        cell = new PdfPCell(new Paragraph(new Chunk("NIT 202.576.893-2", fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #3
        
        cell = new PdfPCell(new Paragraph(new Chunk(direccionSede.toUpperCase(), fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #4
        
        cell = new PdfPCell(new Paragraph(new Chunk(ciudadSede.toUpperCase(), fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #5
        
        cell = new PdfPCell(new Paragraph(new Chunk("NO. "+numeroFactura, fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fin
        
        return tableHeader;
    }
    public PdfPTable getInfo(String fecha,
            String hora,
            String mesero,
            String cajero,
            String cliente,
            String mesaCliente){

        PdfPTable tableHeader = new PdfPTable(2);
        tableHeader.setWidthPercentage(100);
        PdfPCell cell;
        
        // Fila #1
        
        Chunk c1Fila1d1 = new Chunk("MESERO: ", fontBold), c2Fila1d1 = new Chunk(mesero.toUpperCase(), fontNormal);
        Paragraph pFila1d1 = new Paragraph();
        pFila1d1.add(c1Fila1d1);
        pFila1d1.add(c2Fila1d1);
        cell = new PdfPCell(pFila1d1);
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_LEFT);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        cell = new PdfPCell(new Paragraph(new Chunk(fecha, fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_RIGHT);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #2
        
        Chunk c1Fila2d1 = new Chunk("CAJERO: ", fontBold), c2Fila2d1 = new Chunk(cajero.toUpperCase(), fontNormal);
        Paragraph pFila2d1 = new Paragraph();
        pFila2d1.add(c1Fila2d1);
        pFila2d1.add(c2Fila2d1);
        cell = new PdfPCell(pFila2d1);
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_LEFT);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        cell = new PdfPCell(new Paragraph(new Chunk(hora, fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_RIGHT);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #3
        
        Chunk c1Fila3d1 = new Chunk("CLIENTE: ", fontBold), c2Fila3d1 = new Chunk(cliente.toUpperCase(), fontNormal);
        Paragraph pFila3d1 = new Paragraph();
        pFila3d1.add(c1Fila3d1);
        pFila3d1.add(c2Fila3d1);
        cell = new PdfPCell(pFila3d1);
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_LEFT);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        cell = new PdfPCell(new Paragraph(new Chunk("MESA "+mesaCliente, fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_RIGHT);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fin
        
        return tableHeader;
    }
    public PdfPTable getTablaProductos(int idPedido){
        
        PdfPTable tableHeader = new PdfPTable(4);
        tableHeader.setWidthPercentage(100);
        PdfPCell cell;
        
        // Fila #1
        
        cell = new PdfPCell(new Paragraph(new Chunk("CANTIDAD", fontBold)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float)0.3);
        cell.setBorderWidthBottom((float)0.3);
        cell.setPadding(4);
        tableHeader.addCell(cell);
        
        cell = new PdfPCell(new Paragraph(new Chunk("DESCRIP.", fontBold)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float)0.3);
        cell.setBorderWidthBottom((float)0.3);
        cell.setPadding(4);
        tableHeader.addCell(cell);
        
        cell = new PdfPCell(new Paragraph(new Chunk("PRECIO", fontBold)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float)0.3);
        cell.setBorderWidthBottom((float)0.3);
        cell.setPadding(4);
        tableHeader.addCell(cell);
        
        cell = new PdfPCell(new Paragraph(new Chunk("SUBTOTAL", fontBold)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float)0.3);
        cell.setBorderWidthBottom((float)0.3);
        cell.setPadding(4);
        tableHeader.addCell(cell);
        
        
        try {
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            ResultSet rs;
            PreparedStatement ps2;
            ResultSet rs2;
            PreparedStatement ps3;
            ResultSet rs3;
            
            ps = con.prepareStatement("SELECT * FROM pedidos WHERE idPedidos=?;");
            ps.setInt(1, idPedido);
            rs = ps.executeQuery();
            if (rs.next()){
                ps = con.prepareStatement("SELECT * FROM detalles_pedidos WHERE idPedido=? AND existencia=?;");
                ps.setInt(1, rs.getInt("idPedidos"));
                ps.setString(2, "Y");
                rs = ps.executeQuery();
                while (rs.next()) {
                    ps2 = con.prepareStatement("SELECT * FROM productos WHERE idProductos=?;");
                    ps2.setInt(1, rs.getInt("idProducto"));
                    rs2 = ps2.executeQuery();
                    if (rs2.next()) {
                        ps3 = con.prepareStatement("SELECT * FROM promociones WHERE idProducto=?;");
                        ps3.setInt(1, rs2.getInt("idProductos"));
                        rs3 = ps3.executeQuery();
                        if (rs3.next()) {

                            cell = new PdfPCell(new Paragraph(new Chunk(String.valueOf(rs.getInt("cantidad")), fontNormal)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);

                            cell = new PdfPCell(new Paragraph(new Chunk(rs2.getString("nombre").toUpperCase(), fontNormal)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);

                            cell = new PdfPCell(new Paragraph(new Chunk("$ "+dP.formatNumber(rs2.getInt("precio")), fontDelete)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);
                            
                            cell = new PdfPCell();
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);

                            // Fila Promoción

                            cell = new PdfPCell();
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);

                            cell = new PdfPCell(new Paragraph(new Chunk("DESCUENTO "+rs3.getFloat("porcentaje_promo")+"%", fontNormal)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);

                            float baseDescuento = rs2.getInt("precio") * rs3.getFloat("porcentaje_promo");
                            int precioDescuento = rs2.getInt("precio") - ( ( (int)baseDescuento ) / 100 );
                            cell = new PdfPCell(new Paragraph(new Chunk("$ "+dP.formatNumber(precioDescuento), fontNormal)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);
                            
                            int subtotalDescuento = precioDescuento * rs.getInt("cantidad");
                            subtotal += subtotalDescuento;
                            cell = new PdfPCell(new Paragraph(new Chunk("$ "+dP.formatNumber(subtotalDescuento), fontBold)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);
                            
                        } else {
                            
                            cell = new PdfPCell(new Paragraph(new Chunk(String.valueOf(rs.getInt("cantidad")), fontNormal)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);

                            cell = new PdfPCell(new Paragraph(new Chunk(rs2.getString("nombre").toUpperCase(), fontNormal)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);

                            cell = new PdfPCell(new Paragraph(new Chunk("$ "+dP.formatNumber(rs2.getInt("precio")), fontNormal)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);
                            
                            int subtotalProductos = rs2.getInt("precio") * rs.getInt("cantidad");
                            subtotal += subtotalProductos;
                            cell = new PdfPCell(new Paragraph(new Chunk("$ "+dP.formatNumber(subtotalProductos), fontBold)));
                            cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
                            cell.setBorder(PdfPCell.NO_BORDER);
                            tableHeader.addCell(cell);
                            
                        }
                        ps3.close();
                        rs3.close();
                    }
                    ps2.close();
                    rs2.close();
                }
            }
            
            cdb.cierraConexion();
        
        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL LISTANDO los datos de DETALLES PEDIDOS EN FACTURA.");
            sql.printStackTrace();
        } catch (Exception alle){
            System.out.println("ERROR GENERAL EN GENERAR FACTURA");
        }
        
        // Fin
        
        return tableHeader;
    }
    public PdfPTable getContabilidad1(float iva,
            String idFactura){
        
        PdfPTable tableHeader = new PdfPTable(1);
        tableHeader.setWidthPercentage(100);
        PdfPCell cell;
        
        // Fila #1
        
        Chunk c1Fila1d1 = new Chunk("SUBTOTAL: ", fontBold), c2Fila1d1 = new Chunk("$ "+dP.formatNumber(subtotal), fontNormal);
        Paragraph pFila1d1 = new Paragraph();
        pFila1d1.add(c1Fila1d1);
        pFila1d1.add(c2Fila1d1);
        cell = new PdfPCell(pFila1d1);
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #2
        
        float baseIvaP1 = subtotal * iva;
        int baseIva = (int)baseIvaP1 / 100;
        Chunk c1Fila2d1 = new Chunk("I.V.A al "+iva+"%: ", fontBold), c2Fila2d1 = new Chunk("$ "+dP.formatNumber(baseIva), fontNormal);
        Paragraph pFila2d1 = new Paragraph();
        pFila2d1.add(c1Fila2d1);
        pFila2d1.add(c2Fila2d1);
        cell = new PdfPCell(pFila2d1);
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #3
        
        total = subtotal + baseIva;
        Chunk c1Fila3d1 = new Chunk("TOTAL: ", fontBold), c2Fila3d1 = new Chunk("$ "+dP.formatNumber(total), fontNormal);
        Paragraph pFila3d1 = new Paragraph();
        pFila3d1.add(c1Fila3d1);
        pFila3d1.add(c2Fila3d1);
        cell = new PdfPCell(pFila3d1);
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        try {
            ConectaDB cdb = new ConectaDB();
            Connection con = cdb.conectar();
            PreparedStatement ps;
            
            ps = con.prepareStatement("UPDATE facturas SET total=? WHERE idFacturas=?;");
            ps.setInt(1, total);
            ps.setInt(2, Integer.parseInt(idFactura));
            ps.executeUpdate();
            
            cdb.cierraConexion();
        
        } catch (SQLException sql) {
            System.out.println("ERROR en MySQL ACTUALIZANDO los datos de FACTURAS.");
            sql.printStackTrace();
        } catch (Exception alle){
            System.out.println("ERROR GENERAL EN GENERAR FACTURA");
        }
        
        // Fin
        
        return tableHeader;
    }
    public PdfPTable getContabilidad2(int importe){
        
        PdfPTable tableHeader = new PdfPTable(1);
        tableHeader.setWidthPercentage(100);
        PdfPCell cell;
        
        // Fila #1
        
        Chunk c1Fila1d1 = new Chunk("EFECTIVO: ", fontBold), c2Fila1d1 = new Chunk("$ "+dP.formatNumber(importe), fontNormal);
        Paragraph pFila1d1 = new Paragraph();
        pFila1d1.add(c1Fila1d1);
        pFila1d1.add(c2Fila1d1);
        cell = new PdfPCell(pFila1d1);
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #2
        
        int cambio = importe - total;
        Chunk c1Fila2d1 = new Chunk("CAMBIO: ", fontBold), c2Fila2d1 = new Chunk("$ "+dP.formatNumber(cambio), fontNormal);
        Paragraph pFila2d1 = new Paragraph();
        pFila2d1.add(c1Fila2d1);
        pFila2d1.add(c2Fila2d1);
        cell = new PdfPCell(pFila2d1);
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fin
        
        return tableHeader;
    }
    public PdfPTable getFooter1(){
        
        PdfPTable tableHeader = new PdfPTable(1);
        tableHeader.setWidthPercentage(100);
        PdfPCell cell;
        
        // Fila #1
        
        cell = new PdfPCell(new Paragraph(new Chunk("~ GRACIAS POR SU VISITA ~", fontBold)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        cell.setBorderWidthTop((float)0.3);
        cell.setBorderWidthBottom((float)0.3);
        cell.setPadding(4);
        tableHeader.addCell(cell);
        
        // Fin
        
        return tableHeader;
    }
    public PdfPTable getFooter2(String nombreSede,
            String rango){
        
        PdfPTable tableHeader = new PdfPTable(1);
        tableHeader.setWidthPercentage(100);
        PdfPCell cell;
        
        // Fila #1
        
        cell = new PdfPCell(new Paragraph(new Chunk("SEDE "+rango.toUpperCase()+" "+nombreSede.toUpperCase(), fontBold)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #2
        
        cell = new PdfPCell(new Paragraph(new Chunk("contacto.succo@gmail.com", fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fila #3
        
        cell = new PdfPCell(new Paragraph(new Chunk("www.succo.com", fontNormal)));
        cell.setHorizontalAlignment((int)PdfPCell.ALIGN_CENTER);
        cell.setBorder(PdfPCell.NO_BORDER);
        tableHeader.addCell(cell);
        
        // Fin
        
        return tableHeader;
    }
    
}
