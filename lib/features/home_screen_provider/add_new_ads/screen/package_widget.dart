import 'package:adpay/core/utils/app_strings.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/utils/app_colors.dart';
import '../../../../../core/utils/get_size.dart';
import '../../../../core/models/ads_packages_model.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class AdPackageWidget extends StatefulWidget {
  const AdPackageWidget({super.key});

  @override
  State<AdPackageWidget> createState() => _AdPackageWidgetState();
}

class _AdPackageWidgetState extends State<AdPackageWidget> {
  @override
  void initState() {
    context.read<AddNewAdsCubit>().getAdPackagesModel();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AddNewAdsCubit, AddNewAdsState>(
      builder: (context, state) {
        AddNewAdsCubit cubit = context.read<AddNewAdsCubit>();

        if (state is LoadingGetAdPackages) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is ErrorGetAdPackages) {
          return Center(
            child: Container(),
          );
        } else {
          var categories = cubit.adPackagesModel!.data;
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: getSize(context) / 44,
                ),
                child: DropdownButtonFormField2<GetAdPackagesModelData>(
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
                    hintText:cubit.currentPackage?.price.toString()??"",
                    hintStyle: TextStyle(
                      color: AppColors.blackLite,
                      fontFamily: 'tahoma',
                      fontSize: getSize(context) / 20,
                    ),
                  ),
                  hint: Text(
                    cubit.currentPackage?.price.toString()?? 'package'.tr(),
                    style: TextStyle(fontSize: getSize(context) / 24),
                  ),
                  // value: cubit.currentMainCategories,
                  items: categories?.map((item) {
                    return DropdownMenuItem<GetAdPackagesModelData>(
                      value: item,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            fit: FlexFit.tight,
                            child: Text(
                              "${item.count.toString()} ${'watch'.tr()}",
                              style: TextStyle(
                                fontSize: getSize(context) / 24,
                              ),
                            ),
                          ),
                          Text(
                            "${item.price.toString()} ${AppStrings.currency}",
                            style: TextStyle(
                              fontSize: getSize(context) / 24,
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  validator: (value) {
                    if (value == null) {
                      return 'please_enter_data'.tr() + 'package'.tr();
                    }
                    return null;
                  },
                  onChanged: (value) {
                    cubit.onChangePackage(value);
                  },
                  onSaved: (value) {
                    setState(() {
                      cubit.onChangePackage(value);
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
