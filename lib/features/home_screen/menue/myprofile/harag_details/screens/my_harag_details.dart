import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../config/routes/app_routes.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../../../../component/custom_elevated_button.dart';

class MyHaragDetails extends StatelessWidget {
  const MyHaragDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
                child: Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListTile(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(Icons.arrow_back)),
          ),
          title: Text("Productdetails".tr(),
              style: Styles.style20.copyWith(color: Colors.black)),
        ),
      ),
      Container(
          child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                  crossAxisAlignment:
                      CrossAxisAlignment.start, // Align children to the start
                  children: [
                    Stack(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: Container(
                              width: 400.w,
                              height: 200.h,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Container(
                                height: MediaQuery.of(context).size.height *
                                    0.5 /
                                    3,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    //   color: Color(0xfff6f6f6),
                                    color: Colors.white,
                                    // color:Colors.blue,
                                    borderRadius: BorderRadius.circular(30)),
                                child: Swiper(
                                    autoplay: true,
                                    itemCount: 3,
                                    pagination: const SwiperPagination(
                                      alignment: Alignment.bottomCenter,
                                      builder: DotSwiperPaginationBuilder(
                                        color: Colors.grey,
                                        activeColor: Color(0xff205960),
                                      ),
                                    ),
                                    duration: 600,
                                    itemBuilder: (context, index) {
                                      return Image.asset(
                                          'assets/images/teshirt.png');
                                    }),
                              )),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: InkWell(
                              onTap: () {
                                Navigator.pushNamed(
                                    context, Routes.editmyharagdetails);
                              },
                              child: Image.asset("assets/images/edit3.png")),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Flexible(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start, // Align children to the start
                                children: [
                                  Row(
                                    children: [
                                      Text("",
                                          style: Styles.style18.copyWith(
                                              color: AppColors.secondPrimary)),
                                      Spacer(),
                                      Align(
                                          alignment: Alignment.topLeft,
                                          child: Flexible(
                                              child: Text(
                                            "ريال500",
                                            style: Styles.style16,
                                          )))
                                    ],
                                  ),
                                  Text(
                                    'تيشيرت مستعمل',
                                    maxLines: 2,
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 16,
                                      overflow: TextOverflow.ellipsis,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text("تيشيرت", style: Styles.style18),
                                  Text(
                                    "nonjbjbjbjbjhsbdhbhhshcbcbjknjknkjnjknknkskncknskcnskjcnsjkcnsjkcnkjnscnjknkjnjknjknkjnkjnhshdcschbcbhschschbchsdbo",
                                    maxLines: 2,
                                    style: Styles.style12,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(
                                    height: 80.0.h,
                                  ),
                                  CustomElevatedButton(
                                    text: 'Sold'.tr(),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ])))
    ]))));
  }
}
