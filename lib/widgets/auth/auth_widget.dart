import 'package:flutter/material.dart';
import 'package:flutter_vk_app/widgets/auth/login_widget.dart';

class AuthWidget extends StatefulWidget {
  const AuthWidget({super.key});

  @override
  State<AuthWidget> createState() => _AuthWdgetState();
}

class _AuthWdgetState extends State<AuthWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: 
          const Text('вконтакте', style: TextStyle(color: Colors.white)),
          centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFF0a0a0a),
        child: const Column(
          children: [
            SizedBox(height: 10),
            _HeaderWidget(),
            _HeaderWidgetTwo(),
          ],
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF19191a),
        borderRadius: BorderRadius.circular(10), // Скругление углов
      ),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ 
          Container(
            padding: const EdgeInsets.only(top: 24),
            child: const Text(
              'Вход ВКонтакте', 
              style: TextStyle(fontSize: 20, color: Colors.white), 
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: const Text(
              'Мобильная версия поможет вам оставаться ВКонтакте, даже если вы далеко от компьютера.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Color(0xFF5d5f61),
              ),
              maxLines: 3,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.only(top: 10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/login');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFffffff),
                minimumSize: const Size(double.infinity, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: const Text('Войти по телефону или почте', style: TextStyle(fontSize: 15, color: Color(0xFF000000))),
            ),
          ),
        ],
      ),
    );
  }
}

class _HeaderWidgetTwo extends StatelessWidget {
  const _HeaderWidgetTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.only(top: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF19191a),
        borderRadius: BorderRadius.circular(10), // Скругление углов
      ),
      width: double.infinity,
      child: Container(
        padding: const EdgeInsets.only(right: 12,left: 12, bottom: 12, top: 10),
        child: ElevatedButton(
           onPressed: () {},
           style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4bb34b),
                minimumSize: const Size(double.infinity, 36),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
           child: const Text('Создать аккаунт', style: TextStyle(fontSize: 15, color: Color(0xFFFFFFFF))),
        ),
      ),
    );
  }
}

