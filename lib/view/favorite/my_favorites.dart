import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/view/home/home_page.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';
import 'package:provider/provider.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({super.key});

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    return Scaffold(
      backgroundColor:
          isDarkMode ? K.kdarkScaffoldBodyColor : K.kwhiteScaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? K.kdarkAppBarColor : K.kwhiteAppBarColor,
        title: Text(
          'Favoriler',
          style: K.kAppbarTextStyle(context),
        ),
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
            size: K.kIconSize,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Şu anda favorinize aldığınız herhangi bir not bulunmamaktadır.',
            textAlign: TextAlign.center,
            style: K.kExplanationTextStyle(context),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          CupertinoButton(
            color: K.kButtonColor,
            onPressed: () => Navigator.of(context).pushReplacement(
              CupertinoPageRoute(
                builder: (context) => const HomePage(),
              ),
            ),
            child: Text(
              'Notları Keşfet',
              style: K.kButtonTextStyle(context),
            ),
          )
        ],
      ),
    );
  }
}
