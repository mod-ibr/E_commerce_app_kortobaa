import 'package:flutter/material.dart';
import 'widgets/auth_register_view_body.dart';

class RegisterViewAuth extends StatelessWidget {
  const RegisterViewAuth({super.key});
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: RegisterViewBodyAuth(),
    );
  }
}
