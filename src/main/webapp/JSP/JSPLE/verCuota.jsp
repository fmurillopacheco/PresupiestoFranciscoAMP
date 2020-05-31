<%-- 
    Document   : verCuota
    Created on : 25-may-2020, 19:57:20
    Author     : Francisco_Antonio
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="es.albarregas.beans.Contenidos"%>
<%@page import="es.albarregas.beans.Edificios"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../CSS/presupuestoStyleLe.css"/>
        <jsp:include page= "../../INC/metas.inc"/>
        <title>Gestor&iacute;a de Seguros NORMAS - Cuota - Lenguaje de Expresiones v1.</title>
    </head>


    <body>
        <jsp:include page="../../INC/cabecera.inc"/>
        <div class="principal">
            <div class="float">
                <h2>Detalles de su póliza</h2>
                <c:if test="${not empty edificio}">
                    <h3>Edificio</h3>
                    <ul class="list-unstyled">
                        <li>Tipo de edificio: ${edificio.tipo}</li>
                        <li>Habitaciones: ${edificio.habitaciones}</li>
                        <li>Fecha de construcción: ${edificio.fecha}</li>
                        <li>Tipo de construcción: ${edificio.material}</li>
                        <li>Valor de mercado: ${edificio.valor}</li>
                        <li>Prima: <fmt:formatNumber type="currency" value="${edificio.prima}"/></li>
                    </ul>
                    <c:set var="primaed" value="true"/>
                </c:if>
            </div>
            <c:if test="${not empty contenido}">
            <div class="float">
                <h3>Contenido</h3>
                <c:if test="${not empty contenido.daños}">
                    <p>Daños cubiertos:</p>
                </c:if>
                    <ul class="list-unstyled">
                        <li>Cantidad: ${contenido.cantidad}</li>
                        <li>Franquicia: ${contenido.franquicia}</li>        
                        <li class="res">Prima: <fmt:formatNumber type="currency" value="${contenido.prima}"/></li>
                    </ul>
            </div>
                <c:set var="primacon" value="true"/>
            </c:if>          
            <c:if test="${primaed && primacon}">
                <div class="float">
                    
                </div>
            </c:if>                    
        </div>
        <h3 class="clear">El TOTAL de su seguro es de: <fmt:formatNumber type="currency" value="${edificio.prima+contenido.prima}"/></h3>
        <button id="botonMenu" type="submit" name="menu" value="Menu"><a id="enlaceMenu" href="<c:url value = "../JSPLE/index.jsp" />">Menú</a> </button>
        <%session.invalidate();%>
        <jsp:include page="../../INC/piePagina.inc"/>
    </body>
</html>
