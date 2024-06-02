import 'package:adpay/core/models/my_auctions_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/remote/service.dart';

part 'my_harag_state.dart';

class MyHaragCubit extends Cubit<MyHaragState>
{
  MyHaragCubit(this.api) : super(MyHaragInitial());
  MyAuctionsModel? myauctuinsmodel;
  static MyHaragCubit get(context) => BlocProvider.of(context);

  ServiceApi api;

  Future<void> getMyHarag() async {
    emit(LoadingMyHarag());
    final response = await api.GetMyAuctions();
    //
    response.fold((l) {
      emit(ErrorMyHarag());
    }, (r) async {
      // getUserModel();
      print("sucess cubit");
      myauctuinsmodel = r;
      // print('homemodel : ${MyHaragouriteModel?.data?.?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(LoadedMyHarag(haragModel: r));
    });
  }
}
