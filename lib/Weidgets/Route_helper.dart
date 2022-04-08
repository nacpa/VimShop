import 'package:get/get.dart';
import 'package:vim_shop/Page/PopularFoodDetails.dart';
import 'package:vim_shop/Page/RecomendedFoodDetails.dart';

import '../Page/MainPage.dart';

class RouteHelper{

  static const String initial= "/" ;
  static const String PopularFood= "/Popular" ;
  static const String Recomended= "/Recommended" ;
  static String getPopularProduct (int PageId)=> '$PopularFood?PageId=$PageId';
  static String getRecommendedProduct (int PageId)=> '$Recomended?PageId=$PageId';

  static List<GetPage> Routes =[
    GetPage(name: initial, page: (){return MyApp();},transition: Transition.zoom),
    GetPage(name:Recomended , page:() {
      var PageId=Get.parameters['PageId'];
      return RecomendedFoodDetails(PageId: int.parse(PageId!), ); },transition: Transition.zoom ),

    GetPage(name: PopularFood, page: () {
      var PageId=Get.parameters['PageId'];
      return PopularFoodDetails(PageId:int.parse(PageId!));
      },
      transition: Transition.zoom,
    ),

  ];
}