import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';

class FillContainer extends StatelessWidget {
  FillContainer(
      {Key? key,
        required this.TEXTColor,
        required this.IconColor,
        required this.Info,
        required this.IconId})
      : super(key: key);
  IconData IconId;
  String Info;
  Color IconColor;
  Color TEXTColor;

  @override
  Widget build(BuildContext context) {
    return Container(
        child: TextField(
            controller: TextEditingController(),
            decoration: InputDecoration(
              prefixIcon: Icon(
                IconId,
                color: IconColor,size: Dimension.hight10*2.5,
              ),
              hintText: Info,hintStyle: TextStyle(fontSize: 15,color: Colors.grey,letterSpacing: 1.2,fontWeight: FontWeight.w500),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(30),
                borderSide: BorderSide(color: Colors.white),
              ),
            )),
        margin: EdgeInsets.all(10),
        height: Dimension.hight10 * 6,
        width: double.maxFinite,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  offset: Offset(0, 3),
                  spreadRadius: 3,
                  color: Colors.grey.shade300)
            ]));
  }
}
