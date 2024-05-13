import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/styles.dart';
import 'package:adpay/features/home_screen/presentation/controller/Catogries/catogries_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../controller/home/home_cubit.dart';
import '../controller/home/home_state.dart';

class Catogreisss extends StatefulWidget {

  const Catogreisss({Key });

  @override
  State<Catogreisss> createState() => _CatogreisssState();
}

class _CatogreisssState extends State<Catogreisss> {
  void initState() {
    super.initState();
    context.read<CatogriesCubit>().getCatogries();
  }
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<CatogriesCubit, CatogriesState>(
        listener: (context, state) {},
        builder: (context, statee) {
          if (statee is LoadedCatogries) {
            CatogriesCubit cubit = CatogriesCubit.get(context);
            return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                      leading:Padding(
                        padding: const EdgeInsets.all(8.0),
                    child:InkWell(
                      onTap: (){
                        Navigator.pop(context);                      },
                        child: Icon(Icons.arrow_back)),
                      ),
                    title: Text("التصنيفات",style: Styles.style20.copyWith(color:Colors.black)),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.sizeOf(context).height,
                  child: GridView.builder(
                    padding: EdgeInsets.all(16),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: statee.catogriesModel!.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      return    InkWell(
                        onTap: (){
                          Navigator.pushNamed(
                              context, Routes.ProductssRoute,arguments:cubit.catogriesModel!.data![index].id.toString());
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 3,
                                offset: Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Container(
                            height: 100.h,
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Container(
                                  height: 90.h,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white60,
                                    borderRadius: BorderRadius.circular(200),
                                    border: Border.all(
                                      color: AppColors.primary,
                                      width: 2,
                                    ),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(200),

                                    child: Image.asset(
                                      'assets/images/chair.jpg',
                                    ),
                                  ),
                                ),
                                SizedBox(height: 8.h),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    (EasyLocalization.of(context)!
                                        .locale
                                        .languageCode ==
                                        'ar')
                                        ? (cubit.catogriesModel?.data?[index]?.titleAr
                                        ??
                                        'nono')
                                        : (cubit.catogriesModel?.data?[index]?.titleEn
                                        ??
                                        ''),
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );                    },
                  ),
                ),
              ],
            ),
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

Widget buildGridItem( int index) {
  final imageNames = [
    'chair.jpg',
    'clothes.jpg',
    'chair.jpg',
    'clothes.jpg',
  ];
  final textLabels = [
    'آنث',
    'ساعات',
    'ماركت',
    'ملابس'
  ];
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      boxShadow: [
        BoxShadow(
          color: Colors.grey.withOpacity(0.5),
          spreadRadius: 1,
          blurRadius: 3,
          offset: Offset(0, 2),
        ),
      ],
    ),
    child: Container(
      height: 100.h,
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Container(
            height: 90.h,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white60,
              borderRadius: BorderRadius.circular(200),
              border: Border.all(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(200),

              child: Image.asset(
                'assets/images/${imageNames[index]}',
              ),
            ),
          ),
          SizedBox(height: 8.h),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textLabels[index],
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
