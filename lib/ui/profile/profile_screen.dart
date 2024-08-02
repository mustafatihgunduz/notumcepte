import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/ui/register/register_page.dart';
import 'package:notumcepte/utility/constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        title: Text(
          'Profil',
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            IconButton(
                onPressed: () => Get.to(RegisterPage()),
                icon: Icon(Icons.login))
          ],
        ),
      ),
    );
  }
}
