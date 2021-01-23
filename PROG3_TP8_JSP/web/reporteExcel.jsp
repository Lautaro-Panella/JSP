<%@page import="Modelo.ObjetoReporte"%>
<%@page import="Controlador.GestorDatos"%>
<%@page import="java.util.List"%>
<%@page import="Modelo.ObjetoReporte"%>
<%@page import="Controlador.GestorDatos"%>
<%@page import="org.apache.poi.ss.usermodel.IndexedColors"%>
<%@page import="java.io.OutputStream"%>
<%@page import="java.io.ByteArrayOutputStream"%>
<%@page import="org.apache.poi.xssf.streaming.SXSSFCell"%>
<%@page import="org.apache.poi.xssf.streaming.SXSSFRow"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFCellStyle"%>
<%@page import="org.apache.poi.xssf.usermodel.XSSFFont"%>
<%@page import="org.apache.poi.xssf.streaming.SXSSFSheet"%>
<%@page import="org.apache.poi.xssf.streaming.SXSSFWorkbook"%>
<%@page import="org.apache.poi.ss.usermodel.FillPatternType"%>

<%
    String pais = request.getParameter("pais");
    String region = request.getParameter("region");
    GestorDatos gd = new GestorDatos();
    List<ObjetoReporte> objetos = gd.dameObjetosReporte(pais, region);
    
    // Se crea un nuevo libro de Excel.
    SXSSFWorkbook libro = new SXSSFWorkbook(50);
    // Estilos:
    XSSFFont font = (XSSFFont) libro.createFont();
    font.setBold(true);
    XSSFCellStyle style = (XSSFCellStyle) libro.createCellStyle();
    style.setFont(font);
    XSSFCellStyle styleGris = (XSSFCellStyle) libro.createCellStyle();
    styleGris.setFont(font);
    styleGris.setFillForegroundColor(IndexedColors.GREY_25_PERCENT.index);
    styleGris.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    // Amarillo.
    XSSFCellStyle styleAmarillo = (XSSFCellStyle) libro.createCellStyle();
    styleAmarillo.setFont(font);
    styleAmarillo.setFillForegroundColor(IndexedColors.LIGHT_YELLOW.index);
    styleAmarillo.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    // Verde.
    XSSFCellStyle styleGreen = (XSSFCellStyle) libro.createCellStyle();
    styleGreen.setFont(font);
    styleGreen.setFillForegroundColor(IndexedColors.SEA_GREEN.index);
    styleGreen.setFillPattern(FillPatternType.SOLID_FOREGROUND);
    // Se crea una nueva hoja en el libro de Excel.
    SXSSFSheet hoja = libro.createSheet();

    int nroColumna = 0;
    // Se crea una nueva fila.
    SXSSFRow row = hoja.createRow(0);
    // Se crea una nueva celda dentro de la fila.
    SXSSFCell cell = row.createCell(nroColumna);
    cell.setCellValue("Ciudad");
    cell.setCellStyle(styleGris);
    cell = row.createCell(++nroColumna);
    cell.setCellValue("Población");
    cell.setCellStyle(styleGris);
    cell = row.createCell(++nroColumna);
    cell.setCellValue("País");
    cell.setCellStyle(styleGris);
    cell = row.createCell(++nroColumna);
    cell.setCellValue("Región");
    cell.setCellStyle(styleGris);

    int nroFila = 1;
    nroColumna = 0;

    for (ObjetoReporte or : objetos) {
        nroColumna = 0;
        row = hoja.createRow(nroFila);
        ++nroFila;            
        cell = row.createCell(nroColumna);
        if (or.getPoblacion() > 5000000) {

        cell.setCellValue(or.getCiudad());
        cell.setCellStyle(styleAmarillo);
        cell = row.createCell(++nroColumna);           
        cell.setCellValue(or.getPoblacion());
        cell.setCellStyle(styleAmarillo);
        cell = row.createCell(++nroColumna);            
        cell.setCellValue(or.getPais());
        cell.setCellStyle(styleAmarillo);
        cell = row.createCell(++nroColumna);
        cell.setCellValue(or.getRegion());
        cell.setCellStyle(styleAmarillo);

        } else if (or.getPoblacion() < 100000) {
        cell.setCellValue(or.getCiudad());
        cell.setCellStyle(styleGreen);
        cell = row.createCell(++nroColumna);           
        cell.setCellValue(or.getPoblacion());
        cell.setCellStyle(styleGreen);
        cell = row.createCell(++nroColumna);            
        cell.setCellValue(or.getPais());
        cell.setCellStyle(styleGreen);
        cell = row.createCell(++nroColumna);
        cell.setCellValue(or.getRegion());
        cell.setCellStyle(styleGreen);
        } else {
        cell.setCellValue(or.getCiudad());
        cell = row.createCell(++nroColumna);
        cell.setCellValue(or.getPoblacion());
        cell = row.createCell(++nroColumna);
        cell.setCellValue(or.getPais());
        cell = row.createCell(++nroColumna);
        cell.setCellValue(or.getRegion());
        }
    }

    // Se salva el libro.
    ByteArrayOutputStream outByteStream = new ByteArrayOutputStream();
    libro.write(outByteStream);
    byte[] outArray = outByteStream.toByteArray();
    response.setContentType("application/ms-excel");
    response.setContentLength(outArray.length);
    response.setHeader("Expires:", "0"); // eliminates browser caching
    response.setHeader("Content-Disposition", "attachment; filename=Paises.xls");
    OutputStream outStream = response.getOutputStream();
    outStream.write(outArray);
    outStream.flush();
%>
