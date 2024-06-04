import 'package:adpay/core/remote/service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/models/notification_model.dart';
import 'state.dart';

class NotificationVendorCubit extends Cubit<NotificationVendorState> {
  NotificationVendorCubit(this.api) : super(InitVendorNotificationState());

  ServiceApi api;

  NotificationModel? notificationModel;

  getNotifications() async {
    emit(LoadingGetNotificationState());
    final data = await api.getVendorNotifications();
    data.fold((l) {
      emit(ErrorGetNotificationState());
    }, (r) {
      notificationModel = r;
      emit(LoadedGetNotificationState());
    });
  }
}
