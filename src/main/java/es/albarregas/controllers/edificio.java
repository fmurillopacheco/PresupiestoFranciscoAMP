/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import es.albarregas.beans.Edificios;
import es.albarregas.beans.Elecciones;
import es.albarregas.models.CalcularCuota;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Francisco_Antonio
 */
@WebServlet(name = "edificio", urlPatterns = {"/edificio"})
public class edificio extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Edificios ed=new Edificios();
        Enumeration<String> e=request.getParameterNames();
        String txt,url;
        
        while(e.hasMoreElements()){
            txt=e.nextElement();
            switch(txt){
                case "tipo":ed.setTipo(request.getParameter(txt));
                    break;
                case "habitaciones":ed.setHabitaciones(Integer.parseInt(request.getParameter(txt)));
                    break;
                case "fecha":ed.setFecha(request.getParameter(txt));
                    break;
                case "material":ed.setMaterial(request.getParameter(txt));
                    break;
                case "valor":ed.setValor(Integer.parseInt(request.getParameter(txt)));
                    break;
            }
        }
        
        ed.setPrima(CalcularCuota.calcularCuota(ed));
        
        HttpSession sesion=request.getSession();
        sesion.setAttribute("edificio", ed);
        
        Elecciones ele=(Elecciones)sesion.getAttribute("eleccion");
        if(ele.getContenido()){
            if(request.getParameter("jsp").equals("jsple")){
                url="JSP/JSPLE/contenido.jsp";
            }else{
                url="JSP/JSPE/contenido.jsp";
            }
        }else{
            if(request.getParameter("jsp").equals("jsple")){
                url="JSP/JSPLE/visualizar.jsp";
            }else{
                url="JSP/JSP/visualizar.jsp";
            }
        }
        
        response.sendRedirect(url);
        
    }

}
