import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:flutter/material.dart';

import '../../../../core/models/notification_model.dart';

class NotificationDialog extends StatelessWidget {
  final NotificationDataModel notificationModel;
  NotificationDialog({required this.notificationModel});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Align(
              alignment: Alignment.centerRight,
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Container(
                  margin: EdgeInsets.all(getSize(context) / 32),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: AppColors.red),
                  child: Icon(
                    Icons.close,
                    color: AppColors.white,
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            Padding(
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Text(
                  notificationModel.title ?? '',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.w800,
                      fontSize: getSize(context) / 18),
                )),
            Padding(
              padding: EdgeInsets.fromLTRB(20, 10, 20, 20),
              child: Text(
                notificationModel.body ?? '',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: getSize(context) / 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
