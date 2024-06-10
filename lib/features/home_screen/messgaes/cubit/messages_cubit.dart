import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/models/getchat_room_byid.dart';
import '../../../../core/models/getchat_rooms_model.dart';
import '../../../../core/models/send_message_model.dart';
import '../../../../core/remote/service.dart';
import '../../../../core/utils/dialogs.dart';

part 'messages_state.dart';

class MessagesCubit extends Cubit<MessagesState> {
  MessagesCubit(this.api) : super(MessagesInitial());
  GetChatRoomsModel? getChatModel;
  ServiceApi api;
  TextEditingController text1 = TextEditingController();
  static MessagesCubit get(context) => BlocProvider.of(context);

  Future<void> getRooms() async {
    emit(LoadingMessage());
    final response = await api.getChatRooms();
    //
    response.fold((l) {
      emit(ErrorMessage());
    }, (r) async {
      print("sucess cubit");
      getChatModel = r;
      print("loaded");
      emit(LoadedMessage(chatmodel: r));
    });
  }

  GetChatRoomById? chatidmodel;
  //getRoombyid
  Future<void> getRoomById({String? id}) async {
    emit(LoadingRoomMessage());
    final response = await api.getRoomById(id: id);
    //
    response.fold((l) {
      emit(ErrorRoomMessage());
    }, (r) async {
      print("sucess cubit");
      chatidmodel = r;
      print("loaded");
      emit(LoadedRoomMessage(chatmodelid: r));
    });
  }

  SendMessageModel? sendMessageModel;
  //post
  Future<void> postSendMessage() async {
    emit(LoadingPostMessage());
    final response = await api.postMessage(
        message: text1.text, roomId: chatidmodel!.data.id.toString());
    response.fold((l) {
      emit(ErrorPostMessage());
    }, (r) async {
      sendMessageModel = r;
      print("loaded");
      text1.clear();
      successGetBar(r.msg);
      getRoomById(id: chatidmodel!.data.id.toString());
      emit(LoadedPostMessage(chatmodelid: null));
    });
  }
}
