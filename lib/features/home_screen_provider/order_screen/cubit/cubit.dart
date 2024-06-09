import 'package:adpay/config/routes/app_routes.dart';
import 'package:adpay/core/remote/service.dart';
import 'package:adpay/features/home_screen_provider/main_screen/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../../../core/models/order_details.dart';
import '../../../../core/models/vendor_order_model.dart';
import 'state.dart';

class VendorOrderCubit extends Cubit<VendorOrderState> {
  VendorOrderCubit(this.api) : super(InitVendorOrderState());
  ServiceApi api;
  VendorOrdersModel? vendorOrdersModel;
  List<VendorOrderData> vendorOrdersNew = [];
  List<VendorOrderData> vendorOrdersComplete = [];
  List<VendorOrderData> vendorOrdersCancelled = [];
  int currentOrderIndex = 0;

  getVendorOrders() async {
    vendorOrdersNew = [];
    vendorOrdersComplete = [];
    vendorOrdersCancelled = [];
    emit(LoadingGetOrdersVendor());
    final res = await api.getVendorOrders();
    res.fold((l) {
      emit(ErrorGetOrdersVendor());
    }, (r) {
      vendorOrdersModel = r;
      for (int i = 0; i < r.data!.length; i++) {
        if (r.data![i].type == 'cancelled' &&
            (!vendorOrdersCancelled.contains(r.data![i]))) {
          vendorOrdersCancelled.add(r.data![i]);
        } else if (r.data![i].type == 'complete' &&
            (!vendorOrdersComplete.contains(r.data![i]))) {
          vendorOrdersComplete.add(r.data![i]);
        } else if ((r.data![i].type == 'new' || r.data![i].type == 'pending') &&
            (!vendorOrdersNew.contains(r.data![i]))) {
          vendorOrdersNew.add(r.data![i]);
        } else {
          //!
        }
      }

      emit(LoadedGetOrdersVendor());
    });
  }

  MainDetailsModel? detailsModel;
  getVendorOrderDetails(String id) async {
    emit(LoadingGetDetailsOrdersVendor());
    final res = await api.getVendorOrderDetails(id);

    res.fold((l) {
      emit(ErrorGetDetailsOrdersVendor());
    }, (r) {
      detailsModel = r;

      print('..........${detailsModel?.data?.reference.toString()}');
      emit(LoadedGetDetailsOrdersVendor());
    });
  }

  changVendorOrderStatus({
    required String id,
    String type = 'new',
    required BuildContext context,
  }) async {
    emit(LoadingChangeOrderStateVendor());

    final res = await api.changVendorOrderStatus(id: id, type: type);

    res.fold((l) {
      //!
      emit(ErrorChangeOrderStateVendor());
    }, (r) {
      if (r.data!.type == 'pwnding') {
        currentOrderIndex = 0;
      } else if (r.data!.type == 'complete') {
        currentOrderIndex = 1;
      } else if (r.data!.type == 'cancelled') {
        currentOrderIndex = 2;
      } else {
        currentOrderIndex = 0;
      }

      context.read<MainVendorCubit>().currentIndex = 1;

      Navigator.pushNamed(context, Routes.floatVendor);

      Fluttertoast.showToast(msg: r.msg ?? '');

      emit(LoadedChangeOrderStateVendor());
    });
  }
}
