<%-- 
    Document   : index
    Created on : 15/10/2020, 18:09:01
    Author     : hp
--%>

<%@page import="Controlador.PersonaGestor"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>FORMULARIO</title>
    </head>
    <body>
        <form method="post">
            <h1>Ingrese sus datos personales:</h1>
            DNI:<input type="number" name="dni" id="dni"/><br>
            NOMBRE:<input type="text" name="nombre" id="nombre"/><br>
            DOMICILIO:<input type="text" name="domicilio" id="domicilio"/><br>
            <button type="submit">CARGAR</button><br>    
        </form>
        <form action="datos.jsp" method="post">
            <button>MOSTRAR PERSONAS</button>
        </form>
        <%
            String alerta = "";
            PersonaGestor pg = new PersonaGestor();
            try {
                if (request.getParameter("dni") != null && request.getParameter("nombre") != null && request.getParameter("domicilio") != null) {
                    int dni = Integer.parseInt(request.getParameter("dni"));
                    String nombre = request.getParameter("nombre");
                    String domicilio = request.getParameter("domicilio");  
                    pg.insertarPersona(dni, nombre, domicilio);
                    alerta = "";
                }
            } 
            catch (Exception e) {
                e.printStackTrace();   
                alerta = "Los datos no son válidos!";
            }
            out.println(alerta);
        %>
    </body>
</html>
