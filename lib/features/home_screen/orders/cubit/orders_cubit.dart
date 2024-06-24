import 'package:adpay/core/remote/service.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/models/get_my_orders_model.dart';
part 'orders_state.dart';

class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.api) : super(OrdersInitial());
  ServiceApi api;
  GetMyOrderModel? getMyOrderModel ;
  String currentUserOrder = 'complete';

  onChangeUserOrder(String name){
    currentUserOrder = name;
    GetOrders();
    emit(OnChangeUserOrder());
  }
  static OrdersCubit get(context) => BlocProvider.of(context);
  Future<void> GetOrders() async {
    emit(OrdersLoading());
    final response = await api.getMyorders(text: currentUserOrder);
    response.fold((l) {
      emit(OrdersError());
    }, (right) async {
      print("sucess cubit");
      getMyOrderModel = right;
      // print('homemodel : ${catogriesModel?.data?.ads?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(OrdersLoaded( ordermodel: right));
    });
  }
}
