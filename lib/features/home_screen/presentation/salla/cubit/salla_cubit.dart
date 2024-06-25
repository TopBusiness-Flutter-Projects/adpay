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
  Cart? cart;
  String? total;
  static SallaCubit get(context) => BlocProvider.of(context);
  Future<void> getCart() async {
    getTotalPrice = 0;

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

      for (int i = 0; i < cartModel!.data!.length; i++) {
        totalCart(cartModel!.data![i]);
      }
      emit(SallaLoaded(cartmodel: right));
    });
  }

  Future<void> increment({Cart? model, required GetCartModelData item}) async {
    totalCart(item);

    model?.qty = (model.qty!) + 1;
    print(cartModel?.data?.first.carts?.first.qty.toString());
    emit(incremented());
  }

  Future<void> decrement({Cart? model, required GetCartModelData item}) async {
    if (model!.qty! > 1) {
      model?.qty = (model.qty!) - 1;
      print(cartModel?.data?.first.carts?.first.qty.toString());
      totalCart(item, isMinus: true);
    }

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
  Future<void> postDelete(
      {required product_id,
      required user_id,
      required GetCartModelData item}) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(DeleteLoading());
    final response =
        await api.deleteCard(product_id: product_id, user_id: user_id);
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

      totalCart(item);
      emit(DeleteDone());
      getCart();
    });
  }
  //
  //

// double ?total;
  List<Cart> confirmList = [];
  List<GetCartModelData> stringtotalList = [];

  Future fillConfirmList() async {
    for (int i = 0; i < cartModel!.data!.length; i++) {
      confirmList.addAll(cartModel!.data![i].carts ?? []);
    }
    emit(SuccessFillConformList());
  }

  // Future <String>stringTotal() async {
  //   for (int i = 0; i < cartModel!.data!.length; i++) {
  //     // stringtotalList.addAll(cartModel!.data![i]?? []);
  //     // total= (cartModel?.data?[i].carts?[i].total + cartModel?.data?[i+1].carts?[i].total).toString();
  //   }
  //   return total.toString();
  // }
  // Future<void>totalCart(context)async{
  //   for(int i =0;i<confirmList.length ; i++ )
  //     confirmList[i].price *  cart?.qty;
  // }
  Future<void> totalCart(GetCartModelData item, {bool isMinus = false}) async {
    item.total = 0;
    for (int i = 0; i < item.carts!.length; i++) {
      int price = item.carts![i].price ?? 0; // Use 0 if price is null
      int qty = item.carts?[i].qty ?? 0; // Use 0 if qty is null

      if (isMinus) {
        item.total -= (price * qty);
      } else {
        item.total += double.parse((price * qty).toString());
      }
      getTotalCart();
      emit(totalstate());
      // Do something with the total, e.g., add to a total sum
    }
  }

  double getTotalPrice = 0;
  Future<void> getTotalCart() async {
    getTotalPrice = 0;
    for (int i = 0; i < cartModel!.data!.length; i++) {
      getTotalPrice += cartModel!.data![i].total;
      emit(GetTotalstate());

      // Do something with the total, e.g., add to a total sum
    }
  }
}
