import 'package:flutter/material.dart';
import 'package:notumcepte/core/provider/theme_provider.dart';
import 'package:notumcepte/utility/constants.dart';
import 'package:provider/provider.dart';

class CustomListTile extends StatelessWidget {
  final IconData? leadingIcon;
  final String? titleText;
  final VoidCallback? onTap;

  const CustomListTile({
    super.key,
    this.onTap,
    this.leadingIcon,
    this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Provider.of<ThemeProvider>(context);
    bool isDarkMode = theme.isDarkMode;
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
        leading: Icon(
          leadingIcon,
          color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
        ),
        title: Text(
          titleText!,
          style: K.kTitleTextStyle(context),
        ),
        iconColor: Colors.grey.shade600,
        hoverColor: Colors.transparent,
        splashColor: Colors.transparent,
        focusColor: Colors.transparent,
        trailing: Icon(
          Icons.arrow_forward_ios,
          color: isDarkMode ? K.kdarkIconColor : K.kwhiteIconColor,
          size: 16,
        ),
      ),
    );
  }
}
