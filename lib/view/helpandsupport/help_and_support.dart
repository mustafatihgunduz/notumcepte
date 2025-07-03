import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';
import 'package:provider/provider.dart';

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
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
          'Yardım ve Destek',
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: SingleChildScrollView(
        reverse: true,
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Icon(
                  Icons.support_agent,
                  size: SizeConfig.screenWidth! / 3,
                  color: K.kButtonColor,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: K.kHomePageHorizontalPadding,
                ),
                child: Text(
                  'Merhaba değerli kullanıcımız, \n Yaşadığınız sorunu bizimle paylaşmaktan çekinmeyiniz. Teknik destek ekibimiz sizlere en kısa sürede geri dönüş sağlayacaktır.',
                  style: K.kExplanationTextStyle(context),
                  textAlign: TextAlign.center,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: K.kHomePageHorizontalPadding,
                  vertical: K.kHomePageVerticalPadding,
                ),
                child: TextFormField(
                  maxLength: 255,
                  maxLines: 6,
                  cursorHeight: SizeConfig.screenHeight! * 0.02,
                  decoration: InputDecoration(
                    helperText: 'Maksimum 255 karakter',
                    helperStyle: K.kTextFieldHelperTextStyle(context),
                    border: K.kOutlineInputBorder,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: K.kHomePageHorizontalPadding,
                  vertical: K.kHomePageVerticalPadding,
                ),
                child: SizedBox(
                  width: double.infinity,
                  child: CupertinoButton(
                    color: K.kButtonColor,
                    onPressed: () {},
                    child: Text(
                      'Gönder',
                      style: K.kButtonTextStyle(context),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
