import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/ui/settings/utility/faq.dart';
import 'package:notumcepte/utility/constants.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
          ),
        ),
        title: Text('Ayarlar', style: K.kAppbarTextStyle(context)),
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
                onTap: () => Get.to(FAQPage()),
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

  SettingsWidget({super.key, this.text, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      title: Text(
        text!,
        style: Theme.of(context)
            .textTheme
            .bodyLarge!
            .copyWith(color: K.kExpansionTextColor),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: K.kIconColor,
        size: K.kIconSize,
      ),
    );
  }
}
