import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vim_shop/Page/colors.dart';
import 'package:vim_shop/Weidgets/CustomText.dart';
import 'Icon&TextWidget.dart';

class PageBody extends StatefulWidget {
  const PageBody({Key? key}) : super(key: key);


  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController pageController=PageController(viewportFraction: 0.87);
    return Container(
      height: size.height/3,
      color: Colors.white,
      child: PageView.builder(

        controller: pageController,
          itemCount: 5,
          itemBuilder: (context, position) {
            return _Pageitem(position);
          }),
    );
  }

  Widget _Pageitem(int index) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [Align(alignment: Alignment.topCenter,
        child: Container(
    height:size.height/5,
        width: size.width,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/image/food1$index.png")),
            color: index.isEven ? Colors.deepOrangeAccent : Colors.black,
            borderRadius: BorderRadius.circular(30)),
    ),
      ),
        Align( alignment: Alignment.bottomCenter,
          child: Container(child: Container(

            margin: EdgeInsets.all(10),
            child: Column(crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigText(TextColor: Colors.black45, text: 'Chiniese Side ', size:size.width*0.05),
                SizedBox(height: 10,),
                Row( children: [
                  Wrap(
                    children: List.generate(5, (index) =>  Icon(Icons.star,color: AppColor.MainColor,size: size.width*0.04,))),
                  SizedBox(width: 10,),
                  SmalText(TextColor: Colors.black26, text: '4.5', size: size.width*0.03),
                  SizedBox(width: 10,),
                  SmalText(TextColor: Colors.black26, text: '1276   Comments', size:size.width*0.03),
                ],),
                SizedBox(height: 15,),
                Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconAndTextWeidget(icon: Icons.circle_sharp, Text: 'Normal', iconColor: Colors.orange, textcolor: Colors.black26, Size: size.width*0.03),
                    // SizedBox(width: 5,),
                    IconAndTextWeidget(icon: Icons.pin_drop, Text: 'Lucknow', iconColor: AppColor.MainColor, textcolor: Colors.black26, Size: size.width*0.03),
                    // SizedBox(width: 5,),
                    IconAndTextWeidget(icon: Icons.access_time_rounded, Text: '32 min', iconColor: Colors.red, textcolor: Colors.red.shade200, Size: size.width*0.03),
                  ],
                )
              ],
            ),

          ),

            height:size.height/7,
            width: size.width*0.7,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(

                color: index.isEven ? Colors.white : Colors.white,
                borderRadius: BorderRadius.circular(20)),
          ),
        )
      ],);
  }
}
