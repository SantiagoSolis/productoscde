package producto.api

import grails.rest.RestfulController


class ProductosRestController  extends RestfulController{
    static responseFormats = ['json', 'xml']

    ProductService productService

    ProductosRestController() {
        super(Product)
    }
    def listProducts(){
        List<Product> product = productService.list()
        respond product
    }
    def getById(Long id){
        respond productService.get(params.id)
    }
    def getByName(String filter){
        if (filter!=null){
            double number
            boolean numeric = true
            try {
                number = Double.parseDouble(params.name)
            } catch (Exception e) {
                numeric = false
            }
            if (numeric) {
                int id=number
                respond productService.get(filter)
            } else {

                respond productService.search(filter)
            }
        } else{
            respond productService.list()
        }
    }
}

