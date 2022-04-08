import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vim_shop/Page/PopularFoodDetails.dart';
import 'package:vim_shop/Page/RecomendedFoodDetails.dart';
import 'Page/MainPage.dart';
import 'Weidgets/Route_helper.dart';
import 'helper/Dependies.dart' as Dep;

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dep.init();

  runApp(GetMaterialApp( debugShowCheckedModeBanner: false,

    initialRoute: RouteHelper.initial,
    getPages: RouteHelper.Routes,
    home:  MyApp(),));



}




