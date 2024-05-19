import 'package:flutter/material.dart';

class CustomIconAppBar extends StatelessWidget {
  const CustomIconAppBar({Key? key,required this.onTap,required this.icon}) : super(key: key);
final Function onTap;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return  InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[300],
          shape: BoxShape.circle,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(icon,color: Colors.black),
        ),
      ),
    );
  }
}
