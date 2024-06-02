part of 'edit_profile_cubit.dart';

@immutable
sealed class EditProfileState {}

final class EditProfileInitial extends EditProfileState {}
class LoadingAddNewImage extends EditProfileState {}

class LoadedAddNewImage extends EditProfileState {}

class LoadinglogoNewImage extends EditProfileState {}

class LoadedlogoNewImage extends EditProfileState {}
class ErrorEdit extends EditProfileState {}
class LoadedEdit extends EditProfileState {}
class LoadingEdit extends EditProfileState {}
class ChangePasswordState extends EditProfileState {}

class Change2PasswordState extends EditProfileState {}
class ChangeSignUpPageStates extends EditProfileState {}
class ChangeToStoreInfo extends EditProfileState {}

