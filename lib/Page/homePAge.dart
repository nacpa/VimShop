import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vim_shop/Page/Acount_Page.dart';
import 'package:vim_shop/Page/MainPage.dart';
import 'package:vim_shop/Weidgets/colors.dart';

import 'Address/AddAdressPage.dart';

class homePage extends StatefulWidget {
  const homePage({Key? key}) : super(key: key);

  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  int _selectedindex = 0;
  List Pages = [MyApp(), Adresspage(), Acount_Page()];

  void OnTap(int x) {
    setState(() {
      _selectedindex = x;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Pages[_selectedindex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: AppColor.MainColor,
        unselectedItemColor: Colors.blueGrey,
        onTap: OnTap,
        currentIndex: _selectedindex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'home'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'home'),
        ],
      ),
    );
  }
}
