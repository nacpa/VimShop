import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vim_shop/Controller/Cart_Controller.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import 'package:vim_shop/Weidgets/Route_helper.dart';

import '../../Controller/Popular_product_controller.dart';
import '../../Controller/Recommended_product_Comtroller.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;
  void _loadResources() async{
    // initilize cntroller stuff

    await Get.find<CartController>().getCartData();
    await Get.find<PopularProductController>().getPopularProductList();
    await Get.find<RecommendedProductController>().getRecommendedProductList();



  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadResources();
    controller =AnimationController(vsync: this,duration: Duration(seconds: 3,milliseconds: 500))..forward();
    animation =CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    Timer(
      Duration(seconds: 3),
        ()=>Get.toNamed(RouteHelper.initial)
    );
    
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(backgroundColor: Colors.white,
      body: Center(child: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
        ScaleTransition(scale: animation,
        child: Image.asset("assets/image/logo part 1.jpg",width: Dimension.ScreenWidth,)),
        Image.asset("assets/image/logo part 2.png",width: Dimension.ScreenWidth/1.1,),
      ],),),
    );
  }
}
