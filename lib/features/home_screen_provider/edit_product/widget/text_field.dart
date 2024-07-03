import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomAddNewProductField extends StatefulWidget {
  CustomAddNewProductField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.keyboardType,
    required this.mssage,
    this.maxLines = 1,
  });
  TextEditingController? controller;
  String? hintText;
  String? mssage;
  int? maxLines;
  TextInputType? keyboardType;

  @override
  State<CustomAddNewProductField> createState() =>
      _CustomAddNewProductFieldState();
}

class _CustomAddNewProductFieldState extends State<CustomAddNewProductField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: widget.keyboardType,

        maxLines: widget.maxLines,
        minLines: 1,
        validator: (value) {
          if (value!.isEmpty) {
            return "${widget.mssage}${widget.hintText}";
          } else {
            return null;
          }
        },
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey,
            fontSize: 14.0.sp,
            // زيادة المسافة العمودية لنقل النص لأعلى
          ),
          filled: true,
          fillColor: Colors.white,

          // Set the background color to white
          contentPadding: EdgeInsets.all(8),
          // Adjust the content padding
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey,
              // Set the border color to grey
              width: 1.0, // Set the border width
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey,
              // Set the border color to grey
              width: 1.0, // Set the border width
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              color: Colors.grey,
              // Set the border color to grey
              width: 1.0, // Set the border width
            ),
          ),
        ),
        textAlignVertical: TextAlignVertical.top,

        // محاذاة النص داخل الـ TextField إلى الأعلى
      ),
    );
  }
}
