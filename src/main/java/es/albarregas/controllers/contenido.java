/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package es.albarregas.controllers;

import es.albarregas.beans.Contenidos;
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
@WebServlet(name = "contenido", urlPatterns = {"/contenido"})
public class contenido extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                Contenidos con=new Contenidos();
        Enumeration<String> e=request.getParameterNames();
        String txt;
        String url;
        
        while(e.hasMoreElements()){
            txt=e.nextElement();
            switch(txt){
                case "dan":con.setDaños(true);
                    break;
                case "cantidad":con.setCantidad(Integer.parseInt(request.getParameter(txt)));
                    break;
                case "franquicia":con.setFranquicia(Integer.parseInt(request.getParameter(txt)));
                    break;
            }
         
        }
        
        con.setPrima(CalcularCuota.calcularContenido(con));
        
        HttpSession sesion=request.getSession();
        sesion.setAttribute("contenido", con);
        
        if(request.getParameter("jsp").equals("jstl")){
            url="JSP/JSPLE/verCouta.jsp";
        }else{
            url="JSP/JSP/verCuota.jsp";
        }
        request.getRequestDispatcher(url).forward(request, response);
        
    }
    


}
