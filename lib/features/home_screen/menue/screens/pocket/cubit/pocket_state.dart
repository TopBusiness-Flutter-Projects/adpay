part of 'pocket_cubit.dart';

@immutable
sealed class PocketState {}

final class PocketInitial extends PocketState {}
class LoadingPocket extends PocketState{}
class Errorpocket extends PocketState{}
class LoadedPocket extends PocketState{
  final MyWalletModel ? mywalletModel;
  LoadedPocket({required this.mywalletModel});
}