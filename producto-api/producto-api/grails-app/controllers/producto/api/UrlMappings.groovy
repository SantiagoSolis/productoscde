package producto.api

class UrlMappings {

    static mappings = {

        "/$controller/$action?/$id?(.$format)?"
                {
            constraints {
                // apply constraints here
            }
        }
        "/show/$id"(controller: 'product', action: 'show')
        "/"(controller: "product",action:"index", view:"/product/index")
        "500"(view:'/error')
        "404"(view:'/notFound')
    }
}
