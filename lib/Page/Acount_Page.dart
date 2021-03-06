import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vim_shop/Page/Address/AddAdressPage.dart';
import 'package:vim_shop/Page/Authentication/Sign_in_Page.dart';
import 'package:vim_shop/Weidgets/CustomText.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import 'package:vim_shop/Weidgets/colors.dart';

class Acount_Page extends StatelessWidget {
  Acount_Page({Key? key}) : super(key: key);
  final _auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: Dimension.Screenheight / 13,
        shadowColor: Colors.white,
        elevation: 0,
        backgroundColor: AppColor.MainColor,
        title: Text("User Information"),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: Dimension.width10 * 10,
              width: Dimension.width10 * 10,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage("assets/image/user.png")),
                  color: Colors.blueGrey.shade100,
                  borderRadius: BorderRadius.circular(Dimension.width10 * 10)),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    InfoContainer(
                        IconId: Icons.person,
                        Info: _auth.currentUser!.displayName.toString(),
                        IconColor: Colors.deepOrange,
                        TEXTColor: Colors.blue),
                    InfoContainer(
                        IconId: Icons.email,
                        Info: _auth.currentUser!.email.toString(),
                        IconColor: Colors.green,
                        TEXTColor: Colors.black),
                    InfoContainer(
                        IconId: Icons.phone_android_outlined,
                        Info: _auth.currentUser!.phoneNumber ??
                            "Phone No not Added",
                        IconColor: Colors.blueGrey,
                        TEXTColor: Colors.red),
                    GestureDetector(
                        onTap: () {
                          Get.to(Adresspage());
                        },
                        child: InfoContainer(
                            IconId: Icons.location_city,
                            Info: "Select Addres",
                            IconColor: Colors.lightBlueAccent,
                            TEXTColor: Colors.greenAccent)),
                    GestureDetector(
                      onTap: () {
                        _auth.signOut();
                        Get.off(SignInPage(), transition: Transition.cupertino);
                      },
                      child: InfoContainer(
                          IconId: Icons.logout_outlined,
                          Info: "LOGOUT",
                          IconColor: Colors.red,
                          TEXTColor: Colors.red.shade900),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class InfoContainer extends StatelessWidget {
  InfoContainer(
      {Key? key,
      required this.IconId,
      required this.Info,
      required this.IconColor,
      required this.TEXTColor})
      : super(key: key);
  IconData IconId;
  String Info;
  Color IconColor;
  Color TEXTColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.only(left: 10),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                    color: IconColor, borderRadius: BorderRadius.circular(40)),
                child: Icon(IconId, color: Colors.white)),
            SizedBox(
              width: 20,
            ),
            BigText(TextColor: TEXTColor, text: Info, size: 20)
          ],
        ),
        height: Dimension.Screenheight / 12,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.shade200,
                  offset: Offset(0, 5),
                  spreadRadius: 2)
            ]));
  }
}
