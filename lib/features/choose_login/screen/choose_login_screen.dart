import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/assets_manager.dart';
import '../../../core/utils/get_size.dart';

class ChooseloginScreen extends StatefulWidget {
  const ChooseloginScreen({super.key});

  @override
  State<ChooseloginScreen> createState() => _ChooseloginScreenState();
}

class _ChooseloginScreenState extends State<ChooseloginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          child: Text(
            'choose_login'.tr(),
            textAlign: TextAlign.start,
            style: TextStyle(
                fontFamily: 'Tajawal',
                color: Colors.black,
                fontWeight: FontWeight.w700,
                fontSize: getSize(context) / 24),
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondPrimary2,
              ),
              height: getSize(context) / 3,
              child: Image.asset(ImageAssets.partnerImage),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.secondPrimary2,
              ),
              height: getSize(context) / 3,
              child: Image.asset(ImageAssets.customerImage),
            ),
          ],
        ),
      ),
    );
  }
}
