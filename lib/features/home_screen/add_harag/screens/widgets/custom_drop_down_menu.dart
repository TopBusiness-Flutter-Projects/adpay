import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/utils/app_colors.dart';


class CustomDropDownMenu extends StatefulWidget {
  const CustomDropDownMenu({
    super.key,
    this.items,
    required this.text,
    this.onChanged,
    this.dropdownValue,
  });

  final List<DropdownMenuItem<String>>? items;
  final String text;
  final String? dropdownValue;
  final void Function(String?)? onChanged;

  @override
  State<CustomDropDownMenu> createState() => _CustomDropDownMenuState();
}

class _CustomDropDownMenuState extends State<CustomDropDownMenu> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      height: 60.h,
      // padding: EdgeInsets.symmetric(
      //   horizontal: MediaQuery.of(context).size.width / 32,
      // ),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.gray),
        borderRadius: BorderRadius.circular(10), // Added border radius
      ),
      child: Center(
        child: DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          value: widget.dropdownValue,
          style: TextStyle(fontSize: 20),
          onChanged: widget.onChanged,
          items: widget.items,
          validator: (value) {
            if (value == null) {
              return null;
            }
            return null;
          },
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: IconStyleData(
            iconSize: 0,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }
}