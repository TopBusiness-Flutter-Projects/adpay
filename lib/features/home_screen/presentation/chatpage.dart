import 'package:adpay/features/home_screen/presentation/widgets/bubble-widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../config/routes/app_routes.dart';
class chatpage extends StatelessWidget {
  const chatpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
             Navigator.pop(context);

          },
            child: Icon(Icons.arrow_back_ios_sharp,color:Colors.white)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blueGrey,
        
        title: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Image.asset(
            "assets/images/logo.png",
            height: 30,
          ),
          Text("chat"),
        ]),
      
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(child: ListView.builder(itemBuilder: (context, index) {
            return BublleChat();
          })),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onSubmitted: (data) async {},
              decoration: InputDecoration(
                  hintText: "send message",
                  suffixIcon: Icon(Icons.send),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16))),
            ),
          )
        ],
      ),
    );
  }
}
