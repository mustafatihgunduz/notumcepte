import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: true);
    bool isDarkMode = theme.isDarkMode;
    return CupertinoPageScaffold(
        backgroundColor:
            isDarkMode ? K.kdarkScaffoldBodyColor : K.kwhiteScaffoldBodyColor,
        navigationBar: CupertinoNavigationBar(
          backgroundColor:
              isDarkMode ? K.kdarkAppBarColor : K.kwhiteAppBarColor,
          middle: Text(
            'Ayarlar',
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
        child: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CupertinoListSection.insetGrouped(
                header: Text('Uygulama Ayarları'),
                children: [
                  CupertinoListTile(
                    leading: Icon(
                      CupertinoIcons.moon,
                    ),
                    title: Text('Karanlık Mod'),
                    trailing: CupertinoSwitch(
                        value: isDarkMode,
                        onChanged: (val) {
                          theme.toggleTheme(val);
                        }),
                  ),
                ],
              )
            ],
          ),
        )));
  }
}
