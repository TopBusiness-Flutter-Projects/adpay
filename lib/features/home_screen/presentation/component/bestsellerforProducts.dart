import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../controller/home/home_cubit.dart';
import '../controller/home/home_state.dart';

class BestSellerforProducts extends StatelessWidget {
  const BestSellerforProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, statee) {
        if (statee is LoadedADS) {

          HomeCubit cubit = HomeCubit.get(context);
          return SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: statee.homeModel!.data!.products!.length,
              itemBuilder: (context, index) {
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
                                ? (cubit.homeModel?.data?.products?[index]
                                .titleAr ??
                                '')
                                : (cubit.homeModel?.data?.products?[0]
                                .titleEn ??
                                ''),

                            maxLines: 1,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 16,
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
                                fit: FlexFit.tight,
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

