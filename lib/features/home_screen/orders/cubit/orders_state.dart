part of 'orders_cubit.dart';

abstract class OrdersState {}

final class OrdersInitial extends OrdersState {}
final class OrdersLoaded extends OrdersState {
  final GetMyOrderModel ?ordermodel;
  OrdersLoaded({required this.ordermodel});
}
final class OrdersLoading extends OrdersState {}
final class OrdersError extends OrdersState {}
final class OnChangeUserOrder extends OrdersState {}
