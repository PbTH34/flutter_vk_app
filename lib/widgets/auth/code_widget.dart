import 'package:flutter/material.dart';

class CodeWidget extends StatefulWidget {
  const CodeWidget({super.key});

  @override
  State<CodeWidget> createState() => _CodeWidgetState();
}

class _CodeWidgetState extends State<CodeWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ID',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        color: const Color(0xFF19191a),
        padding: const EdgeInsets.only(top: 28, right: 16, left: 16),
        child: Column(
          children: [
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
      width: double.infinity,
      padding: const EdgeInsets.only(bottom: 24),
      child: const Column(
        children: [
          Text(
            'Введите код из уведомления',
            style: TextStyle(fontSize: 21, color: Color(0xFFE1E3E6)),
          ),
          Text(
            'Мы отправили push-уведомление с кодом на устройство',
            style: TextStyle(fontSize: 16, color: Color(0xFF909294)),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _HeaderWidgetTwo extends StatefulWidget {
  const _HeaderWidgetTwo({super.key});

  @override
  State<_HeaderWidgetTwo> createState() => __HeaderWidgetTwoState();
}

class __HeaderWidgetTwoState extends State<_HeaderWidgetTwo> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: TextInputType.number,
      maxLength: 6,
      onChanged: (value) {
        if (value.length == 6) {
          Navigator.pushNamed(context, '/password');//сделать проверку кода
          // Perform code validation here
          // You can call a function or make an API request to validate the code
          // If the code is valid, you can proceed with the next steps
          // If the code is invalid, you can show an error message to the user
        }
      },
      decoration: InputDecoration(
        counterText: '',
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: Colors.red),
        ),
      ),
      style: const TextStyle(fontSize: 24, color: Colors.white),
      textAlign: TextAlign.center,
      cursorColor: Colors.blue,
    );
  }
}