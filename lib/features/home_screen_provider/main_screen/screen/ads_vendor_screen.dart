import 'package:adpay/core/utils/app_colors.dart';
import 'package:adpay/core/utils/get_size.dart';
import 'package:adpay/core/utils/styles.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/end_points.dart';
import '../cubit/cubit.dart';
import '../cubit/state.dart';

class AdsVendorScreen extends StatefulWidget {
  const AdsVendorScreen({super.key});

  @override
  State<AdsVendorScreen> createState() => _AdsVendorScreenState();
}

class _AdsVendorScreenState extends State<AdsVendorScreen> {
  @override
  void initState() {
    context.read<MainVendorCubit>().getVendorMyAdvertise();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainVendorCubit, MainVendorState>(
      builder: (context, state) {
        var cubit = context.read<MainVendorCubit>();
        return Scaffold(
          appBar: AppBar(
            title: Hero(
                tag: 'ads_vendor',
                child: Text(
                  'total_ads'.tr(),
                  style: TextStyle(color: Colors.black),
                )),
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: getSize(context) / 2,
                  child: Material(
                    borderRadius: BorderRadius.circular(getSize(context) / 18),
                    child: DropdownButtonFormField2<String>(
                      isExpanded: true,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical: getSize(context) / 44),
                        border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(getSize(context) / 18),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(getSize(context) / 18),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(getSize(context) / 18),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(getSize(context) / 18),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(getSize(context) / 18),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius:
                              BorderRadius.circular(getSize(context) / 18),
                        ),
                      ),
                      hint: Text(
                        'choose_type'.tr(),
                        style: TextStyle(fontSize: 14),
                      ),
                      items: cubit.adsCategory
                          .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Text(
                                  item,
                                  style: const TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ))
                          .toList(),
                      validator: (value) {
                        return null;
                      },
                      onChanged: (value) {
                        cubit.currentSelectedTypeOfAds = value.toString();
                        cubit.getVendorMyAdvertise();
                      },
                      onSaved: (value) {
                        cubit.currentSelectedTypeOfAds = value.toString();
                        cubit.getVendorMyAdvertise();
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
                ),
              ),
              Flexible(
                  fit: FlexFit.tight,
                  child: (state is LoadingGetAdsOfVendorState)
                      ? Center(
                          child: RefreshProgressIndicator(),
                        )
                      : (cubit.adsVendorModel!.data!.isEmpty ||
                              cubit.adsVendorModel == null)
                          ? Center(child: Text('no_ads'.tr()))
                          : ListView.builder(
                              padding: EdgeInsets.only(left: 8, right: 8),
                              itemCount: cubit.adsVendorModel?.data?.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                var ads = cubit.adsVendorModel?.data?[index];
                                return Container(
                                  margin: EdgeInsets.all(5),
                                  height: getSize(context) / 2.5,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(
                                        getSize(context) / 44),
                                    border: Border.all(
                                      width: 1,
                                      color: AppColors.greyColor,
                                    ),
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start, // Align children to the start
                                    children: [
                                      Flexible(
                                        fit: FlexFit.tight,
                                        child: Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            decoration: BoxDecoration(
                                                color: Colors.blue,
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        getSize(context) / 32)),
                                            child: Image.network(
                                              (ads?.image.toString() ?? ''),
                                              errorBuilder:
                                                  (context, error, stackTrace) {
                                                return ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.only(
                                                          topLeft: Radius
                                                              .circular(getSize(
                                                                      context) /
                                                                  32),
                                                          topRight: Radius
                                                              .circular(getSize(
                                                                      context) /
                                                                  32)),
                                                  child: Image.asset(
                                                    'assets/images/Rectangle.png',
                                                    fit: BoxFit.cover,
                                                  ),
                                                );
                                              },
                                            )
                                            //  }),
                                            ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  color: Colors.white60,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          200),
                                                  border: Border.all(
                                                    color: Colors.black
                                                        .withOpacity(.3),
                                                    width: 2,
                                                  ),
                                                ),
                                                child: CircleAvatar(
                                                  backgroundImage: NetworkImage(
                                                    (ads?.image.toString() ??
                                                        ''),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            Flexible(
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .start, // Align children to the start
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                          (EasyLocalization.of(
                                                                          context)!
                                                                      .locale
                                                                      .languageCode ==
                                                                  'ar')
                                                              ? (ads?.titleAr ??
                                                                  '')
                                                              : (ads?.titleEn ??
                                                                  ''),
                                                          maxLines: 1,
                                                          style: Styles.style18.copyWith(
                                                              fontWeight: FontWeight
                                                                  .w700,
                                                              fontSize: getSize(
                                                                      context) /
                                                                  24,
                                                              color: AppColors
                                                                  .secondPrimary)),
                                                      (ads?.status == 0 &&
                                                              ads?.complete ==
                                                                  0)
                                                          ? Container(
                                                              child:
                                                                  Image.asset(
                                                                'assets/images/new_ads.png',
                                                                width: getSize(
                                                                        context) /
                                                                    16,
                                                              ),
                                                            )
                                                          : (ads?.status == 1 &&
                                                                  ads?.complete ==
                                                                      1)
                                                              ? Container(
                                                                  child: Image
                                                                      .asset(
                                                                    'assets/images/complete_ads.png',
                                                                    width: getSize(
                                                                            context) /
                                                                        16,
                                                                  ),
                                                                )
                                                              : (ads?.status ==
                                                                          1 &&
                                                                      ads?.complete ==
                                                                          0)
                                                                  ? Container(
                                                                      child: Image
                                                                          .asset(
                                                                        'assets/images/pending_ads.png',
                                                                        width: getSize(context) /
                                                                            16,
                                                                      ),
                                                                    )
                                                                  : Container()
                                                    ],
                                                  ),
                                                  Text(
                                                    (EasyLocalization
                                                                    .of(
                                                                        context)!
                                                                .locale
                                                                .languageCode ==
                                                            'ar')
                                                        ? (ads?.descriptionAr ??
                                                            '')
                                                        : (ads?.descriptionEn ??
                                                            ''),
                                                    maxLines: 2,
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                      fontSize:
                                                          getSize(context) / 32,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            )),
            ],
          ),
        );
      },
    );
  }
}
