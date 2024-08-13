import 'package:cloud_firestore/cloud_firestore.dart';
import '../../domain/entity/message_entity.dart';


class MessageModel extends MessageEntity {

  @override
  final String text;

  @override
  final String sender;

  @override
  final int date;

  const MessageModel({
    this.text = '',
    this.sender = '',
    this.date = 0,
  });

  factory MessageModel.fromSnapshot(QueryDocumentSnapshot<Object?> snapshot) => MessageModel(
    text: snapshot["text"],
    sender: snapshot["sender"],
    date: snapshot["date"],
  );

}