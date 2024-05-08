import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

import '../../../../core/utils/styles.dart';
import '../component/bestseller.dart';
import 'Categories.dart';

class Products_Screen extends StatelessWidget {
  const Products_Screen({super.key});
  @override
  Widget build(BuildContext context) {
    return     Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(

              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading:Padding(
                      padding: const EdgeInsets.all(8.0),
                      child:Image.asset("assets/images/back.png"),
                    ),
                    title: Text("المنتجات",style: Styles.style20.copyWith(color:Colors.black)),
                  ),
                ),

                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: GridView.count(

                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: EdgeInsets.all(16),
                    children: [
                      // buildGridItem("assets/images/chair.jpg", 'مارك'),
                      // buildGridItem("assets/images/chair.jpg", 'ملابس'),
                      // buildGridItem("assets/images/chair.jpg", 'مارك'),
                      // buildGridItem("assets/images/chair.jpg", 'آثاث'),
                      // buildGridItem("assets/images/chair.jpg", 'ساعات'),
                      // buildGridItem("assets/images/chair.jpg", 'مارك'),
                      BestSeller(),
                      BestSeller(),
                      BestSeller(),
                      BestSeller(),
                      // BestSeller(),
                      // BestSeller(),


                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

  }
}
