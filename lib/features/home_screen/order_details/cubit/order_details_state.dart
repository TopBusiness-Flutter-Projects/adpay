part of 'order_details_cubit.dart';

@immutable
sealed class OrderDetailsState {}

final class OrdersDetailsInitial extends OrderDetailsState {}
final class OrdersDetailsLoaded extends OrderDetailsState {
  final OrdersDetailsNewModel ?ordermodel;
  OrdersDetailsLoaded({required this.ordermodel});
}
final class OrdersDetailsLoading extends OrderDetailsState {}
final class OrdersDetailsError extends OrderDetailsState {}
