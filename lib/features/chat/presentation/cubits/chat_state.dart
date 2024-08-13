part of 'chat_cubit.dart';

class ChatState {
  final MessageListStatus messageListStatus;

  ChatState({
    required this.messageListStatus,
  });

  ChatState copyWith({
    MessageListStatus? newMessageListStatus,
  }) {
    return ChatState(
      messageListStatus: newMessageListStatus ?? messageListStatus,
    );
  }
}



