import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/ui/addnote/add_note_screen.dart';
import 'package:notumcepte/ui/home/home_page.dart';
import 'package:notumcepte/ui/profile/profile_screen.dart';
import 'package:notumcepte/ui/search/search_screen.dart';
import 'package:notumcepte/utility/size_config.dart';

class BottomNavbar extends StatefulWidget {
  const BottomNavbar({super.key});

  @override
  State<BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<BottomNavbar> {
  int _selectedIndex = 0;

  GlobalKey<CurvedNavigationBarState> _bottomNavigationKey = GlobalKey();

  static const List<Widget> items = [
    HomePage(),
    SearchScreen(),
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
      bottomNavigationBar: CurvedNavigationBar(
        key: _bottomNavigationKey,
        color: Color(0xffE6B9A6),
        backgroundColor: Colors.white,
        buttonBackgroundColor: Color(0xffEEEDEB),
        animationCurve: Curves.easeInOut,
        animationDuration: Duration(milliseconds: 300),
        onTap: _onBarItemTapped,
        items: [
          Icon(
            Icons.home,
            size: SizeConfig.screenWidth! * 0.07,
          ),
          Icon(
            Icons.search,
            size: SizeConfig.screenWidth! * 0.07,
          ),
          Icon(
            Icons.publish,
            size: SizeConfig.screenWidth! * 0.07,
          ),
          Icon(
            Icons.person,
            size: SizeConfig.screenWidth! * 0.07,
          ),
        ],
      ),
      body: items[_selectedIndex],
    );
  }
}
