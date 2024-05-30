import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


import '../main_screen/cubit/home_cubit.dart';
import '../main_screen/cubit/home_state.dart';
import '../products/cubit/products_cubit.dart';
import 'custom_product_widget.dart';

class BestSellerforProducts extends StatefulWidget {
   BestSellerforProducts({super.key,this.id});
String ? id;
  @override
  State<BestSellerforProducts> createState() => _BestSellerforProductsState();
}

class _BestSellerforProductsState extends State<BestSellerforProducts> {
  void initState() {
    super.initState();
    context.read<ProductsCubit>().getProducts(id: widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return  BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, statee) {
        if (statee is LoadedADS) {

          HomeCubit cubit = HomeCubit.get(context);
          return SizedBox(
            height: 200.h,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: statee.homeModel!.data!.products!.length,
              itemBuilder: (context, index) {
                return CustomProductWidget(product:  statee.homeModel!.data!.products?[index],);
              },
            ),
          );
        }
        else {
          return  Container();
        }
      },
    );
  }
}

