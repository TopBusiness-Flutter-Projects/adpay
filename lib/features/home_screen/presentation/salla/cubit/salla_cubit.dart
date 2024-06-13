import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/get_cart_model.dart';
import '../../../../../core/remote/service.dart';

part 'salla_state.dart';

class SallaCubit extends Cubit<SallaState> {
  ServiceApi api;

  SallaCubit(this.api) : super(SallaInitial());
  GetCartModel? cartModel ;
  static SallaCubit get(context) => BlocProvider.of(context);
  Future<void> getCart() async {
    emit(SallaLoading());
    final response = await api.getCart();
    //
    response.fold((l) {
      emit(SallaError());
    }, (right) async {
      print("sucess cubit");
      cartModel =right   ;
      // print('homemodel : ${catogriesModel?.data?.ads?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(SallaLoaded(cartmodel: right));
    });
  }
}
