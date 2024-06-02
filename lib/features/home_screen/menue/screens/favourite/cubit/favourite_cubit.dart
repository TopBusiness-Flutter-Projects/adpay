import 'package:adpay/core/models/favourite_model.dart';
import 'package:adpay/core/models/get_favourite_model.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/remote/service.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit(this.api) : super(FavouriteInitial());
  GetFavouriteModel? favouriteModel;
  static FavouriteCubit get(context) => BlocProvider.of(context);

  ServiceApi api;

  Future<void> getFav() async {
    emit(LoadingFav());
    final response = await api.GetFavourite();
    //
    response.fold((l) {
      emit(ErrorFav());
    }, (r) async {
      // getUserModel();
      print("sucess cubit");
      favouriteModel = r;
      // print('homemodel : ${favouriteModel?.data?.?.first.descriptionAr
      //     .toString()}');
      print("loaded");
      emit(LoadedFav(homeModel: r));
    });
  }
}
