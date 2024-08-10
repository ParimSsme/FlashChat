import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_starting_project/screens/chat_screen.dart';
import 'package:flash_chat_starting_project/screens/login_screen.dart';
import 'package:flash_chat_starting_project/screens/registration_screen.dart';
import 'package:flash_chat_starting_project/services/auth_service.dart';
import 'common/bloc/app_bloc.dart';
import 'config/my_theme.dart';
import 'config/router_config.dart';
import 'constants.dart';
import 'package:flutter/material.dart';
import '/screens/welcome_screen.dart';
import 'firebase_options.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'locator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  setupLocator();

  runApp(
      BlocProvider(
        lazy: false,
        create: (BuildContext context) => AppBloc(authenticationRepository: locator()),
        child:  const MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flash Chat",
      initialRoute: '/',
      locale: const Locale('en', 'US'),
      onGenerateRoute: MyRouter.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyThemes.lightTheme,
      home: BlocSelector<AppBloc, AppState, AppStatus>(
        selector: (state) => state.status,
        builder: (context, appStatus) {
          if (appStatus == AppStatus.authenticated) {
             return ChatScreen();
          } else {
            return WelcomeScreen();
          }
        },
      ),
    );
  }
}


class FlashChat extends StatelessWidget {
  FlashChat({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
        stream: AuthService().authStateChanges,
        builder: (context, snapshot) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              scaffoldBackgroundColor: kBackgroundColor,
            ),
          );
        });
  }
}
