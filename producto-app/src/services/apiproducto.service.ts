import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';


@Injectable({
  providedIn: 'root'
})
export class ApiproductoService {

  constructor(private http: HttpClient) {
  }

  getProducts() {
    return this.http.get('http://localhost:8080/productosRest/listProducts');
  }

  getById(id) {
    return this.http.get('http://localhost:8080/productosRest/getById/'+id);
  }

  getFilteredProducts(filter) {
    return this.http.get("http://localhost:8080/productosRest/getByName?filter="+filter)
  }
}
