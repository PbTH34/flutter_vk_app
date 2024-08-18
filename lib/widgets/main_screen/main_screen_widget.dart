import 'package:flutter/material.dart';

class MainScreenWidget extends StatefulWidget {
  const MainScreenWidget({super.key});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  int _selectedTab = 0;

  static const List<Widget> _tabs = <Widget>[
    Text('Главная'),
    Text('Видео'),
    Text('Мессенджер'),
    Text('Уведомления'),
    Text('Ещё'),
  ];

  void _onSelectedTab(int index) {
    if (_selectedTab == index) return;
    setState(() {
      _selectedTab = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Главная',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Center(
        child: _tabs.elementAt(_selectedTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedTab,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Главная',
            
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library_outlined),
            label: 'Видео',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: 'Мессенджер',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications_none),
            label: 'Уведомления',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Ещё',
          ),
        ],
        onTap: _onSelectedTab,
      ),
    );
  }
}