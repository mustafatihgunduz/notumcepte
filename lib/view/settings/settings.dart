import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/view/settings/utility/faq.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
            color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
            size: K.kIconSize,
          ),
        ),
        title: Text(
          'Ayarlar',
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: ListView.builder(
        itemCount: 1,
        itemBuilder: (context, index) {
          return Column(
            children: [
              SettingsWidget(
                onTap: () {},
                text: 'Bildirim Ayarları',
              ),
              SettingsWidget(
                onTap: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const FAQPage(),
                  ),
                ),
                text: 'Sıkça Sorulan Sorular',
              ),
              SettingsWidget(
                onTap: () {},
                text: 'Gizlilik Sözleşmesi',
              ),
              SettingsWidget(
                onTap: () {},
                text: 'Kullanıcı Sözleşmesi',
              ),
            ],
          );
        },
      ),
    );
  }
}

class SettingsWidget extends StatelessWidget {
  final String? text;
  final VoidCallback onTap;

  const SettingsWidget({super.key, this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = theme.isDarkMode;
    return ListTile(
      onTap: onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      title: Text(
        text!,
        style: K.kExpansionTitleTextStyle(context),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
        size: K.kIconSize,
      ),
    );
  }
}
