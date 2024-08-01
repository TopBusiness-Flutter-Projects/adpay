import 'package:adpay/core/widgets/delete_account_dialog.dart';
import 'package:adpay/features/home_screen/menue/cubit/logout_cubit.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/utils/styles.dart';
import '../../../../home_screen_provider/main_screen/cubit/cubit.dart';
import '../../../../home_screen_provider/main_screen/cubit/state.dart';
import '../../myprofile/cubit/get_profile_cubit.dart';
import '../../screens/widgets/menue_widget.dart';

class VendorProfile extends StatefulWidget {
  const VendorProfile({super.key});

  @override
  State<VendorProfile> createState() => _VendorProfileState();
}

class _VendorProfileState extends State<VendorProfile> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MainVendorCubit, MainVendorState>(
        builder: (context, state) {
          MainVendorCubit cubit = MainVendorCubit.get(context);
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
                  (cubit.userData?.data?.image.toString() ?? ''),
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
                      cubit.userData?.data?.name ?? "adPay",
                      maxLines: 1,
                      style: TextStyle(
                        overflow: TextOverflow.ellipsis,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(cubit.userData?.data?.phone.toString() ??
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
                          Navigator.pushNamed(context, Routes.productVendor);
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
                          Navigator.pushNamed(context, Routes.vendorOrdersUrl);
                        },
                        child: MenueWidget(
                          text: 'orders'.tr(),
                          path: 'assets/images/my-orders.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.advVendor);
                        },
                        child: MenueWidget(
                          text: 'advertisements'.tr(),
                          path: 'assets/images/marketing.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.editProfileVendor);
                        },
                        child: MenueWidget(
                          text: 'edit'.tr(),
                          path: 'assets/images/editvendor.png',
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          // delete account

                          showDeleteAccountAlert(context);



                         // Navigator.pushNamed(context, Routes.myharag);
                        },
                        child: MenueWidget(
                          text: 'delete'.tr(),
                          path: 'assets/images/recycle.png',
                        ),
                      ),
                    ),


      ])
              )));
    });
  }
}
