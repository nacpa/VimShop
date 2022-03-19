import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:vim_shop/Controller/Popular_product_controller.dart';
import 'package:vim_shop/Data/Api/Api_client.dart';
import 'package:vim_shop/Data/Repositories/Popular_product_reppo.dart';
import 'package:vim_shop/Weidgets/Constants.dart';

import '../Controller/Recommended_product_Comtroller.dart';
import '../Data/Repositories/Recommended_product_repo.dart';

Future<void> init()async {
  //Repo

Get.lazyPut(()=>ApiClient(appbaseUrl: AppConstants.APP_base_URL));

//ApiClints

Get.lazyPut(() => PopularProductRepo(apiClient: Get.find()));
Get.lazyPut(() => recommendedProductRepo(apiClient: Get.find()));

//Controllers
Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
Get.lazyPut(() => RecommendedProductController(RecommendedProductRepo: Get.find()));

}