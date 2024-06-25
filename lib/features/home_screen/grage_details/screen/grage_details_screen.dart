import 'package:adpay/config/routes/app_routes.dart';
import 'package:adpay/features/home_screen/grage_details/screen/widgets/comments_widget.dart';
import 'package:adpay/features/home_screen/grage_details/screen/widgets/send_message.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../../../urllaunch.dart';
import '../../component/customRow.dart';
import '../../product_details/cubit/products_details_cubit.dart';
import '../cubit/grage_details_cubit.dart';

class GrageDetailsScreen extends StatefulWidget {
  GrageDetailsScreen({super.key, this.id});
  String? id;

  @override
  State<GrageDetailsScreen> createState() => _GrageDetailsScreenState();
}

class _GrageDetailsScreenState extends State<GrageDetailsScreen> {
  void initState() {
    super.initState();
    context.read<GrageDetailsCubit>().getGrageDetils(id: widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductsDetailsCubit, ProductsDetailsState>(
      builder: (context, state) {
        var cubit2 = context.read<ProductsDetailsCubit>();
        return BlocBuilder<GrageDetailsCubit, GrageDetailsState>(
          builder: (context, state) {
            GrageDetailsCubit cubit = GrageDetailsCubit.get(context);

            return SafeArea(
              child: Scaffold(
                bottomSheet: SendMessage(),
                body: (cubit.grageModelDetails == null)
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : SingleChildScrollView(
                        physics: BouncingScrollPhysics(),
                        child: Column(
                          children: [
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
                                    style: Styles.style20
                                        .copyWith(color: Colors.black)),
                              ),
                            ),
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
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                              child: Container(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.5 /
                                                    3,
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                decoration: BoxDecoration(
                                                    //   color: Color(0xfff6f6f6),
                                                    color: Colors.white,
                                                    // color:Colors.blue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30)),
                                                child: Swiper(
                                                    autoplay: true,
                                                    itemCount:
                                                        //   cubit.productsModelDetails?.data?.images!.length ??
                                                        1,
                                                    pagination:
                                                        const SwiperPagination(
                                                      alignment: Alignment
                                                          .bottomCenter,
                                                      builder:
                                                          DotSwiperPaginationBuilder(
                                                        color: Colors.grey,
                                                        activeColor:
                                                            Color(0xff205960),
                                                      ),
                                                    ),
                                                    duration: 600,
                                                    itemBuilder:
                                                        (context, index) {
                                                      return
                                                        Image.network(
                                                        EndPoints.baseUrlImage +
                                                            (cubit.grageModelDetails?.images[index]
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
                                                      // return Image.asset(
                                                      //     'assets/images/chair.jpg');
                                                    }
                                                    ),
                                              )),
                                        ),
                                        Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: InkWell(
                                                onTap: () {
                                                  cubit2
                                                      .AddAndRemoveFromFavourite(
                                                          isAuction: true,
                                                          context: context,
                                                          productId: cubit
                                                              .grageModelDetails
                                                              ?.id
                                                              .toString());
                                                },
                                                child: Icon(
                                                  Icons.favorite,
                                                  color: cubit.grageModelDetails
                                                              ?.isFav ==
                                                          true
                                                      ? AppColors.primary
                                                      : Colors.grey[400],
                                                )))
                                      ],
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Flexible(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment
                                                .start, // Align children to the start
                                            children: [
                                              Row(
                                                children: [
                                                  Flexible(
                                                    child: Text(
                                                        (EasyLocalization.of(
                                                                        context)!
                                                                    .locale
                                                                    .languageCode ==
                                                                'ar')
                                                            ? (cubit.grageModelDetails
                                                                    ?.titleAr
                                                                    .toString() ??
                                                                'arabic')
                                                            : (cubit.grageModelDetails
                                                                    ?.titleEn ??
                                                                'english'),
                                                        maxLines: 1,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        style: Styles.style18
                                                            .copyWith(
                                                          color: AppColors
                                                              .secondPrimary,
                                                        )),
                                                  ),
                                                  Spacer(),
                                                  Flexible(
                                                    child: Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          cubit.grageModelDetails
                                                                  ?.id
                                                                  .toString() ??
                                                              "تيشيرت",
                                                          style: Styles.style16,
                                                          maxLines: 1,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                        )),
                                                  )
                                                ],
                                              ),
                                              Text(
                                                (EasyLocalization.of(context)!
                                                            .locale
                                                            .languageCode ==
                                                        'ar')
                                                    ? (cubit.grageModelDetails
                                                            ?.descriptionAr ??
                                                        'arabic')
                                                    : (cubit.grageModelDetails
                                                            ?.descriptionEn ??
                                                        'english'),
                                                // (EasyLocalization.of(context)!.locale.languageCode == 'ar') ? (cubit.adesnceModel?.data?[0].descriptionAr ?? '') : (cubit.adesnceModel?.data?[0].descriptionEn ?? ''),
                                                maxLines: 1,
                                                textAlign: TextAlign.start,
                                                style: TextStyle(
                                                  fontSize: 16,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                  (EasyLocalization.of(context)!
                                                              .locale
                                                              .languageCode ==
                                                          'ar')
                                                      ? (cubit.grageModelDetails
                                                              ?.descriptionAr ??
                                                          'arabic')
                                                      : (cubit.grageModelDetails
                                                              ?.descriptionEn ??
                                                          'english'),
                                                  style: Styles.style18
                                                      .copyWith(
                                                          color: AppColors
                                                              .secondPrimary)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: Container(
                                        width: MediaQuery.sizeOf(context).width,
                                        height: 100.h,
                                        decoration: BoxDecoration(
                                          color: Colors.white60,
                                          borderRadius:
                                              BorderRadius.circular(20.0),
                                          border: Border.all(
                                            color: Colors.grey[
                                                300]!, // Set the color of the border
                                            width:
                                                2.0, // Set the width of the border
                                          ),
                                        ),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(10.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  border: Border.all(
                                                    color: Colors
                                                        .red, // Set the border color here
                                                    width:
                                                        1, // Set the border width here
                                                  ),
                                                ),
                                                child: ClipRRect(
                                                    child: Image.network(
                                             
                                                      (cubit.grageModelDetails
                                                              ?.id
                                                              ?.toString() ??
                                                          ''),
                                                  errorBuilder: (context, error,
                                                      stackTrace) {
                                                    return Image.asset(
                                                      'assets/images/chair.jpg',
                                                      scale: 10,
                                                    );
                                                  },
                                                )),
                                              ),
                                            ),
                                            Flexible(
                                              child: Row(
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 5.0, top: 6),
                                                    child: Flexible(
                                                      child: Text(
                                                          cubit.grageModelDetails
                                                                  ?.titleAr
                                                                  .toString() ??
                                                              "محلات كيدز",
                                                          style:
                                                              Styles.style14),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 20.w,
                                                  ),
                                                  CallIcon(
                                                    phoneNumber: '01288143936',
                                                  ),
                                                  SizedBox(width: 6.w),
                                                  InkWell(
                                                    onTap: () {
                                                      Navigator.pushNamed(
                                                        context,
                                                        Routes.chatapp,
                                                      );
                                                    },
                                                    child: Image.asset(
                                                        "assets/images/typing.png"),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: InkWell(
                                        onTap: () {
                                          Navigator.pushNamed(
                                              context, Routes.allcomments);
                                        },
                                        child: CustomRow(
                                            text1: "comments".tr(),
                                            text2: "all".tr()),
                                      ),
                                    ),
                                    cubit.grageModelDetails!.comments.isEmpty
                                        ? Center(
                                            child: Text("No_Comments",
                                                style: TextStyle(
                                                    color: AppColors.primary)))
                                        : ListView.builder(
                                            shrinkWrap: true,
                                            physics: BouncingScrollPhysics(),
                                            itemBuilder: (context, index) {
                                              final comment = cubit
                                                  .grageModelDetails
                                                  ?.comments[index];
                                              if (comment != null) {
                                                return CommentsWidget(
                                                    comment: comment);
                                              } else {
                                                return SizedBox
                                                    .shrink(); // Return an empty widget if the comment is null
                                              }
                                            },
                                            itemCount: (cubit.grageModelDetails!
                                                        .comments!.length >
                                                    5)
                                                ? 5
                                                : cubit.grageModelDetails
                                                    ?.comments.length,
                                          ),
                                    SizedBox(
                                      height: 100.h,
                                    )
                                  ]
                              ),
                            ))
                          ],
                        ),
                      ),
              ),
            );
          },
        );
      },
    );
  }
}
