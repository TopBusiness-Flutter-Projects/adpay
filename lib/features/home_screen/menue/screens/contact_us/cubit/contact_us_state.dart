part of 'contact_us_cubit.dart';

@immutable
sealed class ContactUsState {}

final class ContactUsInitial extends ContactUsState {}
final class LoadingContact extends ContactUsState {}
final class ErrorContact extends ContactUsState {}
final class LoadedContact extends ContactUsState {}
