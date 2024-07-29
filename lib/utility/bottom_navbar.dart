import 'package:flutter/material.dart';
import 'package:notumcepte/ui/addnote/add_note_screen.dart';
import 'package:notumcepte/ui/home/home_page.dart';
import 'package:notumcepte/ui/profile/profile_screen.dart';
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
        backgroundColor: Colors.white,
        currentIndex: 0,
        onTap: _onBarItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
              color: Colors.grey.shade700,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.publish,
              color: Colors.grey.shade700,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.person,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      body: items[_selectedIndex],
    );
  }
}
