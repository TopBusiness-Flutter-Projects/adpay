part of 'catogries_cubit.dart';

@immutable
sealed class CatogriesState {}

final class CatogriesInitial extends CatogriesState {}
class LoadingCatogries extends CatogriesState{}
class ErrorCatogriesextends extends CatogriesState{}
class LoadedCatogries extends CatogriesState{
  final CategoriesModel ?catogriesModel;
  LoadedCatogries({required this.catogriesModel});
}