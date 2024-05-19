import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/shop_model.dart';
import '../../../../../core/models/shop_model.dart';
import '../../../../../core/remote/service.dart';

part 'shop_state.dart';

class ShopCubit extends Cubit<ShopState> {
  ShopCubit(this.api) : super(ShopInitial());
  ServiceApi api;

  ShopModel? shopModel ;
  static ShopCubit get(context) => BlocProvider.of(context);
  Future<void> getShop({ String ?id}) async {
    emit(LoadingShop());
    final response = await api.ShopList(id: id);
    response.fold((l) {
      emit(ErrorShop());
    }, (right) async {
      print("sucess cubit");
      shopModel =right   ;
      print("loaded");
      emit(LoadedShop(shopModel: right));
    });
  }
}
