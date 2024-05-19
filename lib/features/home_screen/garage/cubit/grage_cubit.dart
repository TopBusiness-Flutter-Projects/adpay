import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../core/models/grage_model.dart';
import '../../../../../core/remote/service.dart';

part 'grage_state.dart';

class GrageCubit extends Cubit<GrageState> {
  GrageCubit(this.api) : super(GrageInitial());
  ServiceApi api;

  GrageModel? grageModel ;
  static GrageCubit get(context) => BlocProvider.of(context);
  Future<void> getGarge({ String? id}) async {
    emit(LoadingGarge());
    final response = await api.grageList(id: id);
    //
    response.fold((l) {
      emit(ErrorGargeextends());
    }, (right) async {
      print("sucess cubit");
      grageModel =right   ;
      print("loaded");
      emit(LoadedGarge( grageModel: right));
    });
  }
}
