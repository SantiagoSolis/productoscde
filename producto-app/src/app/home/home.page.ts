import { Component } from '@angular/core';
import { Router } from '@angular/router';
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

  constructor(private apiProducto:ApiproductoService,private router:Router) {
     this.listProduct = this.getProducts();
  }

  getProducts(){
    this.apiProducto.getProducts().
      subscribe(products => {
        this.listProduct=products;
      });
  }
  mostrarDetalleProducto(id)
  {
    this.apiProducto.getById(id).subscribe(product => {
        console.log(product);
        this.product=product;
      this.router.navigate(['/view-product',id]);
    });
  }
  // getFilterList(String param)
  // {
  //   this.apiProducto.getFilteredProducts(param).
  //     subscribe(products => {
  //       this.listProduct=products;
  //     });
  // }ctrl + shif + / comentairos
}
