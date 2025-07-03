import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/utility/size_config.dart';
import 'package:provider/provider.dart';

class K {
  static Color kPrimaryColor = Color(0xffF44A01);
  static Color kExpansionTextColor = Colors.black;
  static Color kDividerColor = Colors.grey.shade600;
  static Color kButtonColor = Color(0xffF44A01);

  static Color kdarkScaffoldBodyColor = Color(0xff222831);
  static Color kdarkAppBarColor = Color(0xff393E46);
  static Color kdarkIconColor = Color(0xffFAF6E9);
  static Color kdarkContainerColor = Color(0xff393E46);
  static Color kdarkTextColor = Colors.white;

  static Color kwhiteScaffoldBodyColor = Color(0xff222831);
  static Color kwhiteAppBarColor = Color(0xff393E46);
  static Color kwhiteIconColor = Color(0xffFAF6E9);
  static Color kwhiteContainerColor = Color(0xff393E46);
  static Color kwhiteTextColor = Colors.white;

  static double kIconSize = SizeConfig.screenWidth! * 0.055;

  static double kHomePageHorizontalPadding = SizeConfig.screenWidth! * 0.02;
  static double kHomePageVerticalPadding = SizeConfig.screenHeight! * 0.01;
  static double kSizedBoxWidth = SizeConfig.screenWidth! * 0.02;

  static TextStyle? kExpansionSubtitleTextStyle(BuildContext context) {
    TextStyle kExpansionTileStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white54);
    return kExpansionTileStyle;
  }

  static TextStyle? kExpansionTitleTextStyle(BuildContext context) {
    TextStyle kExpansionTitleTextStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white70);
    return kExpansionTitleTextStyle;
  }

  static TextStyle? kAppbarTextStyle(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = theme.isDarkMode;
    TextStyle kAppbarTextStyle = Theme.of(context)
        .textTheme
        .titleLarge!
        .copyWith(color: isDarkMode ? K.kdarkTextColor : K.kwhiteTextColor);
    return kAppbarTextStyle;
  }

  static TextStyle? kRegistirationTextStyle(BuildContext context) {
    TextStyle kRegistirationTextStyle =
        Theme.of(context).textTheme.titleSmall!.copyWith(
              color: Colors.white,
            );
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
    TextStyle kDropdownButtonTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white70);
    return kDropdownButtonTextStyle;
  }

  static TextStyle? kDropdownButtonMenuItemTextStyle(BuildContext context) {
    TextStyle kDropdownButtonMenuItemTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(color: Colors.white);
    return kDropdownButtonMenuItemTextStyle;
  }

  static TextStyle? kTitleTextStyle(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = theme.isDarkMode;
    TextStyle kTitleTextStyle = Theme.of(context)
        .textTheme
        .titleSmall!
        .copyWith(color: isDarkMode ? K.kdarkTextColor : K.kwhiteTextColor);
    return kTitleTextStyle;
  }

  static TextStyle? kExplanationTextStyle(BuildContext context) {
    TextStyle kExplanationTextStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: Colors.white60);
    return kExplanationTextStyle;
  }

  static TextStyle? kTabBarTextStyle(BuildContext context) {
    TextStyle kTabBarTextStyle = Theme.of(context).textTheme.titleMedium!;
    return kTabBarTextStyle;
  }

  static TextStyle? kSearchBarTextStyle(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = theme.isDarkMode;
    TextStyle kSearchBarTextStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: isDarkMode ? K.kdarkTextColor : K.kwhiteTextColor);
    return kSearchBarTextStyle;
  }

  static TextStyle? kButtonTextStyle(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = theme.isDarkMode;
    TextStyle kButtonTextStyle = Theme.of(context)
        .textTheme
        .titleMedium!
        .copyWith(color: isDarkMode ? K.kdarkTextColor : K.kwhiteTextColor);
    return kButtonTextStyle;
  }

  static TextStyle? kContainerTextStyle(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context, listen: false);
    bool isDarkMode = theme.isDarkMode;
    TextStyle kContainerTextStyle = Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: isDarkMode ? K.kdarkTextColor : K.kwhiteTextColor);
    return kContainerTextStyle;
  }

  static TextStyle? kContainerSubtitleTextStyle(BuildContext context) {
    TextStyle kContainerSubtitleTextStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
            );
    return kContainerSubtitleTextStyle;
  }

  static TextStyle? kTextFieldHelperTextStyle(BuildContext context) {
    TextStyle kTextFieldHelperTextStyle =
        Theme.of(context).textTheme.bodySmall!.copyWith(
              color: Colors.white,
            );
    return kTextFieldHelperTextStyle;
  }

  static TextStyle? kTextButtonTextStyle(BuildContext context) {
    TextStyle kTextButtonTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: K.kPrimaryColor,
            );
    return kTextButtonTextStyle;
  }

  static TextStyle? kListTileTitleTextStyle(BuildContext context) {
    TextStyle kListTileTitleTextStyle =
        Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Colors.white,
            );
    return kListTileTitleTextStyle;
  }

  static TextStyle? kListTileSubTitleTextStyle(BuildContext context) {
    TextStyle kListTileSubTitleTextStyle =
        Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Colors.white,
            );
    return kListTileSubTitleTextStyle;
  }

  static BorderSide kSearchBarBorderSide = BorderSide(
    width: 1.5,
    color: Colors.grey.shade600,
  );

  static BoxDecoration kDropdownButtonMenuDecoration = BoxDecoration(
    border: Border.all(color: Colors.grey, width: 1.5),
    borderRadius: BorderRadius.circular(10),
  );

  static OutlineInputBorder kOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(width: 1, color: Colors.grey),
  );

  static OutlineInputBorder kErrorOutlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(width: 1, color: Colors.red),
  );
}
