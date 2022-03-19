// import 'dart:ffi';

import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:vim_shop/Weidgets/AppIcon.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import '../Weidgets/CustomText.dart';
import '../Weidgets/Dimensions.dart';
import '../Weidgets/AppIcon.dart';
import 'package:get/get.dart';
import 'package:expandable_text/expandable_text.dart';
import '../Weidgets/Icon&TextWidget.dart';
import '../Weidgets/colors.dart';

class PageDatails extends StatelessWidget {
  const PageDatails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        bottomNavigationBar: Container(
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
                    BigText(
                        TextColor: Colors.black45,
                        text: "+",
                        size: size.width * 0.08),
                    BigText(
                        TextColor: Colors.black45,
                        text: "0",
                        size: size.width * 0.08),
                    BigText(
                        TextColor: Colors.black45,
                        text: "-",
                        size: size.width * 0.08),
                  ],
                ),
              ),
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
                    color: AppColor.MainColor,
                    borderRadius: BorderRadius.circular(30)),
                child: Center(
                    child: BigText(
                  TextColor: Colors.white,
                  size: size.width / 20,
                  text: 'Add to Cart',
                )),
              ),
            ],
          ),
          height: size.height / 8,
          decoration: BoxDecoration(
              boxShadow: [
                // BoxShadow(
                //     color: Colors.black45, offset: Offset(0, 3), blurRadius: 10)
              ],
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(30)),
        ),
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
                        image: AssetImage('assets/image/food12.png'))),
              ),
            ),
            Positioned(
                top: size.height / 15,
                left: size.width / 15,
                right: size.width / 15,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppIcon(
                      icon: Icons.arrow_back,
                      Backgroundcolor: Colors.black,
                      size: 40,
                      iconcolor: Colors.white,
                    ),
                    AppIcon(
                      icon: Icons.shopping_cart_checkout,
                      Backgroundcolor: Colors.black,
                      size: 40,
                      iconcolor: Colors.white,
                    )
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
                                  text: 'Chiniese Side ',
                                  size: size.width * 0.05),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Wrap(
                                      children: List.generate(
                                          5,
                                          (index) => Icon(
                                                Icons.star,
                                                color: AppColor.MainColor,
                                                size: size.width * 0.04,
                                              ))),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  SmalText(
                                      TextColor: Colors.black26,
                                      text: '4.5',
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
                              child: ExpandableText(
                                  "text and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more t and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more at the end or thet and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more at the end or thet and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more at the end or thet and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more at the end or theat the end or the text itself. After the text             The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorumby Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackhamwas expanded it cannot be collapsed again as no collapseText was provid",
                                  expandText: " \n ...show more  ",linkColor: AppColor.MainColor,maxLines: 5,animation: true,collapseOnTextTap: true, style: TextStyle(
                                  fontSize: size.width/23,wordSpacing: 3,color: Colors.blueGrey.shade500),
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
