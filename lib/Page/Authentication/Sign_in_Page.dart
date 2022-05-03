import 'package:flutter/material.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import 'package:vim_shop/Weidgets/colors.dart';

import '../../Weidgets/CustomText.dart';
import '../../Weidgets/TextField.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List img=["t.png","g.png","f.png"

    ];
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          child: Column(mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(height: Dimension.hight10*20,width: Dimension.hight10*20,decoration: BoxDecoration(image: DecorationImage(fit: BoxFit.fill,image: AssetImage("assets/image/logo part 1.jpg"))),
              ),
              BigText(TextColor: Colors.black.withOpacity(0.7), text: "Hello    ", size: Dimension.hight10*10),
              Text("SignIn to Your Account   ",style: TextStyle(color: Colors.deepPurple.shade300,fontSize: 20),),
              SizedBox(height: Dimension.hight10*3,),


              FillContainer(
                  TEXTColor: Colors.grey,
                  IconColor: Colors.deepPurple,
                  Info: "Mobile No",
                  IconId: Icons.phone),
              FillContainer(
                  TEXTColor: Colors.grey,
                  IconColor: Colors.deepOrange,
                  Info: "PassWord",
                  IconId: Icons.password),


              SizedBox(height: Dimension.hight10*3,),
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                Container(height: Dimension.ScreenWidth/6,width: Dimension.ScreenWidth/3,
                  decoration: BoxDecoration(
                    color: AppColor.MainColor,borderRadius: BorderRadius.circular(Dimension.ScreenWidth/6),
                  ),child: Center(child: Text("SIGN-IN",style: TextStyle(color: Colors.white,fontSize: Dimension.hight10*2.3,fontWeight: FontWeight.bold,letterSpacing: 1.5),)),),
                SizedBox(height: Dimension.hight10*3 ,),
                Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [ Text("Don't have an Acoount? ",style: TextStyle(fontSize: 20,color: Colors.grey)), Text("Create! ",style: TextStyle(fontSize: 20,color: Colors.black))],)
                ]),
            ],
          ),
        ),
      ),
    );
  }
}

