part of 'points_cubit.dart';

@immutable
sealed class PointsState {}

final class PointsInitial extends PointsState {}
class LoadingPoints extends PointsState{}
class ErrorPoints extends PointsState{}
class LoadedPoints extends PointsState{
  final MyCoinsModel ? mycoinsModel;
  LoadedPoints({required this.mycoinsModel});
}