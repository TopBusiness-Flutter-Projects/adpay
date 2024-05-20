
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/utils/styles.dart';
import '../../component/custom_product_widget.dart';
import '../../main_screen/cubit/home_cubit.dart';
import '../../main_screen/cubit/home_state.dart';
class BestSellerScreen extends StatefulWidget {
  BestSellerScreen({super.key});

  @override
  State<BestSellerScreen> createState() => _BestSellerScreenState();
}

class _BestSellerScreenState extends State<BestSellerScreen> {
  @override
  Widget build(BuildContext context) {
    return   BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, statee) {
        HomeCubit cubit = HomeCubit.get(context);
        return
         SafeArea(
          // bottom: true,
          child: Scaffold(
            body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back)),
                    ),
                    title: Text("BsetSeller".tr(),
                        style: Styles.style20.copyWith(color: Colors.black)),
                  ),
                ),

                    Flexible(
                  child: GridView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.all(16),
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 16,
                      mainAxisSpacing: 16,
                    ),
                    itemCount: cubit.homeModel?.data?.productMostSell?.length??1,
                    itemBuilder: (BuildContext context, int index) {
                      return CustomProductWidget(product:  cubit.homeModel?.data?.productMostSell?[index]);
                    },
                  ),
                )
              ],
            ),
          ),
        );}
      // }
      // else {
      //   return const Center(child: Text("no data"));
      // }
      ,
    );
  }
}
