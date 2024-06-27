import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart%20';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/styles.dart';
import '../../myprofile/cubit/get_profile_cubit.dart';
import '../../screens/widgets/menue_widget.dart';

class VendorProfile extends StatelessWidget {
  const VendorProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit, GetProfileState>(
        builder: (context, state) {
      GetProfileCubit cubit = GetProfileCubit.get(context);
      return SafeArea(
          child: Scaffold(
              body: SingleChildScrollView(
                  child: Column(children: [
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
            title: Text("profile".tr(),
                style: Styles.style20.copyWith(color: Colors.black)),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  (cubit.profileModel?.data?.first?.image.toString() ?? ''),
                  //
                  // fit:  BoxFit.fill
                ),
              ),
            ),
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cubit.profileModel?.data?.first.name ?? "adPay",
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(cubit.profileModel?.data?.first.phone.toString() ??
                        "-"),
                  ],
                ),
              ),
            ),
          ],
        ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.myharag);
                        },
                        child: MenueWidget(
                          text: 'products'.tr(),
                          path: 'assets/images/boxesproduct.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.myharag);
                        },
                        child: MenueWidget(
                          text: 'orders'.tr(),
                          path: 'assets/images/my-orders.png',
                        ),
                      ),
                    ),
      ])
              )));
    });
  }
}
