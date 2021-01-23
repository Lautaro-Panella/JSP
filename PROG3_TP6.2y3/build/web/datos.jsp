<%-- 
    Document   : datos
    Created on : 15/10/2020, 19:48:03
    Author     : hp
--%>

<%@page import="com.sun.javafx.scene.control.skin.VirtualFlow.ArrayLinkedList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Controlador.PersonaGestor"%>
<%@page import="Modelo.Persona"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>DATOS</title>
    </head>
    <body>
        <%
            PersonaGestor pg = new PersonaGestor();
            List<Persona> personas = pg.dameListaPersonas();
        %>
        <h2>Registro de personas:</h2>
        <table border="1" style="width: 50%; height: 5%; text-align: center">
            <%
                out.println("<tr>");
                out.println("<td>"+"DNI"+"</td>");
                out.println("<td>"+"NOMBRE"+"</td>");
                out.println("<td>"+"DOMICILIO"+"</td>");
                out.println("</tr>");
                for (Persona p : personas) {
                    out.println("<tr>");
                    out.println("<td>"+p.getDni()+"</td>");
                    out.println("<td>"+p.getNombre()+"</td>");
                    out.println("<td>"+p.getDomicilio()+"</td>");
                    out.println("</tr>");
                }
            %>
        </table>
    </body>
</html>
