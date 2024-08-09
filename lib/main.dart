import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/utility/bottom_navbar.dart';
import 'package:notumcepte/utility/constants.dart';

void main() async {
  // ignore: unused_local_variable
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Notum Cepte',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: K.kPrimaryColor,
        scaffoldBackgroundColor: K.kScaffoldBodyColor,
        appBarTheme: AppBarTheme(color: K.kAppBarColor),
        buttonTheme: ButtonThemeData(buttonColor: K.kPrimaryColor),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: K.kScaffoldBodyColor,
        ),
      ),
      home: const BottomNavbar(),
    );
  }
}
