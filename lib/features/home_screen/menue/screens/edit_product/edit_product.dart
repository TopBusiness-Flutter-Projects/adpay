import 'package:adpay/core/utils/get_size.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../home_screen_provider/edit_product/cubit/cubit.dart';
import '../../../../home_screen_provider/edit_product/cubit/state.dart';
import '../../../../home_screen_provider/edit_product/screen/main_catogrey.dart';
import '../../../../home_screen_provider/edit_product/screen/type_category.dart';
import '../../../../home_screen_provider/edit_product/widget/text_field.dart';
class EditProductScreen extends StatefulWidget {
  EditProductScreen({
    super.key,
    this.isUpdate = true,
  });
  bool isUpdate;
  @override
  State<EditProductScreen> createState() => _EditProductScreenState();
}
class _EditProductScreenState extends State<EditProductScreen> {
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewProductCubit, AddNewProductState>(
      builder: (context, state) {
        var cubit = context.read<AddNewProductCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'edit_product'.tr(),
              style: TextStyle(color: AppColors.black),
            ),
          ),
          body: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Productimages".tr(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 8.0),
                              child: InkWell(
                                onTap: () {
                                  cubit.pickLogoImages();
                                },
                                child: cubit.selectedImages.isNotEmpty
                                    ? Center(
                                  child: Container(
                                    height: getSize(context) / 6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      cubit.selectedImages.length,
                                      itemBuilder: (context, index) {
                                        return Center(
                                          child: Image.file(
                                            cubit.selectedImages[index],
                                            height: getSize(context) / 6,
                                            width: getSize(context) / 6,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Center(
                                                child: Image.asset(
                                                    "assets/images/uploadimages.png"),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                                    : cubit.updatedimages.isNotEmpty
                                    ? Center(
                                  child: Container(
                                    height: getSize(context) / 6,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount:
                                      cubit.updatedimages.length,
                                      itemBuilder: (context, index) {
                                        return Center(
                                          child: Image.network(
                                            cubit.updatedimages[index],
                                            height: getSize(context) / 6,
                                            width: getSize(context) / 6,
                                            fit: BoxFit.cover,
                                            errorBuilder: (context, error,
                                                stackTrace) {
                                              return Center(
                                                child: Image.asset(
                                                    "assets/images/uploadimages.png"),
                                              );
                                            },
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                )
                                    : Image.asset(
                                    "assets/images/uploadimages.png"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
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
                    keyboardType: TextInputType.name,
                    mssage: 'please_enter_data'.tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
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
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Text(
                      "Category".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  MainCatogreyAddProductWidget(),
                  // Padding(
                  //   padding: const EdgeInsets.only(right: 8.0, top: 8),
                  //   child: Text(
                  //     "Subcategory".tr(),
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //       fontWeight: FontWeight.bold,
                  //     ),
                  //   ),
                  // ),
                  // SubCatogreyAddProductWidget(),

                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Text(
                      "choose_type".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TypeCategoryAddProduct(),
                  //
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Text(
                      "limit".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomAddNewProductField(
                    controller: cubit.limitController,
                    hintText: 'limit'.tr(),
                    keyboardType: TextInputType.number,
                    mssage: 'please_enter_data'.tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
                    child: Text(
                      "discount".tr(),
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  CustomAddNewProductField(
                    controller: cubit.discountController,
                    hintText: '10%',
                    keyboardType: TextInputType.number,
                    mssage: 'please_enter_data'.tr(),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0, top: 8),
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
                            if (formKey.currentState!.validate()) {
                              if (cubit.selectedImages.isNotEmpty ||
                                  cubit.updatedimages.isNotEmpty) {
                                if (widget.isUpdate) {
                                  cubit.updateProduct(context);
                                } else {
                                  cubit.addNewProduct(context);
                                }
                              } else {
                                Fluttertoast.showToast(
                                    msg: 'Productimages'.tr());
                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.primary, // لون الزر
                          ),
                          child: Center(
                            child: (state is LoadingAddNewProduct)
                                ? Center(
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                              ),
                            )
                                : Text(
                              widget.isUpdate
                                  ? 'edit_product'.tr()
                                  : "add".tr(),
                              style: TextStyle(
                                color: AppColors.white,
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
      },
    );
  }
}
