import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/common/custom_textformfield.dart';
import 'package:notumcepte/ui/register/register_page.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: IconButton(
                onPressed: () => Get.back(),
                icon: Icon(Icons.arrow_back_ios_new),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Image.asset(
                    'assets/uicons/logo-notumcepte.png',
                    fit: BoxFit.cover,
                    width: SizeConfig.screenWidth! * 0.6,
                    height: SizeConfig.screenHeight! * 0.2,
                    filterQuality: FilterQuality.high,
                  ),
                ),
                Text(
                  'Notum Cepte',
                  style: GoogleFonts.satisfy(
                    fontWeight: FontWeight.bold,
                    textStyle: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Colors.black),
                  ),
                ),
                CustomTextFormField(
                  hintText: 'Email',
                  controller: _emailController,
                ),
                CustomTextFormField(
                    hintText: 'Şifre', controller: _passwordController),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding,
                  ),
                  child: Row(
                    // * Beni Hatırla ve Şifreni mi unuttun için oluşturulan Row
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        //! Beni Hatırla ve CheckBox için oluşturulan Row
                        children: [
                          Checkbox(
                              value: isChecked,
                              onChanged: (value) {
                                setState(() {
                                  if (isChecked) {
                                    isChecked = false;
                                  } else {
                                    isChecked = true;
                                  }
                                });
                              }),
                          Text(
                            'Beni Hatırla',
                            style: K.kRegistirationTextStyle(context),
                          )
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text('Şifreni mi unuttun?'),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding * 2,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: CupertinoButton.filled(
                      child: Text('Giriş Yap'),
                      onPressed: () {},
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding * 3,
                    vertical: K.kHomePageVerticalPadding * 3,
                  ),
                  child: Row(
                    children: [
                      Flexible(
                          child: Divider(
                        color: K.kDividerColor,
                        thickness: 1.5,
                      )),
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: K.kHomePageHorizontalPadding * 2,
                        ),
                        child: Text(
                          'Veya',
                          style: K.kDividerTextStyle(context),
                        ),
                      ),
                      Flexible(
                          child: Divider(
                        color: K.kDividerColor,
                        thickness: 1.5,
                      )),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CircleAvatar(
                      minRadius: SizeConfig.screenWidth! * 0.05,
                      backgroundImage:
                          const AssetImage('assets/uicons/google-logo.png'),
                      backgroundColor: Colors.transparent,
                    ),
                    CircleAvatar(
                      minRadius: SizeConfig.screenWidth! * 0.05,
                      backgroundImage:
                          const AssetImage('assets/uicons/apple-logo.png'),
                      backgroundColor: Colors.transparent,
                    ),
                  ],
                )
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Hala bir hesabınız yok mu?',
                    style: K.kRegistirationTextStyle(context),
                  ),
                  TextButton(
                    onPressed: () => Get.to(RegisterPage()),
                    child: Text('Kayıt Ol'),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
