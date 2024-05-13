import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/catogrie_model.dart';
import '../../../../../core/remote/service.dart';

part 'catogries_state.dart';

class CatogriesCubit extends Cubit<CatogriesState> {
  ServiceApi api;

  CatogriesCubit(this.api) : super(CatogriesInitial());
  CategoriesModel? catogriesModel ;
  static CatogriesCubit get(context) => BlocProvider.of(context);
  Future<void> getCatogries() async {
    emit(LoadingCatogries());
    final response = await api.CategoriesData();
    //
    response.fold((l) {
      emit(ErrorCatogriesextends());
    }, (right) async {
      print("sucess cubit");
      catogriesModel =right   ;
      // print('homemodel : ${catogriesModel?.data?.ads?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(LoadedCatogries(catogriesModel: right));
    });
  }
}
