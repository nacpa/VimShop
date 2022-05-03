import 'package:badges/badges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vim_shop/Controller/Cart_Controller.dart';
import 'package:vim_shop/Controller/Popular_product_controller.dart';
import 'package:vim_shop/Weidgets/AppIcon.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import 'package:vim_shop/Weidgets/colors.dart';

import '../Weidgets/Constants.dart';
import '../Weidgets/CustomText.dart';
import '../Weidgets/Icon&TextWidget.dart';
import '../Weidgets/Route_helper.dart';

class Cart_menu extends StatelessWidget {
  const Cart_menu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade50,
      // appBar: AppBar(title:Text("helllo"),),
      body: Stack(
        children: [
          Positioned(
              top: Dimension.hight10 * 4,
              left: Dimension.width10,
              right: Dimension.width10,
              bottom: 0,
              child: Column(
                children: [
                  Expanded(
                    flex: 6,
                    child: GetBuilder<CartController>(builder: (Cart) {
                      return ListView.builder(
                        itemCount: Cart.Getitems.length,
                        itemBuilder: (context, index) => Container(
                          child: Row(
                            children: [
                              // BigText(TextColor: Colors.black12, text: index.toString(), size:20 ),
                              Padding(
                                padding:
                                    EdgeInsets.all(Dimension.Screenheight / 81),
                                child: Container(
                                  height: Dimension.Screenheight / 7,
                                  width: Dimension.ScreenWidth / 3,
                                  decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.black12,
                                            offset: Offset(0, 5),
                                            blurRadius: 2)
                                      ],
                                      borderRadius: BorderRadius.circular(
                                          Dimension.Screenheight / 40),
                                      image: DecorationImage(
                                          fit: BoxFit.fill,
                                          image: NetworkImage(
                                              AppConstants.APP_base_URL +
                                                  "/uploads/" +
                                                  Cart.Getitems[index].img!))),
                                ),
                              ),
                              Expanded(
                                flex: 2,
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Colors.grey.shade300,
                                            offset: Offset(0, 3),
                                            blurRadius: 5)
                                      ],
                                      borderRadius: BorderRadius.circular(
                                          Dimension.Screenheight / 50)),
                                  height: Dimension.Screenheight / 9,
                                  width: Dimension.ScreenWidth * 0.55,
                                  child: Padding(
                                    padding: EdgeInsets.all(
                                        Dimension.Screenheight / 100),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        BigText(
                                            TextColor: Colors.black45,
                                            text: Cart.Getitems[index].name!,
                                            size: Dimension.hight10),
                                        SmalText(
                                            TextColor: Colors.black26,
                                            text: Cart.Getitems[index].price
                                                .toString(),
                                            size: Dimension.ScreenWidth * 0.03),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: Dimension.hight10 * 4,
                                              width: Dimension.width10 * 19.8,
                                              decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                        color: Colors.black12,
                                                        offset: Offset(0, 1),
                                                        blurRadius: 2)
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
                                              child: Padding(
                                                padding: EdgeInsets.all(5),
                                                child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .baseline,
                                                    textBaseline:
                                                        TextBaseline.alphabetic,
                                                    children: [
                                                      BigText(
                                                          TextColor:
                                                              Colors.black45,
                                                          text:
                                                              "${Cart.Getitems[index].Quantity} items",
                                                          size: Dimension
                                                                  .width10 *
                                                              2),
                                                      BigText(
                                                          TextColor: Colors
                                                              .red.shade300,
                                                          text:
                                                              "Total ₹${(Cart.Getitems[index].price)}",
                                                          size: Dimension
                                                                  .width10 *
                                                              1.6)
                                                    ]),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    }),
                  ),
                  Container(
                    height: Dimension.Screenheight / 9,
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                        color: Colors.deepOrangeAccent.shade400,
                        borderRadius: BorderRadius.circular(30)),
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        BigText(
                            TextColor: Colors.white,
                            text: "In Cart items",
                            size: 20),
                        GestureDetector(onTap: ()=> null,
                          child: Container(
                            height: Dimension.hight10*4,width: Dimension.ScreenWidth/3,
                            child: Center(
                              child: Text(
                                "CheckOut",
                                style: TextStyle(color: Colors.deepOrange,fontSize: 20,fontWeight: FontWeight.bold),
                              ),
                            ),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(30)),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              )),
          Positioned(
              top: Dimension.hight10 * 3.5,
              left: Dimension.width10,
              right: Dimension.width10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: AppIcon(
                      icon: Icons.arrow_back_ios_new,
                      Backgroundcolor: Colors.black,
                      size: Dimension.hight10 * 3.5,
                      iconcolor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(RouteHelper.initial);
                    },
                    child: AppIcon(
                      icon: Icons.home,
                      Backgroundcolor: Colors.black,
                      size: Dimension.hight10 * 3.5,
                      iconcolor: Colors.white,
                    ),
                  ),
                  Get.find<PopularProductController>().TotalItem >= 1
                      ? Badge(
                          badgeContent: Padding(
                            padding: const EdgeInsets.all(1),
                            child: Text(
                              "${Get.find<PopularProductController>().TotalItem.toString()} ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 10),
                            ),
                          ),
                          badgeColor: AppColor.MainColor,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(Cart_menu());
                            },
                            child: AppIcon(
                              icon: Icons.shopping_cart_checkout,
                              Backgroundcolor: Colors.black,
                              size: Dimension.hight10 * 3.5,
                              iconcolor: Colors.white,
                            ),
                          ),
                        )
                      : AppIcon(
                          icon: Icons.shopping_cart_checkout,
                          Backgroundcolor: Colors.black,
                          size: Dimension.hight10 * 3.5,
                          iconcolor: Colors.white,
                        ),
                ],
              )),
        ],
      ),
    );
  }
}
