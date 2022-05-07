import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vim_shop/Page/PopularFoodDetails.dart';
import 'package:vim_shop/Page/RecomendedFoodDetails.dart';
import 'package:vim_shop/Page/Splash/SplashScreen.dart';
import 'Page/MainPage.dart';
import 'Page/homePAge.dart';
import 'Weidgets/Route_helper.dart';
import 'helper/Dependies.dart' as Dep;
import '';

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await Dep.init();

  runApp(GetMaterialApp( debugShowCheckedModeBanner: false,

    initialRoute: RouteHelper.GetSplash(),
    getPages: RouteHelper.Routes
    // home:  SplashScreen()))





));}




