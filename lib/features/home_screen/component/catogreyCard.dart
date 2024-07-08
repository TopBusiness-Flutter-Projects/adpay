import 'package:adpay/core/utils/app_colors.dart';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

import '../catogries/cubit/catogries_cubit.dart';
import '../garage/cubit/grage_cubit.dart';
import '../products/cubit/products_cubit.dart';
import '../shop/cubit/shop_cubit.dart';


class CategoryCard extends StatefulWidget {
  int currentId;
  CategoryCard({Key, required this.currentId});

  @override
  State<CategoryCard> createState() => _CategoryCardState();
}

class _CategoryCardState extends State<CategoryCard> {
  void initState() {
    currentIdX= widget.currentId;
    context.read<CatogriesCubit>().getCatogries();
    super.initState();
  }
late  int currentIdX;

  @override
  Widget build(BuildContext context) {
    var widthh = MediaQuery.of(context).size.width;
    return BlocBuilder<CatogriesCubit, CatogriesState>(
      builder: (context, statee) {
        if (statee is LoadedCatogries) {
          CatogriesCubit cubit = CatogriesCubit.get(context);
          return SizedBox(
            height: 42.h,
            child:
              ListView.builder(
                itemCount: cubit.catogriesModel?.data?.length ?? 0,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIdX = cubit.catogriesModel?.data?[index].id ?? 1;
                     context.read<ProductsCubit>().getProducts(id: cubit.catogriesModel?.data?[index].id.toString() ?? '1');
                      context.read<GrageCubit>().getGarge(id: currentIdX.toString()??'1' ) ;
                      context.read<ShopCubit>().getShop(id: currentIdX.toString()??'1' );
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: widthh / 3,
                    decoration: BoxDecoration(
                      color:
                      currentIdX == cubit.catogriesModel?.data?[index].id ? AppColors.primary : Colors.grey[300],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        (EasyLocalization.of(context)!.locale.languageCode ==
                                'ar')
                            ? (cubit.catogriesModel?.data?[index]?.titleAr ?? 'T-Shirt')
                            : (cubit.catogriesModel?.data?[index]?.titleEn ?? ''),
                        maxLines: 1,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: currentIdX==
                                  cubit.catogriesModel?.data?[index].id
                              ? AppColors.white
                              : Colors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            );

        } else {
          return Scaffold(body: const Center(child: Text("no data")));
        }
      },
    );
  }
}

// class NextPage2 extends StatelessWidget {
//   const NextPage2({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: CategoryCard(),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 height: MediaQuery.sizeOf(context).height/1.2,
//                 width:MediaQuery.sizeOf(context).width ,
//                 color: Colors.black,
//                 child: Text("two"),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
