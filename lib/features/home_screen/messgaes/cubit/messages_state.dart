part of 'messages_cubit.dart';

@immutable
sealed class MessagesState {}

final class MessagesInitial extends MessagesState {}
class LoadingMessage extends MessagesState{}
class ErrorMessage extends MessagesState{}
class LoadedMessage extends MessagesState{
  final GetChatRoomsModel ?chatmodel;
  LoadedMessage({required this.chatmodel});
}
//roomby id
class LoadingRoomMessage extends MessagesState{}
class ErrorRoomMessage extends MessagesState{}
class LoadedRoomMessage extends MessagesState{
  final GetChatRoomById ?chatmodelid;
  LoadedRoomMessage({required this.chatmodelid});
}
//post message
class LoadingPostMessage extends MessagesState{}
class ErrorPostMessage extends MessagesState{}
class LoadedPostMessage extends MessagesState{
  final GetChatRoomById ?chatmodelid;
  LoadedPostMessage({required this.chatmodelid});
}

