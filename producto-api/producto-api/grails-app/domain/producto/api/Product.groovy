package producto.api


class Product {
    double precio
    int cantidad
    String nombre
    String descripcion
    int id

    static constraints = {
        id(unique: true)
    }
}
