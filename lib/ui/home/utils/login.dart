import 'package:flutter/material.dart';
import 'package:notumcepte/utility/size_config.dart';

login(BuildContext context, String email, String password) {
  return showAdaptiveDialog(
    context: context,
    builder: (context) => Center(
      child: Container(
        width: SizeConfig.screenWidth!,
        height: SizeConfig.screenHeight! * 0.4,
        margin: EdgeInsets.all(
          SizeConfig.screenWidth! * 0.03,
        ),
        decoration: BoxDecoration(color: Colors.amber),
      ),
    ),
    barrierDismissible: true,
    useSafeArea: true,
  );
}
