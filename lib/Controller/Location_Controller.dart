import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vim_shop/Data/Repositories/Location_Repo.dart';
import 'package:vim_shop/Models/Adress_Model.dart';

class LocationControler extends GetxController  implements GetxService{

  final LocationRepo locationRepo;
  LocationControler({required this.locationRepo});
  bool  _Loading=false;
  late Position _position;
  late Position _PickPosition;
  Placemark _placemark=Placemark();
  Placemark _PickPlacemark =Placemark();
  List<AdressModel>addressList=[];
  List<AdressModel> get AddressList=>addressList;
  late List<AdressModel>AlladdressList=[];
  List<String> AdressTypeList=["Home","office","Others"];
  int AdreesTypeIndex=0;
  late Map<String,dynamic> _getAddress;
  Map get getAddress=>_getAddress;
  bool _updateAdressdata=true;


  late GoogleMapController _MapControler;
  bool get loading=> _Loading;
  Position get position=>_position;
  Position get pickPosition=>_PickPosition;



  void SetMapController( GoogleMapController mapController)async {
    _MapControler=mapController;

  }
  void updatePosition(CameraPosition cameraPosition,bool bool){
    if(_updateAdressdata){
      update();
      try{
        if(true){
          _position=Position(longitude: position.longitude, latitude: position.longitude, timestamp: DateTime.now(), accuracy: 1, altitude: 1, heading: 1, speed: 1, speedAccuracy: 1);

        }

      }catch(e){

      }
    }


  }

}