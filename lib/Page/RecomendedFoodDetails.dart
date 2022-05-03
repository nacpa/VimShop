// import 'dart:html';

import 'package:badges/badges.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vim_shop/Controller/Popular_product_controller.dart';
import 'package:vim_shop/Controller/Recommended_product_Comtroller.dart';
import 'package:vim_shop/Page/Cart.dart';
import 'package:vim_shop/Page/MainPage.dart';
import 'package:vim_shop/Weidgets/CustomText.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import 'package:vim_shop/Weidgets/Route_helper.dart';

import '../Controller/Cart_Controller.dart';
import '../Weidgets/AppIcon.dart';
import '../Weidgets/Constants.dart';
import '../Weidgets/colors.dart';

class RecomendedFoodDetails extends StatelessWidget {
   int PageId;
   RecomendedFoodDetails({Key? key,required this.PageId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var Product=Get.find<RecommendedProductController>().RecommendedProductList[PageId];
    Get.find<PopularProductController>().InitProduct(Product,Get.find<CartController>()) ;

    return
       Scaffold(
      body: CustomScrollView(
        slivers: [
        SliverAppBar(toolbarHeight: Dimension.Screenheight/10,automaticallyImplyLeading: false,
          title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(onTap: (){Get.to(MyApp());},
              child: AppIcon(
                icon: Icons.arrow_back,
                Backgroundcolor: Colors.black,
                size: Dimension.hight10*4.2,
                iconcolor: Colors.white,
              ),
            ),
            GestureDetector(onTap: (){
              Get.toNamed(RouteHelper.getCartPAge());
            },
              child: Get.find<PopularProductController>().TotalItem>=1?  Badge(badgeContent: Padding(
                padding: const EdgeInsets.all(1),
                child: Text("${Get.find<PopularProductController>().TotalItem.toString()} ",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 18),),
              ),badgeColor: AppColor.MainColor,
                child: AppIcon(
                  icon: Icons.shopping_cart_checkout,
                  Backgroundcolor: Colors.black,
                  size: Dimension.hight10*3.5,
                  iconcolor: Colors.white,
                ),
              ):
              AppIcon(
                icon: Icons.shopping_cart_checkout,
                Backgroundcolor: Colors.black,
                size: Dimension.hight10*3.5,
                iconcolor: Colors.white,
              ),
            ),
          ],
        ),
          bottom: PreferredSize(preferredSize: Size.fromHeight(20),
        child: Container( height: Dimension.hight10*4,width: double.maxFinite,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimension.hight10*4),topRight: Radius.circular(Dimension.hight10*4))),
          child: Center(child: BigText(TextColor: Colors.black38, size: Dimension.hight10*3, text: Product.name!,)),
        ),),
          expandedHeight: Dimension.Screenheight/2.5,pinned: true,backgroundColor: Colors.yellow.shade100,
          flexibleSpace: FlexibleSpaceBar( background: Image.network(AppConstants.APP_base_URL+"/uploads/"+Product.img,fit: BoxFit.fill,),

          ),
        ),
         SliverToBoxAdapter(
          child: Padding(
            padding:  EdgeInsets.all(10),
            child: ExpandableText( Product.description,
              expandText: " \n ...show more  ",linkColor: AppColor.MainColor,maxLines: 7,animation: true,collapseOnTextTap: true, style: TextStyle(
                fontSize: Dimension.ScreenWidth/23,wordSpacing: 3,color: Colors.blueGrey.shade500 ,height: 2),
            )
          ),
        )
      ],
      ),
         bottomNavigationBar: GetBuilder<PopularProductController>(builder:(Controller) {return
           Container(margin: EdgeInsets.only(bottom: 10),
           child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [

               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [
                   Container(
                     height: Dimension.Screenheight / 20,
                     width: Dimension.ScreenWidth / 2.5,
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
                         GestureDetector( onTap:(){   Controller.InCartItem>=1? Controller.setQuantity(false) :Controller.Quantity==1; },
                           child : BigText(
                               TextColor: Colors.black45,
                               text: "-",
                               size: Dimension.ScreenWidth * 0.08),
                         ),
                         BigText(
                             TextColor: Colors.black45,
                             text: "${Controller.InCartItem}",
                             size: Dimension.ScreenWidth * 0.06),
                         GestureDetector( onTap: (){
                           Controller.InCartItem<=9?   Controller.setQuantity(true): Get.snackbar("Max Quantity", "You can Add only 10 same Food at a time",backgroundColor: AppColor.MainColor);
                         },
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: BigText(
                                 TextColor: Colors.black45,
                                 text: "+",
                                 size: Dimension.ScreenWidth * 0.08),
                           ),
                         ),
                       ],
                     ),
                   ),
                   GestureDetector(onTap: (){Controller.AddItem(Product);
                   Controller.InCartItem>0?
                   Get.snackbar("Item Added sucessfully in Cart", "",backgroundColor: Colors.lightGreenAccent.withOpacity(0.5),duration:  Duration(milliseconds: 850),snackStyle: SnackStyle.FLOATING): print("");
                   },


                     child: Container(
                       height: Dimension.Screenheight / 20,
                       width: Dimension.ScreenWidth / 2.5,
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
                             size: Dimension.ScreenWidth / 20,
                             text: 'Add to Cart',
                           )),
                     ),
                   ),
                 ],
               ),
               Row(
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                 children: [


                   Container(
                     height: Dimension.Screenheight / 12,
                     width: Dimension.ScreenWidth*0.95,
                     decoration: BoxDecoration(
                         boxShadow: [
                           BoxShadow(
                               color: Colors.black12,
                               offset: Offset(0, 1),
                               blurRadius: 2)
                         ],
                         color: Colors.deepOrange.shade500,
                         borderRadius: BorderRadius.circular(10)),
                     child: Center(
                         child:Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                             children: [
                               Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.center,
                                 children: [ SmalText(TextColor: Colors.white, text: "${Controller.InCartItem} Items", size: 15),BigText(
                                   TextColor: Colors.white,
                                   size: Dimension.ScreenWidth / 25,
                                   text: '₹ ${Controller.InCartItem*50} plus Taxes',
                                 ),],),
                               Container(
                                   height: Dimension.Screenheight / 15,
                                   width: Dimension.Screenheight / 15,
                                   decoration: BoxDecoration(
                                       boxShadow: [
                                         BoxShadow(
                                             color: Colors.black12,
                                             offset: Offset(0, 1),
                                             blurRadius: 2)
                                       ],
                                       color: Colors.white,
                                       borderRadius: BorderRadius.circular(Dimension.Screenheight / 15,)),
                                   child: Icon(Icons.favorite,color: Colors.red.shade700,)
                               ),
                             ],),
                         )),
                   ),
                 ],
               ),
             ],),
           height: Dimension.Screenheight / 5,
           decoration: BoxDecoration(
               boxShadow: [
                 // BoxShadow(
                 //     color: Colors.black45, offset: Offset(0, 3), blurRadius: 10)
               ],
               color: Colors.blueGrey.shade100,
               borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft: Radius.circular(50))),
         );})

    );
  }
}
