import 'package:adpay/core/models/product_details_model.dart';
import 'package:adpay/core/utils/dialogs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/models/add_to_cart_model.dart';
import '../../../../core/remote/service.dart';
import '../../grage_details/cubit/grage_details_cubit.dart';
part 'products_details_state.dart';

class ProductsDetailsCubit extends Cubit<ProductsDetailsState> {
  ProductsDetailsCubit(this.api) : super(ProductsDetailsInitial());
  ServiceApi api;

  ProductDetailsModel? productsModelDetails;
  static ProductsDetailsCubit get(context) => BlocProvider.of(context);
  Future<void> getProductsDetils({String? id}) async {
    productsModelDetails = null;
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
        context.read<GrageDetailsCubit>().grageModelDetails?.isFav =
            (context.read<GrageDetailsCubit>().grageModelDetails?.isFav == true)
                ? false
                : true;
      } else {
        productsModelDetails?.data?.isFav =
            (productsModelDetails?.data?.isFav == true) ? false : true;
      }

      // getProductsDetils(id: productId);
      successGetBar(r.msg);

      context.read<GrageDetailsCubit>().grageModelDetails = null;
      emit(LoadedFavorite());
    });
  }

  //addcart
  AddToCartModel? addtocartModel;
  Future<void> addCart() async {
    emit(LoadingCart());
    final response = await api.addCart(
        product_id: productsModelDetails?.data?.id.toString() ?? "19",
        qty: '1');
    response.fold((l) {
      emit(ErrorCart());
    }, (r) async {
      print("sucess cubit");
      successGetBar(r.msg);
      addtocartModel = r;
      print("loaded");
      emit(LoadedCart(addtocartModel: r));
    });
  }
}
