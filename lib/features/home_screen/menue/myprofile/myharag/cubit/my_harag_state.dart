part of 'my_harag_cubit.dart';

@immutable
sealed class MyHaragState {}

final class MyHaragInitial extends MyHaragState {}

class LoadingMyHarag extends MyHaragState{}
class ErrorMyHarag extends MyHaragState{}
class LoadedMyHarag extends MyHaragState{
  final MyAuctionsModel ?haragModel;
  LoadedMyHarag({required this.haragModel});
}