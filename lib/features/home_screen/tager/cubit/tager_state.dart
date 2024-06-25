part of 'tager_cubit.dart';

@immutable
sealed class TagerState {}

final class TagerInitial extends TagerState {}
class LoadingTager extends TagerState{}
class ErrorTager extends TagerState{}
class LoadedTager extends TagerState{
  final MainVendorHomeModel ?vendorModel;
  LoadedTager({required this.vendorModel});
}
