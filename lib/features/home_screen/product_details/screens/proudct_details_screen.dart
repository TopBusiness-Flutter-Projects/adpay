import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_strings.dart';
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
      builder: (context, state) {
        var cubit = ProductsDetailsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Productdetails".tr(),
              style: Styles.style20.copyWith(color: Colors.black),
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                height: MediaQuery.of(context).size.height * 0.5 / 3,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Swiper(
                                  autoplay: true,
                                  itemCount: cubit.productsModelDetails?.data?.images?.length ?? 1,
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
                                      cubit.productsModelDetails?.data?.images?[index].toString() ?? 'assets/images/chair.jpg',
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset('assets/images/chair.jpg');
                                      },
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: InkWell(
                              onTap: () {
                                cubit.AddAndRemoveFromFavourite(
                                  isAuction: false,
                                  context: context,
                                  productId: cubit.productsModelDetails?.data?.id.toString(),
                                );
                              },
                              child: Icon(
                                Icons.favorite,
                                color: cubit.productsModelDetails?.data?.isFav == true
                                    ? AppColors.primary
                                    : cubit.productsModelDetails?.data?.isFav == false
                                    ? Colors.grey[400]
                                    : null,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Expanded(
                                          child: Text(
                                            EasyLocalization.of(context)!.locale.languageCode == 'ar'
                                                ? cubit.productsModelDetails?.data?.titleAr ?? 'arabic'
                                                : cubit.productsModelDetails?.data?.titleEn ?? 'english',
                                            style: Styles.style18.copyWith(color: AppColors.secondPrimary),
                                          ),
                                        ),
                                        Text(
                                          "${cubit.productsModelDetails?.data?.price.toString() ?? "T-Shirt"} ${AppStrings.currency}",
                                          style: Styles.style16,
                                        ),
                                      ],
                                    ),
                                    Text(
                                      EasyLocalization.of(context)!.locale.languageCode == 'ar'
                                          ? cubit.productsModelDetails?.data?.descriptionAr ?? 'arabic'
                                          : cubit.productsModelDetails?.data?.descriptionEn ?? 'english',
                                      maxLines: 2,
                                      textAlign: TextAlign.start,
                                      style: TextStyle(
                                        fontSize: 16,
                                        overflow: TextOverflow.ellipsis,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      EasyLocalization.of(context)!.locale.languageCode == 'ar'
                                          ? cubit.productsModelDetails?.data?.shopSubCat ?? 'arabic'
                                          : cubit.productsModelDetails?.data?.shopSubCat ?? 'english',
                                      style: Styles.style18.copyWith(color: AppColors.secondPrimary),
                                    ),
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
                          color: Colors.grey[300],
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
                              color: Colors.grey[300]!,
                              width: 2.0,
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
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    child: Image.network(
                                      cubit.productsModelDetails?.data?.id?.toString() ?? '',
                                      errorBuilder: (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/images/chair.jpg',
                                          scale: 10,
                                        );
                                      },
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 5.0, top: 6),
                                      child: Text(
                                        cubit.productsModelDetails?.data?.titleAr.toString() ?? "محلات كيدز",
                                        style: Styles.style14,
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
                                      child: Image.asset("assets/images/typing.png"),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ElevatedButton(
                          onPressed: () {
                            cubit.addCart();
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(40.0),
                            ),
                            minimumSize: Size(double.infinity, 50),
                          ),
                          child: Center(
                            child: Text(
                              'Addtocart'.tr(),
                              style: TextStyle(color: Colors.white, fontSize: 20.0.sp),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
