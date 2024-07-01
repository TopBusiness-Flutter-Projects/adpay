import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/models/about_app_model.dart';
import '../../../../../../core/remote/service.dart';

part 'about_app_state.dart';

class AboutAppCubit extends Cubit<AboutAppState> {
  AboutAppCubit(this.api) : super(AboutAppInitial());
  static AboutAppCubit get(context) => BlocProvider.of(context);

  ServiceApi api;
  AboutAppModel ?aboutModel;
  Future<void> GetAboutAppp() async {
    emit(LoadingAbout());
    final response = await api.getAboutApp();
    response.fold((l) {
      emit(ErrorAbout());
    }, (r) async {
      // getUserModel();
      print("sucess cubit");
      aboutModel = r;
      print("loaded");
      emit(LoadedAbout( aboutModel: r));
    });
  }
}
