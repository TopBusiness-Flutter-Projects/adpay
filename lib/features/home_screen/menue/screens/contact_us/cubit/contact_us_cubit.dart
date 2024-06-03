import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../../../core/remote/service.dart';
import '../../../../../../core/utils/dialogs.dart';
part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  TextEditingController subjectController = TextEditingController();
  TextEditingController messageController = TextEditingController();
  ContactUsCubit(this.api) : super(ContactUsInitial());
  ServiceApi api;

  Future<void> ContactUs(BuildContext context) async {
    var pref = await SharedPreferences.getInstance();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    emit(LoadingContact());
    final response = await api.ContactUs(subject: subjectController.text, message: messageController.text);
    //
    response.fold((l) {
      emit(ErrorContact());
    }, (r) async {
      print("loaded");
      successGetBar(r.msg);
    });
    pref.setBool('onBoarding', true);

    emit(LoadedContact());
  }

}
