import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat_starting_project/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:flash_chat_starting_project/constants.dart';

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _fireStore = FirebaseFirestore.instance;
  TextEditingController _messageTextController = TextEditingController();

  void getMessages() async {
    var messages = await _fireStore.collection('messages').get();
    for (var message in messages.docs) {
      print(message.data());
    }
  }

  void messageStream() {
    // Stream
    _fireStore.collection('messages').snapshots().listen((event) {
      for (var message in event.docs) {
        print(message.data());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBackgroundColor,
        automaticallyImplyLeading: false,
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: const Icon(Icons.logout),
              onPressed: () {
                Navigator.pop(context);
                AuthService().signOut();
              }),
        ],
        title: const Text('⚡ ️Chat'),
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            StreamBuilder<QuerySnapshot>(
              stream: _fireStore.collection('messages').snapshots(),
              builder: (context, snapshot) {
                if(snapshot.connectionState == ConnectionState.waiting){
                  return Expanded(child: Center(child: CircularProgressIndicator(backgroundColor: Colors.lightBlue)),);
                }
                if (snapshot.hasData) {
                  var messages = snapshot.data!.docs;
                  List<Widget> messageBubbles = [];
                  for (var message in messages){
                    var messageText = message.get('text');
                    var sender = message.get('sender');
                    Widget messageBubble = MessageBubble(message: messageText, sender: sender);
                    messageBubbles.add(messageBubble);
                  }
                  return Expanded(
                    child: ListView(
                      children: messageBubbles,
                    ),
                  );
                } else {
                  return Center(child: Text('Snapshot has no data'));
                }
              },
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
                        'date' : DateTime.now().microsecondsSinceEpoch,
                        'text' : _messageTextController.text,
                        'sender' : AuthService().getCurrentUser!.email,
                      });
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

class MessageBubble extends StatelessWidget {
  final String? message, sender;
  const MessageBubble({Key? key, this.message, this.sender}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(bubbleRadius),
          topRight: Radius.circular(bubbleRadius),
          bottomLeft: Radius.circular(bubbleRadius),
          bottomRight: Radius.circular(bubbleRadius),
        ),
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Column(
            children: [
              Text(
                sender!,
                style: TextStyle(fontSize: 12, color: kChatEmailColor),
              ),
              SizedBox(height: 8),
              Text(
                message!,
                style: TextStyle(fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
