part of 'products_cubit.dart';

@immutable
sealed class ProductsState {}

final class ProductsInitial extends ProductsState {}
class LoadingProducts extends ProductsState{}
class ErrorProducts extends ProductsState{}
class LoadedProducts extends ProductsState{
  final ProductModel ?ProductsModel;
  LoadedProducts({required this.ProductsModel});
}