import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flash_chat_starting_project/features/chat/data/repository/chat_repositoryimpl.dart';
import 'package:flash_chat_starting_project/features/chat/domain/entity/message_entity.dart';

part 'message_list_status.dart';
part 'chat_state.dart';

abstract class ItemsEvent {}

class LoadItems extends ItemsEvent {}

class ChatCubit extends Cubit<ChatState> {
  ChatRepositoryImpl repository;

  StreamSubscription<List<MessageEntity>>? _itemsSubscription;

  ChatCubit(
    this.repository,
  ) : super(
          ChatState(
            messageListStatus: MessageListLoading(),
          ),
        );

  void loadAllMessagesEvent() async {
    emit(state.copyWith(newMessageListStatus: MessageListLoading()));

    try {
      _itemsSubscription = repository.fetchAllMessages().listen((items) {
        emit(state.copyWith(
            newMessageListStatus: MessageListLoaded(items)));
      });
    } catch (e) {
      emit(state.copyWith(
          newMessageListStatus: MessageListError(e.toString())));
    }
  }

  @override
  Future<void> close() {
    _itemsSubscription?.cancel();
    return super.close();
  }
}