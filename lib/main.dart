import 'package:flutter/material.dart';
import 'package:flutter_vk_app/widgets/auth/auth_widget.dart';
import 'package:flutter_vk_app/widgets/auth/code_widget.dart';
import 'package:flutter_vk_app/widgets/auth/login_widget.dart';
import 'package:flutter_vk_app/widgets/auth/password_widget.dart';

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
      routes: {
        '/': (context) => AuthWidget(),
        '/login': (context) => LoginWidget(),
        '/code': (context) => CodeWidget(),
        '/password': (context) => PasswordWidget(),
      },
      initialRoute: '/',
      onGenerateRoute: (settings) {
        return MaterialPageRoute(
          builder: (context) => AuthWidget(),
        );
      },
    );
  }
}