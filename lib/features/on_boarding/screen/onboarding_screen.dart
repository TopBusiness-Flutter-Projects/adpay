import 'package:adpay/features/on_boarding/screen/onboarding2.dart';
import 'package:adpay/features/on_boarding/screen/onboarding3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/onboarding_cubit.dart';
import 'onboarding1.dart';

class OnBoardinScreen extends StatefulWidget {
  const OnBoardinScreen({super.key});

  @override
  State<OnBoardinScreen> createState() => _OnBoardinScreenState();
}

class _OnBoardinScreenState extends State<OnBoardinScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<OnboardingCubit, OnboardingState>(
      listener: (context, state) {},
      builder: (context, state) {
        OnboardingCubit cubit = context.read<OnboardingCubit>();
        return OrientationBuilder(
          builder: (context, orientation) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: Stack(
                children: [
                  PageView(
                    controller: cubit.pageController,
                    reverse: true,
                    onPageChanged: (int page) {
                      cubit.onPageChanged(page);
                    },
                    children: const [
                      OnBoarding1(),
                      OnBoarding2(),
                      OnBoarding3(),
                    ],
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
