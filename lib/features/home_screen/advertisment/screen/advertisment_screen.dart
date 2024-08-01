import 'package:adpay/features/home_screen/advertisment/screen/widgets/advertesment_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/api/end_points.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/styles.dart';
import '../cubit/adsence_cubit.dart';

class Advertesment_Screen extends StatefulWidget {
  const Advertesment_Screen({super.key});
  @override
  _Advertesment_ScreenState createState() => _Advertesment_ScreenState();
}

class _Advertesment_ScreenState extends State<Advertesment_Screen> {
  void initState() {
    super.initState();
    context.read<AdsenceCubit>().getAdsence();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AdsenceCubit, AdsenceState>(
      listener: (context, state) {},
      builder: (context, statee) {
        AdsenceCubit cubit = AdsenceCubit.get(context);
        return SafeArea(
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
                      title: Text("advertisements".tr(),
                          style: Styles.style20.copyWith(color: Colors.black)),
                    )),
                statee is LoadedAdsence
                    ? Flexible(
                        fit: FlexFit.tight,
                        child: ListView.builder(
                          padding: EdgeInsets.all(5),
                          physics: const BouncingScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: cubit.adesnceModel!.data!.length,
                          itemBuilder: (context, index) {
                            return AdvertesmentWidet(
                              ads: cubit.adesnceModel!.data![index],
                            );
                          },
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        );
      },
    );
  }
}
