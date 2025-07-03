import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';
import 'package:provider/provider.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = theme.isDarkMode;
    return Scaffold(
      backgroundColor:
          isDarkMode ? K.kdarkScaffoldBodyColor : K.kwhiteScaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: isDarkMode ? K.kdarkAppBarColor : K.kwhiteAppBarColor,
        leading: GestureDetector(
          onTap: () => Navigator.of(context).pop(),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: K.kIconSize,
            color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
          ),
        ),
        title: Text("Bİldirimler", style: K.kAppbarTextStyle(context)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.screenHeight! * 0.1,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/uicons/notification-icon.png",
                ),
              ),
            ),
          ),
          SizedBox(
            height: K.kHomePageVerticalPadding,
          ),
          Text(
            "Şu anda hiçbir bildiriminiz bulunmamaktadır.",
            style: K.kExplanationTextStyle(context),
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
