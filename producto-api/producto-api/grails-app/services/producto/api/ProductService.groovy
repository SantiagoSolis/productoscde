package producto.api
import grails.gorm.services.Query
import grails.gorm.services.Service

@Service(Product)
interface ProductService {

    Product get(Serializable id)

    List<Product> list(Map args)

    Long count()

    void delete(Serializable id)

    Product save(Product product)

    @Query("""\
        select  ${p}
            from ${Product p}
            where p.nombre like ${'%'+name+'%'}  """)
    List<Product> search(String name)
}