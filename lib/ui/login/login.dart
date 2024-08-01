import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
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
            TextFormField(),
            TextFormField(),
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
                      Text('Beni Hatırla')
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
                    color: Colors.grey.shade600,
                    thickness: 1.5,
                  )),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: K.kHomePageHorizontalPadding * 2),
                    child: Text(
                      'Veya',
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.grey.shade600),
                    ),
                  ),
                  Flexible(
                      child: Divider(
                    color: Colors.grey.shade600,
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
                  backgroundImage: AssetImage('assets/uicons/google-logo.png'),
                  backgroundColor: Colors.transparent,
                ),
                CircleAvatar(
                  minRadius: SizeConfig.screenWidth! * 0.05,
                  backgroundImage: AssetImage('assets/uicons/apple-logo.png'),
                  backgroundColor: Colors.transparent,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
