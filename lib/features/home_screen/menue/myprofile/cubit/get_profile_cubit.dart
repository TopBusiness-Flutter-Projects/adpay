import 'package:adpay/core/models/get_myprofile_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/remote/service.dart';

part 'get_profile_state.dart';

class GetProfileCubit extends Cubit<GetProfileState> {
  GetProfileCubit(this.api) : super(GetProfileInitial());
  GetProfileModel? profileModel;
  static GetProfileCubit get(context) => BlocProvider.of(context);

  ServiceApi api;

  Future<void> getProfile() async {
    emit(LoadingProfile());
    final response = await api.getProfile();
    //
    response.fold((l) {
      emit(ErrorProfile());
    }, (r) async {
      // getUserModel();
      print("sucess cubit");
      profileModel = r;
      // print('homemodel : ${ProfileouriteModel?.data?.?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(LoadedProfile( profilemodel: r));
    });
  }
}
