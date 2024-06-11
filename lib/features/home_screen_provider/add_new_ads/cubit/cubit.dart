import 'package:adpay/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class AddNewAdsCubit extends Cubit<AddNewAdsState> {
  AddNewAdsCubit(this.api) : super(AddNewAdsInitState());

  ServiceApi api;
}
