import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/app_colors.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class CustomFlowChartOfStatisticsGoal extends StatefulWidget {
  const CustomFlowChartOfStatisticsGoal({super.key});

  @override
  State<StatefulWidget> createState() => PieChart2State();
}

class PieChart2State extends State {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainVendorCubit, MainVendorState>(
      builder: (context, state) {
        var cubit = context.read<MainVendorCubit>();
        return Container(
          child: (cubit.homeVendorScreenModel?.data?.adsComplete == 0 &&
                  cubit.homeVendorScreenModel?.data?.adsIncomplete == 0 &&
                  cubit.homeVendorScreenModel?.data?.ordersComplete == 0 &&
                  cubit.homeVendorScreenModel?.data?.ordersIncomplete == 0)
              ? Container(
                  height: getSize(context) / 4,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.greyColor, width: 1),
                      borderRadius:
                          BorderRadius.circular(getSize(context) / 32),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyColor,
                          offset: Offset(1, 1),
                        ),
                      ]),
                  child: Text('have_goals'.tr()))
              : Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(color: AppColors.greyColor, width: 1),
                      borderRadius:
                          BorderRadius.circular(getSize(context) / 32),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.greyColor,
                          offset: Offset(1, 1),
                        ),
                      ]),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          //! ordrs
                          Expanded(
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: PieChart(
                                    PieChartData(
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      sectionsSpace: 0,
                                      centerSpaceRadius: getSize(context) / 12,
                                      sections: showingSections(
                                          Incomplete: double.parse(cubit
                                                  .homeVendorScreenModel
                                                  ?.data
                                                  ?.ordersIncomplete
                                                  .toString() ??
                                              '0.0'),
                                          complete: double.parse(cubit
                                                  .homeVendorScreenModel
                                                  ?.data
                                                  ?.ordersComplete
                                                  .toString() ??
                                              '0.0'),
                                          isAds: false),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: CircleAvatar(
                                        radius: getSize(context) / 34,
                                        backgroundColor: AppColors.primary,
                                      ),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          'complete_orders'.tr(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff373737),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(height: getSize(context) / 44),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: CircleAvatar(
                                        radius: getSize(context) / 34,
                                        backgroundColor: AppColors.greyColor,
                                      ),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          'incomplete_orders'.tr(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff373737),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(height: getSize(context) / 44),
                              ],
                            ),
                          ),
                          //! ads
                          Expanded(
                            child: Column(
                              children: [
                                AspectRatio(
                                  aspectRatio: 1,
                                  child: PieChart(
                                    PieChartData(
                                      borderData: FlBorderData(
                                        show: false,
                                      ),
                                      sectionsSpace: 0,
                                      centerSpaceRadius: getSize(context) / 12,
                                      sections: showingSections(
                                          Incomplete: double.parse(cubit
                                                  .homeVendorScreenModel
                                                  ?.data
                                                  ?.adsIncomplete
                                                  .toString() ??
                                              '0.0'),
                                          complete: double.parse(cubit
                                                  .homeVendorScreenModel
                                                  ?.data
                                                  ?.adsComplete
                                                  .toString() ??
                                              '0.0'),
                                          isAds: true),
                                    ),
                                  ),
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: CircleAvatar(
                                        radius: getSize(context) / 34,
                                        backgroundColor:
                                            AppColors.secondPrimary,
                                      ),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          'complete_ads'.tr(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff373737),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(height: getSize(context) / 44),
                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 3.0),
                                      child: CircleAvatar(
                                        radius: getSize(context) / 34,
                                        backgroundColor: AppColors.greyColor,
                                      ),
                                    ),
                                    Flexible(
                                        fit: FlexFit.tight,
                                        child: Text(
                                          'incomplete_ads'.tr(),
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16.sp,
                                            color: Color(0xff373737),
                                          ),
                                        )),
                                  ],
                                ),
                                SizedBox(height: getSize(context) / 44),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        );
      },
    );
  }

  List<PieChartSectionData> showingSections(
      {double? complete, double? Incomplete, bool isAds = false}) {
    return List.generate(2, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: isAds ? AppColors.secondPrimary : AppColors.primary,
            value: complete,
            showTitle: false,
            title: '',
            radius: getSize(context) / 16,
          );
        case 1:
          return PieChartSectionData(
            color: AppColors.greyColor,
            value: Incomplete,
            showTitle: false,
            title: '',
            radius: getSize(context) / 16,
          );

        default:
          throw Error();
      }
    });
  }
}
