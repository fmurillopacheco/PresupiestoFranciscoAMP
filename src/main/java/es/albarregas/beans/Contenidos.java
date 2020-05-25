
package es.albarregas.beans;

/**
 *
 * @author Francisco_Antonio
 */

public class Contenidos {
        private boolean daños;
    private int cantidad;
    private int franquicia;
    private double prima;

    public boolean getDaños() {
        return daños;
    }

    public void setDaños(boolean daños) {
        this.daños = daños;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getFranquicia() {
        return franquicia;
    }

    public void setFranquicia(int franquicia) {
        this.franquicia = franquicia;
    }

    public double getPrima() {
        return prima;
    }

    public void setPrima(double prima) {
        this.prima = prima;
    }
}
