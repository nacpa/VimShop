import 'package:get/get.dart';
import 'package:vim_shop/Models/Product_model.dart';

import '../Data/Repositories/Recommended_product_repo.dart';


class RecommendedProductController extends GetxController{
  final recommendedProductRepo RecommendedProductRepo;

  RecommendedProductController({ required this.RecommendedProductRepo});
  bool isLoaded=false;

  List<dynamic> _RecommendedProductList=[];
  List<dynamic> get RecommendedProductList =>_RecommendedProductList;
  Future <void> getRecommendedProductList() async {

    Response response= await RecommendedProductRepo.getRecommendedProductList();
    if(response.statusCode==200){
      // print("got Responce");
      _RecommendedProductList=[];
      _RecommendedProductList.addAll(Product.fromJson(response.body).products);
      isLoaded=true;
      // print(_PopulatProductList);
      update();
    }else{

    }

  }
}