package producto.api

import grails.converters.JSON
import grails.validation.ValidationException

import javax.validation.OverridesAttribute


import static org.springframework.http.HttpStatus.*

class ProductController {

    ProductService productService

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE", show: "GET"]

    def index(String filter) {
        if (filter!=null){
            double number
            boolean numeric = true
            try {
                number = Double.parseDouble(params.filter)
            } catch (Exception e) {
                numeric = false
            }
            if (numeric) {
                int id=number
                redirect (action:'show', id:id)
            } else {
                respond productService.search(filter)
            }
        } else{
            respond productService.list()
        }
    }

    def show(Long id)
    {
        respond productService.get(id)
    }
    def create() {
        respond new Product(params)
    }

    def save(Product product) {
        if (product == null) {
            notFound()
            return
        }
        try {
            productService.save(product)
        } catch (ValidationException e) {
            respond product.errors, view: 'create'
            return
        }
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'product.label', default: 'Producto'), product.id])
                redirect product
            }
            '*' { respond product, [status: CREATED] }
        }
    }

    def edit(Long id) {
        respond productService.get(id)
    }

    def update(Product product) {
        if (product == null) {
            notFound()
            return
        }

        try {
            productService.save(product)
        } catch (ValidationException e) {
            respond product.errors, view: 'edit'
            return
        }

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'product.label', default: 'Producto'), product.id])
                redirect product
            }
            '*' { respond product, [status: OK] }
        }
    }

    def delete(Long id) {
        if (id == null) {
            notFound()
            return
        }

        productService.delete(id)

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'product.label', default: 'Producto'), id])
                redirect action: "index", method: "GET"
            }
            '*' { render status: NO_CONTENT }
        }
    }
}
