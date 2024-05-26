import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/floating.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/styles.dart';
import '../../../add_harag/screens/widgets/custom_drop_down_menu.dart';
import '../widgets/menue_widget.dart';

class PlacesScreen extends StatefulWidget {
  PlacesScreen({super.key});

  @override
  State<PlacesScreen> createState() => _PlacesScreenState();
}

class _PlacesScreenState extends State<PlacesScreen> {
  String? selectedCategory;

  final List<String> categories = ['Category 1', 'Category 2', 'Category 3'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  title: Text(
                    "places".tr(),
                    style: Styles.style20.copyWith(color: Colors.black),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (BuildContext context, int index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MenueWidget(
                        text: 'places'.tr(),
                        path: 'assets/images/places.png',
                      ),
                    );
                  },
                ),
              ),
              Image.asset("assets/images/logo2.png"),
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        width: 56.0,
        height: 56.0,
        child: InkWell(
          onTap: () {
            showModalBottomSheet(
              isScrollControlled: true,

              context: context,
              builder: (context) {
                return Container(
                  width: MediaQuery.sizeOf(context).width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30.0),
                    color: Colors.white,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: InkWell(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Image.asset(
                              "assets/images/close.png",
                            ),
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Subcategory".tr(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomDropDownMenu(
                              text: 'Select Category',
                              items: categories.map((String category) {
                                return DropdownMenuItem<String>(
                                  value: category,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        category,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      SizedBox(width: 150.w),
                                      Image.asset('assets/images/down.png',
                                          width: 24, height: 24),
                                    ],
                                  ),
                                );
                              }).toList(),
                              dropdownValue: selectedCategory,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory = newValue;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Text(
                              "Subcategory".tr(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: CustomDropDownMenu(
                              text: 'Select Category',
                              items: categories.map((String category) {
                                return DropdownMenuItem<String>(
                                  value: category,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Text(
                                        category,
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      SizedBox(width: 150.w),
                                      Image.asset('assets/images/down.png',
                                          width: 24, height: 24),
                                    ],
                                  ),
                                );
                              }).toList(),
                              dropdownValue: selectedCategory,
                              onChanged: (String? newValue) {
                                setState(() {
                                  selectedCategory = newValue;
                                });
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 10),
                            child: Text(
                              "Detailedaddress".tr(),
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
                                fillColor: Colors
                                    .white, // Set the background color to white
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 15,
                                ), // Adjust the content padding
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .grey, // Set the border color to grey
                                    width: 1.0, // Set the border width
                                  ),
                                ),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .grey, // Set the border color to grey
                                    width: 1.0, // Set the border width
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15),
                                  borderSide: BorderSide(
                                    color: Colors
                                        .grey, // Set the border color to grey
                                    width: 1.0, // Set the border width
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Center(
                              child: Container(
                                width: 120.w,
                                height: 35.h,
                                decoration: BoxDecoration(
                                  color: AppColors.shadeColor,
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                    color:
                                        Colors.red, // Set the border color here
                                    width: 1.0, // Set the border width here
                                  ),
                                ),
                                child: Center(
                                    child: Text(
                                  "add".tr(),
                                  style: Styles.style16,
                                )),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              },
            );
          },
          child: Image.asset("assets/images/add2.png"),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
