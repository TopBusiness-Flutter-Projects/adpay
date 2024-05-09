import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';

import 'custom_network_image.dart';

class CustomSwiper extends StatelessWidget {
  const CustomSwiper({super.key});

  @override
  Widget build(BuildContext context) {
    return    Container(
      height: MediaQuery.of(context).size.height * 0.5 / 3,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: Color(0xfff6f6f6),
        borderRadius: BorderRadius.circular(30)
      ),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Swiper(
            autoplay: true,
            itemCount: 3,
            pagination: const SwiperPagination(
              alignment: Alignment.bottomCenter,
              builder: DotSwiperPaginationBuilder(
                color: Colors.grey,
                activeColor: Colors.green,
              ),
            ),
            duration: 600,
            itemBuilder: (context, index) {
              return CustomNetworkImage(
                image:
                //  "${cubit.sliderModel![index].image}",
                "",
                width: 100,
                height: 80,
                border: BorderRadius.circular(20),
              );
            }),
      ),
    );
  }
}
