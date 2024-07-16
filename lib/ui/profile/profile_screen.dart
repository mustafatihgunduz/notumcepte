import 'package:flutter/material.dart';
import 'package:notumcepte/ui/profile/utils/profile_card.dart';
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
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: Column(
          children: [
            Column(
              // ? Avatar ve İsim için oluşturulan column
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    top: SizeConfig.screenHeight! * 0.04,
                  ),
                  child: Container(
                    height: SizeConfig.screenHeight! * 0.2,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                      image: DecorationImage(
                        image: AssetImage("assets/profile-avatar.png"),
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: SizeConfig.screenHeight! * 0.03,
                ),
                Text(
                  "Mustafa Fatih GÜNDÜZ",
                  style: TextStyle(
                      fontSize: SizeConfig.fontSize!, color: Colors.white),
                )
              ],
            ),
            SizedBox(
              height: SizeConfig.screenHeight! * 0.04,
            ),
            CustomProfileCard(
              title: 'Kullanıcı Bilgilerimi Güncelle',
              icon: Icons.person_search_rounded,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            CustomProfileCard(
              title: 'Eğitim Bilgilerimi Güncelle',
              icon: Icons.school,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            CustomProfileCard(
              title: 'Banka Bilgilerimi Güncelle',
              icon: Icons.credit_card,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            CustomProfileCard(
              title: 'Satın Alma Geçmişi',
              icon: Icons.history,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
            CustomProfileCard(
              title: 'Gizlilik Politikası',
              icon: Icons.privacy_tip,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomProfileCard(
        title: 'Çıkış Yap',
        icon: Icons.logout,
        trailingColor: Colors.red,
        leadingColor: Colors.red,
        style: TextStyle(color: Colors.red),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
