import 'package:flutter/material.dart';
import 'package:notumcepte/ui/addnote/add_note_screen.dart';
import 'package:notumcepte/ui/home/home_page.dart';
import 'package:notumcepte/ui/profile/profile_screen.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  static const List<Widget> items = [
    HomePage(),
    AddNoteScreen(),
    ProfileScreen()
  ];

  void _onBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: K.kScaffoldBodyColor,
        currentIndex: 0,
        onTap: _onBarItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
              color: K.kIconColor,
              size: K.kIconSize * 1.1,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.publish,
              color: K.kIconColor,
              size: K.kIconSize * 1.1,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.person,
              color: K.kIconColor,
              size: K.kIconSize * 1.1,
            ),
          ),
        ],
      ),
      body: items[_selectedIndex],
    );
  }
}
