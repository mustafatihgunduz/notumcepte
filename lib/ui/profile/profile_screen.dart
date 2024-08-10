import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: IconButton(
                  onPressed: () {
                    showAdaptiveDialog(
                        barrierDismissible: true,
                        context: context,
                        builder: (context) {
                          return AlertDialog.adaptive(
                            title: Text(
                                'Çıkış yapmak istediğinizden emin misiniz?'),
                            actions: [
                              TextButton(
                                child: Text('Evet'),
                                onPressed: () => Get.back(),
                              ),
                              TextButton(
                                child: Text(
                                  'Vazgeç',
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () => Get.back(),
                              ),
                            ],
                          );
                        });
                  },
                  icon: Icon(
                    Icons.exit_to_app,
                    color: Colors.red,
                    size: K.kIconSize * 1.5,
                  ),
                ),
              ),
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        width: SizeConfig.screenWidth! * 0.5,
                        height: SizeConfig.screenHeight! * 0.3,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            fit: BoxFit.contain,
                            image: AssetImage('assets/profile-avatar.png'),
                          ),
                        ),
                      ),
                      Positioned(
                        top: SizeConfig.screenHeight! * 0.03,
                        right: SizeConfig.screenWidth! * 0.04,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.edit,
                              color: K.kScaffoldBodyColor,
                              size: K.kIconSize,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Text(
                    'Mustafa Fatih Gündüz',
                    style: K.kTitleTextStyle(context),
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight! * 0.03,
                  ),
                  ProfileCard(
                    title: 'Bilgilerimi Güncelle',
                    icon: Icons.account_box,
                    onTap: () {},
                  ),
                  ProfileCard(
                    title: 'Değerlendirmelerim',
                    icon: Icons.comment,
                    onTap: () {},
                  ),
                  ProfileCard(
                    title: 'Satın Alma Geçmişi',
                    icon: Icons.history,
                    onTap: () {},
                  ),
                  ProfileCard(
                    title: 'IBAN Bilgilerim',
                    icon: Icons.account_balance,
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  ProfileCard({
    required this.title,
    this.onTap,
    this.icon,
    super.key,
  });

  String? title;
  VoidCallback? onTap;
  IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: K.kHomePageHorizontalPadding,
        vertical: K.kHomePageVerticalPadding,
      ),
      color: K.kContainerColor,
      elevation: 1,
      shape: const RoundedRectangleBorder(),
      child: ListTile(
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        selectedColor: Colors.transparent,
        focusColor: Colors.transparent,
        onTap: onTap,
        leading: Icon(
          icon,
          color: K.kIconColor,
          size: K.kIconSize,
        ),
        title: Text(
          title!,
          style: K.kListTileTitleTextStyle(context),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: K.kIconColor,
          size: K.kIconSize,
        ),
      ),
    );
  }
}
