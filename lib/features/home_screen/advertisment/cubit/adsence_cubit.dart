import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../../../core/models/adsence_Model.dart';
import '../../../../../core/remote/service.dart';
part 'adsence_state.dart';
class AdsenceCubit extends Cubit<AdsenceState> {
  AdsenceCubit(this.api) : super(AdsenceInitial());
  ServiceApi api;
  AdsenceModel? adesnceModel ;
  static AdsenceCubit get(context) => BlocProvider.of(context);
  Future<void> getAdsence() async {
    emit(LoadingAdsence());
    final response = await api.ADsenceData();
    response.fold((l) {
      emit(ErrorAdsence());
    }, (right) async {
      print("sucess cubit");
      adesnceModel =right   ;
      print("loaded");
      emit(LoadedAdsence( AdsenceModell: right));
    });
  }
}
