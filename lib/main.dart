import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vim_shop/Page/RecomendedFoodDetails.dart';
import 'Page/MainPage.dart';
import 'Page/PageDetails.dart';
import 'helper/Dependies.dart' as Dep;

Future<void>  main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Dep.init();
  // runApp(GetMaterialApp(home:  PageDatails(),));
  // runApp(GetMaterialApp( debugShowCheckedModeBanner: false,
    // home:  RecomendedFoodDetails(),));
  runApp( MyApp());


}



class Sample extends StatelessWidget {

  const Sample({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(body: Container(child: Text('hjhj',overflow: TextOverflow.ellipsis,),)),
    );
  }
}


