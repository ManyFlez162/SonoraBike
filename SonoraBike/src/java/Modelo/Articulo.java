package Modelo;

/**
 *
 * @author Brandon Figueroa Ugalde - 00000233295
 * @author Manuel Francisco Flores Velazquez - 00000233301
 */
public class Articulo {

    private int idProducto;
    private int cantidad;

    public Articulo(int idProducto, int cantidad) {
        this.idProducto = idProducto;
        this.cantidad = cantidad;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

}
