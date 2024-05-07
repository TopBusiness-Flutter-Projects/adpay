import 'package:cached_network_image/cached_network_image.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:shimmer/shimmer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';


import '../component/custom_icon_appbar.dart';
import '../component/custom_network_image.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';

import '../controller/home_cubit.dart';
import '../controller/home_state.dart';
class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  var pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {


    return BlocConsumer<HomeCubit,HomeState>(
      listener: (context,state){},
      builder: (context,state){
        HomeCubit cubit = HomeCubit.get(context);
        return Scaffold(
          appBar: PreferredSize(
            preferredSize:
            Size.fromHeight(MediaQuery.of(context).size.height * 0.18),
            child: AppBar(
              backgroundColor: Colors.white,
              elevation: 0.0,
              systemOverlayStyle: SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarColor: Colors.white,
              ),
              leading: Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CustomIconAppBar(
                          onTap: () {}, icon: Icons.shopping_cart_outlined),
                    ),
                    SizedBox(width: 2),
                    Text(
                      'اهلا بك , ${cubit.userData?.data?.name??""}',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
              leadingWidth: 100,
              actions: [
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Column(
                    children: [
                      Text(
                        'اهلا بك في',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'سوق العراق',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.green,
                        ),
                      ),
                    ],
                  ),
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextFormField(
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            decoration: InputDecoration(
                              hintText: 'ابحث عن منتجك',
                              contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              prefixIcon: Icon(Icons.search),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body:
          SingleChildScrollView(
            child: ConditionalBuilder(
              condition:state is! ShowSliderLoading && state is! ShowCategoryLoading && state is! ShowProductLoading,
              builder: (context){
                return   SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        // image
                        Container(
                          height: MediaQuery.of(context).size.height * 0.5 / 3,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Color(0xfff6f6f6),
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
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        //image
                        SizedBox(
                          height: 200,
                          child: Directionality(
                            textDirection: TextDirection.rtl,
                            child: GridView.count(
                              physics: const BouncingScrollPhysics(),
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              crossAxisCount: 2,
                              mainAxisSpacing: 2.0,
                              crossAxisSpacing: 2.0,
                              childAspectRatio: 1 / 1.4,
                              children: List.generate(
                               3,
                                    (index) =>  Column(
                                      children: [
                                        Expanded(
                                          child: CachedNetworkImage(
                                            imageUrl:"",
                                            imageBuilder: (context, imageProvider) =>
                                                Container(
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),

                                            ///=== is dark baseColor = grey[800]! & hightLightColor = grey[850]! ===///
                                            placeholder: (context, url) => Shimmer.fromColors(
                                              baseColor: Colors.grey.shade400,
                                              highlightColor: Colors.grey,
                                              child: Container(
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                            errorWidget: (context, url, error) =>
                                            const Icon(Icons.error),
                                            height: 100,
                                            fit: BoxFit.cover,
                                            width: 100,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ],
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          'المنتجات',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        // 3 Button
                        Row(
                          textDirection: TextDirection.rtl,
                          children: [
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: MaterialButton(
                                  onPressed: () {
                                    // cubit.index =0;
                                    // cubit.changeButton(0);
                                  },
                                  child: Text(
                                    'الاحدث',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:  Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: MaterialButton(
                                  onPressed: () {
                                    // cubit.index =1;
                                    // cubit.changeButton(1);
                                  },
                                  child: Text(
                                    'العروض',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                    color:  Colors.green,
                                    borderRadius: BorderRadius.circular(30)),
                                child: MaterialButton(
                                  onPressed: () {
                                    // cubit.index =2;
                                    // cubit.changeButton(2);
                                  },
                                  child: Text(
                                    'كل المنتجات',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                        color:Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 4,
                        ),
                        GridView.count(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          crossAxisCount: 2,
                          mainAxisSpacing: 2.0,
                          crossAxisSpacing: 2.0,
                          childAspectRatio: 1 / 1.5,
                          children: List.generate(
                           3,
                                (index) => Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  textDirection: TextDirection.rtl,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomNetworkImage(
                                      image:
                                      '',
                                      height: 120,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      // '${cubit.productModel![index].name}',
                                      "nehal",
                                      style: const TextStyle(
                                        fontSize: 16,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Text(
                                      '',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),

                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 1,
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Row(
                                      textDirection: TextDirection.rtl,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          '',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                          width: 3,
                                        ),
                                        Text(
                                          'د.ع',
                                          style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 3,
                                    ),
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.green,
                                          ),
                                          borderRadius: BorderRadius.circular(30)),
                                      child: Padding(
                                        padding: const EdgeInsets.all(1),
                                        child: MaterialButton(
                                          onPressed: () {},
                                          child: Text(
                                            'أضافة للسلة',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
              fallback:(context)=>const Center(child: RefreshProgressIndicator()) ,
                ),
          ),


        );
      },
    );
  }
}
