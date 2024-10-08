import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/shopcatogriesmodel.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/get_size.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class MainCatogreyAddProductWidget extends StatefulWidget {
  const MainCatogreyAddProductWidget({super.key});

  @override
  State<MainCatogreyAddProductWidget> createState() =>
      _MainCatogreyAddProductWidgetState();
}

class _MainCatogreyAddProductWidgetState
    extends State<MainCatogreyAddProductWidget> {
  @override
  void initState() {
    super.initState();
    context.read<AddNewProductCubit>().getMainCatogrey(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewProductCubit, AddNewProductState>(
      builder: (context, state) {
        AddNewProductCubit cubit = context.read<AddNewProductCubit>();

        if (state is LoadingGetCatogreyModel) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorGetCatogreyModel) {
          return Center(
            child: Text('Failed to load categories'.tr()),
          );
        } else {
          var categories = cubit.maincatogreyModel?.data;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getSize(context) / 44,
                ),
                child: DropdownButtonFormField2<Category>(
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
                    hintText:


                    EasyLocalization.of(context)!.locale.languageCode ==
                        'ar'
                        ? ( cubit.currentMainCategories?.titleAr.toString()??"nehal")
                        : ( cubit.currentMainCategories?.titleEn.toString()??"nehal"),

                    hintStyle: TextStyle(
                      color: AppColors.blackLite,
                      fontFamily: 'tahoma',
                      fontSize: getSize(context) / 20,
                    ),
                  ),
                  hint: Text(
                    cubit.currentMainCategories?.titleAr.toString()??"",
                    style: TextStyle(fontSize: getSize(context) / 24),
                  ),
                  // value: cubit.currentMainCategories,
                  items: categories?.map((item) {
                    return DropdownMenuItem<Category>(
                      value: item,
                      child: Text(
                        EasyLocalization.of(context)!.locale.languageCode ==
                                'ar'
                            ? (item.titleAr!)
                            : (item.titleEn!),
                        style: TextStyle(
                          fontSize: getSize(context) / 24,
                        ),
                      ),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please_enter_data'.tr() + 'Category'.tr();
                    }
                    return null;
                  },
                  onChanged: (value) {
                    cubit.onChangeMain(value);
                    // setState(() {
                    //   // context.read<AddHaragCubit>().subcatogrey(id:state.categoriesModel.data![0].id.toString()??"");
                    // });
                  },
                  onSaved: (value) {
                    setState(() {
                      // cubit.changeNationality(value);
                    });
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

        // return Container();
      },
    );
  }
}
