import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:vim_shop/Controller/Cart_Controller.dart';
import 'package:vim_shop/Data/Repositories/Popular_product_reppo.dart';
import 'package:vim_shop/Models/Product_model.dart';
import 'package:vim_shop/Weidgets/colors.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;
  PopularProductController({ required this.popularProductRepo});
  bool isLoaded=false;
  int _Quantity=0;
  int get Quantity => _Quantity;
  int _IncartItems=0;

  int get  InCartItem => _IncartItems+_Quantity;

  late CartController _cart;

  List<dynamic> _PopulatProductList=[];

  List<dynamic> get PopulatProductList =>_PopulatProductList;

  Future <void> getPopularProductList() async {
   Response response= await popularProductRepo.getPopolarProductList();
   if(response.statusCode==200){
     // print("got Responce");
     _PopulatProductList=[];
     _PopulatProductList.addAll(Product.fromJson(response.body).products);
     isLoaded=true;
     // print(_PopulatProductList);
     update();
   }else{

   }

  }

void setQuantity(bool isIncrement){
    if(isIncrement){

      _Quantity= _Quantity+1;}

     else{
      _Quantity=_Quantity-1;
    }
    update();
}
  void InitProduct(Products_Models product,CartController cart){
    _Quantity=0;
    _IncartItems=0;
    _cart=cart;
    var Exist=false;
    Exist=_cart.ExistInCart(product);
    print("exists or not ${Exist.toString()}");
    if(Exist){
      _IncartItems=_cart.GetQuantity(product);
    }
    print("Quantity is ${_IncartItems}");


  }

  void AddItem( Products_Models product){
    // if(InCartItem>0){
      _cart.addItem(product, _Quantity);
      _Quantity=0;

    // }
    // else{Get.snackbar("Warning", "Add atLeast one Item in Cart",backgroundColor: AppColor.MainColor);}
  }
  int get TotalItem{
    return _cart.TotalItems;


  }



}