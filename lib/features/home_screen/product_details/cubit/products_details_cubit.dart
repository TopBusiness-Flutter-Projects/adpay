import 'package:adpay/core/utils/dialogs.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/models/product_details._modeldart';
import '../../../../core/remote/service.dart';
import '../../grage_details/cubit/grage_details_cubit.dart';
part 'products_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductsDetailsCubit(this.api) : super(ProductsDetailsInitial());
  ServiceApi api;

  ProductDetailsModel? productsModelDetails;
  static ProductsDetailsCubit get(context) => BlocProvider.of(context);
  Future<void> getProductsDetils({String? id}) async {
    emit(LoadingProductsDetails());
    final response = await api.ProductsDetails(id: id);
    response.fold((l) {
      emit(ErrorProductsDetails());
    }, (right) async {
      print("sucess cubit");
      productsModelDetails = right;

      print("loaded");
      emit(LoadedProductsDEtails(productsDetailsModel: right));
    });
  }

  //favourite
  Future<void> AddAndRemoveFromFavourite(
      {required BuildContext context,
      bool isAuction = false,
      String? productId}) async {
    var pref = await SharedPreferences.getInstance();
    emit(LoadingProductsDetails());
    final response =
        await api.FavouriteStore(isAuction: isAuction, productId: productId);
    //
    response.fold((l) {
      emit(ErrorProductsDetails());
    }, (r) async {
      
      // print(';/')
      if (isAuction) {
        context.read<GrageDetailsCubit>().grageModelDetails?.isFav = !(context.read<GrageDetailsCubit>().grageModelDetails?.isFav ?? false);
      } else {
        productsModelDetails?.data?.isFav =
            !(productsModelDetails?.data?.isFav ?? true);
      }

      // getProductsDetils(id: productId);
      successGetBar(r.msg);
      emit(LoadedFavorite());
    });
  }
}
