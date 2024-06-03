part of 'logout_cubit.dart';

@immutable
sealed class LogoutState {}

final class LogoutInitial extends LogoutState {}
final class LoadingLogoutAuth extends LogoutState {}
final class ErrorLogoutAuth extends LogoutState {}
final class LoadedLogoutAuth extends LogoutState {}

