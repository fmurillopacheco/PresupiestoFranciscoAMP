<%-- 
    Document   : edificio
    Created on : 25-may-2020, 19:56:47
    Author     : Francisco_Antonio
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="../../CSS/presupuestoStyle.css"/>
        <%@include file = "../../INC/metas.inc" %>
        <title>Gestor&iacute;a de Seguros NORMAS - Edificios.</title>
    </head>
    <body>
    <%@include file = "../../INC/cabecera.inc" %>

        <div id="principal">

            <form action="<%=request.getContextPath()%>/Edificio" method="post">


                <h1>Detalle de la póliza de edificios</h1>
                <p>Proporcione la información que necesitamos para hacer los cálculos y pulse enviar</p>
                <br>
                <table>
                    <tr>
                        <td>Tipo de edificio: </td>
                        <td>Número de habitaciones: </td>
                        <td>Fecha de construcción: </td>
                        <td>Tipo de construcción: </td>
                        <td>Valor estimado del mercado: </td>
                    </tr>

                    <tr>
                        <td><select name="tipoEdificio">
                                <option value="piso" selected>piso</option>
                                <option value="casa">casa</option>
                                <option value="adosado">adosado</option>
                                <option value="duplex">duplex</option>
                                <option value="chalet">chalet</option>
                            </select>
                        </td>
                        <td><select name="habitaciones">
                                <option value="1" selected>1</option>
                                <option value="2">2</option>
                                <option value="3">3</option>
                                <option value="4">4</option>
                                <option value="5">5 o más</option>
                            </select>
                        </td>
                        <td><select name="fechaConstruccion">
                                <option value="1949" selected>antes de 1950</option>
                                <option value="1950">entre 1950 y 1990</option>
                                <option value="1991">entre 1991 y 2005</option>
                                <option value="2006">entre 2006 y 2015</option>
                                <option value="2016">después de 2016</option>
                            </select>
                        </td>
                        <td>
                            <input value="madera" name="tipoCons" type="radio" checked/>Madera<br/>
                            <input value="homigon" name="tipoCons" type="radio"/>Hormigón
                        </td>
                        <td><select name="valorMercado">
                                <option value="25000" selected>menos de 50.000</option>
                                <option value="50001">entre 50.001 y 80.000</option>
                                <option value="80001">entre 80.001 y 100.000</option>
                                <option value="100001">entre 100.001 y 150.000</option>
                                <option value="125000">más de 150.000</option>
                            </select>
                        </td>
                        
                    </tr>
                </table>
                <br><br>
                <button type="submit" name="enviar" value="Enviar"/>Enviar


            </form>

        </div>


        <%@include file="../../INC/piePagina.inc"%>
    </body>
</html>
