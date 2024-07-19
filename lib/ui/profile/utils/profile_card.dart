// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:notumcepte/utility/size_config.dart';

class CustomProfileCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final TextStyle? style;
  Color trailingColor;
  Color leadingColor;

  CustomProfileCard({
    super.key,
    required this.title,
    required this.icon,
    this.style,
    this.trailingColor = Colors.white,
    this.leadingColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: SizeConfig.screenWidth! * 0.03,
      ),
      child: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              offset: Offset(4, 4),
              blurRadius: 15,
              spreadRadius: 1,
              color: Colors.black,
            ),
            BoxShadow(
              offset: Offset(-2, -2),
              blurRadius: 15,
              spreadRadius: 0.1,
              color: Colors.grey.shade800,
            ),
          ],
        ),
        child: Card(
            color: Colors.grey.shade900,
            child: ListTile(
              title: Text(
                title,
                style: style,
              ),
              leading: Icon(
                icon,
                color: leadingColor,
              ),
              trailing: Icon(
                Icons.arrow_forward_ios,
                size: SizeConfig.screenWidth! * 0.04,
                color: trailingColor,
              ),
            )),
      ),
    );
  }
}
