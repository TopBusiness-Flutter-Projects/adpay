import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/get_vendor_model.dart';
import '../../../../core/remote/service.dart';

part 'tager_state.dart';

class TagerCubit extends Cubit<TagerState> {
  TagerCubit(this.api) : super(TagerInitial());
  ServiceApi api;

  MainVendorHomeModel? vendorModel ;
  static TagerCubit get(context) => BlocProvider.of(context);
  Future<void> getVendor({ String ?id}) async {
    emit(LoadingTager());
    final response = await api.getVendorProfile();
    response.fold((l) {
      emit(ErrorTager());
    }, (right) async {
      print("sucess cubit");
      vendorModel=right;
      print("loaded");
      emit(LoadedTager( vendorModel: right));
    });
  }
}
