import 'package:adpay/core/utils/assets_manager.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../../../home_screen/main_screen/cubit/home_cubit.dart';
import '../../../home_screen/main_screen/cubit/home_state.dart';
import '../../../home_screen/component/custom_icon_appbar.dart';

class CustomAppBarVendor extends StatelessWidget {
  const CustomAppBarVendor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainVendorCubit, MainVendorState>(
        listener: (context, state) {},
        builder: (context, state) {
          MainVendorCubit cubit = context.read<MainVendorCubit>();
          return AppBar(
            backgroundColor: Colors.white,
            elevation: 0.0,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: Colors.white,
            ),
            leading: Container(
              // color: Colors.red,
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: cubit.userData?.data?.image != null
                  ? CircleAvatar(
                      backgroundImage: NetworkImage(
                        cubit.userData?.data?.image ?? '',
                      ),
                    )
                  : Image.asset(ImageAssets.appIconImage),
            ),
            centerTitle: false,
            title: Text(
              // 'hello '.tr()+${cubit.userData?.data?.name??""},
              'hello'.tr() + " , " + (cubit.userData?.data?.name ?? "adPay"),

              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            // leadingWidth: 100,
            actions: [
              Container(
                  height: getSize(context) / 16,
                  // color: Colors.blue,
                  child: Text('4.5')),
              Container(
                height: getSize(context) / 16,
                // color: Colors.red,
                child: RatingBar.builder(
                  initialRating: 4.5,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 1,
                  itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                  itemBuilder: (context, _) => Icon(
                    Icons.star,
                    color: Colors.amber,
                  ),
                  onRatingUpdate: (rating) {
                    print(rating);
                  },
                  itemSize: getSize(context) / 18,
                  tapOnlyMode: true, // Disable tapping to change the rating
                  updateOnDrag: false,
                  ignoreGestures: true, wrapAlignment: WrapAlignment.start,
                ),
              ),
            ],
          );
        });
  }
}
