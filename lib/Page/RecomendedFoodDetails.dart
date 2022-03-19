import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vim_shop/Weidgets/CustomText.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';

import '../Weidgets/AppIcon.dart';
import '../Weidgets/colors.dart';

class RecomendedFoodDetails extends StatelessWidget {
  const RecomendedFoodDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
       Scaffold(
      body: CustomScrollView(
        slivers: [
        SliverAppBar(toolbarHeight: Dimension.Screenheight/10,
          title:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppIcon(
              icon: Icons.arrow_back,
              Backgroundcolor: Colors.black,
              size: Dimension.hight10*3.5,
              iconcolor: Colors.white,
            ),
            AppIcon(
              icon: Icons.shopping_cart_checkout,
              Backgroundcolor: Colors.black,
              size: Dimension.hight10*3.5,
              iconcolor: Colors.white,
            )
          ],
        ),
          bottom: PreferredSize(preferredSize: Size.fromHeight(20),
        child: Container( height: Dimension.hight10*4,width: double.maxFinite,
          decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.only(topLeft: Radius.circular(Dimension.hight10*4),topRight: Radius.circular(Dimension.hight10*4))),
          child: Center(child: BigText(TextColor: Colors.black38, size: Dimension.hight10*3, text: 'Indian side',)),
        ),),
          expandedHeight: Dimension.Screenheight/2.5,pinned: true,backgroundColor: Colors.yellow.shade100,
          flexibleSpace: FlexibleSpaceBar( background: Image.asset("assets/image/food11.png",fit: BoxFit.cover,),

          ),
        ),
         SliverToBoxAdapter(
          child: Padding(
            padding:  EdgeInsets.all(10),
            child: ExpandableText(
              "text and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more t and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more at the end or thet and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more at the end or thet and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more at the end or thet and tapping on it opens the user profile. The text is truncated after bbnmbbnmbbbnmbbtwo lines and can be expanded by tapping on the link show more at the end or theat the end or the text itself. After the text             The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from de Finibus Bonorum et Malorumby Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackhamwas expanded it cannot be collapsed again as no collapseText was provid",
              expandText: " \n ...show more  ",linkColor: AppColor.MainColor,maxLines: 7,animation: true,collapseOnTextTap: true, style: TextStyle(
                fontSize: Dimension.ScreenWidth/23,wordSpacing: 3,color: Colors.blueGrey.shade500 ,height: 2),
            )
          ),
        )

      ],

      ),
         bottomNavigationBar: Container(
           child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Container(
                 height: Dimension.Screenheight / 15,
                 width: Dimension.ScreenWidth / 3,
                 decoration: BoxDecoration(
                     boxShadow: [
                       BoxShadow(
                           color: Colors.black12,
                           offset: Offset(0, 1),
                           blurRadius: 2)
                     ],
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(30)),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                     BigText(
                         TextColor: Colors.black45,
                         text: "+",
                         size: Dimension.ScreenWidth * 0.08),
                     BigText(
                         TextColor: Colors.black45,
                         text: "0",
                         size: Dimension.ScreenWidth * 0.08),
                     BigText(
                         TextColor: Colors.black45,
                         text: "-",
                         size: Dimension.ScreenWidth * 0.08),
                   ],
                 ),
               ),
               Container(
                 height: Dimension.Screenheight / 15,
                 width: Dimension.Screenheight / 15,
                 decoration: BoxDecoration(
                     boxShadow: [
                       BoxShadow(
                           color: Colors.black12,
                           offset: Offset(0, 1),
                           blurRadius: 2)
                     ],
                     color: Colors.white,
                     borderRadius: BorderRadius.circular(30)),
                 child: Icon(Icons.favorite,color: Colors.red.shade700,)
               ),
               Container(
                 height: Dimension.Screenheight / 15,
                 width: Dimension.ScreenWidth / 3,
                 decoration: BoxDecoration(
                     boxShadow: [
                       BoxShadow(
                           color: Colors.black12,
                           offset: Offset(0, 1),
                           blurRadius: 2)
                     ],
                     color: AppColor.MainColor,
                     borderRadius: BorderRadius.circular(30)),
                 child: Center(
                     child: BigText(
                       TextColor: Colors.white,
                       size: Dimension.ScreenWidth / 20,
                       text: 'Add to Cart',
                     )),
               ),
             ],
           ),
           height: Dimension.Screenheight / 8,
           decoration: BoxDecoration(
               boxShadow: [
                 // BoxShadow(
                 //     color: Colors.black45, offset: Offset(0, 3), blurRadius: 10)
               ],
               color: Colors.blueGrey.shade200,
               borderRadius: BorderRadius.circular(30)),
         ),

    );
  }
}
