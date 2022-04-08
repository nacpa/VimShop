import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vim_shop/Controller/Popular_product_controller.dart';
import 'package:vim_shop/Controller/Recommended_product_Comtroller.dart';
import 'package:vim_shop/Models/Product_model.dart';
import 'package:vim_shop/Weidgets/Constants.dart';
import 'package:vim_shop/Weidgets/Route_helper.dart';
import 'package:vim_shop/Weidgets/colors.dart';
import 'package:vim_shop/Weidgets/CustomText.dart';
import 'package:vim_shop/Weidgets/Dimensions.dart';
import '../Weidgets/Icon&TextWidget.dart';

class PageBody extends StatefulWidget {
  const PageBody({Key? key}) : super(key: key);

  @override
  _PageBodyState createState() => _PageBodyState();
}

class _PageBodyState extends State<PageBody> {

  PageController pageController=PageController(viewportFraction: 0.87);
  var _CurrentPage=0.0;

  @override


  void initState() {
    // TODO: implement initState
    super.initState();
    pageController.addListener(() {
      setState(() {
        _CurrentPage=pageController.page!;
      });
    });
  }
late int member=8;
  @override
  Widget build(BuildContext context) {
    // print(MediaQuery.of(context).size.width );
    // print(MediaQuery.of(context).size.height );
    Size size = MediaQuery.of(context).size;
    return Column(children: [
      GetBuilder<PopularProductController>(builder: (PopularProduct){
        return
      PopularProduct.isLoaded? Container(
        height: size.height/3,
        color: Colors.white,
        child: PageView.builder(
            controller: pageController,
            itemCount:  PopularProduct.PopulatProductList.length>=1 ?  PopularProduct.PopulatProductList.length:1,
            itemBuilder: (context, position) {
              return _Pageitem(position,PopularProduct.PopulatProductList[position],PopularProduct);
            }),
      ):
      CircularProgressIndicator(color:AppColor.MainColor,);
       }),
      GetBuilder<PopularProductController>(builder: (PopularProduct){
        return DotsIndicator(
          dotsCount: PopularProduct.PopulatProductList.length>=1 ?  PopularProduct.PopulatProductList.length:1 ,
          position:_CurrentPage,
          decorator: DotsDecorator(
            size: const Size.square(9.0),
            activeSize: const Size(18.0, 9.0),
            activeShape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
          ),
        );

      }),
      SizedBox(height: Dimension.Screenheight/81),
      Container( margin: EdgeInsets.all(Dimension.Screenheight/50),
        child: Row(crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            BigText(TextColor: Colors.black45, text: "Recommended", size: Dimension.Screenheight/38),
            SizedBox(width: Dimension.Screenheight/81,),
            Container(margin: EdgeInsets.only(bottom: 3),
                child: SmalText(TextColor: Colors.black45, text: '.', size: Dimension.Screenheight/38)),
            SizedBox(width: Dimension.Screenheight/81,),

            Padding(
              padding: const EdgeInsets.only(bottom: 4),
              child: SmalText(TextColor: Colors.black26, text: 'food Paring', size: Dimension.ScreenWidth*0.03),
            ),
          ],
        ),
      ),
      GetBuilder<RecommendedProductController>(builder: (RecomendedProduct){
        return  RecomendedProduct.isLoaded?
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: ListView.builder(itemCount: RecomendedProduct.RecommendedProductList.length,
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (context,index)=>

                  GestureDetector(onTap: (){
                    Get.toNamed(RouteHelper.getRecommendedProduct(index));},
                    child: Container(child: Row(
                      children: [
                        // BigText(TextColor: Colors.black12, text: index.toString(), size:20 ),  //index no
                        Padding(
                          padding:  EdgeInsets.all(Dimension.Screenheight/81),
                          child: Container(height: Dimension.Screenheight/7,width: Dimension.ScreenWidth/3,

                            decoration: BoxDecoration(boxShadow:[BoxShadow(color: Colors.black12,offset: Offset(0,5),blurRadius: 2)],
                                borderRadius: BorderRadius.circular(Dimension.Screenheight/40),
                                image: DecorationImage(fit: BoxFit.fill,
                                    image:  NetworkImage(AppConstants.APP_base_URL+"/uploads/"+RecomendedProduct.RecommendedProductList[index].img))),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(color: Colors.grey.shade300 ,offset: Offset(0,3),blurRadius:5)], borderRadius: BorderRadius.circular(Dimension.Screenheight/50)),height: Dimension.Screenheight/9,width: Dimension.ScreenWidth*0.55,
                          child: Padding(
                            padding:  EdgeInsets.all(Dimension.Screenheight/100),
                            child: Column(crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                BigText(TextColor: Colors.black45, text: RecomendedProduct.RecommendedProductList[index].name!, size: Dimension.Screenheight/50),
                                SmalText(TextColor: Colors.black26, text: RecomendedProduct.RecommendedProductList[index].description, size: Dimension.ScreenWidth*0.03),
                                Row( mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    IconAndTextWeidget(icon: Icons.circle_sharp, Text: 'Normal', iconColor: Colors.orange, textcolor: Colors.black26, Size: size.width*0.03),
                                    SizedBox(width: Dimension.ScreenWidth/30,),                         IconAndTextWeidget(icon: Icons.pin_drop, Text: "lucknow", iconColor: AppColor.MainColor, textcolor: Colors.black26, Size: size.width*0.03),
                                    SizedBox(width: Dimension.ScreenWidth/30,),
                                    IconAndTextWeidget(icon: Icons.access_time_rounded, Text: '32 min', iconColor: Colors.red, textcolor: Colors.red.shade200, Size: size.width*0.03),
                                  ],
                                )
                              ],),
                          ),)
                      ],
                    ),

                    ),
                  )
          ),
        ) :CircularProgressIndicator(color: AppColor.MainColor,);
      }),





    ],);
  }



  Widget _Pageitem(int index,Products_Models populatProduct, PopularProductController popularProduct,   ) {

    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [Align(alignment: Alignment.topCenter,
        child: GestureDetector(onTap: (){}
          ,
          child: Container(
    height:size.height/4.5,
          width: size.width,
          margin: EdgeInsets.all(Dimension.ScreenWidth/60),
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(AppConstants.APP_base_URL+"/uploads/"+populatProduct.img!)),
              color: index.isEven ? Colors.deepOrangeAccent : Colors.black,
              borderRadius: BorderRadius.circular(30)),
    ),
        ),
      ),
        GestureDetector(onTap: (){
          Get.offNamed(RouteHelper.getPopularProduct(index));},
          child: Align( alignment: Alignment.bottomCenter,
            child: Container(
              child: Container(

              margin: EdgeInsets.all(10),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigText(TextColor: Colors.black45, text: populatProduct.name!, size:size.width*0.05),
                  SizedBox(height: 10,),
                  Row( children: [
                    Wrap(
                      children: List.generate(populatProduct.stars!, (index) =>  Icon(Icons.star,color: AppColor.MainColor,size: size.width*0.04,))),
                    SizedBox(width: 10,),
                    SmalText(TextColor: Colors.black26, text: populatProduct.stars.toString(), size: size.width*0.03),
                    SizedBox(width: 10,),
                    SmalText(TextColor: Colors.black26, text: '1276   Comments', size:size.width*0.03),
                  ],),
                  SizedBox(height: 15,),
                  Row( mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconAndTextWeidget(icon: Icons.circle_sharp, Text: 'Normal', iconColor: Colors.orange, textcolor: Colors.black26, Size: size.width*0.04),
                      SizedBox(width: Dimension.ScreenWidth/30,),
                      IconAndTextWeidget(icon: Icons.pin_drop, Text: '1.3Km', iconColor: AppColor.MainColor, textcolor: Colors.black26, Size: size.width*0.04),
                      SizedBox(width: Dimension.ScreenWidth/30,),
                      IconAndTextWeidget(icon: Icons.access_time_rounded, Text: '32 min', iconColor: Colors.red, textcolor: Colors.red.shade200, Size: size.width*0.04),
                    ],
                  )
                ],
              ),

            ),

              height:size.height/7,
              width: size.width*0.7,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                   boxShadow: [BoxShadow(color: Colors.black12,offset: Offset(0,6),blurRadius: 5,)],

                  color: index.isEven ? Colors.white : Colors.white,
                  borderRadius: BorderRadius.circular(20)),
            ),
          ),
        )
      ],);
  }
}
