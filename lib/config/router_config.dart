import 'package:flutter/material.dart';
import '../features/auth/presentation/screens/login_screen.dart';
import '../features/auth/presentation/screens/registration_screen.dart';
import '../features/auth/presentation/screens/welcome_screen.dart';
import '../screens/chat_screen.dart';

class MyRouter{

  static get routes{

    return (RouteSettings settings) {
      switch (settings.name) {
        case RegistrationScreen.routeName:
          return MaterialPageRoute(
            settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
            builder: (_) => const RegistrationScreen(),
            // transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c),
          );
        case LoginScreen.routeName:
          return MaterialPageRoute(
              settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
              builder: (_) => const LoginScreen(),
              // transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
        );
        case ChatScreen.routeName:
          return MaterialPageRoute(
              settings: settings, // Pass this to make popUntil(), pushNamedAndRemoveUntil(), works
              builder: (_) => ChatScreen(),
              // transitionsBuilder: (_, a, __, c) => FadeTransition(opacity: a, child: c)
          );
      }
      // Unknown route
      return MaterialPageRoute(builder: (_) => WelcomeScreen());
    };
  }
}