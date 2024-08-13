import 'package:flash_chat_starting_project/features/chat/data/data_source/remote/chat_api_provider.dart';
import 'package:flash_chat_starting_project/features/chat/data/models/message_model.dart';
import 'package:flash_chat_starting_project/features/chat/domain/entity/message_entity.dart';
import '../../domain/repository/chat_repository.dart';

class ChatRepositoryImpl extends ChatRepository {
  ChatApiProvider apiProvider;
  ChatRepositoryImpl(this.apiProvider);

  @override
  Stream<List<MessageEntity>> fetchAllMessages() {
    return apiProvider.callMessages().map((snapshot) => List<MessageEntity>.from(snapshot.docs.map((x) => MessageModel.fromSnapshot(x))));
  }
}
