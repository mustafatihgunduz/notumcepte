import 'package:flutter/material.dart';
import 'package:notumcepte/utility/constants.dart';

class CustomTextFormField extends StatelessWidget {
  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  String? hintText;
  late TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: K.kHomePageHorizontalPadding,
        vertical: K.kHomePageVerticalPadding,
      ),
      child: TextFormField(
        scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom / 2,
        ),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: K.kRegistirationTextStyle(context),
          enabledBorder: K.kOutlineInputBorder,
          focusedBorder: K.kOutlineInputBorder,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          errorBorder: K.kErrorOutlineInputBorder,
        ),
      ),
    );
  }
}
