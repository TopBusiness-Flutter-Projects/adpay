part of 'add_harag_cubit.dart';

@immutable
sealed class AddHaragState {}

final class AddHaragInitial extends AddHaragState {}
class LoadingHarag extends AddHaragState{}
class ErrorHarag extends AddHaragState{}
class LoadedHarag extends AddHaragState{
  final AddHaragModel ?addharagModel;
  LoadedHarag({required this.addharagModel});
}
class LoadingAddNewImage extends AddHaragState {}

class LoadedAddNewImage extends AddHaragState {}

class LoadinglogoNewImage extends AddHaragState {}

class LoadedlogoNewImage extends AddHaragState {}