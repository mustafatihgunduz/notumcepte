import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:provider/provider.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
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
          'İstek Listem',
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
          Padding(
            padding:
                EdgeInsets.symmetric(horizontal: K.kHomePageHorizontalPadding),
            child: Text(
              'Şu anda istek listeniz boş gözüküyor. Daha sonrasında ulaşmak istediğiniz notları takibe alın',
              textAlign: TextAlign.center,
              style: K.kExplanationTextStyle(context),
            ),
          )
        ],
      ),
    );
  }
}
