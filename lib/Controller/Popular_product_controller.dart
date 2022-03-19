import 'package:get/get.dart';
import 'package:vim_shop/Data/Repositories/Popular_product_reppo.dart';
import 'package:vim_shop/Models/Product_model.dart';

class PopularProductController extends GetxController{
  final PopularProductRepo popularProductRepo;

  PopularProductController({ required this.popularProductRepo});
  bool isLoaded=false;

  List<dynamic> _PopulatProductList=[];
  List<dynamic> get PopulatProductList =>_PopulatProductList;
  Future <void> getPopularProductList() async {
   Response response= await popularProductRepo.getPopolarProductList();
   if(response.statusCode==200){
     // print("got Responce");
     _PopulatProductList=[];
     _PopulatProductList.addAll(Product.fromJson(response.body).products);
     isLoaded=true;
     // print(_PopulatProductList);
     update();
   }else{

   }

  }
}