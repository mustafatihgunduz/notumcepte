import 'package:flutter/material.dart';

class CustomListTile extends StatelessWidget {
  final IconData? leadingIcon;
  final String? titleText;
  final VoidCallback? onTap;

  CustomListTile({
    super.key,
    this.onTap,
    this.leadingIcon,
    this.titleText,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ListTile(
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
      ),
    );
  }
}
