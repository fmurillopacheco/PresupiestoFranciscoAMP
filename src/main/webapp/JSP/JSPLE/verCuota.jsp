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
        <jsp:include page= "../../INC/metas.inc"/>
        <title>Gestor&iacute;a de Seguros NORMAS - Cuota - Lenguaje de Expresiones v1.</title>
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
        <jsp:include page="../../INC/cabecera.inc"/>
        <div id="principal">
            <%
                if (edificio != null) {
                    total = total + edificio.getPrima();
            %>
            <h1>Seguro de edificio</h1>
            <%-- A TODAS VISTAS ESTO ES <ul><li>...</li></ul> --%>
            <p>- Tipo de edificio: ${edificio.tipo}</p>
            <p>- Número de habitaciones: ${edificio.habitaciones}</p>
            <p>- Fecha de construcción: ${edificio.fecha}</p>
            <%
                if (edificio.getFecha().startsWith("mad")) {
                    mh = "Madera";
                } else {
                    mh = "Hormigón";
                }

            %>
            <p>- Tipo de construcción: ${edificio.material}</p>
            <p>- Valor estimado del mercado: ${edificio.valor}€</p>
            <%
                if (contenido != null) {
            %>
            <p><small>(Total del seguro del edificio: ${edificio.prima}€)</small></p>

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
            <p>- Cantidad que se quiere asegurar: ${contenido.cantidad}€</p>
            <%
                if (contenido.getFranquicia() == 0) {
                    franquicia = "Ninguna";
                } else {
                    franquicia = Double.toString(Math.round(contenido.getFranquicia() *100.0/100.0)) + "€";
                }
            %>
            <p>- Franquicia: ${contenido.franquicia}</p>
            
            <%
                if (edificio != null) {
            %>
            <p><small>(Total del seguro del contenido: ${contenido.prima}€)</small></p>

            <%
                }
            %>
            
            <br/>

            <%
                }
            %>

            <h2>El TOTAL de su seguro es de: ${edificio.prima+contenido.prima}€</h2>
            <button id="botonMenu" type="submit" name="menu" value="Menu"><a id="enlaceMenu" href="<%=request.getContextPath()%>/index.jsp">Menú</a> </button>
        </div>
        <%
            sesion.invalidate();
        %>
        <jsp:include page="../../INC/piePagina.inc"/>
        ${sesion.invalidate()}
    </body>
</html>
