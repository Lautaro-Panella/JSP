<%-- 
    Document   : index
    Created on : 11/11/2020, 01:21:34
    Author     : hp
--%>

<%@page import="Controlador.GestorDatos"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DATOS</title>
    </head>
    <body>
        <form action="index.jsp">
            <b>Ingrese país y región:</b><br>
            <input type="text" name="pais" id="pais" placeholder="Pais"/><br>
            <select name="region" id="region">
                <%
                    GestorDatos gd = new GestorDatos();
                    for (String region : gd.dameRegiones()) {
                        out.print("<option>"+region+"</option>");  
                    }
                %>
            </select><br>
            <button type="submit" formaction="reportePDF.jsp">Crear PDF</button>
            <button type="submit" formaction="reporteExcel.jsp">Crear Excel</button>
        </form>   
    </body>
</html>
