import 'package:get/get.dart';
import 'package:vim_shop/Data/Api/Api_client.dart';
import 'package:vim_shop/Weidgets/Constants.dart';

class recommendedProductRepo extends GetxService{
  final ApiClient apiClient;

  recommendedProductRepo( { required this.apiClient});

  Future <Response> getRecommendedProductList () async{
    return await apiClient.getData(AppConstants.APP_Recommended_Products_URL);

  }


}