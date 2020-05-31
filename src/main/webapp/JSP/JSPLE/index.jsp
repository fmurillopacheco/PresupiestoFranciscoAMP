<%-- 
    Document   : index
    Created on : 25-may-2020, 19:56:58
    Author     : Francisco_Antonio
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../CSS/presupuestoStyle.css"/>
        <%@include file="../../INC/metas.inc" %>
        <title>Gestor&iacute;a de Seguros NORMAS - Lenguaje de Expresiones v1.</title>

    </head>
    <body>
        <%@include file="../../INC/cabecera.inc" %>
        <div id="principal">
            <h1>Elija su seguro de confianza</h1>
            <form action="../../eleccion" method="post">
                <p>Por favor, elija que desea asegurar (marque uno sólo o los dos en las casillas)</p>
                <br>
                <p>¿Qué tipo de seguro desea?</p>
                <input type="checkbox" name="edificio" value="edificio" id="edificio" checked/>Seguro de edificios
                <br>
                <input type="checkbox" name="contenido" value="contenido" id="contenido" checked/>Seguro de contenido
                <br><br>
                <input type="hidden" name="jsp" value="jsple"/>
                <button type="submit" name="enviar" value="Enviar"/>Enviar
                
                 <button id="botonMenu" type="submit" name="menu" value="Menu"><a id="enlaceMenu" href="<c:url value = "/index.html" />">Versiones</a> </button>
            </form>
        </div>

        <%@include file="../../INC/piePagina.inc"%>
    </body>
</html>
