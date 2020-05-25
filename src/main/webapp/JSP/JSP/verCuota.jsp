<%-- 
    Document   : verCuota
    Created on : 25-may-2020, 19:57:20
    Author     : Francisco_Antonio
--%>

<%@page import="es.albarregas.beans.Contenidos"%>
<%@page import="es.albarregas.beans.Edificios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../CSS/presupuestoStyle.css"/>
        <%@include file = "../../INC/metas.inc" %>
        <title>Gestor&iacute;a de Seguros NORMAS - Cuota.</title>
    </head>

        <%

        HttpSession sesion = request.getSession();
        Edificios edificio = (Edificios) sesion.getAttribute("edificio");
        Contenidos contenido = (Contenidos) request.getAttribute("contenido");
        String mh;
        String siOno; 
        String franquicia; 
        double total = 0; 
    %>
    <body>
        <%@include file = "../../INC/cabecera.inc" %>
        <div id="principal">
            <%
                if (edificio != null) {
                    total = total + edificio.getPrima();
            %>
            <h1>Seguro de edificio</h1>
            <%-- A TODAS VISTAS ESTO ES <ul><li>...</li></ul> --%>
            <p>- Tipo de edificio: <%=edificio.getTipo()%></p>
            <p>- Número de habitaciones: <%=edificio.getHabitaciones()%></p>
            <p>- Fecha de construcción: <%=edificio.getFecha()%></p>
            <%
                if (edificio.getFecha().startsWith("mad")) {
                    mh = "Madera";
                } else {
                    mh = "Hormigón";
                }

            %>
            <p>- Tipo de construcción: <%=mh%></p>
            <p>- Valor estimado del mercado: <%=edificio.getValor()%>€</p>
            <%
                if (contenido != null) {
            %>
            <p><small>(Total del seguro del edificio: <%=Math.round(edificio.getPrima() * 100.0) / 100.0%>€)</small></p>

            <%
                }
            %>
            <br/>
            <%
                }
                //Se añade una línea separadora <hr/> si están los dos seguros seleccionados
                if (edificio != null && contenido != null) {
            %>
            <hr/>
            <%
                }
            %>

            <%
                if (contenido != null) {
                    total = total + contenido.getPrima();
            %>
            <h1>Seguro de contenido</h1>
            <%
                if (contenido.getDaños()== true) {
                    siOno = "Sí";
                } else {
                    siOno = "No";
                }
            %>
            <p>- Cubrir daños accidentales: <%=siOno%></p>
            <p>- Cantidad que se quiere asegurar: <%=contenido.getCantidad()%>€</p>
            <%
                if (contenido.getFranquicia() == 0) {
                    franquicia = "Ninguna";
                } else {
                    franquicia = Double.toString(Math.round(contenido.getFranquicia() *100.0/100.0)) + "€";
                }
            %>
            <p>- Franquicia: <%=franquicia%></p>
            
            <%
                if (edificio != null) {
            %>
            <p><small>(Total del seguro del contenido: <%=Math.round(contenido.getPrima() * 100.0) / 100.0%>€)</small></p>

            <%
                }
            %>
            
            <br/>

            <%
                }
            %>

            <h2>El TOTAL de su seguro es de: <%=Math.round(total * 100.0) / 100.0%>€</h2>
            <button id="botonMenu" type="submit" name="menu" value="Menu"><a id="enlaceMenu" href="<%=request.getContextPath()%>/index.jsp">Menú</a> </button>
        </div>
        <%
            sesion.invalidate();
        %>
        <%@include file="../../INC/piePagina.inc"%>
    </body>
</html>
