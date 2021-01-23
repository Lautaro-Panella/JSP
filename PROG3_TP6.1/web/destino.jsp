<%-- 
    Document   : destino
    Created on : 15/10/2020, 16:28:09
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PÁGINA 2</title>
    </head>
    <body>
        <%
            int nroFilas = 0;
            int nroColumnas = 0;
            String alerta = "";
            try {
                if (request.getParameter("filas") != null && request.getParameter("columnas") != null) {
                    nroFilas = Integer.parseInt(request.getParameter("filas"));
                    nroColumnas = Integer.parseInt(request.getParameter("columnas"));    
                }
            } 
            catch (Exception e) {
                e.printStackTrace();
                alerta = "Ingrese cantidad de filas y columnas!";
            }
            out.println(alerta);
        %>
        <table border="1">
            <%
                for (int i = 0; i < nroFilas; i++) {
                    out.println("<tr>");
                    for (int j = 0; j < nroColumnas; j++) {
                        out.println("<td>CELDA: "+(i+1)+" "+(j+1)+"</td>");
                    }
                    out.println("</tr>");
                }
            %>
        </table>
    </body>
</html>
