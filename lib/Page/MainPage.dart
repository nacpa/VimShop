import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vim_shop/Controller/Popular_product_controller.dart';
import 'package:vim_shop/Controller/Recommended_product_Comtroller.dart';
// import 'package:get/get.dart';
import 'package:vim_shop/Page/Page_Body.dart';
import 'package:vim_shop/Weidgets/CustomText.dart';
import 'package:vim_shop/Weidgets/Route_helper.dart';
import '../Weidgets/colors.dart';
import 'Page_Body.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<RecommendedProductController>().getRecommendedProductList();

    return

       Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BigText(
                            TextColor: AppColor.MainColor,
                            text: ' India ',
                            size: 25),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmalText(
                                TextColor: Colors.black26,
                                text: 'city',
                                size: 16),
                            Icon(Icons.arrow_drop_down),
                          ],
                        )

                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: AppColor.MainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed:null,
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          iconSize: 30,
                        ))
                  ],
                ),
              ),
            ),
            // Container( decoration: BoxDecoration(color: Colors.deepOrangeAccent),height: 200,)
            Expanded(child: SingleChildScrollView(child: PageBody())),


          ],
        )),
      );

  }
}
