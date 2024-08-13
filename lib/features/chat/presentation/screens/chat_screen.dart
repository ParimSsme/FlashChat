import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat_starting_project/features/chat/data/repository/chat_repositoryimpl.dart';
import 'package:flash_chat_starting_project/features/chat/domain/entity/message_entity.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_starting_project/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/message_bubble.dart';
import '../../../../locator.dart';
import '../cubits/chat_cubit.dart';

class ChatScreen extends StatefulWidget {
  static const String routeName = '/chat_screen';

  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _fireStore = FirebaseFirestore.instance;
  final TextEditingController _messageTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChatCubit(locator<ChatRepositoryImpl>())..loadAllMessagesEvent(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: kBackgroundColor,
          automaticallyImplyLeading: false,
          leading: null,
          actions: <Widget>[
            IconButton(
                icon: const Icon(Icons.logout),
                onPressed: () {
                  if (Navigator.canPop(context)) {
                    Navigator.pop(context);
                  }

                  // AuthService().signOut();
                }),
          ],
          title: const Text('⚡ ️Chat'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                buildWhen: (previous, current) => previous.messageListStatus != current.messageListStatus,
                builder: (context, state) {
                  /// loading
                  if (state is MessageListLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  /// completed
                  if(state.messageListStatus is MessageListLoaded){
                    List<MessageEntity> messages = (state.messageListStatus as MessageListLoaded).messages;

                    return  ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        itemCount: messages.length,
                        itemBuilder: (context, index) {
                          final item = messages[index];
                          return MessageBubble(
                            message: item.text,
                            sender: item.sender,
                            isMe: true,
                            // isMe: AuthService().getCurrentUser!.email == sender,
                          );
                        },
                        separatorBuilder: (context, index){
                          return const SizedBox(height: 15,);
                        },
                    );
                  }

                  ///error
                  if (state is MessageListError) {
                    return Center(child: Text('Error: ${(state.messageListStatus as MessageListError).error}'));
                  }

                  return Container();
                },
              )
            ),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: _messageTextController,
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      _fireStore.collection('messages').add({
                        'date': DateTime.now().microsecondsSinceEpoch,
                        'text': _messageTextController.text,
                        'sender': ''
                        // 'sender': AuthService().getCurrentUser!.email,
                      });
                      _messageTextController.clear();
                    },
                    child: const Icon(Icons.send,
                        size: 30, color: kSendButtonColor),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}