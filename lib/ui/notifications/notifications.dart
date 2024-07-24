import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:notumcepte/utility/size_config.dart';

class Notifications extends StatelessWidget {
  const Notifications({super.key});

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
          "Bİldirimler",
          style: Theme.of(context)
              .textTheme
              .titleLarge!
              .copyWith(color: K.kTextColor),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: SizeConfig.screenHeight! * 0.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/uicons/notification-icon.png",
                ),
              ),
            ),
          ),
          SizedBox(
            height: K.kHomePageVerticalPadding,
          ),
          Container(
            width: SizeConfig.screenWidth! / 2,
            child: Center(
              child: Text(
                "Şu anda hiçbir bildiriminiz bulunmamaktadır.",
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge!
                    .copyWith(color: K.kTextColor),
              ),
            ),
          )
        ],
      ),
    );
  }
}