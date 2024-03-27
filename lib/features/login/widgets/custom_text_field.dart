import 'package:flutter/material.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/get_size.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField(
      {required this.title,
      required this.hintTitle,
      required this.message,
      this.obscureText = false,
      this.isPass = false,
      this.onPressed,
      required this.keyboardType,
      required this.controller,
      super.key});
  String title;
  String hintTitle;
  bool obscureText;
  void Function()? onPressed;
  bool isPass;
  String message;
  TextInputType? keyboardType;
  TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          child: Text(title,
              style: TextStyle(
                  color: AppColors.grayColor,
                  fontWeight: FontWeight.bold,
                  fontSize: getSize(context) / 20)),
        ),
        SizedBox(height: getSize(context) / 88),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: TextFormField(
            controller: controller,
            validator: (value) {
              if (value!.isEmpty) {
                return message;
              } else {
                return null;
              }
            },
            keyboardType: keyboardType,
            decoration: InputDecoration(
              suffixIcon: isPass
                  ? IconButton(
                      onPressed: onPressed,
                      icon: Icon(
                        obscureText
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                      ))
                  : null,
              contentPadding: EdgeInsets.symmetric(
                horizontal: getSize(context) / 20,
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(getSize(context) / 44))),
              enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(getSize(context) / 44))),
              border: OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.grayColor),
                  borderRadius:
                      BorderRadius.all(Radius.circular(getSize(context) / 44))),
              hintText: hintTitle,
            ),
            obscureText: obscureText,
          ),
        )
      ],
    );
  }
}
