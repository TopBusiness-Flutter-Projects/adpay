import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/products_model.dart';
import '../../../../../core/remote/service.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.api) : super(ProductsInitial());
  ServiceApi api;

  ProductModel? productsModel ;
  static ProductsCubit get(context) => BlocProvider.of(context);
  Future<void> getProducts({ String ?id}) async {
    emit(LoadingProducts());
    final response = await api.ProductsData(id: id);
    response.fold((l) {
      emit(ErrorProducts());
    }, (right) async {
      print("sucess cubit");
      productsModel =right   ;
      // print('homemodel : ${catogriesModel?.data?.ads?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(LoadedProducts( ProductsModel: right));
    });
  }
}
