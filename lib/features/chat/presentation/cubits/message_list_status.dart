part of 'chat_cubit.dart';

abstract class MessageListStatus{}

class MessageListLoading extends MessageListStatus{}

class MessageListLoaded extends MessageListStatus{
  final List<MessageEntity> messages;
  MessageListLoaded(this.messages);
}

class MessageListError extends MessageListStatus{
  final String error;
  MessageListError(this.error);
}