import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/subcatogrey_model.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/get_size.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class SubCatogreyAddProductWidget extends StatefulWidget {
  const SubCatogreyAddProductWidget({super.key});

  @override
  State<SubCatogreyAddProductWidget> createState() =>
      _SubCatogreyAddProductWidgetState();
}

class _SubCatogreyAddProductWidgetState
    extends State<SubCatogreyAddProductWidget> {
  void initState() {
    super.initState();
    context.read<AddNewProductCubit>().subcatogrey(
        id: context
                .read<AddNewProductCubit>()
                .maincatogreyModel
                ?.data[0]
                .id
                .toString() ??
            "1");
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewProductCubit, AddNewProductState>(
      builder: (context, state) {
        AddNewProductCubit cubit = context.read<AddNewProductCubit>();

        if (state is LoadingSubCatogreyModel) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorsubCatogreyModel) {
          return Center(
            child: Text('Failed to load categories'.tr()),
          );
        } else {
          return Column(
            children: [
              (cubit.subcategoriesModel?.data == null)
                  ? Container()
                  : Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: getSize(context) / 44),
                      child: DropdownButtonFormField2<SubCategory>(
                        isExpanded: true,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          contentPadding: EdgeInsets.all(
                            getSize(context) / 32,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.gray),
                            borderRadius: BorderRadius.all(
                              Radius.circular(getSize(context) / 44),
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.gray),
                            borderRadius: BorderRadius.all(
                              Radius.circular(getSize(context) / 44),
                            ),
                          ),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: AppColors.gray),
                            borderRadius: BorderRadius.all(
                              Radius.circular(getSize(context) / 44),
                            ),
                          ),
                          hintText: 'Subcategory'.tr(),
                          hintStyle: TextStyle(
                            color: AppColors.blackLite,
                            fontFamily: 'tahoma',
                            fontSize: getSize(context) / 20,
                          ),
                        ),
                        hint: Text(
                          'Subcategory'.tr(),
                          style: TextStyle(fontSize: getSize(context) / 24),
                        ),
                        items: cubit.subcategoriesModel?.data?.map((item) {
                          return DropdownMenuItem<SubCategory>(
                            value: item ?? SubCategory(),
                            child: Text(
                              EasyLocalization.of(context)!
                                          .locale
                                          .languageCode ==
                                      'ar'
                                  ? (item.titleAr ?? '')
                                  : (item.titleEn ?? ''),
                              style: TextStyle(
                                fontSize: getSize(context) / 24,
                              ),
                            ),
                          );
                        }).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'please_enter_data'.tr() +
                                'Subcategory'.tr();
                          } else {
                            return null;
                          }
                        },
                        onChanged: (value) {
                          cubit.onchangeSubCategory(value);
                        },
                        onSaved: (value) {
                          cubit.onchangeSubCategory(value);
                        },
                        buttonStyleData: const ButtonStyleData(
                          padding: EdgeInsets.only(right: 8),
                        ),
                        iconStyleData: const IconStyleData(
                          icon: Icon(
                            Icons.arrow_drop_down,
                            color: Colors.black45,
                          ),
                          iconSize: 24,
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
            ],
          );
        }
      },
    );
  }
}
