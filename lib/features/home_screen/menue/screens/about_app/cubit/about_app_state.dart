part of 'about_app_cubit.dart';

@immutable
sealed class AboutAppState {}

 class AboutAppInitial extends AboutAppState {}
class LoadingAbout extends AboutAppInitial{}
class ErrorAbout extends AboutAppInitial{}
class LoadedAbout extends AboutAppInitial{
  final AboutAppModel ?aboutModel;
  LoadedAbout({required this.aboutModel});
}
