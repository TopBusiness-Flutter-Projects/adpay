import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/features/home_screen/add_harag/screens/widgets/sub_catogrey.dart';
import 'package:adpay/features/home_screen/add_harag/screens/widgets/main_catogrey.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/styles.dart';
import '../../../home_screen_provider/add_new_product/widget/text_field.dart';
import '../cubit/add_harag_cubit.dart';

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

  final formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return BlocBuilder<AddHaragCubit, AddHaragState>(builder: (context, state) {
      AddHaragCubit cubit = context.read<AddHaragCubit>();
      return SafeArea(
        child: Scaffold(
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
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
                              child: cubit.selectedImage != null
                                  ? Image.file(
                                      cubit.selectedImage!,
                                      height: getSize(context) / 6,
                                      width: getSize(context),
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          "assets/images/uploadimages.png",
                                          height: getSize(context) / 6,
                                          width: getSize(context),
                                          // fit: BoxFit.cover,
                                        );
                                      },
                                    )
                                  : Image.asset(
                                      "assets/images/uploadimages.png",
                                      height: getSize(context) / 6,
                                      width: getSize(context),
                                      // fit: BoxFit.cover,
                                    ),
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
                  CustomAddNewProductField(
                    controller: cubit.nameController,
                    hintText: 'productname'.tr(),
                    keyboardType: TextInputType.text,
                    mssage: 'please_enter_data'.tr(),
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
                  CustomAddNewProductField(
                    controller: cubit.priceController,
                    hintText: 'price'.tr(),
                    keyboardType: TextInputType.number,
                    mssage: 'please_enter_data'.tr(),
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
                  CustomAddNewProductField(
                    controller: cubit.discriptoionController,
                    hintText: 'Productdetails'.tr(),
                    keyboardType: TextInputType.text,
                    mssage: 'please_enter_data'.tr(),
                    maxLines: 3,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Center(
                      child: SizedBox(
                        width: 250.w,
                        child: ElevatedButton(
                          onPressed: () {
                            //! must make

                            if (formKey.currentState!.validate()) {
                              if (cubit.selectedImage != null) {
                                cubit.addharag(context);
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Productimage'.tr());
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary, // لون الزر
                            // minimumSize: Size(50.w, 50), // تحديد الحد الأدنى للعرض والارتفاع
                          ),
                          child: Center(
                            child: (state is LoadingHarag)
                                ? CircularProgressIndicator(
                                    color: Colors.white,
                                  )
                                : Text(
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
        ),
      );
    });
  }
}
