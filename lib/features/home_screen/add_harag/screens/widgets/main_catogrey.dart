import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/models/shopcatogriesmodel.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/get_size.dart';
import '../../cubit/add_harag_cubit.dart';

class MainCatogreyWidget extends StatefulWidget {
  const MainCatogreyWidget({super.key});

  @override
  State<MainCatogreyWidget> createState() => _MainCatogreyWidgetState();
}

class _MainCatogreyWidgetState extends State<MainCatogreyWidget> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<AddHaragCubit>().getMainCatogrey(context);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddHaragCubit, AddHaragState>(
      builder: (context, state) {
        AddHaragCubit cubit = context.read<AddHaragCubit>();

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
                    hintText: 'nationality_select'.tr(),
                    hintStyle: TextStyle(
                      color: AppColors.blackLite,
                      fontFamily: 'tahoma',
                      fontSize: getSize(context) / 20,
                    ),
                  ),
                  hint: Text(
                    'Category'.tr(),
                    style: TextStyle(fontSize: getSize(context) / 24),
                  ),
                  // value: cubit.currentMainCategories,
                  items: categories?.map((item) {
                    return DropdownMenuItem<Category>(
                      value: item,
                      child: Text(
                        EasyLocalization.of(context)!.locale.languageCode ==
                                'ar'
                            ? (item.titleAr)
                            : (item.titleEn),
                        style: TextStyle(
                          fontSize: getSize(context) / 24,
                        ),
                      ),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please_select_nationality'.tr();
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
