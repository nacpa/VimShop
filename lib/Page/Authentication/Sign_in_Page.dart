import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:vim_shop/Weidgets/Route_helper.dart';

import '../../Weidgets/CustomSnackBar.dart';
import '../../Weidgets/CustomText.dart';
import '../../Weidgets/Dimensions.dart';
import '../../Weidgets/TextField.dart';
import '../../Weidgets/colors.dart';
import 'Signup_Page.dart';
// import '../../Weidgets/CustomSnackBargets/colors.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    var EmailController = TextEditingController();
    var PassWordcontroller = TextEditingController();

    List img = ["t.png", "g.png", "f.png"];

    void SignIn() {
      String Email = EmailController.text.trim();
      String Password = PassWordcontroller.text.trim();

      if (Email.isEmpty) {
        CustomSnackBar("Email can't be Empty", "please Fill valid mail",
            Colors.red, Colors.white);
      } else if (Password.isEmpty) {
        CustomSnackBar("Password can't be Empty", "please Fill valid Password",
            Colors.red, Colors.white);
      } else if (!GetUtils.isEmail(Email)) {
        CustomSnackBar(
            "Wrong Email ", "please Fill valid mail", Colors.red, Colors.white);
      } else {
        _auth
            .signInWithEmailAndPassword(email: Email, password: Password)
            .then((value) {
          Get.offNamed(RouteHelper.initial);
          print("Im the Current User${_auth.currentUser}");
        }).onError((error, stackTrace) {
          CustomSnackBar("Error", error.toString(), Colors.red, Colors.white);
        });
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    height: Dimension.hight10 * 20,
                    width: Dimension.hight10 * 20,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage("assets/image/logo part 1.jpg"))),
                  ),
                  BigText(
                      TextColor: Colors.black.withOpacity(0.7),
                      text: "Hello    ",
                      size: Dimension.hight10 * 10),
                  Text(
                    "SignIn to Your Account   ",
                    style: TextStyle(
                        color: Colors.deepPurple.shade300, fontSize: 20),
                  ),
                  SizedBox(
                    height: Dimension.hight10 * 3,
                  ),
                  FillContainer(
                      textController: EmailController,
                      TEXTColor: Colors.grey,
                      IconColor: Colors.deepPurple,
                      Info: "Email",
                      IconId: Icons.email),
                  FillContainer(
                      textController: PassWordcontroller,
                      TEXTColor: Colors.grey,
                      IconColor: Colors.deepOrange,
                      Info: "PassWord",
                      IconId: Icons.password),
                  SizedBox(
                    height: Dimension.hight10 * 3,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            SignIn();
                          },
                          child: Container(
                            height: Dimension.ScreenWidth / 6,
                            width: Dimension.ScreenWidth / 3,
                            decoration: BoxDecoration(
                              color: AppColor.MainColor,
                              borderRadius: BorderRadius.circular(
                                  Dimension.ScreenWidth / 6),
                            ),
                            child: Center(
                                child: Text(
                              "SIGN-IN",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: Dimension.hight10 * 2.3,
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.5),
                            )),
                          ),
                        ),
                        SizedBox(
                          height: Dimension.hight10 * 3,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an Acoount? ",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.grey)),
                            GestureDetector(
                                onTap: () {
                                  Get.to(SignupPage());
                                },
                                child: Text("Create! ",
                                    style: TextStyle(
                                        fontSize: 20, color: Colors.black)))
                          ],
                        )
                      ]),
                ],
              ),
            ),
          ),
          Positioned(
              child: Opacity(
            opacity: 0.2,
            child: Container(
              color: Colors.orange,
              width: double.maxFinite,
              height: double.maxFinite,
              child: Lottie.network(
                  "https://assets1.lottiefiles.com/packages/lf20_snmohqxj/lottie_step2/data.json"),
            ),
          )),
        ],
      ),
    );
  }
}
