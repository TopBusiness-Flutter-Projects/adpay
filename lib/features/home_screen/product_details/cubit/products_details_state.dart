part of 'products_details_cubit.dart';

@immutable
sealed class ProductsDetailsState {}

final class ProductsDetailsInitial extends ProductsDetailsState {}
class LoadingProductsDetails extends ProductsDetailsState{}
class ErrorProductsDetails extends ProductsDetailsState{}
class LoadedProductsDEtails extends ProductsDetailsState{
  final ProductDetailsModel ?productsDetailsModel;
  LoadedProductsDEtails({required this.productsDetailsModel});
}
//favourite
class LoadedFavorite extends ProductsDetailsState{
  LoadedFavorite();
}
//state
class LoadingCart extends ProductsDetailsState {}

class LoadedCart extends ProductsDetailsState {
  final AddToCartModel addtocartModel;
  LoadedCart({required this.addtocartModel});
}

class ErrorCart extends ProductsDetailsState {}