part of 'get_profile_cubit.dart';

@immutable
sealed class GetProfileState {}

final class GetProfileInitial extends GetProfileState {}
class LoadingProfile extends GetProfileState{}
class ErrorProfile extends GetProfileState{}
class LoadedProfile extends GetProfileState{
  final GetProfileModel ?profilemodel;
  LoadedProfile({required this.profilemodel});
}