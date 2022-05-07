import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vim_shop/Page/Acount_Page.dart';
import 'package:vim_shop/Page/Authentication/Sign_in_Page.dart';
import 'package:vim_shop/Page/Authentication/Signup_Page.dart';
import 'package:vim_shop/Page/Cart.dart';
import 'package:vim_shop/Page/MainPage.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:vim_shop/Page/Splash/SplashScreen.dart';
import 'package:vim_shop/Weidgets/Route_helper.dart';
import 'package:vim_shop/Weidgets/colors.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedindex=0;
  List Pages=[
    MyApp(),
    // SignupPage(),
    // SignInPage(),
    // Container(child: Center(child: Text("nacpa 1")),),
    // SplashScreen(),
    Container(child: Center(child: Text("nacpa 2")),),
    Container(child: Center(child: Text("nacpa 3")),),
    Acount_Page()

  ];
  void OnTap(int x){
    setState(() {
      _selectedindex=x;
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Pages[_selectedindex],
    bottomNavigationBar:  BottomNavigationBar(
      selectedItemColor:AppColor.MainColor,unselectedItemColor: Colors.blueGrey,onTap:OnTap ,currentIndex: _selectedindex,showSelectedLabels: false,showUnselectedLabels: false,
      items: const
    [
      BottomNavigationBarItem(icon: Icon(Icons.home),label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.menu),label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label: 'home'),
      BottomNavigationBarItem(icon: Icon(Icons.person),label: 'home'),

    ],),);
  }
}
