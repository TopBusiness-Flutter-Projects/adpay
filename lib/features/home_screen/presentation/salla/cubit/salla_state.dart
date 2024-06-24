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

final class incremented extends SallaState {}

final class decremented extends SallaState {}
//confitmotp
final class ConfirmLoading extends SallaState {}
final class ConfirmError extends SallaState {}
final class ConfirLoaded extends SallaState {
  // final ConfirmOrderModel ?confrimmodel;
  // ConfirLoaded({required this.confrimmodel});
}
//empty state
final class emptyLoading extends SallaState {}
final class emptyError extends SallaState {}
final class SuccessFillConformList extends SallaState {}
final class emptyLoaded extends SallaState {
  // final ConfirmOrderModel ?confrimmodel;
  // ConfirLoaded({required this.confrimmodel});
}
//delete card
final class DeleteLoading extends SallaState {}
final class DeleteError extends SallaState {}
final class DeleteDone extends SallaState {}



