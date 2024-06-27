import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/api/end_points.dart';

import '../main_screen/cubit/home_cubit.dart';
import '../main_screen/cubit/home_state.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, statee) {
        if (statee is LoadedADS) {
          HomeCubit cubit = HomeCubit.get(context);
          return Container(
            height: MediaQuery.of(context).size.height * 0.5 / 3,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Color(0xfff6f6f6),
                borderRadius: BorderRadius.circular(30)),
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Swiper(
                  autoplay: true,
                  itemCount: cubit.homeModel?.data?.sliders?.length ?? 0,
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
           
                          (cubit.homeModel?.data?.sliders?[index].image
                                  .toString() ??
                              ''),
                      errorBuilder: (context, error, stackTrace) {
                        return Image.asset('assets/images/logo.png');
                      },
                    );
                  }
                  ),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
