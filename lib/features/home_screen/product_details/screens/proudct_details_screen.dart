import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../urllaunch.dart';
import '../cubit/products_details_cubit.dart';

class ProductDetailsScreen extends StatefulWidget {
  ProductDetailsScreen({super.key, this.id});
  String? id;
  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  void initState() {
    super.initState();
    context.read<ProductsDetailsCubit>().getProductsDetils(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsDetailsCubit, ProductsDetailsState>(
      listener: (context, state) {},
      builder: (context, statee) {
        var cubit = ProductsDetailsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text("Productdetails".tr(),
                style: Styles.style20.copyWith(color: Colors.black)),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment
                          .start, // Align children to the start
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
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                    child: Swiper(
                                        autoplay: true,
                                        itemCount: cubit.productsModelDetails
                                                ?.data?.images?.length ??
                                            1,
                                        pagination: const SwiperPagination(
                                          alignment: Alignment.bottomCenter,
                                          builder: DotSwiperPaginationBuilder(
                                            color: Colors.grey,
                                            activeColor: Color(0xff205960),
                                          ),
                                        ),
                                        duration: 600,
                                        itemBuilder: (context, index) {
                                          return Image.network(
                                            EndPoints.baseUrlImage +
                                                (cubit.productsModelDetails
                                                        ?.data?.images?[index]
                                                        .toString() ??
                                                    'assets/images/chair.jpg'),
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Image.asset(
                                                  'assets/images/chair.jpg');
                                            },
                                          );
                                          // Image.asset(
                                          //     'assets/images/chair.jpg');
                                        }),
                                  )),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: InkWell(
                                  onTap: () {
                                    cubit.AddAndRemoveFromFavourite(
                                        isAuction: false,
                                        context: context,
                                        productId: cubit
                                            .productsModelDetails?.data?.id
                                            .toString());
                                  },
                                  child: Icon(
                                    Icons.favorite,
                                    color: cubit.productsModelDetails?.data
                                                ?.isFav ==
                                            true
                                        ? AppColors.primary
                                        : Colors.grey[400],
                                  )),
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
                                          Text(
                                              (EasyLocalization.of(context)!
                                                          .locale
                                                          .languageCode ==
                                                      'ar')
                                                  ? (cubit.productsModelDetails
                                                          ?.data?.titleAr ??
                                                      'arabic')
                                                  : (cubit.productsModelDetails
                                                          ?.data?.titleEn ??
                                                      'english'),
                                              style: Styles.style18.copyWith(
                                                  color:
                                                      AppColors.secondPrimary)),
                                          Spacer(),
                                          Align(
                                              alignment: Alignment.topLeft,
                                              child: Flexible(
                                                  child: Text(
                                                cubit.productsModelDetails?.data
                                                        ?.price
                                                        .toString() ??
                                                    "T-Shirt",
                                                style: Styles.style16,
                                              )))
                                        ],
                                      ),
                                      Text(
                                        (EasyLocalization.of(context)!
                                                    .locale
                                                    .languageCode ==
                                                'ar')
                                            ? (cubit.productsModelDetails?.data
                                                    ?.descriptionAr ??
                                                'arabic')
                                            : (cubit.productsModelDetails?.data
                                                    ?.descriptionEn ??
                                                'english'),
                                        // (EasyLocalization.of(context)!.locale.languageCode == 'ar') ? (cubit.adesnceModel?.data?[0].descriptionAr ?? '') : (cubit.adesnceModel?.data?[0].descriptionEn ?? ''),
                                        maxLines: 2,
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 16,
                                          overflow: TextOverflow.ellipsis,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                          (EasyLocalization.of(context)!
                                                      .locale
                                                      .languageCode ==
                                                  'ar')
                                              ? (cubit.productsModelDetails
                                                      ?.data?.shopSubCat ??
                                                  'arabic')
                                              : (cubit.productsModelDetails
                                                      ?.data?.shopSubCat ??
                                                  'english'),
                                          style: Styles.style18.copyWith(
                                              color: AppColors.secondPrimary)),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                              width: MediaQuery.sizeOf(context).width,
                              height: 2.0.sp,
                              color: Colors.grey[300]),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Table(
                            border: TableBorder.all(
                              color: Colors.grey[300]!,
                              width: 1,
                              style: BorderStyle.solid,
                            ),
                            children: [
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                ),
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text(
                                      'Availablesizes'.tr(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  TableCell(
                                    verticalAlignment:
                                        TableCellVerticalAlignment.middle,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Center(
                                            child: Text(
                                              cubit.productsModelDetails?.data
                                                      ?.props?.size
                                                      .toString() ??
                                                  '',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              TableRow(
                                children: [
                                  TableCell(
                                    child: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Text(
                                        "colors".tr(),
                                        style: Styles.style14,
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Text(
                                            cubit.productsModelDetails?.data
                                                    ?.props?.color
                                                    .toString() ??
                                                "red",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.sizeOf(context).width,
                            height: 100.h,
                            decoration: BoxDecoration(
                              color: Colors.white60,
                              borderRadius: BorderRadius.circular(20.0),
                              border: Border.all(
                                color: Colors
                                    .grey[300]!, // Set the color of the border
                                width: 2.0, // Set the width of the border
                              ),
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                        color: Colors
                                            .red, // Set the border color here
                                        width: 1, // Set the border width here
                                      ),
                                    ),
                                    child: ClipRRect(
                                        child: Image.network(
                                      EndPoints.baseUrlImage +
                                          (cubit.productsModelDetails?.data
                                                  ?.vendor?.logo
                                                  .toString() ??
                                              ''),
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/images/chair.jpg',
                                          scale: 10,
                                        );
                                      },
                                    )),
                                  ),
                                ),
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 8.0, top: 6),
                                        child: Text(cubit.productsModelDetails
                                                ?.data?.vendor?.name ??
                                            "محلات كيدز"),
                                      ),
                                      Row(
                                        children: [
                                          RatingBar.builder(
                                            initialRating: double.parse(cubit
                                                    .productsModelDetails
                                                    ?.data
                                                    ?.rate
                                                    .toString() ??
                                                "0"),
                                            minRating: 1,
                                            direction: Axis.horizontal,
                                            allowHalfRating: true,
                                            itemCount: 5,
                                            itemPadding: EdgeInsets.symmetric(
                                                horizontal: 4.0),
                                            itemBuilder: (context, _) => Icon(
                                              Icons.star,
                                              color: Colors.amber,
                                            ),
                                            onRatingUpdate: (rating) {
                                              print(rating);
                                            },
                                            itemSize: 20.0,
                                            tapOnlyMode:
                                                true, // Disable tapping to change the rating
                                            updateOnDrag: false,
                                            ignoreGestures: true,
                                          ),
                                          SizedBox(
                                            width: 15.w,
                                          ),
                                          CallIcon(
                                            phoneNumber: cubit
                                                    .productsModelDetails
                                                    ?.data
                                                    ?.vendor
                                                    ?.phone
                                                    ?.toString() ??
                                                '0123',
                                          ),
                                          SizedBox(width: 6.w),
                                          Image.asset(
                                              "assets/images/typing.png")
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors
                                  .red, // Set the background color of the button to red
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(40.0),
                              ),
                              minimumSize: Size(double.infinity, 50),
                            ),
                            child: Center(
                              child: Text('Addtocart'.tr(),
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0.sp)),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
        // } else {
        //   return const Center(child: Text("no data"));
        // }
      },
    );
  }
}
