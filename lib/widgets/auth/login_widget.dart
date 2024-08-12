import 'package:flutter/material.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
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
        child: Padding(
          padding: const EdgeInsets.only(top: 12, right: 16, left: 16),
          child: Column(
            children: [
              _HeaderWidget(),
              _HeaderWidgetTwo(),
              
            ],
          ),
        ),
      ),
    );
  }
}

class _HeaderWidget extends StatelessWidget {
  const _HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,

      child: Column(
        children: [
          const Text(
            'Вход ВКонтакте',
            style: TextStyle(fontSize: 20, color: Color(0xFFE1E3E6)),
          ),
          Container(
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.only(bottom: 24),
            child: const Text(
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF909294)),
              'Введите телефон или почту, которые привязаны к аккаунту',
              maxLines: 2,
            ),
          )
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
  final TextEditingController _loginTextController = TextEditingController();
  bool _isTextFieldEmpty = true;
  final phoneRegex = RegExp(r'^((8|\+7)[\- ]?)?(\(?\d{3}\)?[\- ]?)?[\d\- ]{7,10}$');
  String? _loginErrorText;
  
  void _auth(){
    final login = _loginTextController.text;
    if (login.contains('@')) {
      _loginErrorText = null;
      Navigator.of(context).pushNamed('/code');
  } else if (phoneRegex.hasMatch(login)) {
      _loginErrorText = null;
      Navigator.of(context).pushNamed('/code');
    } else {
      _loginErrorText = 'Телефон или почта указаны неверно';
    }
    setState(() {});
  }
  

  void _onTextChanged() {
    setState(() {
      _isTextFieldEmpty = _loginTextController.text.isEmpty;
    });
  }

  @override
  void initState() {
    super.initState();
    _loginTextController.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    _loginTextController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final loginErrorText = _loginErrorText;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 44,
          child: TextField(
            controller: _loginTextController,
            style: const TextStyle(color: Colors.white), // Цвет текста
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(horizontal: 12),
              hintText: 'Телефон или email',
              hintStyle: const TextStyle(color: Color(0xFF909294)),
              filled: true,
              fillColor: const Color(0xFF2A2A2E),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              enabledBorder: loginErrorText != null
                  ? OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: const BorderSide(color: Colors.red),
                    )
                  : null,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: const BorderSide(color: Color(0xFF529ef4)), // Цвет рамки при фокусировке
              ),
            ),
          ),
        ),
        if (loginErrorText != null)
          Container(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              loginErrorText,
              style: const TextStyle(color: Colors.red, fontSize: 13),
            ),
          ),
        const SizedBox(height: 28),
        ElevatedButton(
          onPressed: _isTextFieldEmpty ? null : _auth, 
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