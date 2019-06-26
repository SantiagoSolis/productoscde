import { Component } from '@angular/core';
import { ApiproductoService } from '../../services/apiproducto.service';
import { Observable } from "rxjs";
import { map,catchError } from "rxjs/operators";


@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss']
})
export class HomePage {

  listProduct :any;
  product:any;

  constructor(private apiProducto:ApiproductoService) {
     this.listProduct = this.getProducts();
  }

  getProducts(){
    this.apiProducto.getProducts().
      subscribe(products => {
        console.log(products);
        this.listProduct=products;
      });
  }
  mostrarDetalleProducto(id)
  {
    this.apiProducto.getById(id.toString()).
    subscribe(product => {
      console.log(product);
      this.product=product;
    });
  }
}
