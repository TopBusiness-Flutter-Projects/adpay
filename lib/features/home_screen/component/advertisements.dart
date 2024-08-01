import 'package:adpay/core/api/end_points.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../advertisment/screen/widgets/advertesment_widget.dart';
import '../main_screen/cubit/home_cubit.dart';
import '../main_screen/cubit/home_state.dart';

class advertisements extends StatefulWidget {
  const advertisements({super.key});

  @override
  State<advertisements> createState() => _advertisementsState();
}

class _advertisementsState extends State<advertisements> {
  void initState() {
    super.initState();
    // context.read<HomeCubit>().getHome();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, statee) {

          HomeCubit cubit = HomeCubit.get(context);
          return SingleChildScrollView(
            child: SizedBox(
              // width: 400.w,
              height: 310.h,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: cubit.homeModel?.data?.ads?.length ?? 2,
                  itemBuilder: (context, index) {
                    return AdvertesmentWidet(ads: cubit.homeModel!.data!.ads![index]);
                  }),
            ),
          );
        }

    );
  }
}
