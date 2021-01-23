<%@page import="java.util.List"%>
<%@page import="Modelo.ObjetoReporte"%>
<%@page import="Controlador.GestorDatos"%>
<%@page import="com.lowagie.text.Rectangle"%>
<%@page import="com.lowagie.text.PageSize"%>
<%@page import="com.lowagie.text.pdf.PdfPTable"%>
<%@page import="com.lowagie.text.pdf.PdfPCell"%>
<%@page import="com.lowagie.text.Font"%>
<%@page import="com.lowagie.text.Phrase"%>
<%@page import="java.io.IOException"%>
<%@page import="com.lowagie.text.DocumentException"%>
<%@page import="java.util.Date"%>
<%@page import="com.lowagie.text.Paragraph"%>
<%@page import="com.lowagie.text.pdf.PdfWriter"%>
<%@page import="com.lowagie.text.Document"%>

<%
    String pais = request.getParameter("pais");
    String region = request.getParameter("region");
    GestorDatos gd = new GestorDatos();
    List<ObjetoReporte> objetos = gd.dameObjetosReporte(pais, region);
    
    response.setContentType("application/pdf");
    
    // Estilos:
    Font titulo = new Font(Font.COURIER, 14, Font.BOLD);
    Font textoBold = new Font(Font.COURIER, 11, Font.BOLD);
    Font texto = new Font(Font.COURIER, 11, Font.NORMAL);
    
    // Se crea un nuevo documento PDF.
    Document document = new Document(PageSize.A4, 30, 30, 50, 30);
    //metadata
    document.addTitle("PROG 3");
    document.addSubject("UTN");
    document.addKeywords("Ejemplo");
    document.addAuthor("UTN");
    document.addCreator("UTN");

    PdfWriter.getInstance(document, response.getOutputStream());
    // Se abre el documento.
    document.open();
    
    // Se crea una tabla de 4 columnas.
    PdfPTable table = new PdfPTable(4);
    // Se configura para ocupar el 100% de la página.
    table.setWidthPercentage(100);
    
    // Se crea la primer fila o cabecera de la tabla.
    PdfPCell celdaIzq = new PdfPCell(new Phrase("Ciudad", textoBold));
    celdaIzq.setBorder(Rectangle.BOX);
    PdfPCell celdaCentroIzq = new PdfPCell(new Phrase("Población", textoBold));
    celdaCentroIzq.setBorder(Rectangle.BOX);
    PdfPCell celdaCentroDer = new PdfPCell(new Phrase("País", textoBold));
    celdaCentroDer.setBorder(Rectangle.BOX);
    PdfPCell celdaDer = new PdfPCell(new Phrase("Región", textoBold));
    celdaDer.setBorder(Rectangle.BOX);
    table.addCell(celdaIzq);
    table.addCell(celdaCentroIzq);
    table.addCell(celdaCentroDer);
    table.addCell(celdaDer);
    
    // Se crean las celdas para completar la tabla.
    for (ObjetoReporte or : objetos) {
        celdaIzq = new PdfPCell(new Phrase(or.getCiudad(), texto));
        celdaIzq.setBorder(Rectangle.BOX);
        celdaCentroIzq = new PdfPCell(new Phrase(String.valueOf(or.getPoblacion()), texto));
        celdaCentroIzq.setBorder(Rectangle.BOX);
        celdaCentroDer = new PdfPCell(new Phrase(or.getPais(), texto));
        celdaCentroDer.setBorder(Rectangle.BOX);
        celdaDer = new PdfPCell(new Phrase(or.getRegion(), texto));
        celdaDer.setBorder(Rectangle.BOX);
        table.addCell(celdaIzq);
        table.addCell(celdaCentroIzq);
        table.addCell(celdaCentroDer);
        table.addCell(celdaDer);
    }
    
    // Se agrega la tabla al documento.
    document.add(table);
   
    // Se cierra el documento.
    document.close();
%>
    