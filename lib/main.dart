import 'package:firebase_core/firebase_core.dart';
import 'package:flash_chat_starting_project/features/chat/presentation/screens/chat_screen.dart';
import 'common/bloc/app_bloc.dart';
import 'config/my_theme.dart';
import 'config/router_config.dart';
import 'package:flutter/material.dart';
import 'features/auth/presentation/screens/welcome_screen.dart';
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
    const App(),
  );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flash Chat",
      initialRoute: '/',
      locale: const Locale('en', 'US'),
      onGenerateRoute: MyRouter.routes,
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: darkTheme,
      home: BlocProvider(
        create: (_) => locator<AppBloc>(),
        child: BlocSelector<AppBloc, AppState, AppStatus>(
          selector: (state) => state.status,
          builder: (context, appStatus) {
            if (appStatus == AppStatus.authenticated) {
              return const ChatScreen();
            } else {
              return WelcomeScreen();
            }
          },
        ),
      ),
    );
  }
}