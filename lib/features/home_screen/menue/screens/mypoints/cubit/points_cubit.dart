import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/models/coins_model.dart';
import '../../../../../../core/remote/service.dart';

part 'points_state.dart';

class PointsCubit extends Cubit<PointsState> {
  PointsCubit(this.api) : super(PointsInitial());
  MyCoinsModel? coinsModel;
  static PointsCubit get(context) => BlocProvider.of(context);

  ServiceApi api;

  Future<void> getPoints() async {
    emit(LoadingPoints());
    final response = await api.getCoins();
    //
    response.fold((l) {
      emit(ErrorPoints());
    }, (r) async {
      // getUserModel();
      print("sucess cubit");
      coinsModel = r;
      // print('homemodel : ${PointsouriteModel?.data?.?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(LoadedPoints( mycoinsModel: r));
    });
  }
}
