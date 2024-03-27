import 'package:adpay/core/remote/service.dart';
import 'package:adpay/features/vendor_sign_up/cubit/state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpVendorCubit extends Cubit<SignUpVendorState> {
  SignUpVendorCubit(this.api) : super(SignUpVendorInitial());
  ServiceApi api;

  bool isPersonalType = true;
  void setSignUpPageType(bool isMarket) {
    isPersonalType = isMarket;
    emit(ChangeSignUpPageStates());
  }
}
