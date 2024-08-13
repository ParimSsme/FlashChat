import 'package:equatable/equatable.dart';

class MessageEntity extends Equatable {
  final String text;
  final String sender;
  final int date;

  const MessageEntity({
    this.text = '',
    this.sender = '',
    this.date = 0,
  });

  @override
  List<Object?> get props => [
        text,
        sender,
        date,
      ];
}
