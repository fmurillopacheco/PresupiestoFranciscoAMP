
package es.albarregas.models;

import es.albarregas.beans.Contenidos;
import es.albarregas.beans.Edificios;

/**
 *
 * @author Francisco_Antonio
 */
public class CalcularCuota {
        public static double calcularCuota(Edificios ed){
        double prima=ed.getValor()*0.005;
        switch(ed.getTipo()){
            case "piso":prima=prima*0.95;
                break;
            case "casa":prima=prima*1;
                break;
            case "adosado":prima=prima*1.05;
                break;
            case "duplex":prima=prima*1.1;
                break;
            case "chalet":prima=prima*1.2;
                break;
        }
        prima+=(prima/100)*ed.getHabitaciones();
        switch(ed.getFecha()){
            case "1949":prima+=prima*0.09;
                break;
            case "1950":prima+=prima*0.06;
                break;
            case "1991":prima+=prima*0.04;
                break;
            case "2006":prima+=prima*0.02;
                break;
            case "2016":prima+=prima*0.01;
                break;
        }
        if(ed.getMaterial().equals("madera")){
            prima+=prima*0.1;
        }
        return prima;
    }
    
    public static double calcularContenido(Contenidos con){
        double prima=con.getCantidad()*0.008;
        if(con.getDaños()){
            prima*=1.25;
        }
        switch(con.getFranquicia()){
            case 500:prima-=prima*0.1;
                break;
            case 1000:prima-=prima*0.2;
        }
        return prima;
    }
}
