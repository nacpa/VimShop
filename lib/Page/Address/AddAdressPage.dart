import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:vim_shop/Controller/Location_Controller.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import 'package:vim_shop/Weidgets/colors.dart';

class Adresspage extends StatefulWidget {
  const Adresspage({Key? key}) : super(key: key);

  @override
  State<Adresspage> createState() => _AdresspageState();
}

class _AdresspageState extends State<Adresspage> {
  TextEditingController addresscontroller = TextEditingController();
  final TextEditingController _ContactPersonsonName = TextEditingController();
  final TextEditingController _ContactPersonName = TextEditingController();
  late bool _isLogged;

  CameraPosition _cameraPosition =
      CameraPosition(target: LatLng(29.9457, 78.1642), zoom: 20);
  late LatLng _initialPosition = LatLng(29.9457, 78.1642);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Get.find<LocationControler>().AddressList.isNotEmpty) {
      _cameraPosition = CameraPosition(
          target: LatLng(
        double.parse(Get.find<LocationControler>().getAddress['latitude']),
        double.parse(Get.find<LocationControler>().getAddress['longitude']),
      ));
      _initialPosition = LatLng(
        double.parse(Get.find<LocationControler>().getAddress['latitude']),
        double.parse(Get.find<LocationControler>().getAddress['longitude']),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Add Address",
          ),
          toolbarHeight: Dimension.hight10 * 6,
          backgroundColor: AppColor.MainColor,
        ),
        body: GetBuilder<LocationControler>(
          builder: (LocationControler) {
            return Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      GoogleMap(
                          zoomControlsEnabled: true,
                          myLocationButtonEnabled: true,
                          myLocationEnabled: true,
                          compassEnabled: true,
                          mapToolbarEnabled: true,
                          onCameraIdle: () {
                            LocationControler.update();
                          },
                          onCameraMove: ((Position) =>
                              _cameraPosition = Position),
                          onMapCreated: (GoogleMapController controller) {},
                          initialCameraPosition: CameraPosition(
                              target: _initialPosition, zoom: 20))
                    ],
                  ),
                  margin: EdgeInsets.all(5),
                  height: Dimension.hight10 * 25,
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(width: 2, color: Colors.red)),
                )
              ],
            );
          },
        ));
  }
}
