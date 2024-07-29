import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class HelpAndSupportPage extends StatefulWidget {
  const HelpAndSupportPage({super.key});

  @override
  State<HelpAndSupportPage> createState() => _HelpAndSupportPageState();
}

class _HelpAndSupportPageState extends State<HelpAndSupportPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
          ),
        ),
        title: Text('Yardım ve Destek', style: K.kAppbarTextStyle(context)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Center(
              child: Icon(
                Icons.support_agent,
                size: SizeConfig.screenWidth! / 3,
                color: Colors.amber,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
              ),
              child: Text(
                'Merhaba değerli kullanıcımız, \n Yaşadığınız sorunu bizimle paylaşmaktan çekinmeyiniz. Teknik destek ekibimiz sizlere en kısa sürede geri dönüş sağlayacaktır.',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: K.kTextColor),
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
                  helperStyle: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: K.kTextColor),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(width: 2, color: Colors.black),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: K.kHomePageHorizontalPadding,
                vertical: K.kHomePageVerticalPadding,
              ),
              child: ElevatedButton(
                onPressed: () {},
                child: Text(
                  'Gönder',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: K.kExpansionTextColor),
                ),
                style: ButtonStyle(
                  minimumSize: WidgetStatePropertyAll(
                    Size(
                      double.infinity,
                      SizeConfig.screenHeight! * 0.06,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
