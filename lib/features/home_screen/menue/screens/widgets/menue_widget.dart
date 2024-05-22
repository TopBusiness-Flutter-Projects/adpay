import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

class MenueWidget extends StatelessWidget {
   MenueWidget({super.key, required this.text,required this.path});
String? text;
String? path;
  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset('${path}'),
            ),
            Text("${text}"),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset("assets/images/arrow.png"),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Divider(),
        )
      ],
    );
  }
}
