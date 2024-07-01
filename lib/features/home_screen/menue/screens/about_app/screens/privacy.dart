import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../cubit/about_app_cubit.dart';
import 'dart:ui' as ui;

class Privacy_Screen extends StatefulWidget {
  const Privacy_Screen({super.key});

  @override
  State<Privacy_Screen> createState() => _Privacy_ScreenState();
}

class _Privacy_ScreenState extends State<Privacy_Screen> {
  @override
  void initState() {
    super.initState();
    context.read<AboutAppCubit>().GetAboutAppp();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AboutAppCubit, AboutAppState>(
      builder: (context, state) {
        AboutAppCubit cubit = AboutAppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "aboutapp".tr(),
              style: TextStyle(color: AppColors.primary),
            ),
          ),
          body: Directionality(
            textDirection: ui.TextDirection.rtl, // Use ui.TextDirection.rtl
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start, // Align children to the start (right in RTL)
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cubit.aboutModel?.privacyPolicy ?? "",
                    textDirection: ui.TextDirection.rtl, // Ensure the text is also in RTL
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
