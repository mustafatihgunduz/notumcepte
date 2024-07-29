import 'package:flutter/material.dart';
import 'package:notumcepte/utility/size_config.dart';

class K {
  static Color kScaffoldBodyColor = Colors.grey.shade100;
  static Color kAppBarColor = Colors.white;
  static Color kIconColor = Colors.grey;
  static Color kContainerColor = Colors.white;
  static Color kTextColor = Colors.grey.shade500;
  static Color kExpansionTextColor = Colors.black;

  static double kIconSize = SizeConfig.screenWidth! * 0.055;

  static double kHomePageHorizontalPadding = SizeConfig.screenWidth! * 0.02;
  static double kHomePageVerticalPadding = SizeConfig.screenHeight! * 0.01;
  static double kSizedBoxWidth = SizeConfig.screenWidth! * 0.02;

  static TextStyle? kExpansionTextStyle(BuildContext context) {
    TextStyle kExpansionTileStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.black);
    return kExpansionTileStyle;
  }

  static TextStyle? kAppbarTextStyle(BuildContext context) {
    TextStyle kAppbarTextStyle =
        Theme.of(context).textTheme.titleLarge!.copyWith(color: K.kTextColor);
    return kAppbarTextStyle;
  }
}
