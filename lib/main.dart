import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/firebase_options.dart';
import 'package:notumcepte/utility/bottom_navbar.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:provider/provider.dart';

void main() async {
  // ignore: unused_local_variable
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) {
      if (kDebugMode) {
        print('main.dart: ThemeProvider oluşturuldu.');
      }
      return ThemeProvider();
    }),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return MaterialApp(
      title: 'Notum Cepte',
      debugShowCheckedModeBanner: false,
      themeMode: themeProvider.themeMode,
      theme: ThemeData(
        primaryColor: K.kPrimaryColor,
        scaffoldBackgroundColor: K.kdarkScaffoldBodyColor,
        appBarTheme: AppBarTheme(color: K.kdarkAppBarColor),
        buttonTheme: ButtonThemeData(buttonColor: K.kPrimaryColor),
        progressIndicatorTheme: ProgressIndicatorThemeData(
          color: K.kdarkScaffoldBodyColor,
        ),
      ),
      home: const BottomNavbar(),
    );
  }
}
