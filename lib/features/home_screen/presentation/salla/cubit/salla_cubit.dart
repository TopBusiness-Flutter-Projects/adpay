import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../../config/routes/app_routes.dart';
import '../../../../../core/models/confirm_order.dart';
import '../../../../../core/models/get_cart_model.dart';
import '../../../../../core/preferences/preferences.dart';
import '../../../../../core/remote/service.dart';
import '../../../../../core/utils/dialogs.dart';

part 'salla_state.dart';

class SallaCubit extends Cubit<SallaState> {
  ServiceApi api;

  SallaCubit(this.api) : super(SallaInitial());
  GetCartModel? cartModel;

  static SallaCubit get(context) => BlocProvider.of(context);
  Future<void> getCart() async {
    emit(SallaLoading());
    final response = await api.getCart();
    //
    response.fold((l) {
      emit(SallaError());
    }, (right) async {
      print("sucess cubit");
      cartModel = right;
      // print('homemodel : ${catogriesModel?.data?.ads?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(SallaLoaded(cartmodel: right));
    });
  }

  Future<void> increment({
    Cart? model,
  }) async {
    model?.qty = (model.qty!) + 1;
    print(cartModel?.data?.first.carts?.first.qty.toString());
    emit(incremented());
  }

  Future<void> decrement({
    Cart? model,
  }) async {
    model?.qty = (model.qty!) - 1;
    print(cartModel?.data?.first.carts?.first.qty.toString());

    emit(decremented());
  }

  //lconfirmotp
  Future<void> postConfirm(context) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(ConfirmLoading());
    final response = await api.confirmOrder(confirmList: confirmList);
    response.fold((l) {
      emit(ConfirmError());
    }, (r) async {
      // Preferences.instance.clearAllData().then(
      //         (value) =>
      //         Navigator.pushNamedAndRemoveUntil(
      //             context,
      //             Routes.choosLogin,
      //                 (route) => false)
      // );
      print("loaded");
      successGetBar(r.msg);
      emit(ConfirLoaded());
      postempty(context);
      Navigator.pushNamed(
        context,
        Routes.completeorder,
      );
    });
  }

  onTapConfirm(BuildContext context) async {
    fillConfirmList().then((e) {

      print('confirm List : ${confirmList.length}');
      postConfirm(context);
    });
  }

//postempty
  Future<void> postempty(context) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(emptyLoading());
    final response = await api.emptycard();
    response.fold((l) {
      emit(emptyError());
    }, (r) async {
      // Preferences.instance.clearAllData().then(
      //         (value) =>
      //         Navigator.pushNamedAndRemoveUntil(
      //             context,
      //             Routes.choosLogin,
      //                 (route) => false)
      // );
      print("loaded");
      successGetBar(r.msg);
      emit(emptyLoaded());
    });
  }
  //post delete 
  Future<void> postDelete({ required product_id, required user_id}) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(DeleteLoading());
    final response = await api.deleteCard(product_id: product_id, user_id: user_id);
    response.fold((l) {
      emit(DeleteError());
    }, (r) async {
      // Preferences.instance.clearAllData().then(
      //         (value) =>
      //         Navigator.pushNamedAndRemoveUntil(
      //             context,
      //             Routes.choosLogin,
      //                 (route) => false)
      // );
      print("loaded");
      successGetBar(r.msg);
      emit(DeleteDone());
      getCart();
    });
  }
  //
  //


  List<Cart> confirmList = [];
  Future fillConfirmList() async {
    for (int i = 0; i < cartModel!.data!.length; i++) {
      confirmList.addAll(cartModel!.data![i].carts ?? []);
    }
    emit(SuccessFillConformList());
  }
}
