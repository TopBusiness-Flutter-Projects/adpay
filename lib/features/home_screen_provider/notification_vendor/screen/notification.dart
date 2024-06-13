import 'package:adpay/core/api/end_points.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/app_colors.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';
import '../widget/noification_widget.dart';

class NotificationScreenVendor extends StatefulWidget {
  const NotificationScreenVendor({super.key});

  @override
  State<NotificationScreenVendor> createState() =>
      _NotificationScreenVendorState();
}

class _NotificationScreenVendorState extends State<NotificationScreenVendor> {
  @override
  void initState() {
    context.read<NotificationVendorCubit>().getNotifications();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationVendorCubit, NotificationVendorState>(
        builder: (context, state) {
      var cubit = context.read<NotificationVendorCubit>();
      return Scaffold(
          appBar: AppBar(
            centerTitle: false,
            title: Text(
              'notifications'.tr(),
              style: TextStyle(
                  color: AppColors.grayColor, fontWeight: FontWeight.w700),
            ),
          ),
          body: (state is LoadingGetNotificationState)
              ? Center(
                  child: RefreshProgressIndicator(),
                )
              : cubit.notificationModel!.data!.isEmpty
                  ? Center(
                      child: Text('no_notifications'.tr()),
                    )
                  : RefreshIndicator(
                      onRefresh: () async {
                        await cubit.getNotifications();
                      },
                      child: ListView.builder(
                        itemCount: cubit.notificationModel!.data!.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        padding: EdgeInsets.all(3),
                        itemBuilder: (context, index) {
                          var noti = cubit.notificationModel!.data![index];
                          return GestureDetector(
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => NotificationDialog(
                                      notificationModel: noti));
                            },
                            child: Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: AppColors.greyColor,
                                        offset: Offset(1, 1))
                                  ],
                                  borderRadius: BorderRadius.circular(
                                      getSize(context) / 44),
                                  color: AppColors.white,
                                  border: Border.all(
                                    width: 0.5,
                                    color: AppColors.greyColor,
                                  )),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  CircleAvatar(
                                    backgroundColor: AppColors.secondPrimary,
                                    backgroundImage: NetworkImage(
                                      (noti.logo ?? ''),
                                    ),
                                  ),
                                  Flexible(
                                    fit: FlexFit.tight,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Row(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Flexible(
                                                fit: FlexFit.tight,
                                                child: Text(
                                                  noti.title ?? '',
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.w700,
                                                    color:
                                                        AppColors.secondPrimary,
                                                    fontSize: 16.sp,
                                                  ),
                                                ),
                                              ),
                                              Text(
                                                noti.formattedCreatedAt ?? '',
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w700,
                                                  color:
                                                      AppColors.secondPrimary,
                                                  fontSize: 12.sp,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Text(
                                            noti.body ?? '',
                                            style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              color: Color(0xff373737),
                                              fontSize: 14.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      )));
    });
  }
}
