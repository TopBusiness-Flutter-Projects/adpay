import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/app_colors.dart';
import '../../../../../../core/utils/styles.dart';
import '../cubit/contact_us_cubit.dart';
class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ContactUsCubit, ContactUsState>(
        listener: (context, state) {
      if (state is LoadingContact ) {
        EasyLoading.show(status: 'loading...');
      } else if (state is LoadedContact) {
        EasyLoading.dismiss();
        EasyLoading.showSuccess('Messege Success');
      } else if (state is ErrorContact) {
        EasyLoading.showError("state.toString()");
      } else if (state is ErrorContact ) {
        EasyLoading.dismiss();
        EasyLoading.showError("${state.toString()}");
      } else {
        EasyLoading.dismiss();
      }
    },
    builder: (context, state) {
    var cubit = context.read<ContactUsCubit>();
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
                  "contactus".tr(),
                  style: Styles.style20.copyWith(color: Colors.black),
                ),
              ),
              Padding(padding: const EdgeInsets.only(right:20.0),
                child: Center(child: Image.asset("assets/images/contactus2.png",scale: 5,)),),
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
                  controller: cubit.subjectController,
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
                  controller: cubit.messageController,
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 6),
                child: Center(
                  child: SizedBox(
                    width: 250.w,
                    child: ElevatedButton(
                      onPressed: () {
                        context.read<ContactUsCubit>().ContactUs(context);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary, // لون الزر
                        // minimumSize: Size(50.w, 50), // تحديد الحد الأدنى للعرض والارتفاع
                      ),
                      child: Center(
                        child: Text(
                         "send".tr(),
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )            ],
          ),
        ),
      ),
    );
  }
    );}}
