import 'package:easy_localization/easy_localization.dart' as trans;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adpay/config/routes/app_routes.dart';
import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/assets_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../core/utils/get_size.dart';
import '../cubit/onboarding_cubit.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            actions: [],
          ),
          body: Column(
            children: [
              SizedBox(
                height: getSize(context) / 22,
              ),
              Flexible(
                child: Padding(
                  padding: EdgeInsets.all(getSize(context) / 22),
                  child: Image.asset(
                    ImageAssets.introBackgroundImage,
                    // width: getSize(context) / 1.1,
                  ),
                ),
              ),
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: getSize(context) / 44),
                child: Text(
                  trans.tr('our_app'),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontFamily: 'Tajawal',
                      fontWeight: FontWeight.bold,
                      fontSize: getSize(context) / 18),
                ),
              ),
              Container(
                padding: EdgeInsets.all(getSize(context) / 44),
                child: Text(
                  trans.tr('on_1'),
                  style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Tajawal',
                      fontSize: getSize(context) / 22),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: getSize(context) / 16),
                child: SmoothPageIndicator(
                  controller: cubit.pageController,
                  count: cubit.numPages,
                  textDirection: TextDirection.ltr,
                  effect: WormEffect(
                    activeDotColor: AppColors.primary,
                    dotColor: AppColors.gray1,
                    dotHeight: getSize(context) / 44,
                    dotWidth: getSize(context) / 44,
                    type: WormType.underground,
                  ),
                ),
              ),
              MaterialButton(
                  minWidth: getSize(context) / 1.2,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(getSize(context) / 8)),
                  color: AppColors.primary,
                  onPressed: () {
                    cubit.pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 1000),
                        curve: Curves.easeInOut);
                    // Navigator.pushReplacementNamed(context, Routes.choosLogin);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: getSize(context) / 44,
                        horizontal: getSize(context) / 44),
                    padding: EdgeInsets.symmetric(
                        vertical: getSize(context) / 100,
                        horizontal: getSize(context) / 32),
                    decoration: BoxDecoration(
                        // color: AppColors.primary,
                        borderRadius:
                            BorderRadius.circular(getSize(context) / 44)),
                    child: Text(
                      trans.tr('next'),
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: AppColors.white,
                          fontSize: getSize(context) / 22),
                    ),
                  )),
              InkWell(
                  onTap: () async{
                    Navigator.pushReplacementNamed(context, Routes.choosLogin);
                    SharedPreferences pref=await SharedPreferences.getInstance();
                    pref.setBool('onBoarding', true);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                        vertical: getSize(context) / 44,
                        horizontal: getSize(context) / 44),
                    padding: EdgeInsets.symmetric(
                        vertical: getSize(context) / 100,
                        horizontal: getSize(context) / 32),
                    decoration: BoxDecoration(
                        // color: AppColors.primary,
                        borderRadius:
                            BorderRadius.circular(getSize(context) / 44)),
                    child: Text(
                      trans.tr('skip'),
                      style: TextStyle(
                          fontFamily: 'Tajawal',
                          color: AppColors.primary,
                          fontSize: getSize(context) / 22),
                    ),
                  )),
              Container(
                padding: const EdgeInsets.all(5),
                color: Colors.white,
                child: Image.asset(ImageAssets.topBbusiness,
                    width: getSize(context) / 3),
              ),
            ],
          ),
        );
      },
    );
  }
}
