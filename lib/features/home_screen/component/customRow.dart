import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/styles.dart';

class CustomRow extends StatelessWidget {
   CustomRow({super.key,required this.text1,required this.text2});
String text1;
   String text2;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Text(text1,style:
      //TextStyle(color:AppColors.secondPrimary,fontSize: 20,fontWeight:FontWeight.w500),
      Styles.style20),
      Spacer(),
      Text(text2,style: Styles.style18)
    ],);
    ;
  }
}
