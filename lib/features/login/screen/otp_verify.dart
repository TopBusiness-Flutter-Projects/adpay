import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_pin_code_fields/flutter_pin_code_fields.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_strings.dart';
import '../../../core/utils/get_size.dart';
import '../../../core/utils/show_dialog.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class OTPVerifyScreen extends StatefulWidget {
  const OTPVerifyScreen({super.key});

  @override
  State<OTPVerifyScreen> createState() => _OTPVerifyScreenState();
}

class _OTPVerifyScreenState extends State<OTPVerifyScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<LoginCubit, LoginState>(
        listener: (context, state) {
      if (state is LoadingLoginAuth) {
        EasyLoading.show(status:  'loading'.tr());
        // createProgressDialog(context, 'loading'.tr());
      } else if (state is LoadedLoginAuth || state is ErrorLoginAuth) {
        Navigator.pop(context);
      } else {}
    }, builder: (context, state) {
      var cubit = context.read<LoginCubit>();
      return Scaffold(
        appBar: AppBar(),
        body: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: getSize(context) / 44,
          ),
          children: [
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(children: [
                TextSpan(
                    text:
                        '${'we_sent_an_code_to_verify_your_phone'.tr()}(${context.read<LoginCubit>().countryCode})',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.blackColor,
                        fontSize: getSize(context) / 18)),
                TextSpan(
                    text: '${cubit.phoneController.text}',
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        color: AppColors.secondPrimary,
                        fontSize: getSize(context) / 18))
              ]),
            ),
            Image.asset(
              'assets/images/otp.png',
              width: getSize(context) / 1.6,
              height: getSize(context) / 1.6,
            ),
            SizedBox(height: getSize(context) / 22),
            Text('enter_your_verification_code'.tr(),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppColors.blackColor,
                    fontSize: getSize(context) / 18)),
            SizedBox(height: getSize(context) / 22),
            Directionality(
              textDirection: TextDirection.ltr,
              child: PinCodeFields(
                fieldHeight: getSize(context) / 8,
                length: 6,
                // controller: cubit.otpController,
                keyboardType: TextInputType.number,
                onComplete: (String text) async {
                  await cubit.verifyOtp(text, context);
                  print(".............$text");
                  print(".............${cubit.otpController.text}");
                },
              ),
            ),
            SizedBox(height: getSize(context) / 22),
          ],
        ),
      );
    });
  }

  @override
  void initState() {
    // context.read<LoginCubit>().otpController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    // context.read<LoginCubit>().otpController.dispose();
    super.dispose();
  }
}
