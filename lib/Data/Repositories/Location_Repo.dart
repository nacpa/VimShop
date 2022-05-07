import 'package:shared_preferences/shared_preferences.dart';
import 'package:vim_shop/Data/Api/Api_client.dart';

class LocationRepo{
  final SharedPreferences sharedPreferences;
  final ApiClient apiClient;


  LocationRepo({required this.sharedPreferences,required this.apiClient});


}