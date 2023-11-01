import 'package:flutter/material.dart';

class ErrorView extends StatelessWidget {
  final String? title;
  final String? error;
  const ErrorView({super.key, this.error, this.title});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: Center(
      child: Text("ERROR View"),
    ));
  }
}
