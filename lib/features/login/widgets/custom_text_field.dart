import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import '../../../core/utils/app_colors.dart';
import '../../../core/utils/get_size.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    required this.title,
    required this.hintTitle,
    required this.message,
    this.obscureText = false,
    this.isPass = false,
    this.onPressed,
    required this.keyboardType,
    required this.controller,
    this.isPhoneNumber = false,
    this.onPhoneChanged,
    super.key,
  });

  final String title;
  final String hintTitle;
  final bool obscureText;
  final void Function()? onPressed;
  final bool isPass;
  final String message;
  final TextInputType? keyboardType;
  final TextEditingController controller;
  final bool isPhoneNumber;
  final void Function(String, String)? onPhoneChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: AppColors.grayColor,
            fontWeight: FontWeight.bold,
            fontSize: getSize(context) / 20,
          ),
        ),
        SizedBox(height: getSize(context) / 88),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: isPhoneNumber
              ? _buildPhoneField(context)
              : _buildRegularField(context),
        ),
      ],
    );
  }

  Widget _buildPhoneField(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      decoration: _getInputDecoration(context),
      initialCountryCode: 'US',
      onChanged: (phone) {
        if (onPhoneChanged != null) {
          onPhoneChanged!(phone.countryCode, phone.number);
        }
      },
    );
  }

  Widget _buildRegularField(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) {
        if (value!.isEmpty) {
          return message;
        } else {
          return null;
        }
      },
      keyboardType: keyboardType,
      decoration: _getInputDecoration(context),
      obscureText: obscureText,
    );
  }

  InputDecoration _getInputDecoration(BuildContext context) {
    return InputDecoration(
      suffixIcon: isPass
          ? IconButton(
        onPressed: onPressed,
        icon: Icon(
          obscureText
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
      )
          : null,
      contentPadding: EdgeInsets.symmetric(
        horizontal: getSize(context) / 20,
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayColor),
        borderRadius: BorderRadius.all(Radius.circular(getSize(context) / 44)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayColor),
        borderRadius: BorderRadius.all(Radius.circular(getSize(context) / 44)),
      ),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: AppColors.grayColor),
        borderRadius: BorderRadius.all(Radius.circular(getSize(context) / 44)),
      ),
      hintText: hintTitle,
    );
  }
}

