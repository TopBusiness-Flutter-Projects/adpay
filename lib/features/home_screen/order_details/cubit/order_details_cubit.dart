import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';import '../../../../core/models/new_order_details_model.dart';
import '../../../../core/remote/service.dart';
part 'order_details_state.dart';
class OrderDetailsCubit extends Cubit<OrderDetailsState> {
  OrderDetailsCubit(this.api) : super(OrdersDetailsInitial());
  static OrderDetailsCubit get(context) => BlocProvider.of(context);
  OrdersDetailsNewModel? getMyOrderModel ;
  ServiceApi api;
  Future<void> GetOrdersDetails({String? id}) async {
    emit(OrdersDetailsLoading());
    print('..............${id}');
    final response = await api.newDetailsOfOrder(id: id??'1');
    response.fold((l) {
      emit(OrdersDetailsError());
    }, (right) async {
      print("sucess cubit");
       getMyOrderModel = right;
      // print('homemodel : ${catogriesModel?.data?.ads?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(OrdersDetailsLoaded(ordermodel: right));
    }
    );
  }
}
