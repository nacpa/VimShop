import 'package:flutter/material.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import 'package:vim_shop/Weidgets/colors.dart';

import '../../Weidgets/CustomText.dart';
import '../../Weidgets/TextField.dart';

class SignupPage extends StatelessWidget {
  const SignupPage({Key? key}) : super(key: key);

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
              FillContainer(
              TEXTColor: Colors.grey,
              IconColor: Colors.blueGrey,
              Info: "Email",
              IconId: Icons.email),
              FillContainer(
              TEXTColor: Colors.grey,
              IconColor: Colors.deepOrange,
              Info: "PassWord",
              IconId: Icons.password),
              FillContainer(
              TEXTColor: Colors.grey,
              IconColor: Colors.green,
              Info: "Name",
              IconId: Icons.person),
              FillContainer(
              TEXTColor: Colors.grey,
              IconColor: Colors.deepPurple,
              Info: "Mobile No",
              IconId: Icons.phone),
              SizedBox(height: Dimension.hight10*3,),
              Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                Container(height: Dimension.ScreenWidth/6,width: Dimension.ScreenWidth/3,
                  decoration: BoxDecoration(
                    color: AppColor.MainColor,borderRadius: BorderRadius.circular(Dimension.ScreenWidth/6),
                  ),child: Center(child: Text("SIGN UP",style: TextStyle(color: Colors.white,fontSize: Dimension.hight10*2.3,fontWeight: FontWeight.bold,letterSpacing: 1.5),)),),
                SizedBox(height: Dimension.hight10,),
                Text("Already have an Acoount? ",style: TextStyle(fontSize: 20,color: Colors.grey)), SizedBox(height: Dimension.hight10*2,),
                Text("Signup using one of them ",style: TextStyle(fontSize: 15,color: Colors.grey.shade500),),
                Wrap(children: List.generate(3, (index) => Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: CircleAvatar(radius: 25,backgroundImage: AssetImage("assets/image/"+img[index]),),
                )),)],),
            ],
          ),
        ),
      ),
    );
  }
}

