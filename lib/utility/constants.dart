import 'package:flutter/material.dart';
import 'package:notumcepte/utility/size_config.dart';

class K {
  static Color kScaffoldBodyColor = Colors.grey.shade100;
  static Color kAppBarColor = Colors.white;
  static Color kIconColor = Colors.grey;
  static Color kContainerColor = Colors.white;
  static Color kTextColor = Colors.grey.shade500;
  static Color kExpansionTextColor = Colors.black;
  static Color kDividerColor = Colors.grey.shade600;

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

  static TextStyle? kRegistirationTextStyle(BuildContext context) {
    TextStyle kRegistirationTextStyle =
        Theme.of(context).textTheme.titleSmall!.copyWith(color: Colors.black);
    return kRegistirationTextStyle;
  }

  static TextStyle? kDividerTextStyle(BuildContext context) {
    TextStyle kDividerTextStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: Colors.grey.shade700);
    return kDividerTextStyle;
  }

  static TextStyle? kDropdownButtonTextStyle(BuildContext context) {
    TextStyle kDropdownButtonTextStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Colors.grey.shade700);
    return kDropdownButtonTextStyle;
  }

  static TextStyle? kDropdownButtonMenuItemTextStyle(BuildContext context) {
    TextStyle kDropdownButtonMenuItemTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.black);
    return kDropdownButtonMenuItemTextStyle;
  }
}
