import 'package:adpay/features/home_screen/add_harag/screens/widgets/sub_catogrey.dart';
import 'package:adpay/features/home_screen/add_harag/screens/widgets/main_catogrey.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../cubit/add_harag_cubit.dart';
import 'widgets/custom_text_field.dart';



class AddHarag extends StatefulWidget {
  const AddHarag({super.key});

  @override
  _AddHaragState createState() => _AddHaragState();
}

class _AddHaragState extends State<AddHarag> {

  void initState() {
    super.initState();

   
  
    // Use read method from context in initState

    // context.read<AddHaragCubit>().subcatogrey(id:"1");
  }
  // String? imagePath;
  String? selectedCategory;
  final List<String> categories = ['Category 1', 'Category 2', 'Category 3'];

  // Future<void> _pickImage() async {
  //   FilePickerResult? result = await FilePicker.platform.pickFiles(
  //     type: FileType.image,
  //   );
  //   if (result != null) {
  //     setState(() {
  //       imagePath = result.files.single.path;
  //     });
  //   }
  // }
  //


  Widget build(BuildContext context) {
    return BlocBuilder<AddHaragCubit, AddHaragState>(
        builder: (context, state) {
          AddHaragCubit cubit = context.read<AddHaragCubit>();
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
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: Colors.grey,
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                "Productimage".tr(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: InkWell(
                                onTap: () {
                                  cubit.pickLogoImage(imageName: "user_image");
                                },
                                child: Image.asset(
                                    "assets/images/uploadimages.png"),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "productname".tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: cubit.nameController,
                        onSubmitted: (data) async {},
                        decoration: InputDecoration(
                          hintText: "SendMessage".tr(),
                          filled: true,
                          fillColor: Colors.white,
                          // Set the background color to white
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "price".tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller: cubit.priceController,
                        onSubmitted: (data) async {},
                        decoration: InputDecoration(
                          hintText: "SendMessage".tr(),
                          filled: true,
                          fillColor: Colors.white,
                          // Set the background color to white
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 10,
                            horizontal: 15,
                          ),
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
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "Category".tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: CustomDropDownMenu(
                    //     text: 'Select Category',
                    //     items: categories.map((String category) {
                    //       return DropdownMenuItem<String>(
                    //         value: category,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.end,
                    //           children: [
                    //             Text(category,
                    //               style: TextStyle(color: Colors.blue),),
                    //             SizedBox(width: 150.w),
                    //             Image.asset('assets/images/down.png', width: 24,
                    //                 height: 24),
                    //           ],
                    //         ),
                    //       );
                    //     }).toList(),
                    //     dropdownValue: selectedCategory,
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         selectedCategory = newValue;
                    //       });
                    //     },
                    //   ),),
                    MainCatogreyWidget(),
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
                    // Padding(
                    //   padding: const EdgeInsets.all(10.0),
                    //   child: CustomDropDownMenu(
                    //     text: 'Select Category',
                    //     items: categories.map((String category) {
                    //       return DropdownMenuItem<String>(
                    //         value: category,
                    //         child: Row(
                    //           mainAxisAlignment: MainAxisAlignment.end,
                    //           children: [
                    //             Text(category,
                    //               style: TextStyle(color: Colors.blue),),
                    //             SizedBox(width: 150.w),
                    //             Image.asset('assets/images/down.png', width: 24,
                    //                 height: 24),
                    //           ],
                    //         ),
                    //       );
                    //     }).toList(),
                    //     dropdownValue: selectedCategory,
                    //     onChanged: (String? newValue) {
                    //       setState(() {
                    //         selectedCategory = newValue;
                    //       });
                    //     },
                    //   ),
                    // ),
                    SubCatogreyWidget(),
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Text(
                        "Productdetails".tr(),
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextField(
                        controller:cubit.discriptoionController ,
                        onSubmitted: (data) async {},
                        decoration: InputDecoration(
                          hintStyle: TextStyle(
                            color: Colors.grey,
                            fontSize: 16.0,
                            height: 2.0, // زيادة المسافة العمودية لنقل النص لأعلى
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          // Set the background color to white
                          contentPadding: EdgeInsets.symmetric(
                            vertical: 40,
                            // زيادة المسافة العمودية لزيادة الارتفاع
                            horizontal: 15,
                          ),
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
                        textAlignVertical: TextAlignVertical
                            .top, // محاذاة النص داخل الـ TextField إلى الأعلى
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 6),
                      child: Center(
                        child: SizedBox(
                          width: 250.w,
                          child: ElevatedButton(
                            onPressed: () {
                              // Navigator.pushNamed(
                              //     context, Routes.completeorder);
                              if(cubit.selectedImage !=null){
                               cubit.addharag(context);
                              }
 context.read<AddHaragCubit>().addharag(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: AppColors.primary, // لون الزر
                              // minimumSize: Size(50.w, 50), // تحديد الحد الأدنى للعرض والارتفاع
                            ),
                            child: Center(
                              child: Text(
                                "add".tr(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
    );
  }

}
