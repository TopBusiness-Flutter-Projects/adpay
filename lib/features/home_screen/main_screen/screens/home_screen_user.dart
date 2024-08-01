import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../config/routes/app_routes.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import '../../component/advertisements.dart';
import '../../component/bestseller.dart';
import '../../component/bestsellerforProducts.dart';
import '../../component/catogries.dart';
import '../../component/customRow.dart';
import '../../component/custom_Appbar.dart';
import '../../component/grage_widget.dart';
import '../../component/store.dart';
import '../../component/swiper.dart';
import '../cubit/home_cubit.dart';
import '../cubit/home_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var pagecontroller = PageController();
  @override
  void initState() {
    super.initState();
    context.read<HomeCubit>().getHome();
  }

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {
        if (state is LoadingADS) {
          isLoading = true;
        } else {
          isLoading = false;
        }
      },
      builder: (context, state) {
        HomeCubit cubit = HomeCubit.get(context);
        return SafeArea(
          child: Scaffold(
            appBar: PreferredSize(
                preferredSize:
                    Size.fromHeight(MediaQuery.of(context).size.height * 0.18),
                child: CustomAppBar()),
            body: (isLoading || HomeCubit.get(context).homeModel == null)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ConditionalBuilder(
                    condition: state is! ShowSliderLoading &&
                        state is! ShowCategoryLoading &&
                        state is! ShowProductLoading,
                    builder: (context) {
                      return Padding(
                        padding: const EdgeInsets.all(10),
                        child: RefreshIndicator(
                          onRefresh: () async {
                            await context.read<HomeCubit>().getHome();
                          },
                          child: ListView(
                            shrinkWrap: true,
                            // crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              CustomSwiper(),
                              SizedBox(
                                height: 5.h,
                              ),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.CategoriesRoute);
                                  },
                                  child: CustomRow(
                                    text1: 'Categories'.tr(),
                                    text2: "all".tr(),
                                  )),
                              SizedBox(
                                height: 9.h,
                              ),
                              Catogries(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.advertisement);
                                  },
                                  child: CustomRow(
                                      text1: 'advertisements'.tr(),
                                      text2: "all".tr())),
                              advertisements(),
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.bestSeller);
                                },
                                child: CustomRow(
                                    text1: 'BsetSeller'.tr(),
                                    text2: "all".tr()),
                              ),
                              BestSeller(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.ShopRoute);
                                  },
                                  child: CustomRow(
                                    text1: 'theShop'.tr(),
                                    text2: "all".tr(),
                                  )),
                              Stores(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.garageRoute);
                                  },
                                  child: CustomRow(
                                      text1: 'garage'.tr(), text2: "all".tr())),
                              BestSellerforGrage(),
                              InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, Routes.ProductssRoute,
                                        arguments: null);
                                  },
                                  child: CustomRow(
                                      text1: 'products'.tr(),
                                      text2: "all".tr())),
                              BestSellerforProducts(),
                              SizedBox(
                                height: 100.h,
                              )
                            ],
                          ),
                        ),
                      );
                    },
                    fallback: (context) =>
                        const Center(child: RefreshProgressIndicator()),
                  ),
          ),
        );

        // else {
        // return const Center(child: Text("no data"));
        // }
      },
    );
  }
}
