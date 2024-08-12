import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../locator.dart';
import '../cubits/login_cubit/login_cubit.dart';
import '../widget/login_form.dart';

class LoginScreen extends StatefulWidget {
  static const String routeName = "/login_screen";

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose;
    _passwordController.dispose;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: BlocProvider(
          create: (_) => LoginCubit(locator()),
          child: const LoginForm(),
        ),
      ),
    );
  }
}
