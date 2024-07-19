import 'package:flutter/material.dart';
import 'package:notumcepte/utility/size_config.dart';

class AuthentacionContainer extends StatelessWidget {
  final String imageStr;
  final String text;

  AuthentacionContainer({
    super.key,
    required this.imageStr,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: SizeConfig.screenWidth! * 0.4,
        height: SizeConfig.screenHeight! * 0.2,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              imageStr,
            ),
            fit: BoxFit.cover,
          ),
          border: Border.all(
            color: Colors.brown.shade400,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Text(text, style: Theme.of(context).textTheme.headlineMedium!),
        ),
      ),
    );
  }
}
