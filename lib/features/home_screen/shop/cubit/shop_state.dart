part of 'shop_cubit.dart';

@immutable
sealed class ShopState {}

final class ShopInitial extends ShopState {}
class LoadingShop extends ShopState{}
class ErrorShop extends ShopState{}
class LoadedShop extends ShopState{
  final ShopModel ?shopModel;
  LoadedShop({required this.shopModel});
}