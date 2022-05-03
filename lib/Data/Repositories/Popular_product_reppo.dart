import 'package:get/get.dart';
import 'package:vim_shop/Data/Api/Api_client.dart';
import 'package:vim_shop/Weidgets/Constants.dart';

class PopularProductRepo extends GetxService {
  final ApiClient apiClient;

  PopularProductRepo( { required this.apiClient});

  Future <Response> getPopolarProductList () async{
    return await apiClient.getData(AppConstants.APP_popularProducts_URL);

  }




}