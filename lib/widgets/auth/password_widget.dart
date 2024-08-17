import 'package:flutter/material.dart';

class PasswordWidget extends StatefulWidget {
  const PasswordWidget({super.key});

  @override
  State<PasswordWidget> createState() => _PasswordWidgetState();
}

class _PasswordWidgetState extends State<PasswordWidget> {
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
            'Введите пароль',
            style: TextStyle(fontSize: 21, color: Color(0xFFE1E3E6)),
          ),
          Text(
            'Введите ваш текущий пароль, привязанный к аккаунту',
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
  bool _visibility = false;
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordFieldEmpty = true;
  String? _passwordErrorText;

  void _auth(){
    final password = _passwordController.text;
    if (password == 'admin') {
      _passwordErrorText = null;
      Navigator.pushNamedAndRemoveUntil(context, '/main_screen', (route) => false);
    } else {
      _passwordErrorText = 'Неверный пароль';
    }
    setState(() {});
  }

  void _onTextChanged() {
    setState(() {
      _isPasswordFieldEmpty = _passwordController.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _passwordController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final passwordController = _passwordController;
    return Column(
      children: [
        TextField(
          controller: passwordController,
          style: const TextStyle(color: Color(0xFFE1E3E6), fontSize: 16),
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.symmetric(horizontal: 12),
            hintText: 'Введите пароль',
            hintStyle: const TextStyle(color: Color(0xFF909294)),
            filled: true,
            fillColor: const Color(0xFF2A2A2E),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            enabledBorder: _passwordErrorText != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red),
                    )
                  : null,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Color(0xFF529ef4)),
            ),
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  _visibility = !_visibility;
                });
              },
              icon: Icon(
                _visibility ? Icons.visibility : Icons.visibility_off,
                color: const Color(0xFF909294),
              ),
            ),
          ),
          obscureText: _visibility,
        ),
        if (_passwordErrorText != null)
          Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              _passwordErrorText!,
              style: const TextStyle(color: Colors.red),
            ),
          ),
        Container(
          padding: const EdgeInsets.only(top: 12),
          width: double.infinity,
          child: const Text(
            'Забыли пароль? Да мне поебать ваще. Регайтесь заново.', 
            style: TextStyle(color: Color(0xFF529ef4)),
            textAlign: TextAlign.left ,
          ),
        ),
        const SizedBox(height: 28),
        ElevatedButton(
          onPressed: _isPasswordFieldEmpty ? null : _auth, 
          style: ElevatedButton.styleFrom(
            backgroundColor:Colors.white,
            disabledBackgroundColor: Colors.grey,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            minimumSize: const Size(double.infinity, 44),
          ),
          child: const Text(
            'Продолжить',
            style: TextStyle(fontSize: 16, color: Color(0xFF000000)),
            )
        ),
      ],
    );
  }
}