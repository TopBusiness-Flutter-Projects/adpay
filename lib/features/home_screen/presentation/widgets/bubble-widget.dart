import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BublleChat extends StatelessWidget {
  const BublleChat({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal:16,vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(32) ,
                    topLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                  color:Colors.blueGrey
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Hello i am nono",style: TextStyle(color:Colors.white),),
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Expanded(
            child: Container(
              margin: EdgeInsets.symmetric(horizontal:16,vertical: 8),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight:Radius.circular(32) ,
                    topLeft: Radius.circular(32),
                    bottomLeft: Radius.circular(32),
                  ),
                  color:Colors.grey[300]
              ),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Text("Hello  nonddddddddddddddddo"),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
