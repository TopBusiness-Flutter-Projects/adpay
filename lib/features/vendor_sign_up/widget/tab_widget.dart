import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';

class SignUpTabBar extends StatelessWidget {
  const SignUpTabBar({
    super.key,
    this.isSelected = false,
    required this.departmentName,
    required this.isRight,
  });
  final bool isSelected;
  final bool isRight;
  final String departmentName;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 2),
            decoration: isSelected
                ? BoxDecoration(color: AppColors.primary).copyWith(
                    borderRadius: isRight
                        ? BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))
                        : BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                    border: Border.all(color: AppColors.transparent, width: 2))
                : BoxDecoration(color: AppColors.gray1).copyWith(
                    borderRadius: isRight
                        ? BorderRadius.only(
                            topRight: Radius.circular(15),
                            bottomRight: Radius.circular(15))
                        : BorderRadius.only(
                            topLeft: Radius.circular(15),
                            bottomLeft: Radius.circular(15)),
                    border: Border.all(color: AppColors.transparent, width: 2)),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Text(
                    departmentName,
                    maxLines: 1,
                    style: TextStyle(color: AppColors.white, height: 2),
                  ),
                ))),
      ],
    );
  }
}
