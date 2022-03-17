import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vim_shop/Page/Page_Body.dart';
import 'package:vim_shop/Weidgets/CustomText.dart';
import 'colors.dart';
import 'Icon&TextWidget.dart';
// import 'page_Body.dart';
import 'Page_Body.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: SafeArea(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                margin: EdgeInsets.only(left: 5, right: 5, top: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        BigText(
                            TextColor: AppColor.MainColor,
                            text: ' India ',
                            size: 25),
                        Row(mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SmalText(
                                TextColor: Colors.black26,
                                text: 'city',
                                size: 16),
                            GestureDetector(onTap: null, child: Icon(Icons.arrow_drop_down)),
                          ],
                        )

                      ],
                    ),
                    Container(
                        decoration: BoxDecoration(
                            color: AppColor.MainColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          iconSize: 30,
                        ))
                  ],
                ),
              ),
            ),
            // Container( decoration: BoxDecoration(color: Colors.deepOrangeAccent),height: 200,)
            PageBody(),

          ],
        )),
      ),
    );
  }
}
