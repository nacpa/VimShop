// import 'dart:ffi';
import 'package:flutter/cupertino.dart';

import 'package:badges/badges.dart';
import 'package:flutter/material.dart';
import 'package:vim_shop/Controller/Cart_Controller.dart';
import 'package:vim_shop/Page/Cart.dart';
import 'package:vim_shop/Page/MainPage.dart';
import 'package:vim_shop/Page/Page_Body.dart';
import 'package:vim_shop/Weidgets/AppIcon.dart';
import 'package:vim_shop/Weidgets/Constants.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import 'package:vim_shop/Weidgets/Route_helper.dart';
import '../Controller/Popular_product_controller.dart';
import '../Weidgets/CustomText.dart';
import '../Weidgets/Dimensions.dart';
import '../Weidgets/AppIcon.dart';
import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';
import '../Weidgets/Icon&TextWidget.dart';
import '../Weidgets/colors.dart';
import 'RecomendedFoodDetails.dart';

class PopularFoodDetails extends StatelessWidget {
   int PageId;
   PopularFoodDetails({Key? key,required this.PageId} ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Product=Get.find<PopularProductController>().PopulatProductList[PageId];
    Get.find<PopularProductController>().InitProduct(Product,Get.find<CartController>()) ;

    Size size = MediaQuery.of(context).size;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: GetBuilder<PopularProductController>(builder: (PopularProduct){return Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                height: size.height / 15,
                width: size.width / 3,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black12,
                          offset: Offset(0, 1),
                          blurRadius: 2)
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    GestureDetector( onTap:(){   PopularProduct.InCartItem>=1? PopularProduct.setQuantity(false) :PopularProduct.Quantity==1; },
                     child : BigText(
                          TextColor: Colors.black45,
                          text: "-",
                          size: size.width * 0.08),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: BigText(
                          TextColor: Colors.black45,
                          text: "${PopularProduct.InCartItem}",
                          size: size.width * 0.08),
                    ),
                    GestureDetector( onTap: (){
                   PopularProduct.InCartItem<=9?   PopularProduct.setQuantity(true): Get.snackbar("Max Quantity", "You can Add only 10 same Food at a time",backgroundColor: AppColor.MainColor);
                    },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: BigText(
                            TextColor: Colors.black45,
                            text: "+",
                            size: size.width * 0.08),
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(onTap: (){
                PopularProduct.AddItem(Product);
                },
                child: Container(
                  height: size.height / 15,
                  width: size.width / 3,
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(0, 1),
                            blurRadius: 2)
                      ],
                      color: AppColor.MainColor,
                      borderRadius: BorderRadius.circular(30)),
                  child: Center(
                      child: BigText(
                        TextColor: Colors.white,
                        size: size.width / 20,
                        text: 'Add to Cart',
                      )),
                ),
              ),
            ],
          ),
          height: size.height / 8,
          decoration: BoxDecoration(
              boxShadow:[
                // BoxShadow(
                //     color: Colors.black45, offset: Offset(0, 3), blurRadius: 10)
              ],
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30)),
        );}),
        body: Stack(
          children: [
            Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: size.height / 2.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(AppConstants.APP_base_URL+"/uploads/"+Product.img))),
              ),
            ),
            Positioned(
                top: size.height / 15,
                left: size.width / 15,
                right: size.width / 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(onTap: (){Get.toNamed(RouteHelper.initial);},
                      child: AppIcon(
                        icon: Icons.arrow_back,
                        Backgroundcolor: Colors.black,
                        size: Dimension.hight10*3.5,
                        iconcolor: Colors.white,
                      ),
                    ),
                   Get.find<PopularProductController>().TotalItem>=1?  Badge(badgeContent: Padding(
                     padding: const EdgeInsets.all(1),
                     child: Text("${Get.find<PopularProductController>().TotalItem.toString()} ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 15),),
                   ),badgeColor: AppColor.MainColor,
                     child: GestureDetector(  onTap:(){  Get.toNamed(RouteHelper.CartPage);},
                       child: AppIcon(
                         icon: Icons.shopping_cart_checkout,
                         Backgroundcolor: Colors.black,
                         size: Dimension.hight10*3.5,
                         iconcolor: Colors.white,
                       ),
                     ),
                   ):
                   GestureDetector(  onTap:(){  Get.toNamed(RouteHelper.CartPage);},
                     child: AppIcon(
                       icon: Icons.shopping_cart_checkout,
                       Backgroundcolor: Colors.black,
                       size: Dimension.hight10*3.5,
                       iconcolor: Colors.white,
                     ),
                   ),
                  ],
                )),
            Positioned(
                bottom: 0,
                top: size.height / 2.4,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30)),
                      color: Colors.white),
                  height: size.height / 2,
                  width: double.maxFinite,
                  child: Padding(
                      padding: EdgeInsets.only(
                          left: size.width / 20,
                          right: size.width / 20,
                          top: size.width / 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              BigText(
                                  TextColor: Colors.black45,
                                  text: Product.name!,
                                  size: size.width * 0.05),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Wrap(
                                      children: List.generate(Product.stars , (index) => Icon(
                                            Icons.star,
                                            color: AppColor.MainColor,
                                            size: size.width * 0.04,
                                          ))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SmalText(
                                      TextColor: Colors.black26,
                                      text: Product.stars.toString(),
                                      size: size.width * 0.03),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SmalText(
                                      TextColor: Colors.black26,
                                      text: '1276   Comments',
                                      size: size.width * 0.03),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                                children: [
                                  IconAndTextWeidget(
                                      icon: Icons.circle_sharp,
                                      Text: 'Normal',
                                      iconColor: Colors.orange,
                                      textcolor: Colors.black26,
                                      Size: size.width * 0.04),
                                  SizedBox(
                                    width: size.width / 30,
                                  ),
                                  IconAndTextWeidget(
                                      icon: Icons.pin_drop,
                                      Text: 'Lucknow',
                                      iconColor: AppColor.MainColor,
                                      textcolor: Colors.black26,
                                      Size: size.width * 0.04),
                                  SizedBox(
                                    width: size.width / 30,
                                  ),
                                  IconAndTextWeidget(
                                      icon: Icons.access_time_rounded,
                                      Text: '32 min',
                                      iconColor: Colors.red,
                                      textcolor: Colors.red.shade200,
                                      Size: size.width * 0.04),
                                ],
                              )
                            ],
                          ),
                          SizedBox(
                            height: size.height / 75,
                          ),
                          BigText(
                              TextColor: Colors.black45,
                              text: "Introduce",
                              size: size.width * 0.06),
                          Expanded(
                            child: SingleChildScrollView(
                              child: ExpandableText(Product.description
                                ,
                                expandText: " \n ...show more  ",linkColor: AppColor.MainColor,maxLines: 5,animation: true,collapseOnTextTap: true, style: TextStyle(
                                  fontSize: size.width/23,wordSpacing: 3,color: Colors.blueGrey.shade500,height: 2),
                              ),
                            ),
                          )
                        ],
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
