import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../config/routes/app_routes.dart';
import '../main_screen/cubit/home_cubit.dart';
import '../main_screen/cubit/home_state.dart';


class Products extends StatefulWidget {
   Products({super.key});
  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
    builder: (context, statee) {
    if (statee is LoadedADS) {
    HomeCubit cubit = HomeCubit.get(context);
    return   InkWell(
      onTap: (){

      },
      child: SizedBox(
        height: 200.h,
        child: GridView.builder(
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 2.0,
            crossAxisSpacing: 2.0,
            childAspectRatio: 1 / 1.4,
          ),
          itemCount: statee.homeModel!.data!.shops!.length,
          itemBuilder: (BuildContext context, int index) {

               return Column(
                   children: [
                     InkWell(
                       onTap: (){
                        Navigator.pushNamed(
                            context, Routes.tagerscreen,
                        );
                       },
                       child: Container(
                         width: 100.w,
                         height: 70.h,
                         decoration: BoxDecoration(
                           color: Colors.black,
                           borderRadius: BorderRadius.circular(30),
                         ),
                         child: ClipRRect(
                           borderRadius: BorderRadius.circular(5),
                           child: Image.asset(
                             "assets/images/Rectangle.png",
                             fit: BoxFit.cover,
                           ),
                         ),
                       ),
                     ),
                     SizedBox(
                       height: 5,
                     ),
                     Text(
                       (EasyLocalization.of(context)!
                           .locale
                           .languageCode ==
                           'ar')
                           ? (cubit.homeModel?.data?.shops?[index]
                           .titleAr ??
                           '')
                           : (cubit.homeModel?.data?.shops?[index]
                           .titleEn ??
                           ''),
                       style: TextStyle(
                         fontSize: 16,
                         fontWeight: FontWeight.w400,
                         overflow: TextOverflow.ellipsis,
                       ),
                     ),
                   ],
               );},



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
