import 'package:flutter/material.dart';
import 'package:flutter_vk_app/widgets/auth/auth_widget.dart';
import 'package:flutter_vk_app/widgets/auth/login_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vk',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF19191a),
        ),
        useMaterial3: true,
      ),
      home: LoginWidget(),
    );
  }
}