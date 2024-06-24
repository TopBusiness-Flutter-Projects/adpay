import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/features/home_screen/presentation/salla/cubit/salla_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/models/get_cart_model.dart';
import '../../../../../core/utils/get_size.dart';
import '../../../../../core/utils/hex_color.dart';
import '../../../../../core/utils/styles.dart';

class SallaScreen extends StatefulWidget {
  const SallaScreen({super.key});

  @override
  State<SallaScreen> createState() => _SallaScreenState();
}

class _SallaScreenState extends State<SallaScreen> {
  @override
  void initState() {
    context.read<SallaCubit>().getCart();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SallaCubit, SallaState>(
      builder: (context, state) {
        var cubit = context.read<SallaCubit>();
        return SafeArea(
            child: Scaffold(
                body: (state is SallaLoading)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Column(children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            title: Text("basket".tr(),
                                style: Styles.style20
                                    .copyWith(color: Colors.black)),
                          ),
                        ),
                        Flexible(
                          fit:FlexFit.tight,
                          //main scrooll >>have
                          child: ListView.builder(
                            itemCount: cubit.cartModel?.data!.length,
                            shrinkWrap: true,
                            physics: const BouncingScrollPhysics(),
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  CustomCartWidget(
                                    model: cubit.cartModel!.data![index],
                                  ),
                                ],
                              );
                            },
                          ),
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "total".tr(),
                                    style: Styles.style16
                                        .copyWith(color: Colors.black),
                                  ),
                                  Text(
                                    "total",
                                    // cubit.cartModel?.data![index].carts?[index].total.toString()??"",
                                    style: Styles.style16
                                        .copyWith(color: Colors.black),
                                  )
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () {},
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                Colors.red, // لون الزر
                                          ),
                                          child: Text(
                                            "الغاء",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.sp),
                                          )),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ElevatedButton(
                                          onPressed: () {
                                            cubit.onTapConfirm(context);
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: AppColors
                                                .secondPrimary, // لون الزر
                                          ),
                                          child: Text("completeorder".tr(),
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp))),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        )
                      ])));
      },
    );
  }
}

class CustomCartWidget extends StatefulWidget {
  CustomCartWidget({
    super.key,
    required this.model,
  });
GetCartModelData model;

  @override
  State<CustomCartWidget> createState() => _CustomCartWidgetState();
}

