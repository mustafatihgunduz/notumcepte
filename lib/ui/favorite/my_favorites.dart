import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notumcepte/ui/home/home_page.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class MyFavorites extends StatefulWidget {
  const MyFavorites({super.key});

  @override
  State<MyFavorites> createState() => _MyFavoritesState();
}

class _MyFavoritesState extends State<MyFavorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: K.kScaffoldBodyColor,
      appBar: AppBar(
        backgroundColor: K.kAppBarColor,
        title: Text(
          'Favoriler',
          style: K.kAppbarTextStyle(context),
        ),
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Icon(
            Icons.arrow_back_ios_new,
            color: K.kIconColor,
            size: K.kIconSize,
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Şu anda favorinize aldığınız herhangi bir not bulunmamaktadır.',
            textAlign: TextAlign.center,
            style: K.kExplanationTextStyle(context),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.02,
          ),
          CupertinoButton(
            color: K.kButtonColor,
            onPressed: () => Get.offAll(const HomePage()),
            child: Text(
              'Notları Keşfet',
              style: K.kButtonTextStyle(context),
            ),
          )
        ],
      ),
    );
  }
}
