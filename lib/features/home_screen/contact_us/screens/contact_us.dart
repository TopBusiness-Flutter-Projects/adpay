import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/styles.dart';
import '../../../add_harag/screens/widgets/custom_text_field.dart';
import '../../presentation/widgets/custom_elevated_button.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.arrow_back),
                ),
                title: Text(
                  "addharag".tr(),
                  style: Styles.style20.copyWith(color: Colors.black),
                ),
              ),
              Center(
                child: Image.asset("assets/images/contactus2.png"),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "name".tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (data) async {},
                  decoration: InputDecoration(
                    hintText: "SendMessage".tr(),
                    filled: true,
                    fillColor: Colors.white, // Set the background color to white
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0,top:10),
                child: Text(
                  "phone".tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (data) async {},
                  decoration: InputDecoration(
                    hintText: "SendMessage".tr(),
                    filled: true,
                    fillColor: Colors.white, // Set the background color to white
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0,top:10),
                child: Text(
                  "topic".tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (data) async {},
                  decoration: InputDecoration(
                    hintText: "SendMessage".tr(),
                    filled: true,
                    fillColor: Colors.white, // Set the background color to white
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 20,
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
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Text(
                  "messages".tr(),
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onSubmitted: (data) async {},
                  decoration: InputDecoration(

                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 16.0,
                      height: 2.0, // زيادة المسافة العمودية لنقل النص لأعلى
                    ),
                    filled: true,
                    fillColor: Colors.white, // Set the background color to white
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 40, // زيادة المسافة العمودية لزيادة الارتفاع
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
                  textAlignVertical: TextAlignVertical.top, // محاذاة النص داخل الـ TextField إلى الأعلى
                ),
              ),
              CustomElevatedButton(text: 'send'.tr(),),
            ],
          ),
        ),
      ),
    );
  }
}
