import 'package:flutter/cupertino.dart';
import 'package:vim_shop/Weidgets/CustomText.dart';


class IconAndTextWeidget extends StatelessWidget {
 IconAndTextWeidget({Key? key, required this.icon, required this.Text, required this.iconColor, required this.textcolor,required this.Size
  }) : super(key: key);
  final IconData icon;
  final String Text;
  final Color iconColor;
  final Color textcolor;
  double Size ;


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon,color: iconColor,),
        SizedBox(width: 10,),
        SmalText(TextColor: textcolor, text:Text , size: Size)

      ],
    )
      ;
  }
}


