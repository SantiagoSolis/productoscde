import { Component, OnInit } from '@angular/core';
import { ApiproductoService } from '../../services/apiproducto.service';
import { ActivatedRoute } from '@angular/router';

@Component({
  selector: 'app-view-product',
  templateUrl: './view-product.page.html',
  styleUrls: ['./view-product.page.scss'],
})
export class ViewProductPage implements OnInit {

  product:any;
  id:String;

  constructor(private activatedRoute: ActivatedRoute, private apiProductoService :ApiproductoService ) {
  }

  ngOnInit(){
    this.id = this.activatedRoute.snapshot.paramMap.get('id');
    this.obtener_producto(this.id);
  }

  obtener_producto(id){
    this.apiProductoService.getById(id).subscribe(product =>{
      this.product=product;
    });
  }
}
