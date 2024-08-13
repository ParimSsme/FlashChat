import 'package:flash_chat_starting_project/features/chat/domain/entity/message_entity.dart';

abstract class ChatRepository {

  Stream<List<MessageEntity>> fetchAllMessages();

}