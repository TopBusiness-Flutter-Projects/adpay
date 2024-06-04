import 'package:adpay/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        if (r.data![i].type == 'cancelled') {
          vendorOrdersCancelled.add(r.data![i]);
        } else if (r.data![i].type == 'complete') {
          vendorOrdersComplete.add(r.data![i]);
        } else if (r.data![i].type == 'new') {
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
}
