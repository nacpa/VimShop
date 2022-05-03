import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Models/ProductModel.dart';

class CartRepo{


  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart=[];
  List<String> cartHistory=[];


  void AddToCartList(List<Cart_Models> cartList){
    cart=[];
   // convert obect to list bcz Sharedprefrences acepts only strings


   return cartList.forEach((element) {cart.add(jsonEncode(element));
     sharedPreferences.setStringList("Cart_list", cart);
     // print(sharedPreferences.getStringList("Cart_list"));

   }
   );
  }


  List<Cart_Models> getcartList(){
    List<String>? carts=[];
    if(sharedPreferences.containsKey("Cart_list")){
     carts= sharedPreferences.getStringList("Cart_list");
    }

    List<Cart_Models> CartList=[];
    carts?.forEach((element) {CartList.add(Cart_Models.fromJson(jsonDecode(element))); });
    print(carts.toString());

    return CartList;

}




void AddCartHistoryList(){
    for(int i =0; i<cart.length;i++){
      cartHistory.add(cart[i]);
      print("History${cart[i].toString()}");
    }

    sharedPreferences.setStringList("Cart-History", cartHistory);

}





}