import 'package:get/get.dart';
import 'package:vim_shop/Weidgets/Constants.dart';

class ApiClient extends GetConnect implements GetxService{
 late String token =AppConstants.Token;
final String appbaseUrl;
late Map<String,String> _mainHeaders;
  ApiClient( {required this.appbaseUrl } ){
    baseUrl=appbaseUrl;                                    //Getx pakaage management system
    timeout=Duration(seconds: 30);
    // _mainHeaders={};

  }
  Future<Response> getData(String uri)  async{
    try{
     Response response= await get (uri);         // we are using GetX method not http request;   // Nacpa : 20/03/2022
     return response;                   // get(uri) only required end url ,bcz base url is already intialized

    }catch(x){
      return Response( statusCode: 1,statusText: x.toString(),);
    }

}

}