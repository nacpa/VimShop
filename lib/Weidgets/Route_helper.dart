import 'package:get/get.dart';
import 'package:vim_shop/Page/Cart.dart';
import 'package:vim_shop/Page/PopularFoodDetails.dart';
import 'package:vim_shop/Page/RecomendedFoodDetails.dart';
import 'package:vim_shop/Page/Splash/SplashScreen.dart';
import 'package:vim_shop/Page/Splash/SplashScreen.dart';

import '../Page/MainPage.dart';
import '../Page/homePAge.dart';

class RouteHelper{

  static const String initial= "/" ;
  static const String SplashPage="/SplashPage";
  static const String PopularFood= "/Popular" ;
  static const String Recomended= "/Recommended" ;
  static const String CartPage="/cartPage";
  static String getPopularProduct (int PageId)=> '$PopularFood?PageId=$PageId';
  static String getRecommendedProduct (int PageId)=> '$Recomended?PageId=$PageId';
  static String  getCartPAge ()=> CartPage  ;
  static String GetInitial()=> initial;
  static String GetSplash()=> SplashPage;

  static List<GetPage> Routes =[
    GetPage(name: initial, page: (){return homePage();},transition: Transition.zoom),
    GetPage(name: SplashPage, page:(){return SplashScreen();},transition: Transition.zoom ),

    GetPage(name:Recomended , page:() {
      var PageId=Get.parameters['PageId'];
      return RecomendedFoodDetails(PageId: int.parse(PageId!), ); },transition: Transition.zoom ),


    GetPage(name: PopularFood, page: () {
      var PageId=Get.parameters['PageId'];
      return PopularFoodDetails(PageId:int.parse(PageId!));
      },
      transition: Transition.zoom,
    ),
    GetPage(name: CartPage, page: (){return Cart_menu();},transition: Transition.zoom


    )];
}