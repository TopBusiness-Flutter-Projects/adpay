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