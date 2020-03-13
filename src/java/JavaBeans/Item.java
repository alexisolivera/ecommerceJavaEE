/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package JavaBeans;

/**
 *
 * @author Alexis
 */
public class Item {
    private  ProductoTerminar p;
    private int cantidad;

    public ProductoTerminar getP() {
        return p;
    }

    public void setP(ProductoTerminar p) {
        this.p = p;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public Item(ProductoTerminar p, int cantidad) {
        this.p = p;
        this.cantidad = cantidad;
    }
}
