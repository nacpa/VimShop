import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class AppIcon extends StatelessWidget {


  AppIcon({Key? key, required this.size, required this.Backgroundcolor, required this.icon, required this.iconcolor  }) : super(key: key);
  final double size;
  final Color Backgroundcolor;
  final Color iconcolor;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: 0.4,
      child: Container(  height: size,width: size,
        decoration: BoxDecoration(color: Backgroundcolor,
          borderRadius: BorderRadius.circular(size/2),),
        child: Center(child: Icon(icon,color: iconcolor,size: size*0.6,)),
      ),
    );
  }
}
