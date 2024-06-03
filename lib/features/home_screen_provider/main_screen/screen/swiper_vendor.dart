import 'package:adpay/core/utils/get_size.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';

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
                itemCount: 5,
                pagination: const SwiperPagination(
                  alignment: Alignment.bottomCenter,
                  builder: DotSwiperPaginationBuilder(
                    color: Colors.grey,
                    activeColor: Color(0xff205960),
                  ),
                ),
                duration: 600,
                itemBuilder: (context, index) {
                  return Image.network(
                    EndPoints.baseUrlImage +
                        (
                            // cubit.homeModel?.data?.sliders?[index].image
                            //       .toString() ??
                            ''),
                    errorBuilder: (context, error, stackTrace) {
                      return Image.asset('assets/images/logo.png');
                    },
                  );
                }),
          ),
        );
      },
    );
  }
}
