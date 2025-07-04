import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/view/addnote/add_note_screen.dart';
import 'package:notumcepte/view/home/home_page.dart';
import 'package:notumcepte/view/profile/profile_screen.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';
import 'package:provider/provider.dart';

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
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    SizeConfig().init(context);
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor:
            isDarkMode ? K.kdarkScaffoldBodyColor : K.kwhiteScaffoldBodyColor,
        currentIndex: 0,
        onTap: _onBarItemTapped,
        items: [
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.home,
              color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
              size: K.kIconSize * 1.1,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.publish,
              color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
              size: K.kIconSize * 1.1,
            ),
          ),
          BottomNavigationBarItem(
            label: "",
            icon: Icon(
              Icons.person,
              color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
              size: K.kIconSize * 1.1,
            ),
          ),
        ],
      ),
      body: items[_selectedIndex],
    );
  }
}
