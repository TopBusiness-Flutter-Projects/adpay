import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/styles.dart';
import '../component/bestseller.dart';
import '../component/catogreyCard.dart';
import '../controller/home/home_cubit.dart';
import '../controller/home/home_state.dart';

class Grage_Screen extends StatefulWidget {
  const Grage_Screen({super.key});

  @override
  _Grage_ScreenState createState() => _Grage_ScreenState();
}

class _Grage_ScreenState extends State<Grage_Screen> {
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
    builder: (context, statee) {
    if (statee is LoadedADS) {

    HomeCubit cubit = HomeCubit.get(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child:InkWell(
                      onTap: (){
                        Navigator.pop(context);
                      },
                        child: Icon(Icons.arrow_back)),
                  ),
                  title: Text("garage".tr(), style: Styles.style20.copyWith(color: Colors.black)),
                ),
              ),
              // CategoryCard(
              //   onCategorySelected: (index) {
              //     setState(() {
              //       selectedCategoryIndex = index;
              //     });
              //   },
            //  ),
              SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: selectedCategoryIndex == 0
                      ? GridView.builder(

                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: statee.homeModel!.data!.auctions!.length,
                    itemBuilder: (BuildContext context, int index) {
                          return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 150.w,
                          height: 300.h,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color:
                                Colors.grey.withOpacity(0.005), // Lighter shadow color
                                blurRadius: 2,
                                offset: Offset(0, 1),
                              ),
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: Colors.black.withOpacity(0.05), // Lighter shadow color
                              width: 2,
                            ),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Flexible(
                                fit: FlexFit.tight,
                                child: Image.asset(
                                  index == 0
                                      ? 'assets/images/chair.jpg' // Replace with your hoodie image path
                                      : 'assets/images/clothes.jpg', // Replace with your outfit image path
                                ),
                              ),
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(top: 2.0),
                                child: Text(
                                  (EasyLocalization.of(context)!
                                      .locale
                                      .languageCode ==
                                      'ar')
                                      ? (cubit.homeModel?.data?.auctions?[index]
                                      .titleAr ??
                                      '')
                                      : (cubit.homeModel?.data?.auctions?[index]
                                      .titleEn ??
                                      ''),
                                  maxLines: 1,
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    overflow: TextOverflow.ellipsis,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Flexible(
                                      fit: FlexFit.loose,
                                      child: Text(
statee.homeModel!.data!.auctions![index]!.price.toString(),
                                        maxLines: 1,
                                        style: TextStyle(
                                          overflow: TextOverflow.ellipsis,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,

                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amber,
                                          size: 18,
                                        ),
                                        SizedBox(width: 4),
                                        Text(
                                          statee.homeModel!.data!.auctions![index]!.catId.toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },



                  )
                      :selectedCategoryIndex == 1 ? GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    padding: EdgeInsets.all(16),
                    children: [
                      BestSeller(),
                      BestSeller(),

                    ],
                  )
                      :Container()
              ),
            ],
          ),
        ),
      ),
    );
  }
    else {
      return const Center(child: Text("no data"));
    }
    },
    );
  }
}
