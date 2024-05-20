import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../config/routes/app_routes.dart';
import '../main_screen/cubit/home_cubit.dart';
import '../main_screen/cubit/home_state.dart';



class Catogries extends StatelessWidget {
   Catogries({Key? key});


  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
    builder: (context, statee) {
    if (statee is LoadedADS) {
    HomeCubit cubit = HomeCubit.get(context);
    return Container(
      alignment: Alignment.centerRight,
      height: 130.h,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: cubit.homeModel!.data!.categories!.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: (){
              Navigator.pushNamed(
                  context, Routes.ProductssRoute,arguments:cubit.homeModel!.data!.categories![index].id.toString());
            },
            child: Container(
              height: 120.h,
              width: MediaQuery.of(context).size.width/4.2,
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                     // height: 85.h,
                  //  margin: EdgeInsets.all(5),
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      color: Colors.white60,
                      borderRadius: BorderRadius.circular(200),
                      border: Border.all(
                        color: Colors.red,
                        width: 2,
                      ),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(200),
                      child: Image.asset(
                        'assets/images/chair.jpg',),
                    ),
                  ),
                  // SizedBox(height: 8.h),
                  Flexible(fit: FlexFit.tight,
                    child: Text(
                    cubit.homeModel?.data?.categories?[index]?.titleAr??"",
                      maxLines: 1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                       // fontSize: 10.sp,
                        fontWeight: FontWeight.bold,


                          fontSize: 16,
                          overflow: TextOverflow.fade,

                      ),

                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }else {
      return const Center(child: Text("no data"));
    }
    },
    );
  }
}
