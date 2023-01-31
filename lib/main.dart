import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_starting_project/screens/chat_screen.dart';
import 'package:flash_chat_starting_project/screens/login_screen.dart';
import 'package:flash_chat_starting_project/screens/registration_screen.dart';

import 'constants.dart';
import 'package:flutter/material.dart';
import '/screens/welcome_screen.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(FlashChat());
}

class FlashChat extends StatelessWidget {
  FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
      ),
      routes: {
        WelcomeScreen.id: (context) => WelcomeScreen(),
        LoginScreen.id: (context) => LoginScreen(),
        RegistrationScreen.id: (context) => RegistrationScreen(),
        ChatScreen.id: (context) => ChatScreen(),
      },
      initialRoute: WelcomeScreen.id,
    );
  }
}
