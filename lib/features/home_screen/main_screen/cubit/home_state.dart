import 'package:adpay/core/models/Home_models.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class ShowSliderLoading extends HomeState {}

class ShowSliderSuccess extends HomeState {}

class ShowSliderError extends HomeState {
  final String error;

  ShowSliderError(this.error);
}

class ShowCategoryLoading extends HomeState {}

class ShowCategorySuccess extends HomeState {}

class ShowCategoryError extends HomeState {
  final String error;

  ShowCategoryError(this.error);
}

class ChangeColorButton extends HomeState {}

class ShowProductLoading extends HomeState {}

class ShowProductSuccess extends HomeState {}

class GetUserData extends HomeState {}
class ShowProductError extends HomeState {
  final String error;

  ShowProductError(this.error);
}
//ADS
class LoadingADS extends HomeState{}
class ErrorADS extends HomeState{}
class LoadedADS extends HomeState{
  final HomeModel ?homeModel;
  LoadedADS({required this.homeModel});
}