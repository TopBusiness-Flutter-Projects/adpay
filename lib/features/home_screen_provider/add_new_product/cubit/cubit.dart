import 'package:adpay/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'state.dart';

class AddNewProductCubit extends Cubit<AddNewProductState> {
  AddNewProductCubit(this.api) : super(AddAddNewProductInitState());

  ServiceApi api;
}