class _CustomCartWidgetState extends State<CustomCartWidget> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      print("nono");
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    var cubit = context.read<SallaCubit>();

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              // height: 300.h,
              margin: EdgeInsets.only(top: getSize(context) / 24),
              width: getSize(context),
              decoration: BoxDecoration(
                  color: Colors.white, // Background color
                  border: Border.all(
                    color: Colors.red, // Border color
                    width: 2.0, // Border width
                  ),
                  borderRadius: BorderRadius.circular(20.0), // Border radius
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.01), // Shadow color
                      spreadRadius: 5, // Spread radius
                      blurRadius: 7, // Blur radius
                      offset: Offset(0, 2), // Shadow position
                    ),
                  ]),
              // didnt have scroll
              child: Column(
                children: [
                  SizedBox(
                    // height: 200.h,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),

                      padding: EdgeInsets.only(top: getSize(context) / 8),
                      itemBuilder: (BuildContext context, int index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: 100.w,
                              height: 100.h,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.grey.shade300, // Border color
                                    width: 1.0, // Border width
                                  ),
                                  borderRadius: BorderRadius.circular(15.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey
                                          .withOpacity(0.09), // Shadow color
                                      spreadRadius: 1, // Spread radius
                                      blurRadius: 7, // Blur radius
                                      offset: Offset(0, 2), // Shadow position
                                    ),
                                  ]),
                              child: Row(
                                  //  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child:
                                          Image.asset("assets/images/logo.png"),
                                    ),
                                    Column(
                                      children: [
                                        Text(widget.model.carts?[index].name.toString()??""),
                                        // ElevatedButton(onPressed: (){}, child: Text("hi"))
                                        Container(
                                          height: 30.h,
                                          margin: EdgeInsets.only(
                                              top: getSize(context) / 24),
                                          width: getSize(context) / 2.7,
                                          decoration: BoxDecoration(
                                            color: Colors
                                                .white, // Background color
                                            border: Border.all(
                                              color: Colors.red, // Border color
                                              width: 2.0, // Border width
                                            ),
                                            borderRadius: BorderRadius.circular(
                                                20.0), // Border radius
                                            // boxShadow: [
                                            //   BoxShadow(
                                            //     color: Colors.grey.withOpacity(0.3), // Shadow color
                                            //     spreadRadius: 5, // Spread radius
                                            //     blurRadius: 7, // Blur radius
                                            //     offset: Offset(0, 2), // Shadow position
                                            //   ),
                                            // ]),
                                          ),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              // IconButton(
                                              //   icon: Icon(Icons.add),
                                              //   onPressed: _incrementCounter,
                                              // ),
                                              InkWell(
                                                  onTap: () {
                                                    // setState(() {
                                                    //   _counter++;
                                                    // });
                                                 cubit.increment(
                                                   //  model:widget.model?.carts?[index]
                                                   model:widget.model?.carts?[index]
                                                 );
                                                 //     .then((value) =>     cubit.getCart()
                                                 // );
                                                  },
                                                  child: Image.asset(
                                                      "assets/images/add.png")),
                                              Text(
                                              widget.model.carts![index].qty.toString()??"",
                                                style:
                                                    TextStyle(fontSize: 24.0),
                                              ),
                                              InkWell(
                                                  onTap: () {
                                                    // setState(() {
                                                    //   _counter--;
                                                    // });
                                                    cubit.decrement(
                                                      //  model:widget.model?.carts?[index]
                                                        model:widget.model?.carts?[index]
                                                    );
                                                  },
                                                  child: Image.asset(
                                                      "assets/images/minus.png")),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
"ss",
                                            style: Styles.style16,
                                          ),
                                        ),
                                        InkWell(
                                        onTap:(){
                                     cubit.postDelete(product_id:widget.model.carts?[index].productId.toString() , user_id: widget.model.carts?[index].userId.toString());
                                        },
                                          child: Icon(Icons.delete_outline,
                                              color: AppColors.primary),
                                        )
                                      ],
                                    )
                                  ])),
                        );
                      },
                      itemCount: widget.model.carts?.length,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الاجمالي",
                          style: Styles.style16.copyWith(color: Colors.black),
                        ),
                        Text(
                          context.read<SallaCubit>().cartModel?.data![0].carts![0].total.toString()??"",
                          style: Styles.style16.copyWith(color: Colors.black),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  )
                ],
              )
          ),
        ),
        Positioned(
          top: 0,
          child: Align(
            alignment: Alignment.topCenter,
            child: Center(
              child: Container(
                alignment: Alignment.topCenter,
                height: getSize(context) / 8,
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                decoration: BoxDecoration(
                  color: HexColor('#fdd7cf'),
                  borderRadius: BorderRadius.circular(70.0),
                  border: Border.all(
                    color: Colors.red,
                    width: 2.0,
                  ),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                    widget.model.vendor?.name.toString()??"",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 8.0),
                    // CircleAvatar(
                    //
                    //   child: Image.network(
                    //     (widget.model.vendor?.image
                    //         .toString() ??
                    //         ''),
                    //     errorBuilder: (context, error, stackTrace) {
                    //       return Image.asset('assets/images/logo.png',
                    //         // width: 50.0,
                    //         // height: 50.0,
                    //       );
                    //     },
                    //
                    //   ),
                    // ),
                    CircleAvatar(
                      radius: 50, // You can adjust the radius as needed
                      child: ClipOval(
                        child: Image.network(
                          widget.model.vendor?.image.toString() ?? '',
                          fit: BoxFit.cover, // Ensures the image covers the CircleAvatar
                          errorBuilder: (context, error, stackTrace) {
                            return Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.cover,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
