import 'package:adpay/core/utils/get_size.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:easy_localization/easy_localization.dart' as tr;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../../core/api/end_points.dart';

import '../cubit/cubit.dart';
import '../cubit/state.dart';

class CustomSwiperVendor extends StatelessWidget {
  const CustomSwiperVendor({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainVendorCubit, MainVendorState>(
      listener: (context, state) {},
      builder: (context, state) {
        MainVendorCubit cubit = context.read<MainVendorCubit>();
        return Container(
          height: getSize(context) / 3,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              color: Color(0xfff6f6f6),
              borderRadius: BorderRadius.circular(30)),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Swiper(
                autoplay: true,
                itemCount:
                    cubit.homeVendorScreenModel?.data?.sliders?.length ?? 0,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: Color(0xff205960),
                  ),
                ),
                duration: 600,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () async {
                      await socialMedia(cubit
                              .homeVendorScreenModel?.data?.sliders?[index].url
                              ?.toString() ??
                          'https://topbuziness.com/');
                    },
                    child: Image.network(
                      (cubit.homeVendorScreenModel?.data?.sliders?[index].image
                              .toString() ??
                          ''),
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/logo.png');
                      },
                    ),
                  );
                }),
          ),
        );
      },
    );
  }

  socialMedia(String url) async {
    if (!await launchUrl(Uri.parse(url),
        mode: LaunchMode.externalApplication)) {
      Fluttertoast.showToast(msg: 'invalid_url'.tr());
      throw Exception('Could not launch $url');
    }
    //!
  }
}
