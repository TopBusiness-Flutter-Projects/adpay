import 'package:adpay/core/utils/get_size.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/styles.dart';
import '../../component/catogreyCard.dart';
import '../../component/custom_grage_widget.dart';
import '../../main_screen/cubit/home_cubit.dart';
import '../cubit/grage_cubit.dart';



class GrageScreen extends StatefulWidget {
  GrageScreen({super.key});

  @override
  _GrageScreenState createState() => _GrageScreenState();
}

class _GrageScreenState extends State<GrageScreen> {
  void initState() {
    super.initState();
    context.read<GrageCubit>().getGarge();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GrageCubit, GrageState>(builder: (context, state) {
      GrageCubit cubit = GrageCubit.get(context);
      return SafeArea(
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
                  title: Text("garage".tr(),
                      style: Styles.style20.copyWith(color: Colors.black)),
                ),
              ),
              CategoryCard(
                currentId: int.parse('0'),
              ),
              (state is LoadingGarge)
                  ? Flexible(
                      child: Container(
                          alignment: Alignment.center,
                          height: getSize(context),
                          child: Center(
                            child: CircularProgressIndicator(),
                          )),
                    )
                  : (cubit.grageModel!.data.isEmpty)
                      ? Flexible(
                          child: Container(
                              alignment: Alignment.center,
                              height: getSize(context),
                              child: Text("no_data".tr())),
                        )
                      : Flexible(
                          child: GridView.builder(
                            shrinkWrap: true,
                            padding: EdgeInsets.all(16),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              crossAxisSpacing: 16,
                              mainAxisSpacing: 16,
                            ),
                            itemCount: cubit.grageModel?.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              return CustomGrageWidget(auctions:context.read<HomeCubit>().homeModel?.data?.auctions?[index]);
                            },
                          ),
                        )
            ],
          ),
        ),
      );
    });
  }
}
