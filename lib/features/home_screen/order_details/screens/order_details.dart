import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/utils/get_size.dart';
import '../../../../core/utils/styles.dart';
import '../../orders/cubit/orders_cubit.dart';
import '../cubit/order_details_cubit.dart';
import 'custom_cart_widget_details.dart';
import 'package:flutter/material.dart';

class OrderDetails extends StatefulWidget {
   OrderDetails({super.key,this.id});
  String ?id;

  @override
  State<OrderDetails> createState() => _OrderDetailsState();
}

class _OrderDetailsState extends State<OrderDetails> {
  void initState() {
    super.initState();
    context.read<OrderDetailsCubit>().GetOrdersDetails(id:widget.id);
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OrderDetailsCubit, OrderDetailsState>(
        builder: (context, state) {

      var cubit = context.read<OrderDetailsCubit>();
      return Scaffold(
        body: (state is OrdersDetailsLoading)
            ? Center(
          child: CircularProgressIndicator(),)
            : SafeArea(
        bottom: true,
        child: Scaffold(
        body:  ListView(
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
                title: Text("orders".tr(),
                    style: Styles.style20.copyWith(color: Colors.black)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                // height: 300.h,
                margin: EdgeInsets.only(top: getSize(context) / 40),
                width: getSize(context),
                decoration: BoxDecoration(
                    color: Colors.red.shade200.withOpacity(.09), // Background color
                    border: Border.all(
                      color: Colors.red, // Border color
                      width: 2.0, // Border width
                    ),
                    borderRadius:
                    BorderRadius.circular(20.0), // Border radius
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.01), // Shadow color
                        spreadRadius: 5, // Spread radius
                        blurRadius: 7, // Blur radius
                        offset: Offset(0, 2), // Shadow position
                      ),
                    ]),
                // didnt have scroll
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/ordernumber.png"),
                        ),
                        Text("ordernum".tr()),
                        Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            cubit?.getMyOrderModel?.data?.total?.toString()??"nehal"
                            ,style: Styles.style16.copyWith(color: Colors.black),),
                        )
                      ],),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/calender.png"),
                        ),
                        Text("ordernum".tr()),
                        SizedBox(width: 30.w,),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/watch.png"),
                        ),
                        Text(cubit?.getMyOrderModel?.data?.date.toString()??"3:30"),
                      ],),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset("assets/images/grage.png"),
                        ),
                        Text("ordernum".tr()),
                        Spacer(),

                      ],),
                  ],
                ),
              ),
            ),

            CustomCartWidgetdetails(itemCount: cubit.getMyOrderModel?.data?.details?.length??0,),
            // CustomCartWidgetdetails(itemCount: 2,),
            SizedBox(height: 300.h,)

          ],
        ),
        bottomSheet: Container(
          height: 130.h,
            decoration: BoxDecoration(
              color:Colors.grey[300],
    borderRadius: BorderRadius.only(topRight:Radius.circular(20) ,topLeft:Radius.circular(20) ),

            ),
          child:Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("الاجمالي",style: Styles.style16.copyWith(color: Colors.black),),
                    Text(cubit.getMyOrderModel?.data?.details?[0]?.total?.toString()??"",style: Styles.style16.copyWith(color: Colors.black),)
                  ],),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal:25.0,),
                child: SizedBox(
                  width: double.infinity, // Set the width to the maximum available
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, // لون الزر
                    ),
                    child: Text(
                      "اعادة الطلب",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15.sp,
                      ),
                    ),
                  ),
                ),
              ),

            ],
          ),
        ) ,
            ),
      )
      );
  }
    );}
}
