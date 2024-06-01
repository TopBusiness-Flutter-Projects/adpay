part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState {}

final class FavouriteInitial extends FavouriteState {}
class LoadingFav extends FavouriteState{}
class ErrorFav extends FavouriteState{}
class LoadedFav extends FavouriteState{
  final GetFavouriteModel ?homeModel;
  LoadedFav({required this.homeModel});
}
