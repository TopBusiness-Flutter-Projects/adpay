import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/styles.dart';
import '../../component/catogreyCard.dart';
import '../cubit/shop_cubit.dart';

class Shop_Screen extends StatefulWidget {
  Shop_Screen({super.key, this.id});
  String? id;

  @override
  _Shop_ScreenState createState() => _Shop_ScreenState();
}

class _Shop_ScreenState extends State<Shop_Screen> {
  @override
  void initState() {
    super.initState();
    context.read<ShopCubit>().getShop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                    child: Icon(Icons.arrow_back),
                  ),
                ),
                title: Text(
                  "theShop".tr(),
                  style: Styles.style20.copyWith(color: Colors.black),
                ),
              ),
            ),
            CategoryCard(
              currentId: int.parse('0'),
            ),
            SizedBox(height: 5.h),
            Expanded(child: ShopsCategory()), // Use Expanded here
          ],
        ),
      ),
    );
  }
}

class ShopsCategory extends StatelessWidget {
  const ShopsCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ShopCubit, ShopState>(
      listener: (context, state) {},
      builder: (context, state) {
        if (state is LoadedShop) {
          ShopCubit cubit = ShopCubit.get(context);
          return GridView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 1.0, // Reduced vertical spacing even further
              crossAxisSpacing: 1.0,
              childAspectRatio: 1 / 1,
            ),
            itemCount: state.shopModel!.data!.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(
                children: [
                  Container(
                    width: 100.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        EndPoints.baseUrlImage +
                            (cubit.shopModel?.data?[index].image.toString() ?? ''),
                        errorBuilder: (context, error, stackTrace) {
                          return Image.asset('assets/images/chair.jpg');
                        },scale:50
                      ),
                    ),
                  ),
                  Text(
                    (EasyLocalization.of(context)!.locale.languageCode == 'ar')
                        ? (cubit.shopModel?.data?[index].titleAr ?? '')
                        : (cubit.shopModel?.data?[index].titleEn ?? ''),
                    style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              );
            },
          );
        } else {
          return const Center(child: Text("no data"));
        }
      },
    );
  }
}
