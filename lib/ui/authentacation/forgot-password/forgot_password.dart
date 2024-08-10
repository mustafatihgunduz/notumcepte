import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/common/custom_textformfield.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            size: K.kIconSize,
            color: K.kIconColor,
          ),
        ),
        title: Text(
          'Şifre Sıfırlama',
          style: K.kAppbarTextStyle(context),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: SizedBox(
            width: double.infinity,
            height: SizeConfig.screenHeight! * 0.8,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth! * 0.3,
                  child: Image.asset(
                    'assets/uicons/forgot-password.png',
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: K.kHomePageHorizontalPadding,
                    vertical: K.kHomePageVerticalPadding,
                  ),
                  child: Text(
                    'Kayıtlı e-posta adresinizi aşağıdaki alana girin. Size bir şifre sıfırlama bağlantısı göndereceğiz.',
                    style: K.kExplanationTextStyle(context),
                    textAlign: TextAlign.center,
                  ),
                ),
                CustomTextFormField(
                  hintText: 'Email Adresinizi Giriniz',
                  controller: _emailController,
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
                      child: Text(
                        'Sıfırla',
                        style: K.kButtonTextStyle(context),
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
