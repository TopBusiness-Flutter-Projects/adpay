part of 'grage_cubit.dart';

@immutable
sealed class GrageState {}

final class GrageInitial extends GrageState {}
class LoadingGarge extends GrageState{}
class ErrorGargeextends extends GrageState{}
class LoadedGarge extends GrageState{
  final GrageModel ?grageModel;
  LoadedGarge({required this.grageModel});
}