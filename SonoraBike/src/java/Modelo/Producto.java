package Modelo;

/**
 *
 * @author Brandon Figueroa Ugalde - 00000233295
 * @author Manuel Francisco Flores Velazquez - 00000233301
 */
public class Producto {

    private int id;
    private String nombre, img, tipo;
    private float precio;
    private int stock;

    public Producto(int id, String nombre, String img, String tipo, float precio, int stock) {
        this.id = id;
        this.nombre = nombre;
        this.img = img;
        this.tipo = tipo;
        this.precio = precio;
        this.stock = stock;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }
}
