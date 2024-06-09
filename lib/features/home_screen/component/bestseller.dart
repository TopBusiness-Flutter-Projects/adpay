import 'package:adpay/features/home_screen/main_screen/cubit/home_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../main_screen/cubit/home_state.dart';
import 'custom_product_widget.dart';

class BestSeller extends StatelessWidget {
  const BestSeller({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {},
        builder: (context, statee) {
          HomeCubit cubit = HomeCubit.get(context);
          return SizedBox(
            height: 200.h,
            //  width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: cubit.homeModel?.data?.productMostSell?.length,
              itemBuilder: (context, index) {
                return CustomProductWidget(
                    product: cubit.homeModel?.data?.productMostSell?[index]);
              },
            ),
          );
        });
  }
}
