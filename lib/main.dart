import 'package:flutter/material.dart';
import 'package:flutter_vk_app/Theme/app_colors.dart';
import 'package:flutter_vk_app/widgets/auth/auth_widget.dart';
import 'package:flutter_vk_app/widgets/auth/code_widget.dart';
import 'package:flutter_vk_app/widgets/auth/login_widget.dart';
import 'package:flutter_vk_app/widgets/auth/password_widget.dart';
import 'package:flutter_vk_app/widgets/main_screen/main_screen_widget.dart';

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
          backgroundColor: AppColors.primary,
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: AppColors.primary,// Цвет фона
          selectedItemColor: Colors.white,// Цвет выбранного элемента
          unselectedItemColor: Colors.grey,// Цвет невыбранных элементов
          selectedLabelStyle: TextStyle(fontSize: 11), // Устанавливаем одинаковый размер шрифта
          unselectedLabelStyle: TextStyle(fontSize: 11), // Устанавливаем одинаковый размер шрифта
        ),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => AuthWidget(),
        '/login': (context) => LoginWidget(),
        '/code': (context) => CodeWidget(),
        '/password': (context) => PasswordWidget(),
        '/main_screen': (context) => MainScreenWidget(),
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