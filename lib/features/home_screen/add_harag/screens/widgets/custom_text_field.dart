import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomTextFieldHarag extends StatelessWidget {
  const CustomTextFieldHarag({super.key});

  @override
  Widget build(BuildContext context) {
    return  TextField(

      onSubmitted: (data) async {},
      decoration: InputDecoration(
        hintText: "SendMessage".tr(),
        filled: true,
        fillColor: Colors.white, // Set the background color to white
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 15,
        ), // Adjust the content padding
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey, // Set the border color to grey
            width: 1.0, // Set the border width
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey, // Set the border color to grey
            width: 1.0, // Set the border width
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: Colors.grey, // Set the border color to grey
            width: 1.0, // Set the border width
          ),
        ),
      ),
    );
  }
}
