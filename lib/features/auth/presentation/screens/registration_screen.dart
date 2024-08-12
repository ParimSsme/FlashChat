import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../locator.dart';
import '../cubits/register_cubit/register_cubit.dart';
import '../widget/register_form.dart';

class RegistrationScreen extends StatefulWidget {
  static const String routeName = "/registration_screen";

  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {

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
        child: BlocProvider<RegisterCubit>(
          create: (_) => RegisterCubit(locator()),
          child: const RegisterForm(),
        ),
      ),
    );
  }
}