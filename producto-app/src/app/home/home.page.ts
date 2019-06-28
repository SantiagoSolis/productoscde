import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { ApiproductoService } from '../../services/apiproducto.service';
import { Observable } from "rxjs";



@Component({
  selector: 'app-home',
  templateUrl: 'home.page.html',
  styleUrls: ['home.page.scss']
})
export class HomePage {

  listProduct :any;
  product:any;
  searchFilter: String = "";
  text: string = "";

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

    getFilteredProducts(event)
    {
      const text = event.target.value
      if(isNaN(text)){
        this.apiProducto.getFilteredProducts(text).
          subscribe(products => {
            this.listProduct=products;
            console.log(text);
            console.log(products);
          });
      } else{
        this.apiProducto.getById(text).subscribe(product => {
            console.log(product);
            this.product=product;
          this.router.navigate(['/view-product',text]);
        });
    }
    }


}
