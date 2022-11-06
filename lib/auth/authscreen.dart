import 'package:flutter/material.dart';
import 'package:todo/auth/authform.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDo")),
      body: AuthForm(),
    );
  }
}
