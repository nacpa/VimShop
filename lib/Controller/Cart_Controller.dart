import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vim_shop/Data/Repositories/Cart_Repo.dart';
import 'package:vim_shop/Models/ProductModel.dart';
import 'package:vim_shop/Models/Product_model.dart';

class CartController extends GetxController{
  final CartRepo cartRepo;

  CartController( {required this.cartRepo });

  Map<int, Cart_Models> _items={};


  void addItem(Products_Models product , int quantity){
    var TotalQuantity=0;
  if(_items.containsKey(product.id)){
    _items.update(product.id!, (value) {print(" item  updated to cart -> "+product.id!.toString()+" And Quantity is -> "+quantity.toString());


      TotalQuantity=value.Quantity!+quantity;
      if(TotalQuantity+1>=1){
      Get.snackbar("Item Added sucessfully in Cart", "",backgroundColor: Colors.lightGreenAccent.withOpacity(0.5),duration:  Duration(milliseconds: 850),snackStyle: SnackStyle.FLOATING);

      }


      return Cart_Models(
        id: value.id,
        name: value.name,
        price:value.price,

        img:product.img,
        Quantity:value.Quantity!+  quantity,
        IsExists:true,
        time:DateTime.now().toString(),
      ) ;
    } );
    if(TotalQuantity<=0){_items.remove(product.id);}

  }else{
    if(quantity>0){
      _items.putIfAbsent(product.id! , (){
        print("New  item  Addeded to cart -> "+product.id!.toString()+" And Quantity is -> "+quantity.toString());

        return Cart_Models(
          id: product.id,
          name: product.name,
          price:product.price,

          img:product.img,
          Quantity:quantity,
          IsExists:true,
          time:DateTime.now().toString(),
        );});
    }
  }

update();

    }





    bool ExistInCart(Products_Models product  ){
    if(_items.containsKey(product.id)){return true;

    }else
      {return false;}

    }


    int GetQuantity(Products_Models product){
    var Quantity=0;
    if(_items.containsKey(product.id)){
      _items.forEach((key, value) {
        if(key==product.id) {
          Quantity=value.Quantity!  ;
        }

      });

    }
    return Quantity;
    }

    int get TotalItems{
    var TotalQuantity=0;
    _items.forEach((key, value) {
      TotalQuantity+=value.Quantity!;
    });
    return TotalQuantity;

    }

  }




