import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styles.dart';
import '../cubit/points_cubit.dart';

class MyPoints extends StatefulWidget {
  const MyPoints({super.key});

  @override
  State<MyPoints> createState() => _MyPointsState();
}

class _MyPointsState extends State<MyPoints> {

  void initState() {
    super.initState();
    context.read<PointsCubit>().getPoints();
  }
  @override
  Widget build(BuildContext context) {
    PointsCubit cubit = PointsCubit.get(context);

    return BlocBuilder<PointsCubit, PointsState>(
        builder: (context, state) {
    return    SafeArea(
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
              title: Text("points".tr(),
              style: Styles.style20.copyWith(color: Colors.black)),
              ),
              ),
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'nono',
                    child: Container(
                      width: 160.w,
                      height: 100.w,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey, // Lighter shadow color
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 8.0, top: 5.0),
                            child: Text(
                              "points".tr(),
                              style: Styles.style16.copyWith(color: Colors.black),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/coins.png"),
                              ),
                              Text(
                                cubit.coinsModel?.data?.user.points.toString()??"nono",
                                style: Styles.style16.copyWith(color: Colors.black),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
          Flexible(
            child: ListView.builder(
         //     itemCount: cubit.coinsModel?.data?.ads.length??3,
              itemCount: 3,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) {
              return   Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  width: MediaQuery.sizeOf(context).width,
                  height: 110.w,
                  decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey, // Lighter shadow color
              blurRadius: 2,
              offset: Offset(0, 1),
            ),
          ],
                  ),
                  child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              fit:FlexFit.loose,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.asset("assets/images/coins.png"),
              ),
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cubit.coinsModel?.data?.user.name.toString()??"nono"
                    // cubit.coinsModel?.data?.user.name??"nehal",
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(  cubit.coinsModel?.data?.user.type??"",maxLines: 1,overflow:TextOverflow.ellipsis ,),
                ),

              ],
            )
          ],
                  ),
                ),
              );
            },

            ),
          )


            ]  )),
    );
  }
    );}
}
