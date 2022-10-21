import 'package:best_warrior/pages/profile_page.dart';
import 'package:best_warrior/pages/ranking_page.dart';
import 'package:best_warrior/pages/room_list_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          ProfilePage(),
          RoomListPage(),
          RankingPage(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _selectedIndex,
        backgroundColor: Colors.grey[100],
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black54,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.user),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.list),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.chartBar),
            label: "",
          ),
        ],
      ),
    );
  }
}
