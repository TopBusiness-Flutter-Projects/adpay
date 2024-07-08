import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/show_dialog.dart';
import '../../../../core/utils/styles.dart';
import '../../../../core/widgets/network_image.dart';
import '../../../urllaunch.dart';
import '../../products/cubit/products_cubit.dart';
import '../cubit/tager_cubit.dart';

class TagerScreen extends StatefulWidget {
  const TagerScreen({super.key});

  @override
  State<TagerScreen> createState() => _TagerScreenState();
}

class _TagerScreenState extends State<TagerScreen> {
  @override
  void initState() {
    currentIdX;
    context.read<TagerCubit>().getVendor();
    super.initState();
  }

  late int currentIdX = -1;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TagerCubit, TagerState>(
      listener: (context, state) {},
      builder: (context, state) {
        TagerCubit cubit = TagerCubit.get(context);
        return SafeArea(
          child: Scaffold(
            body: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      width: 400.w,
                      height: 150.h,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.5 / 3,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset('assets/images/chair.jpg'),
                      ),
                    ),
                    ListTile(
                      leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                      ),
                      title: Text("Merchantaccount".tr(),
                          style: Styles.style16.copyWith(color: Colors.white)),
                    ),
                  ],
                ),
                Row(
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
                          child: Image.asset(
                            'assets/images/chair.jpg',
                            scale: 10,
                          ),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 8.0, top: 6),
                          child: Text(
                              cubit.vendorModel?.data?.vendor?.name.toString() ?? ""),
                        ),
                        Row(
                          children: [
                            RatingBar.builder(
                              initialRating: 0,
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                              itemSize: 20.0,
                              tapOnlyMode: true,
                              updateOnDrag: false,
                              ignoreGestures: true,
                            ),
                            SizedBox(width: 50.w),
                            CallIcon(phoneNumber: '01288143936'),
                            SizedBox(width: 6.w),
                            Image.asset("assets/images/typing.png")
                          ],
                        ),
                      ],
                    ),
                  ],
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 10),
                  child: SizedBox(
                    height: 30.h,
                    child: ListView.builder(
                      itemCount: cubit.vendorModel?.data?.vendor?.shopSubCat?.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        final subCatId = cubit.vendorModel?.data?.vendor?.shopSubCat?[index].toString() ?? "1";
                        final subCatIdInt = int.tryParse(subCatId) ?? 1;
                        return GestureDetector(
                          onTap: () {
                            cubit.getVendor(text: subCatId);
                            setState(() {
                              currentIdX = index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 2),
                            width: MediaQuery.sizeOf(context).width / 4,
                            decoration: BoxDecoration(
                              color: currentIdX == index
                                  ? AppColors.primary
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                subCatId,
                                maxLines: 1,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: AppColors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                currentIdX==-1?
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("الكل ",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15.sp),),
                ):Container(),
                Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: cubit.vendorModel?.data?.products?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, Routes.ProductsDetails,
                                arguments: context.read<ProductsCubit>().product?.id.toString() ?? "1");
                          },
                          child: Container(
                            width: 150.w,
                            height: 150.h,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.005),
                                  blurRadius: 2,
                                  offset: Offset(0, 1),
                                ),
                              ],
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                color: Colors.black.withOpacity(0.05),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  fit: FlexFit.tight,
                                  child: ManageNetworkImage(
                                    imageUrl: "",
                                  ),
                                ),
                                Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.only(top: 2.0, right: 5.0),
                                  child: Text(
                                    (EasyLocalization.of(context)!.locale.languageCode == 'ar')
                                        ? (cubit.vendorModel?.data?.products?[index].titleAr ?? 'arabic')
                                        : (cubit.vendorModel?.data?.products?[index].titleEn ?? 'english'),
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
                                          (EasyLocalization.of(context)!.locale.languageCode == 'ar')
                                              ? (cubit.vendorModel?.data?.products?[index].descriptionAr ?? 'arabic')
                                              : (cubit.vendorModel?.data?.products?[index].descriptionEn ?? 'english'),
                                          maxLines: 1,
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 4),
                                      Text(
                                        cubit.vendorModel?.data?.products?[index]?.price?.toString() ?? "",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                // Spacer(),
              ],
            ),
            bottomNavigationBar:    Padding(
              padding: const EdgeInsets.all(10.0),
              child: SizedBox(
                width: 300.w,
                child: ElevatedButton(
                  onPressed: () {
                    createProgressDialog2(context, "adPay");
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset("assets/images/star.png"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Text(
                          "MerchantRating".tr(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
