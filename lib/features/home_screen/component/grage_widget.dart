import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../main_screen/cubit/home_cubit.dart';
import '../main_screen/cubit/home_state.dart';
import 'custom_grage_widget.dart';

class BestSellerforGrage extends StatelessWidget {
  const BestSellerforGrage({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, statee) {


          HomeCubit cubit = HomeCubit.get(context);
          return SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.homeModel!.data!.auctions!.length,
              itemBuilder: (context, index) {
                return CustomGrageWidget(auctions:cubit.homeModel?.data?.auctions?[index],);
              },
            ),
          );
        }


    );
  }
}

