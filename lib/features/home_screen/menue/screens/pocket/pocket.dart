import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../core/utils/styles.dart';
import 'cubit/pocket_cubit.dart';

class PocketScreen extends StatefulWidget {
  const PocketScreen({super.key});

  @override
  State<PocketScreen> createState() => _PocketScreenState();
}

class _PocketScreenState extends State<PocketScreen> {

  void initState() {
    super.initState();
    context.read<PocketCubit>().getPocket();
  }
  @override
  Widget build(BuildContext context) {
    PocketCubit cubit = PocketCubit.get(context);

    return BlocBuilder<PocketCubit, PocketState>(
        builder: (context, state) {
    return   SafeArea(
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
                    title: Text("pocket".tr(),
                        style: Styles.style20.copyWith(color: Colors.black)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Hero(
                    tag: 'pocket',
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
                              "pocket".tr(),
                              style: Styles.style16.copyWith(color: Colors.black),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset("assets/images/pocket.png"),
                              ),
                              Text(
                                cubit.walletModel?.data.wallet.toString()??"1",
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
                      shrinkWrap: true,

                      itemCount: 3,
                      itemBuilder: (context,index){
                    return  Padding(
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
                                child: Image.asset("assets/images/pocket.png"),
                              ),
                            ),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(cubit.walletModel?.data?.user.name.toString()??"nono"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text( cubit.walletModel?.data.user.type.toString()??"type",maxLines: 1,overflow:TextOverflow.ellipsis ,),
                                ),

                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
                )
              ]  )),
    );
  }
    );}
}
