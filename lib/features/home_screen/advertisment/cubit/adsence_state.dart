part of 'adsence_cubit.dart';

@immutable
sealed class AdsenceState {}

final class AdsenceInitial extends AdsenceState {}
class LoadingAdsence extends AdsenceState{}
class ErrorAdsence extends AdsenceState{}
class LoadedAdsence extends AdsenceState{
  final AdsenceModel ?AdsenceModell;
  LoadedAdsence({required this.AdsenceModell});
}