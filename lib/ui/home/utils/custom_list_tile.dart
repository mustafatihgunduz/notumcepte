import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? leadingIcon;
  final String? titleText;

  CustomListTile({
    super.key,
    this.leadingIcon,
    this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon),
      title: Text(titleText!),
      iconColor: Colors.grey.shade600,
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      trailing: Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }
}
