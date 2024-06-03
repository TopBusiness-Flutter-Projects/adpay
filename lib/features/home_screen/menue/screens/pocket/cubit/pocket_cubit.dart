import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../../core/models/wallet_model.dart';
import '../../../../../../core/remote/service.dart';

part 'pocket_state.dart';

class PocketCubit extends Cubit<PocketState> {
  PocketCubit(this.api) : super(PocketInitial());
  MyWalletModel? walletModel;
  static PocketCubit get(context) => BlocProvider.of(context);

  ServiceApi api;

  Future<void> getPocket() async {
    emit(LoadingPocket());
    final response = await api.GetWallet();
    response.fold((l) {
      emit(Errorpocket());
    }, (r) async {
      // getUserModel();
      print("sucess cubit");
      walletModel = r;
      print("loaded");
      emit(LoadedPocket( mywalletModel: r));
    });
  }
}
