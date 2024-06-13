part of 'salla_cubit.dart';

@immutable
sealed class SallaState {}

final class SallaInitial extends SallaState {}
final class SallaLoading extends SallaState {}
final class SallaError extends SallaState {}
final class SallaLoaded extends SallaState {
  final GetCartModel ?cartmodel;
  SallaLoaded({required this.cartmodel});
}


